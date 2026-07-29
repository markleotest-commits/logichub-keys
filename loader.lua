-- Logic Hub v3.5 - Resilient Loader
local url = "https://raw.githubusercontent.com/markleotest-commits/logichub-keys/main/main_obf.lua?nc=" .. tostring(os.time())

local fetchSuccess, response = pcall(function()
    return game:HttpGet(url, true)
end)

if not fetchSuccess or not response or #response == 0 then
    warn("[Logic Hub] Error: Failed to fetch script from server -> " .. tostring(response))
    return
end

local func, compileErr = loadstring(response)
if not func then
    warn("[Logic Hub] Error: Script compilation failed -> " .. tostring(compileErr))
    return
end

local execSuccess, execErr = pcall(func)
if not execSuccess then
    warn("[Logic Hub] Error: Runtime error during script execution -> " .. tostring(execErr))
end
