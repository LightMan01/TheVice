--Huge server file.

local interiors = {
	[1] = { ["xe"] = -248.41557312012, ["ye"] = 6332.6733398438, ["ze"] = 32.426181793212, ["he"] = 321.7075, ["xo"] = 248.7377319336, ["yo"] = -1369.8635253906, ["zo"] = 29.647987365722, ["ho"] = 234.62, ["name"] = 'Paleto Bay Care Center'},
	[2] = { ["xe"] = -300.2573852539, ["ye"] = 6256.2783203125, ["ze"] = 31.508373260498, ["he"] = 321.7075, ["xo"] = -560.51599121094, ["yo"] = 278.87683105468, ["zo"] = 82.976501464844, ["ho"] = 234.62, ["name"] = 'The Hen House' }
}

RegisterServerEvent("interiors:sendData_s")
AddEventHandler("interiors:sendData_s", function()
    TriggerClientEvent("interiors:f_sendData", source, interiors)
end)
