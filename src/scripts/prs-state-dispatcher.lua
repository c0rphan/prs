PRSState = PRSState or {}
PRSState.Char = PRSState.Char or {}
PRSState.Char.quests = PRSState.Char.quests or {}
PRSState.Char.player = PRSState.Char.player or {}
PRSState.Char.skills = PRSState.Char.skills or {}
PRSState.Char.room = PRSState.Char.room or {}
PRSState.Char.inventory = PRSState.Char.inventory or {}
PRSState.Char.radials = PRSState.Char.radials or {}
PRSState.Char.slots = PRSState.Char.slots or {}
PRSState.Char.sidemap = PRSState.Char.sidemap or {}
PRSState.Char.minimap = PRSState.Char.minimap or {}
PRSState.Char.room = PRSState.Char.room or {}
PRSState.Char.room.entities = PRSState.Char.room.entities or {}
PRSState.Char.room.exits = PRSState.Char.room.exits or {}
PRSState.Char.room.items = PRSState.Char.room.items or {}
PRSState.Char.aliases = PRSState.Char.aliases or {}
PRSState.Char.equipment = PRSState.Char.equipment or {}
PRSState.Char.channels = PRSState.Char.channels or {}
PRSState.Char.charmies = PRSState.Char.charmies or {}
PRSState.Char.party = PRSState.Char.party or {}
PRSState.Char.battle = PRSState.Char.battle or {}

function prs_state_dispatcher()
  local JSONpatch = require("__PKGNAME__.jsonpatch")
  local raisedEvents = {}
  local handledEvents = {}
  for _, patch in ipairs(gmcp.State.Patch) do
    table.insert(handledEvents, (string.gsub(string.sub(patch.path, 2), "/", ".")))
  end
  local new_obj, patches, err = JSONpatch.apply(PRSState.Char, gmcp.State.Patch)
  if err ~= nil then
    debugc(string.format("%s", err))
  else
    PRSState.Char = new_obj
  end
  for _, event in ipairs(handledEvents) do
    local eventToRaise = "PRSState.Char"
    for subEvent in string.gmatch(event, "([^.]+)") do
      eventToRaise = eventToRaise ..".".. subEvent
      if raisedEvents[eventToRaise] == nil and tonumber(subEvent) == nil then
        raisedEvents[eventToRaise] = {1}
        raiseEvent(eventToRaise)
      end
    end
  end
end

if stateEventHandlerId then
  killAnonymousEventHandler(stateEventHandlerId)
end

stateEventHandlerId = registerAnonymousEventHandler("gmcp.State.Patch", prs_state_dispatcher, false)

-- Reset state on reconnect to prevent duplicate data
local function resetPRSState()
  PRSState.Char = {}
  PRSState.Char.quests = {}
  PRSState.Char.player = {}
  PRSState.Char.skills = {}
  PRSState.Char.room = {}
  PRSState.Char.inventory = {}
  PRSState.Char.radials = {}
  PRSState.Char.slots = {}
  PRSState.Char.sidemap = {}
  PRSState.Char.minimap = {}
  PRSState.Char.room.entities = {}
  PRSState.Char.room.exits = {}
  PRSState.Char.room.items = {}
  PRSState.Char.aliases = {}
  PRSState.Char.equipment = {}
  PRSState.Char.channels = {}
  PRSState.Char.charmies = {}
  PRSState.Char.party = {}
  PRSState.Char.battle = {}
end

if connectionResetHandlerId then
  killAnonymousEventHandler(connectionResetHandlerId)
end

connectionResetHandlerId = registerAnonymousEventHandler("sysConnectionEvent", resetPRSState)
