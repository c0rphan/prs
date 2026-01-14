PRSState = PRSState or {}
PRSState.Char = PRSState.Char or {}
PRSState.Char.quests = PRSState.Char.quests or {}
PRSState.Char.player = PRSState.Char.player or {}
PRSState.Char.skills = PRSState.Char.skills or {}
PRSState.Char.room = PRSState.Char.room or {}
PRSState.Char.inventory = PRSState.Char.inventory or {}
PRSState.Char.radials = PRSState.Char.radials or {}

function prs_state_dispatcher()
  local raisedEvents = {}
  local handledEvents = {}
  for _, patch in ipairs(gmcp.State.Patch) do
    table.insert(handledEvents, (string.gsub(string.sub(patch.path, 2), "/", ".")))
  end
  local new_obj, patches, err = JSONpatch.apply(PRSState.Char, gmcp.State.Patch)
  if err ~= nil then
    echo(err)
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
