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
  raiseChar = false
  raisePlayer = false
  raiseSkills = false
  raiseRoom = false
  raiseInventory = false
  for _, patch in ipairs(gmcp.State.Patch) do
    if string.find(patch.path, "^/quests/") then
      raiseChar = true
      slot = getAttribute(patch.path) + 1
      if patch.op == "add" then
        PRSState.Char.quests[slot] = patch.value
      elseif patch.op == "remove" then
        table.remove(PRSState.Char.quests, slot)
      end
      raiseEvent("PRSState.Char.quests")
    elseif string.find(patch.path, "^/player/") then
      raisePlayer = true
      attr = getAttribute(patch.path)
      if patch.op == "add" or patch.op == "replace" then
        PRSState.Char.player[attr] = patch.value
      elseif patch.op == "remove" then
        PRSState.Char.player[attr] = nil
      end
      raiseEvent("PRSState.Char.player." .. attr)
    elseif string.find(patch.path, "^/skills/") then
      raiseSkills = true
      skill = getAttribute(patch.path)
      if patch.op == "add" then
        table.insert(PRSState.Char.skills, patch.value)
      elseif patch.op == "replace" then
        for i=1,#PRSState.Char.skills do
          if PRSState.Char.skills[i].name == patch.value.name then
            PRSState.Char.skills[i] = patch.value
            break
          end
        end
      elseif patch.op == "remove" then
        found = nil
        for i=1,#PRSState.Char.skills do
          if PRSState.Char.skills[i].name == patch.value.name then
            found = i
            break
          end
        end
        if found ~= nil then
          table.remove(i)
        end
      end
      raiseEvent("PRSState.Char.skills." .. skill)
    elseif string.find(patch.path, "^/room/") then
      raiseRoom = true
      if pathIsList(patch.path) then -- attr is part of list
        attr, slot = getAttributeAndIndex(patch.path)
        PRSState.Char.room[attr] = PRSState.Char.room[attr] or {}
        if patch.op == "add" or patch.op == "replace" then
          PRSState.Char.room[attr][slot] = patch.value
        elseif patch.op == "remove" then
          table.remove(PRSState.Char.room[attr], slot)
        end
        raiseEvent("PRSState.Char.room." .. attr)
      else -- not a list
        attr = getAttribute(patch.path)
        if patch.op == "add" or patch.op == "replace" then
          PRSState.Char.room[attr] = patch.value
        elseif patch.op == "remove" then
          PRSState.Char.room[attr] = nil
        end
        raiseEvent("PRSState.Char.room." .. attr)
      end
    elseif string.find(patch.path, "^/inventory") then
      raiseInventory = true
      slot = getAttribute(patch.path) + 1
      if patch.op == "add" or patch.op == "replace" then
        PRSState.Char.inventory[slot] = patch.value
      elseif patch.op == "remove" then
        table.remove(PRSState.Char.inventory, slot)
      end
    end
  end
  raiseEvent("PRSState")
  if raiseChar or raisePlayer or raiseSkills or raiseRoom or raiseInventory then
    raiseEvent("PRSState.Char")
  end
  if raisePlayer then
    raiseEvent("PRSState.Char.player")
  end
  if raiseSkills then
    raiseEvent("PRSState.Char.skills")
  end
  if raiseRoom then
    raiseEvent("PRSState.Char.room")
  end
  if raiseInventory then
    raiseEvent("PRSState.Char.inventory")
  end
end

if stateEventHandlerId then
  killAnonymousEventHandler(stateEventHandlerId)
end

stateEventHandlerId = registerAnonymousEventHandler("gmcp.State.Patch", prs_state_dispatcher, false)

