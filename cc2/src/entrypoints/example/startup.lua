--- This script runs automatically when the computer starts
--- Its purpose is to trigger the `main.lua` script while also performing
--- any other work needed on startup which must happen before the main app starts


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


print("Starting...")
info = textutils.unserializeJSON(readFile("info.json"))


-- When no config is provided go straight to running the main application
startup = info.startup
if not startup then
    os.run({}, "run.lua")
end


-- It might be necessary to clear logs on startup e.g. to reduce storage consumption
if startup.clearLogs then
    print(" | Clearing old logs")
    deleteDirectory("app/logs")
end


-- In some situations it is necessary to wait for example for the area around a computer to load
-- so that when the application starts the computer has all the peripherals that it needs
if startup.delaySeconds then
    print(" | Waiting for " .. startup.delaySeconds .. " seconds...")
    os.sleep(startup.delaySeconds)
end


-- This ensures that the application remains up to date with any improvements
-- and allows bugs to be remotely fixed without the need to manually access
-- the computer
if startup.autoUpdate then
    os.run({}, "update.lua")
end


-- Run the application
os.run({}, "run.lua")


