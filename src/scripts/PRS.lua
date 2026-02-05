-- Procedural Realms Script (PRS) for Mudlet
-- by Stack (https://ilpdev.com/prs) & Dalem
PRS_VERSION = "__VERSION__"
PRS_PKGNAME = "__PKGNAME__"

-- check if the generic_mapper package is installed and, if so, uninstall it
if table.contains(getPackages(), "generic_mapper") then
    uninstallPackage("generic_mapper")
end

registerAnonymousEventHandler("PRSState.Char.player", function()
    PRSstats.stats()
end, true)

-- set Discord button to PR invite
setDiscordGameUrl("https://discord.gg/rRFEjc6vV9", "Procedural Realms")

-- Discord Rich Text Integration
setDiscordApplicationID("947477099596378142")
setDiscordGame("Procedural Realms")
local currentarea = getRoomArea(getPlayerRoom())
local areaname = getAreaTableSwap()[currentarea]
setDiscordDetail(areaname)
setDiscordElapsedStartTime(os.time(os.date("*t")))
