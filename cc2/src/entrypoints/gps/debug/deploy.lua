--- This script is responsible for setting up a new instance of an application
--- It is intended to be pulled by a significantly simpler "one liner" that can
--- be easily copied into a computer


baseUrl = "https://raw.githubusercontent.com/7obyGit/C-183501-124812851/main/cc2/src/entrypoints/gps"


function download(url)
    local request = http.get(url)
    local text = request.readAll()
    text = (text:sub(1,1) == "?" and text:sub(2)) or text
    request.close()
    return text
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


local updateScript = download(baseUrl .. "/update.lua")
writeFile("/update.lua", updateScript)
shell.run("update.lua")


info = textutils.unserializeJSON(readFile("info.json"))


print("\nDeployment completed successfully")
print(" - v" .. info.version)
print(" - Installed " .. #info.deployment.manifest .. " files")
local completeMessage = info.deployment.completeMessage
if completeMessage then
    print("\n" .. completeMessage)
end
os.sleep(3)


local completeScript = info.deployment.completeScript
if completeScript then
    print("\nComplete Script Detected")
    print(" | Retrieved `deployment.completeScript`")
    for _, command in ipairs(completeScript) do
        print(" | > " .. command)
        shell.run(command)
    end
    print(" | Complete!")
end
