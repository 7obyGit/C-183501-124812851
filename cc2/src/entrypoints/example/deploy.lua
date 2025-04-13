--- This script is responsible for setting up a new instance of an application
--- It is intended to be pulled by a significantly simpler "one liner" that can
--- be easily copied into a computer


os.run({}, "update.lua")


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
        os.run({}, command)
    end
    print(" | Complete!")
end
