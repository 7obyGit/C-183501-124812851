--- This script is responsible for safely running the main application
--- It can ensure that, in the event of an error, the application will continue
--- to operate effectively


function readFile(path)
    local file = fs.open(path, "r")
    if not file then
        error("Could not open file: " .. path)
    end
    local content = file.readAll()
    file.close()
    return content
end


function deleteDirectory(path)
    if not fs.exists(path) then
        return
    end

    if not fs.isDir(path) then
        fs.delete(path)
        return
    end

    for _, item in ipairs(fs.list(path)) do
        deleteDirectory(fs.combine(path, item))
    end

    fs.delete(path)
end


function copyDirectory(fromDirectory, toDirectory)
    if not fs.exists(fromDirectory) or not fs.isDir(fromDirectory) then
        error("Source directory does not exist or is not a directory: " .. fromDirectory)
    end

    if not fs.exists(toDirectory) then
        fs.makeDir(toDirectory)
    end

    for _, item in ipairs(fs.list(fromDirectory)) do
        local fromPath = fs.combine(fromDirectory, item)
        local toPath = fs.combine(toDirectory, item)

        if fs.isDir(fromPath) then
            copyDirectory(fromPath, toPath)
        else
            if fs.exists(toPath) then
                fs.delete(toPath)
            end
            fs.copy(fromPath, toPath)
        end
    end
end


function moveDirectory(fromDirectory, toDirectory)
    copyDirectory(fromDirectory, toDirectory)
    deleteDirectory(fromDirectory)
end


info = textutils.unserializeJSON(readFile("info.json"))
appName = info.name or "Application"
lifetime = info.lifetime or {}


function rollback()
    deleteDirectory("app")
    moveDirectory("old", "app")
end


function run()
    local runs = 0
    while true do
        runs = runs + 1

        -- Try to run the application
        print(appName .. " Starting...")
        local success, err = pcall(function()
            os.run({}, "app/main.lua")
        end)
        print(appName .. " Terminated")


        if not success then
            print("Critical Error:")
            print(err)
        end

        -- Decide what to do based on the `onCrash` strategy
        local backupExists = fs.exists("old")
        if backupExists then
            print("Backup EXISTS")
        end
        if lifetime.onCrash == "ROLLBACK" and backupExists then
            -- There is a backup in the `old` directory, rollback to that version
            print("Rolling back to the previous version...")
            os.sleep(lifetime.restartDelaySeconds or 1)
        elseif lifetime.onCrash == "ROLLBACK" or lifetime.onCrash == "RESTART" then
            -- Ok to restart, no action needed
            print("Restarting...")
            os.sleep(lifetime.restartDelaySeconds or 1)
        elseif lifetime.onCrash == "TERMINATE" then
            -- Do nothing
            print("Terminating Wrapper...")
            return
        else
            -- Unknown crash strategy
            error("Unknown crash strategy: " .. lifetime.onCrash)
        end

        -- Log the number of times this has happened
        print("Crash Number: " .. runs)
    end
end


run()

