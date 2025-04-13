﻿print(" | Checking for updates...")


baseUrl = "https://raw.githubusercontent.com/7obyGit/C-183501-124812851/main/cc2/src/entrypoints/example"


function download(url)
    local request = http.get(url)
    local text = request.readAll()
    request.close()
    return text
end


function createDirectory(path)
    local parts = {}
    for part in string.gmatch(path, "[^/]+") do
        table.insert(parts, part)
    end

    local current = ""
    for i = 1, #parts do
        current = fs.combine(current, parts[i])
        if not fs.exists(current) then
            fs.makeDir(current)
        end
    end
end

function writeFile(path, content)
    local dir = fs.getDir(path)
    if dir ~= "" then
        createDirectory(dir)
    end

    local file = fs.open(path, "w")
    file.write(content)
    file.close()
end


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


function update()
    oldInfo = textutils.unserializeJSON(readFile("info.json"))


    -- Delete the current contents of the `old` directory
    print("\n(1/5) Preparing Environment...")
    deleteDirectory("old")
    print(" | Deleted previous backup files")

    -- Move the existing files from the `app` directory to the `old` directory
    -- so that they can be restored if necessary
    moveDirectory("app", "old")
    print(" | Created new backup")
    print(" | Environment ready!")

    -- Pull down the new files
    print("\n(2/5) Loading Info...")
    print(" | [ ] Downloading `info.json`...")
    infoText = download(baseUrl + "info.json")
    print(" | [*] Downloaded latest `info.json`")
    writeFile("info.json", infoText)
    print(" | Saved " .. #infoText .. " bytes to `info.json`")
    info = textutils.unserializeJSON(infoText)
    print(" | Parsed `info.json`")
    if info.version == oldInfo.version then
        -- No need to update
        local appName = info.name or "Application"
        print(" | " .. appName .. " is up to date")
        print(" | Update complete!")
        return
    end
    print(" | Complete!")


    print("\n(3/5) Downloading Files...")
    manifest = info.deployment.manifest
    if not manifest then
        error("`deployment.manifest` field not found in `info.json`.")
    end
    print(" | Retrieved `deployment.manifest`")
    fileCount = countElements(manifest)
    print(" | " .. fileCount .. " files identified")
    for _, path in ipairs(manifest) do
        print(" | [ ] Downloading '" .. path .. "'...")
        local text = download(baseUrl + path)
        writeFile(path, text)
        print(" | [*] Download Complete!")
    end
    print(" | Complete!")


    print("\n(4/5) Config Script")
    configScript = info.deployment.configScript
    if configScript then
        print(" | Retrieved `deployment.configScript`")
        for _, command in ipairs(configScript) do
            print(" | > " .. command)
            os.run({}, command)
        end
        print(" | Complete!")
    else
        print(" | \"`deployment.configScript` field not found in `info.json`.\"")
        print(" | Skipped!")
    end

    -- If not a `cleanUpdate` then copy across all files inside the `old/data` directory
    print("\n(5/5) Cleanup")
    startup = info.startup or {}
    if not startup.cleanUpdate and fs.exists("old/data") then
        copyDirectory("old/data", "app/data")
        print(" | Restored data files")
    end
    print(" | Complete!")
end


update()
