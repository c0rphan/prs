PRSState = PRSState or {}
PRSState.Char = PRSState.Char or {}
PRSState.Char.quests = PRSState.Char.quests or {}
PRSState.Char.player = PRSState.Char.player or {}
PRSState.Char.skills = PRSState.Char.skills or {}
PRSState.Char.room = PRSState.Char.room or {}
PRSState.Char.inventory = PRSState.Char.inventory or {}

function pathIsList(path)
  i, j = string.find(path, "/%d+$")
  return i ~= nil
end

function getAttributeAndIndex(path)
  i, j = string.find(path, "/[^/]+/%d+$")
  subpath = string.sub(path, i, j)
  i, j = string.find(subpath, "^/[^/]+")
  attr = string.sub(subpath, i+1, j)
  i, j = string.find(subpath, "/%d+$")
  slot = string.sub(subpath, i+1, j) + 1
  return attr, slot
end

function getAttribute(path)
  i, j = string.find(path, "/[^/]+$")
  attr = string.sub(path, i+1, j)
  return attr
end

function prs_state_dispatcher()
  raisedEvents = {}
  handledEvents = {}
  for _, patch in ipairs(gmcp.State.Patch) do
    table.insert(handledEvents, (string.gsub(string.sub(patch.path, 2), "/", ".")))
    local segments = {}
    local k = nil
    for key in string.gmatch(patch.path, "([^/]+)") do
      k = key
      table.insert(segments, k)
    end
    if tonumber(k) then
      k = k + 1
    end
    if #segments == 1 then
      if patch.op == "replace" then
        PRSState.Char[k] = patch.value
      elseif patch.op == "remove" then
        PRSState.Char[k] = nil
      elseif patch.op == "add" then
        if tonumber(k) then
          table.insert(PRSState.Char, k, patch.value)
        else
          PRSState.Char[k] = patch.value
        end
      end
    elseif #segments > 1 then
      local target = PRSState.Char
      local tk = nil
      for i=1,#segments-1 do
        tk = segments[i]
        if target[tk] == nil then
          target[tk] = {}
        end
        target = target[tk]
      end
      if patch.op == "replace" then
        target[k] = patch.value
      elseif patch.op == "remove" then
        if tonumber(k) then
          table.remove(target, k)
        else
          target[k] = nil
        end
      elseif patch.op == "add" then
        if tonumber(k) then
          table.insert(target, k, patch.value)
        else
          target[k] = patch.value
        end
      end
    end
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

