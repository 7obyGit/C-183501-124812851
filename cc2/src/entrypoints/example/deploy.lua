--- This script is responsible for setting up a new instance of an application
--- It is intended to be pulled by a significantly simpler "one liner" that can
--- be easily copied into a computer
local baseUrl = "https://raw.githubusercontent.com/7obyGit/C-183501-124812851/main/cc2/src/entrypoints/example"


local function download(url)
    local request = http.get(url)
    local text = request.readAll()
    request.close()
    return text
end


local function writeFile(path, content)
    local file = fs.open(path, "w")
    file.write(content)
    file.close()
end


local function readFile(path)
    local file = fs.open(path, "r")
    if not file then
        error("Could not open file: " .. path)
    end
    local content = file.readAll()
    file.close()
    return content
end


local function countElements(table) 
    local count = 0
    for _ in pairs(table) do
        count = count + 1
    end
    return count
end


print("\n(1/3) Loading Info...")
print(" | [ ] Downloading `info.json`...")
local infoText = download(baseUrl + "info.json")
print(" | [*] Downloaded latest `info.json`")
writeFile("info.json", infoText)
print(" | Saved " .. #infoText .. " bytes to `info.json`")
local info = textutils.unserializeJSON(infoText)
print(" | Parsed `info.json`")
print(" | Complete!")


print("\n(2/3) Downloading Files...")
local manifest = info.deployment.manifest
if not manifest then
    error("`deployment.manifest` field not found in `info.json`.")
end
print(" | Retrieved `deployment.manifest`")
local fileCount = countElements(manifest)
print(" | " .. fileCount .. " files identified")
for _, path in ipairs(manifest) do
    print(" | [ ] Downloading '" .. path .. "'...")
    local text = download(baseUrl + path)
    writeFile(path, text)
    print(" | [*] Download Complete!")
end
print(" | Complete!")


print("\n(3/3) Config Script")
local configScript = info.deployment.configScript
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


print("\nDeployment completed successfully")
print(" - v" .. info.version)
print(" - Installed " .. fileCount .. " files")
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
        os.run({}, command)
    end
    print(" | Complete!")
end
