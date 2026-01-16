-- Procedural Realms Script (PRS) Stats Gauges for Mudlet
-- by Stack (https://ilpdev.com/prs) & Dalem
PRSstats = PRSstats or {}
PRSstats.events = PRSstats.events or {}

local SUG = require("PRS.sug")

local function vitalsHeader()
    local header = Geyser.HBox:new({
        name = "header",
        height = 25,
        width = "93%"
    }, GUI.tabwindow1.Vitalscenter)
    local name = Geyser.Label:new({
        name = "name"
    }, header)
    name:setFontSize(12)
    name:setColor(0, 0, 0, 0)
    name:echo(PRSState.Char.player.name, "#f9f1a5", "l")
    local class = Geyser.Label:new({
        name = "class"
    }, header)
    class:setFontSize(12)
    class:setColor(0, 0, 0, 0)
    class:echo(PRSState.Char.player.class, "#b4009e", "c")
    if PRSstats.events.classChange_id then
        killAnonymousEventHandler(PRSstats.events.classChange_id)
    end
    PRSstats.events.classChange_id = registerAnonymousEventHandler("PRSState.Char.player.class", function()
        if PRSState.Char.player.class then
            class:echo(PRSState.Char.player.class, "#b4009e", "c")
        end
    end)
    local level = Geyser.Label:new({
        name = "level"
    }, header)
    level:setFontSize(12)
    level:setColor(0, 0, 0, 0)
    level:echo("Level " .. PRSState.Char.player.level, "#ababab", "r")
    if PRSstats.events.levelChange_id then
        killAnonymousEventHandler(PRSstats.events.levelChange_id)
    end
    PRSstats.events.levelChange_id = registerAnonymousEventHandler("PRSState.Char.player.level", function()
        if PRSState.Char.player.level then
            level:echo("Level " .. PRSState.Char.player.level, "#ababab", "r")
        end
    end)
end

local function statsTab()
    local statsVBox = Geyser.VBox:new({
        name = "statsVBox",
        height = "95%",
        width = "93%"
    }, GUI.tabwindow1.Statscenter)
    local abilitiesTitle = Geyser.Label:new({
        name = "abilitiesTitle"
    }, statsVBox)
    abilitiesTitle:setColor(0, 0, 0, 0)
    abilitiesTitle:setFontSize(8)
    abilitiesTitle:echo("Abilities", "#f2f2f2", "c")
    local row1 = Geyser.HBox:new({
        name = "row1",
        width = "93%"
    }, statsVBox)
    -- Strength
    local strength = Geyser.Label:new({
        name = "strength"
    }, row1)
    strength:setColor(0, 0, 0, 0)
    strength:setFontSize(10)
    strength:echo(PRSState.Char.player._strength, "#e74856", "r")
    if PRSstats.events._strengthChange_id then
        killAnonymousEventHandler(PRSstats.events._strengthChange_id)
    end
    PRSstats.events._strengthChange_id = registerAnonymousEventHandler("PRSState.Char.player._strength", function()
        if PRSState.Char.player._strength then
            strength:echo(PRSState.Char.player._strength, "#e74856", "r")
        end
    end)
    local strengthDiv = Geyser.Label:new({
        name = "strengthDiv"
    }, row1)
    strengthDiv:setColor(0, 0, 0, 0)
    -- strengthDiv:setFontSize(16)
    strengthDiv:echo("+", "#767676", "c")
    local _strength = Geyser.Label:new({
        name = "_strength"
    }, row1)
    _strength:setColor(0, 0, 0, 0)
    _strength:setFontSize(10)
    _strength:echo(PRSState.Char.player.strength - PRSState.Char.player._strength, "#c50f1f", "l")
    if PRSstats.events.strengthChange_id then
        killAnonymousEventHandler(PRSstats.events.strengthChange_id)
    end
    PRSstats.events.strengthChange_id = registerAnonymousEventHandler("PRSState.Char.player.strength", function()
        if PRSState.Char.player._strength and PRSState.Char.player.strength then
            _strength:echo(PRSState.Char.player.strength - PRSState.Char.player._strength, "#c50f1f", "l")
        end
    end)
    -- Magic
    local magic = Geyser.Label:new({
        name = "magic"
    }, row1)
    magic:setColor(0, 0, 0, 0)
    magic:setFontSize(10)
    magic:echo(PRSState.Char.player._magic, "#61d6d6", "r")
    if PRSstats.events._magicChange_id then
        killAnonymousEventHandler(PRSstats.events._magicChange_id)
    end
    PRSstats.events._magicChange_id = registerAnonymousEventHandler("PRSState.Char.player._magic", function()
        if PRSState.Char.player._magic then
            magic:echo(PRSState.Char.player._magic, "#61d6d6", "r")
        end
    end)
    local magicDiv = Geyser.Label:new({
        name = "magicDiv"
    }, row1)
    magicDiv:setColor(0, 0, 0, 0)
    magicDiv:setFontSize(10)
    magicDiv:echo("+", "#767676", "c")
    local _magic = Geyser.Label:new({
        name = "_magic"
    }, row1)
    _magic:setColor(0, 0, 0, 0)
    _magic:setFontSize(10)
    _magic:echo(PRSState.Char.player.magic - PRSState.Char.player._magic, "#3a96dd", "l")
    if PRSstats.events.magicChange_id then
        killAnonymousEventHandler(PRSstats.events.magicChange_id)
    end
    PRSstats.events.magicChange_id = registerAnonymousEventHandler("PRSState.Char.player.magic", function()
        if PRSState.Char.player._magic and PRSState.Char.player.magic then
            _magic:echo(PRSState.Char.player.magic - PRSState.Char.player._magic, "#3a96dd", "l")
        end
    end)
    local row2 = Geyser.HBox:new({
        name = "row2",
        width = "93%"
    }, statsVBox)
    local strengthTitle = Geyser.Label:new({
        name = "strengthTitle"
    }, row2)
    strengthTitle:setColor(0, 0, 0, 0)
    strengthTitle:setFontSize(10)
    strengthTitle:echo("Strength", "#ffffff", "c")
    local magicTitle = Geyser.Label:new({
        name = "magicTitle"
    }, row2)
    magicTitle:setColor(0, 0, 0, 0)
    magicTitle:setFontSize(10)
    magicTitle:echo("Magic", "#ffffff", "c")
    local row3 = Geyser.HBox:new({
        name = "row3",
        width = "93%"
    }, statsVBox)
    local maxHealth = Geyser.Label:new({
        name = "maxHealth"
    }, row3)
    maxHealth:setColor(0, 0, 0, 0)
    maxHealth:setFontSize(8)
    maxHealth:echo(PRSState.Char.player.strengthHpBonus .. " ", "#16c60c", "r")
    if PRSstats.events.strengthHpBonusChange_id then
        killAnonymousEventHandler(PRSstats.events.strengthHpBonusChange_id)
    end
    PRSstats.events.strengthHpBonusChange_id = registerAnonymousEventHandler("PRSState.Char.player.strengthHpBonus",
        function()
            if PRSState.Char.player.strengthHpBonus then
                maxHealth:echo(PRSState.Char.player.strengthHpBonus .. " ", "#16c60c", "r")
            end
        end)
    local maxHealthTitle = Geyser.Label:new({
        name = "maxHealthTitle"
    }, row3)
    maxHealthTitle:setColor(0, 0, 0, 0)
    maxHealthTitle:setFontSize(8)
    maxHealthTitle:echo("Max Health", "#aaaaaa", "l")
    local maxEnergy = Geyser.Label:new({
        name = "maxEnergy"
    }, row3)
    maxEnergy:setColor(0, 0, 0, 0)
    maxEnergy:setFontSize(8)
    maxEnergy:echo(PRSState.Char.player.magicEnergyBonus .. " ", "#f2f2f2", "r")
    if PRSstats.events.magicEnergyBonusChange_id then
        killAnonymousEventHandler(PRSstats.events.magicEnergyBonusChange_id)
    end
    PRSstats.events.magicEnergyBonusChange_id = registerAnonymousEventHandler("PRSState.Char.player.magicEnergyBonus",
        function()
            if PRSState.Char.player.magicEnergyBonus then
                maxEnergy:echo(PRSState.Char.player.magicEnergyBonus .. " ", "#f2f2f2", "r")
            end
        end)
    local maxEnergyTitle = Geyser.Label:new({
        name = "maxEnergyTitle"
    }, row3)
    maxEnergyTitle:setColor(0, 0, 0, 0)
    maxEnergyTitle:setFontSize(8)
    maxEnergyTitle:echo("Max Energy", "#aaaaaa", "l")
    local row4 = Geyser.HBox:new({
        name = "row4",
        width = "93%"
    }, statsVBox)
    local maxStamina = Geyser.Label:new({
        name = "maxStamina"
    }, row4)
    maxStamina:setColor(0, 0, 0, 0)
    maxStamina:setFontSize(8)
    maxStamina:echo(PRSState.Char.player.strengthStaminaBonus .. " ", "#f9f1a5", "r")
    if PRSstats.events.strengthStaminaBonusChange_id then
        killAnonymousEventHandler(PRSstats.events.strengthStaminaBonusChange_id)
    end
    PRSstats.events.strengthStaminaBonusChange_id = registerAnonymousEventHandler(
        "PRSState.Char.player.strengthStaminaBonus", function()
            if PRSState.Char.player.strengthStaminaBonus then
                maxStamina:echo(PRSState.Char.player.strengthStaminaBonus .. " ", "#f9f1a5", "r")
            end
        end)
    local maxStaminaTitle = Geyser.Label:new({
        name = "maxStaminaTitle"
    }, row4)
    maxStaminaTitle:setColor(0, 0, 0, 0)
    maxStaminaTitle:setFontSize(8)
    maxStaminaTitle:echo("Max Stamina", "#aaaaaa", "l")
    local spellCooldown = Geyser.Label:new({
        name = "spellCooldown"
    }, row4)
    spellCooldown:setColor(0, 0, 0, 0)
    spellCooldown:setFontSize(8)
    spellCooldown:echo(PRSState.Char.player.magicSpellCooldownBonus .. " ", "#881798", "r")
    if PRSstats.events.magicSpellCooldownBonusChange_id then
        killAnonymousEventHandler(PRSstats.events.magicSpellCooldownBonusChange_id)
    end
    PRSstats.events.magicSpellCooldownBonusChange_id = registerAnonymousEventHandler(
        "PRSState.Char.player.magicSpellCooldownBonus", function()
            if PRSState.Char.player.magicSpellCooldownBonus then
                spellCooldown:echo(PRSState.Char.player.magicSpellCooldownBonus .. " ", "#881798", "r")
            end
        end)
    local spellCooldownTitle = Geyser.Label:new({
        name = "spellCooldownTitle"
    }, row4)
    spellCooldownTitle:setColor(0, 0, 0, 0)
    spellCooldownTitle:setFontSize(8)
    spellCooldownTitle:echo("Spell Cooldown", "#aaaaaa", "l")
    local row5 = Geyser.HBox:new({
        name = "row5",
        width = "93%"
    }, statsVBox)
    local strengthDamage = Geyser.Label:new({
        name = "strengthDamage"
    }, row5)
    strengthDamage:setColor(0, 0, 0, 0)
    strengthDamage:setFontSize(8)
    strengthDamage:echo(PRSState.Char.player.strengthDamageBonus .. " ", "#e74856", "r")
    if PRSstats.events.strengthDamageBonusChange_id then
        killAnonymousEventHandler(PRSstats.events.strengthDamageBonusChange_id)
    end
    PRSstats.events.strengthDamageBonusChange_id = registerAnonymousEventHandler("PRSState.Char.player.strengthDamageBonus",
        function()
            if PRSState.Char.player.strengthDamageBonus then
                strengthDamage:echo(PRSState.Char.player.strengthDamageBonus .. " ", "#e74856", "r")
            end
        end)
    local strengthDamageTitle = Geyser.Label:new({
        name = "strengthDamageTitle"
    }, row5)
    strengthDamageTitle:setColor(0, 0, 0, 0)
    strengthDamageTitle:setFontSize(8)
    strengthDamageTitle:echo("Damage", "#aaaaaa", "l")
    local magicDamage = Geyser.Label:new({
        name = "magicDamage"
    }, row5)
    magicDamage:setColor(0, 0, 0, 0)
    magicDamage:setFontSize(8)
    magicDamage:echo(PRSState.Char.player.magicDamageBonus .. " ", "#b4009e", "r")
    if PRSstats.events.magicDamageBonusChange_id then
        killAnonymousEventHandler(PRSstats.events.magicDamageBonusChange_id)
    end
    PRSstats.events.magicDamageBonusChange_id = registerAnonymousEventHandler("PRSState.Char.player.magicDamageBonus",
        function()
            if PRSState.Char.player.magicDamageBonus then
                magicDamage:echo(PRSState.Char.player.magicDamageBonus .. " ", "#b4009e", "r")
            end
        end)
    local magicDamageTitle = Geyser.Label:new({
        name = "magicDamageTitle"
    }, row5)
    magicDamageTitle:setColor(0, 0, 0, 0)
    magicDamageTitle:setFontSize(8)
    magicDamageTitle:echo("Magic Damage", "#aaaaaa", "l")
    local row6 = Geyser.HBox:new({
        name = "row6",
        width = "93%"
    }, statsVBox)
    local strengthCriticalMultiplier = Geyser.Label:new({
        name = "strengthCriticalMultiplier"
    }, row6)
    strengthCriticalMultiplier:setColor(0, 0, 0, 0)
    strengthCriticalMultiplier:setFontSize(8)
    strengthCriticalMultiplier:echo(PRSState.Char.player.strengthCriticalMultiplierBonus .. " ", "#c50f1f", "r")
    if PRSstats.events.strengthCriticalMultiplierBonusChange_id then
        killAnonymousEventHandler(PRSstats.events.strengthCriticalMultiplierBonusChange_id)
    end
    PRSstats.events.strengthCriticalMultiplierBonusChange_id =
        registerAnonymousEventHandler("PRSState.Char.player.strengthCriticalMultiplierBonus", function()
            if PRSState.Char.player.strengthCriticalMultiplierBonus then
                strengthCriticalMultiplier:echo(PRSState.Char.player.strengthCriticalMultiplierBonus .. " ", "#c50f1f", "r")
            end
        end)
    local strengthCriticalMultiplierTitle = Geyser.Label:new({
        name = "strengthCriticalMultiplierTitle"
    }, row6)
    strengthCriticalMultiplierTitle:setColor(0, 0, 0, 0)
    strengthCriticalMultiplierTitle:setFontSize(8)
    strengthCriticalMultiplierTitle:echo("x Multiplier", "#aaaaaa", "l")
    local magicFocus = Geyser.Label:new({
        name = "magicFocusBonus"
    }, row6)
    magicFocus:setColor(0, 0, 0, 0)
    magicFocus:setFontSize(8)
    magicFocus:echo(PRSState.Char.player.magicFocusBonus .. " ", "#61d6d6", "r")
    if PRSstats.events.magicFocusBonusChange_id then
        killAnonymousEventHandler(PRSstats.events.magicFocusBonusChange_id)
    end
    PRSstats.events.magicFocusBonusChange_id = registerAnonymousEventHandler("PRSState.Char.player.magicFocusBonus",
        function()
            if PRSState.Char.player.magicFocusBonus then
                magicFocus:echo(PRSState.Char.player.magicFocusBonus .. " ", "#61d6d6", "r")
            end
        end)
    local magicFocusTitle = Geyser.Label:new({
        name = "magicFocusTitle"
    }, row6)
    magicFocusTitle:setColor(0, 0, 0, 0)
    magicFocusTitle:setFontSize(8)
    magicFocusTitle:echo("Focus", "#aaaaaa", "l")
    local row7 = Geyser.HBox:new({
              name = "row7",
              width = "93%"
              }, statsVBox)
    local row8 = Geyser.HBox:new({
        name = "row8",
        width = "93%"
    }, statsVBox)
    -- Agility
    local agility = Geyser.Label:new({
        name = "agility"
    }, row8)
    agility:setColor(0, 0, 0, 0)
    agility:setFontSize(10)
    agility:echo(PRSState.Char.player._agility, "#f9f1a5", "r")
    if PRSstats.events._agilityChange_id then
        killAnonymousEventHandler(PRSstats.events._agilityChange_id)
    end
    PRSstats.events._agilityChange_id = registerAnonymousEventHandler("PRSState.Char.player._agility", function()
        if PRSState.Char.player._agility then
            agility:echo(PRSState.Char.player._agility, "#f9f1a5", "r")
        end
    end)
    local agilityDiv = Geyser.Label:new({
        name = "agilityDiv"
    }, row8)
    agilityDiv:setColor(0, 0, 0, 0)
    agilityDiv:setFontSize(10)
    agilityDiv:echo("+", "#767676", "c")
    local _agility = Geyser.Label:new({
        name = "_agility"
    }, row8)
    _agility:setColor(0, 0, 0, 0)
    _agility:setFontSize(10)
    _agility:echo(PRSState.Char.player.agility - PRSState.Char.player._agility, "#c19c00", "l")
    if PRSstats.events.agilityChange_id then
        killAnonymousEventHandler(PRSstats.events.agilityChange_id)
    end
    PRSstats.events.agilityChange_id = registerAnonymousEventHandler("PRSState.Char.player.agility", function()
        if PRSState.Char.player.agility and PRSState.Char.player._agility then
            _agility:echo(PRSState.Char.player.agility - PRSState.Char.player._agility, "#c19c00", "l")
        end
    end)
    -- Spirit
    local spirit = Geyser.Label:new({
        name = "spirit"
    }, row8)
    spirit:setColor(0, 0, 0, 0)
    spirit:setFontSize(10)
    spirit:echo(PRSState.Char.player._spirit, "#16c60c", "r")
    if PRSstats.events._spiritChange_id then
        killAnonymousEventHandler(PRSstats.events._spiritChange_id)
    end
    PRSstats.events._spiritChange_id = registerAnonymousEventHandler("PRSState.Char.player._spirit", function()
        if PRSState.Char.player._spirit then
            spirit:echo(PRSState.Char.player._spirit, "#16c60c", "r")
        end
    end)
    local spiritDiv = Geyser.Label:new({
        name = "spiritDiv"
    }, row8)
    spiritDiv:setColor(0, 0, 0, 0)
    spiritDiv:setFontSize(10)
    spiritDiv:echo("+", "#767676", "c")
    local _spirit = Geyser.Label:new({
        name = "_spirit"
    }, row8)
    _spirit:setColor(0, 0, 0, 0)
    _spirit:setFontSize(10)
    _spirit:echo(PRSState.Char.player.spirit - PRSState.Char.player._spirit, "#13a10e", "l")
    if PRSstats.events.spiritChange_id then
        killAnonymousEventHandler(PRSstats.events.spiritChange_id)
    end
    PRSstats.events.spiritChange_id = registerAnonymousEventHandler("PRSState.Char.player.spirit", function()
        if PRSState.Char.player._spirit and PRSState.Char.player.spirit then
            _spirit:echo(PRSState.Char.player.spirit - PRSState.Char.player._spirit, "#13a10e", "l")
        end
    end)
    local row9 = Geyser.HBox:new({
        name = "row9",
        width = "93%"
    }, statsVBox)
    local agilityTitle = Geyser.Label:new({
        name = "agilityTitle"
    }, row9)
    agilityTitle:setColor(0, 0, 0, 0)
    agilityTitle:setFontSize(10)
    agilityTitle:echo("Agility", "#ffffff", "c")
    local spiritTitle = Geyser.Label:new({
        name = "spiritTitle"
    }, row9)
    spiritTitle:setColor(0, 0, 0, 0)
    spiritTitle:setFontSize(10)
    spiritTitle:echo("Spirit", "#ffffff", "c")
    local row10 = Geyser.HBox:new({
        name = "row10",
        width = "93%"
    }, statsVBox)
    local agilitySpeed = Geyser.Label:new({
        name = "agilitySpeed"
    }, row10)
    agilitySpeed:setColor(0, 0, 0, 0)
    agilitySpeed:setFontSize(8)
    agilitySpeed:echo(PRSState.Char.player.agilitySpeedBonus .. " ", "#f9f1a5", "r")
    if PRSstats.events.agilitySpeedBonusChange_id then
        killAnonymousEventHandler(PRSstats.events.agilitySpeedBonusChange_id)
    end
    PRSstats.events.agilitySpeedBonusChange_id = registerAnonymousEventHandler("PRSState.Char.player.agilitySpeedBonus",
        function()
            if PRSState.Char.player.agilitySpeedBonus then
                agilitySpeed:echo(PRSState.Char.player.agilitySpeedBonus .. " ", "#f9f1a5", "r")
            end
        end)
    local agilitySpeedTitle = Geyser.Label:new({
        name = "agilitySpeedTitle"
    }, row10)
    agilitySpeedTitle:setColor(0, 0, 0, 0)
    agilitySpeedTitle:setFontSize(8)
    agilitySpeedTitle:echo("Speed", "#aaaaaa", "l")
    local spiritEnergy = Geyser.Label:new({
        name = "spiritEnergy"
    }, row10)
    spiritEnergy:setColor(0, 0, 0, 0)
    spiritEnergy:setFontSize(8)
    spiritEnergy:echo(PRSState.Char.player.spiritEnergyBonus .. " ", "#f2f2f2", "r")
    if PRSstats.events.spiritEnergyBonusChange_id then
        killAnonymousEventHandler(PRSstats.events.spiritEnergyBonusChange_id)
    end
    PRSstats.events.spiritEnergyBonusChange_id = registerAnonymousEventHandler("PRSState.Char.player.spiritEnergyBonus",
        function()
            if PRSState.Char.player.spiritEnergyBonus then
                spiritEnergy:echo(PRSState.Char.player.spiritEnergyBonus .. " ", "#f2f2f2", "r")
            end
        end)
    local spiritEnergyTitle = Geyser.Label:new({
        name = "spiritEnergyTitle"
    }, row10)
    spiritEnergyTitle:setColor(0, 0, 0, 0)
    spiritEnergyTitle:setFontSize(8)
    spiritEnergyTitle:echo("Max Energy", "#aaaaaa", "l")
    local row11 = Geyser.HBox:new({
        name = "row11",
        width = "93%"
    }, statsVBox)
    local skillCooldown = Geyser.Label:new({
        name = "skillCooldown"
    }, row11)
    skillCooldown:setColor(0, 0, 0, 0)
    skillCooldown:setFontSize(8)
    skillCooldown:echo(string.format("%0.2f", PRSState.Char.player.agilitySkillCooldownBonus) .. " ", "#c19c00", "r")
    if PRSstats.events.agilitySkillCooldownBonusChange_id then
        killAnonymousEventHandler(PRSstats.events.agilitySkillCooldownBonusChange_id)
    end
    PRSstats.events.agilitySkillCooldownBonusChange_id = registerAnonymousEventHandler(
        "PRSState.Char.player.agilityskillCooldownBonus", function()
            if PRSState.Char.player.agilitySkillCooldownBonus then
                skillCooldown:echo(string.format("%0.2f", PRSState.Char.player.agilityCooldownBonus) .. " ", "#c19c00", "r")
            end
        end)
    local skillCooldownTitle = Geyser.Label:new({
        name = "skillCooldownTitle"
    }, row11)
    skillCooldownTitle:setColor(0, 0, 0, 0)
    skillCooldownTitle:setFontSize(8)
    skillCooldownTitle:echo("Skill Cooldown", "#aaaaaa", "l")
    local spiritHealing = Geyser.Label:new({
        name = "spiritHealing"
    }, row11)
    spiritHealing:setColor(0, 0, 0, 0)
    spiritHealing:setFontSize(8)
    spiritHealing:echo(PRSState.Char.player.spiritHealingPowerBonus .. " ", "#3b78ff", "r")
    if PRSstats.events.spiritHealingPowerBonusChange_id then
        killAnonymousEventHandler(PRSstats.events.spiritHealingPowerBonusChange_id)
    end
    PRSstats.events.spiritHealingPowerBonusChange_id = registerAnonymousEventHandler("PRSState.Char.player.spiritHealingPowerBonus",
        function()
            if PRSState.Char.player.spiritHealingPowerBonus then
                spiritHealing:echo(PRSState.Char.player.spiritHealingPowerBonus .. " ", "#3b78ff", "r")
            end
        end)
    local spiritHealingTitle = Geyser.Label:new({
        name = "spiritHealingTitle"
    }, row11)
    spiritHealingTitle:setColor(0, 0, 0, 0)
    spiritHealingTitle:setFontSize(8)
    spiritHealingTitle:echo("Healing", "#aaaaaa", "l")
    local row12 = Geyser.HBox:new({
        name = "row12",
        width = "93%"
    }, statsVBox)
    local agilityCritical = Geyser.Label:new({
        name = "agilityCritical"
    }, row12)
    agilityCritical:setColor(0, 0, 0, 0)
    agilityCritical:setFontSize(8)
    agilityCritical:echo(string.format("%0.2f", PRSState.Char.player.agilityCriticalBonus) .. " ", "#e74856", "r")
    if PRSstats.events.agilityCriticalBonusChange_id then
        killAnonymousEventHandler(PRSstats.events.agilityCriticalBonusChange_id)
    end
    PRSstats.events.agilityCriticalBonusChange_id = registerAnonymousEventHandler(
        "PRSState.Char.player.agilityCriticalBonus", function()
            if PRSState.Char.player.agilityCriticalBonus then
                agilityCritical:echo(string.format("%0.2f", PRSState.Char.player.agilityCriticalBonus) .. " ", "#e74856",
                    "r")
            end
        end)
    local agilityCriticalTitle = Geyser.Label:new({
        name = "agilityCriticalTitle"
    }, row12)
    agilityCriticalTitle:setColor(0, 0, 0, 0)
    agilityCriticalTitle:setFontSize(8)
    agilityCriticalTitle:echo("% Critical Hit", "#aaaaaa", "l")
    local spiritCommand = Geyser.Label:new({
        name = "spiritCommand"
    }, row12)
    spiritCommand:setColor(0, 0, 0, 0)
    spiritCommand:setFontSize(8)
    spiritCommand:echo(PRSState.Char.player.spiritCommandBonus .. " ", "#16c60c", "r")
    if PRSstats.events.spiritCommandBonusChange_id then
        killAnonymousEventHandler(PRSstats.events.spiritCommandBonusChange_id)
    end
    PRSstats.events.spiritCommandBonusChange_id = registerAnonymousEventHandler("PRSState.Char.player.spiritCommandBonus",
        function()
            if PRSState.Char.player.spiritCommandBonus then
                spiritCommand:echo(PRSState.Char.player.spiritCommandBonus .. " ", "#16c60c", "r")
            end
        end)
    local spiritCommandTitle = Geyser.Label:new({
        name = "spiritCommandTitle"
    }, row12)
    spiritCommandTitle:setColor(0, 0, 0, 0)
    spiritCommandTitle:setFontSize(8)
    spiritCommandTitle:echo("Command", "#aaaaaa", "l")
    local row13 = Geyser.HBox:new({
        name = "row13",
        width = "93%"
    }, statsVBox)
    local agilityMovement = Geyser.Label:new({
      name = "agilityMovement"
    }, row13)
    agilityMovement:setColor(0, 0, 0, 0)
    agilityMovement:setFontSize(8)
    agilityMovement:echo(PRSState.Char.player.agilityMovementBonus .. " ", "#ffff00", "r")
    if PRSstats.events.agilityMovementBonusChange_id then
        killAnonymousEventHandler(PRSstats.events.agilityMovementBonusChange_id)
    end
    PRSstats.events.agilityMovementBonusChange_id = registerAnonymousEventHandler("PRSState.Char.player.agilityMovementBonus",
        function()
          if PRSState.Char.player.agilityMovementBonus then
              agilityMovement:echo(PRSState.Char.player.agilityMovementBonus .. " ", "#ffff00", "r")
          end
        end)
    local agilityMovementTitle = Geyser.Label:new({
        name = "agilityMovementTitle"
    }, row13)
    agilityMovementTitle:setColor(0, 0, 0, 0)
    agilityMovementTitle:setFontSize(8)
    agilityMovementTitle:echo("Movement", "#aaaaaa", "l")
    local spiritSummoning = Geyser.Label:new({
        name = "spiritSummoning"
    }, row13)
    spiritSummoning:setColor(0, 0, 0, 0)
    spiritSummoning:setFontSize(8)
    spiritSummoning:echo(PRSState.Char.player.spiritSummoningPowerBonus .. " ", "#13a10e", "r")
    if PRSstats.events.spiritSummoningPowerBonusChange_id then
        killAnonymousEventHandler(PRSstats.events.spiritSummoningPowerBonusChange_id)
    end
    PRSstats.events.spiritSummoningPowerBonusChange_id = registerAnonymousEventHandler("PRSState.Char.player.spiritSummoningPowerBonus",
        function()
            if PRSState.Char.player.spiritResistBonus then
                spiritSummoning:echo(PRSState.Char.player.spiritSummoningPowerBonus .. " ", "#13a10e", "r")
            end
        end)
    local spiritSummoningTitle = Geyser.Label:new({
        name = "spiritSummoningTitle"
    }, row13)
    spiritSummoningTitle:setColor(0, 0, 0, 0)
    spiritSummoningTitle:setFontSize(8)
    spiritSummoningTitle:echo("% Summoning", "#aaaaaa", "l")
    --        local row14 = Geyser.HBox:new({
    --            name = "row14",
    --            width = "93%"
    --            }, statsVBox)

    local combatTitle = Geyser.Label:new({
        name = "combatTitle",
        height = 30
    }, statsVBox)
    combatTitle:setColor(0, 0, 0, 0)
    combatTitle:setFontSize(8)
    combatTitle:echo("Combat", "#f2f2f2", "c")
    -- Damage
    local damageHBox = Geyser.HBox:new({
        name = "damageHBox",
        width = "93%"
    }, statsVBox)
    local damageTitle = Geyser.Label:new({
        name = "damageTitle"
    }, damageHBox)
    damageTitle:setColor(0, 0, 0, 0)
    damageTitle:setFontSize(8)
    damageTitle:echo("Damage:", "#aaaaaa", "r")
    local damage = Geyser.Label:new({
        name = "damage"
    }, damageHBox)
    damage:setColor(0, 0, 0, 0)
    damage:setFontSize(8)
    damage:echo(string.format("%0.0f", PRSState.Char.player.damLow) .. "-" ..
                    string.format("%0.0f", PRSState.Char.player.damHigh) .. " +" .. PRSState.Char.player.damage, "#e74856", "c")
    if PRSstats.events.damLowChange_id then
        killAnonymousEventHandler(PRSstats.events.damLowChange_id)
    end
    PRSstats.events.damLowChange_id = registerAnonymousEventHandler("PRSState.Char.player.damLow", function()
        if PRSState.Char.player.damLow then
            damage:echo(string.format("%0.0f", PRSState.Char.player.damLow) .. "-" ..
                            string.format("%0.0f", PRSState.Char.player.damHigh), "#e74856", "c")
        end
    end)
    if PRSstats.events.damHighChange_id then
        killAnonymousEventHandler(PRSstats.events.damHighChange_id)
    end
    PRSstats.events.damHighChange_id = registerAnonymousEventHandler("PRSState.Char.player.damHigh", function()
        if PRSState.Char.player.damHigh then
            damage:echo(string.format("%0.0f", PRSState.Char.player.damLow) .. "-" ..
                            string.format("%0.0f", PRSState.Char.player.damHigh), "#e74856", "c")
        end
    end)
    if PRSstats.events.damageChange_id then
        killAnonymousEventHandler(PRSstats.events.damageChange_id)
    end
    PRSstats.events.damageChange_id = registerAnonymousEventHandler("PRSState.Char.player.damage", function()
        if PRSState.Char.player.damage then
            damage:echo(string.format("%0.0f", PRSState.Char.player.damLow) .. "-" ..
                            string.format("%0.0f", PRSState.Char.player.damHigh) .. " +" .. PRSState.Char.player.damage,
                "#e74856", "c")
        end
    end)
    local dpr = Geyser.Label:new({
        name = "dpr"
    }, damageHBox)
    dpr:setColor(0, 0, 0, 0)
    dpr:setFontSize(8)
    dpr:echo(string.format("%0.1f", PRSState.Char.player.dpr) .. " dpr", "#c50f1f", "l")
    if PRSstats.events.dprChange_id then
        killAnonymousEventHandler(PRSstats.events.dprChange_id)
    end
    PRSstats.events.dprChange_id = registerAnonymousEventHandler("PRSState.Char.player.dpr", function()
        if PRSState.Char.player.dpr then
            dpr:echo(string.format("%0.1f", PRSState.Char.player.dpr) .. " dpr", "#c50f1f", "l")
        end
    end)
    -- Armor
    local armorHBox = Geyser.HBox:new({
        name = "armorHBox",
        width = "93%"
    }, statsVBox)
    local armorTitle = Geyser.Label:new({
        name = "armorTitle"
    }, armorHBox)
    armorTitle:setColor(0, 0, 0, 0)
    armorTitle:setFontSize(8)
    armorTitle:echo("Armor:", "#aaaaaa", "r")
    local armor = Geyser.Label:new({
        name = "armor"
    }, armorHBox)
    armor:setColor(0, 0, 0, 0)
    armor:setFontSize(8)
    armor:echo(PRSState.Char.player.armor, "#f2f2f2", "c")
    if PRSstats.events.armorChange_id then
        killAnonymousEventHandler(PRSstats.events.armorChange_id)
    end
    PRSstats.events.armorChange_id = registerAnonymousEventHandler("PRSState.Char.player.armor", function()
        if PRSState.Char.player.armor then
            armor:echo(PRSState.Char.player.armor, "#f2f2f2", "c")
        end
    end)
    local armorAbsorption = Geyser.Label:new({
        name = "armorAbsorption"
    }, armorHBox)
    armorAbsorption:setColor(0, 0, 0, 0)
    armorAbsorption:setFontSize(8)
    armorAbsorption:echo(string.format("%0.2f", PRSState.Char.player.armorAbsorption) .. " absorb", "#f2f2f2", "l")
    if PRSstats.events.armorAbsorptionChange_id then
        killAnonymousEventHandler(PRSstats.events.armorAbsorptionChange_id)
    end
    PRSstats.events.armorAbsorptionChange_id = registerAnonymousEventHandler("PRSState.Char.player.armorAbsorption",
        function()
            if PRSState.Char.player.armorAbsorption then
                armorAbsorption:echo(string.format("%0.2f", PRSState.Char.player.armorAbsorption) .. " absorb", "#f2f2f2", "l")
            end
        end)
    -- Speed
    local speedHBox = Geyser.HBox:new({
        name = "speedHBox",
        width = "93%"
    }, statsVBox)
    local speedTitle = Geyser.Label:new({
        name = "speedTitle"
    }, speedHBox)
    speedTitle:setColor(0, 0, 0, 0)
    speedTitle:setFontSize(8)
    speedTitle:echo("Speed:", "#aaaaaa", "r")
    local speed = Geyser.Label:new({
        name = "speed"
    }, speedHBox)
    speed:setColor(0, 0, 0, 0)
    speed:setFontSize(8)
    speed:echo(PRSState.Char.player.speed, "#f9f1a5", "c")
    if PRSstats.events.speedChange_id then
        killAnonymousEventHandler(PRSstats.events.speedChange_id)
    end
    PRSstats.events.speedChange_id = registerAnonymousEventHandler("PRSState.Char.player.speed", function()
        if PRSState.Char.player.speed then
            speed:echo(PRSState.Char.player.speed, "#f9f1a5", "c")
        end
    end)
    local regeneration = Geyser.Label:new({
        name = "xxxTime"
    }, speedHBox)
    regeneration:setColor(0, 0, 0, 0)
    regeneration:setFontSize(8)
    regeneration:echo(PRSState.Char.player.regeneration .. " regen", "#16c60c", "l")
    if PRSstats.events.regenerationChange_id then
        killAnonymousEventHandler(PRSstats.events.regenerationChange_id)
    end
    PRSstats.events.regenerationChange_id = registerAnonymousEventHandler("PRSState.Char.player.regeneration", function()
        if PRSState.Char.player.regeneration then
            regeneration:echo(PRSState.Char.player.regeneration, "#16c60c", "l")
        end
    end)
    -- Recovery
    local recoveryHBox = Geyser.HBox:new({
        name = "recoveryHBox",
        width = "93%"
    }, statsVBox)
    local recoveryTitle = Geyser.Label:new({
        name = "recoveryTitle"
    }, recoveryHBox)
    recoveryTitle:setColor(0, 0, 0, 0)
    recoveryTitle:setFontSize(8)
    recoveryTitle:echo("Recovery:", "#aaaaaa", "r")
    local recoveryTime = Geyser.Label:new({
        name = "recoveryTime"
    }, recoveryHBox)
    recoveryTime:setColor(0, 0, 0, 0)
    recoveryTime:setFontSize(8)
    recoveryTime:echo(string.format("%0.2f", PRSState.Char.player.recoveryTime) .. "s", "#f9f1a5", "c")
    if PRSstats.events.recoveryTimeChange_id then
        killAnonymousEventHandler(PRSstats.events.recoveryTimeChange_id)
    end
    PRSstats.events.recoveryTimeChange_id = registerAnonymousEventHandler("PRSState.Char.player.recoveryTime", function()
        if PRSState.Char.player.recoveryTime then
            recoveryTime:echo(string.format("%0.2f", PRSState.Char.player.recoveryTime) .. "s", "#f9f1a5", "c")
        end
    end)
    local apr = Geyser.Label:new({
        name = "apr"
    }, recoveryHBox)
    apr:setColor(0, 0, 0, 0)
    apr:setFontSize(8)
    apr:echo(string.format("%0.2f", PRSState.Char.player.apr) .. " apr", "#f9f1a5", "l")
    if PRSstats.events.aprChange_id then
        killAnonymousEventHandler(PRSstats.events.aprChange_id)
    end
    PRSstats.events.aprChange_id = registerAnonymousEventHandler("PRSState.Char.player.apr", function()
        if PRSState.Char.player.spr then
            apr:echo(string.format("%0.2f", PRSState.Char.player.apr) .. " apr", "#f9f1a5", "l")
        end
    end)
    -- Critical
    local criticalHBox = Geyser.HBox:new({
        name = "criticalHBox",
        width = "93%"
    }, statsVBox)
    local criticalTitle = Geyser.Label:new({
        name = "criticalTitle"
    }, criticalHBox)
    criticalTitle:setColor(0, 0, 0, 0)
    criticalTitle:setFontSize(8)
    criticalTitle:echo("Critical:", "#aaaaaa", "r")
    local criticalChance = Geyser.Label:new({
        name = "criticalChance"
    }, criticalHBox)
    criticalChance:setColor(0, 0, 0, 0)
    criticalChance:setFontSize(8)
    criticalChance:echo(string.format("%0.2f", PRSState.Char.player.criticalChance) .. "%", "#f9f1a5", "c")
    if PRSstats.events.criticalChanceChange_id then
        killAnonymousEventHandler(PRSstats.events.criticalChanceChange_id)
    end
    PRSstats.events.criticalChanceChange_id = registerAnonymousEventHandler("PRSState.Char.player.criticalChance",
        function()
            if PRSState.Char.player.criticalChance then
                criticalChance:echo(string.format("%0.2f", PRSState.Char.player.criticalChance) .. "%", "#f9f1a5", "c")
            end
        end)
    local criticalMultiplier = Geyser.Label:new({
        name = "criticalMultiplier"
    }, criticalHBox)
    criticalMultiplier:setColor(0, 0, 0, 0)
    criticalMultiplier:setFontSize(8)
    criticalMultiplier:echo(string.format("%0.2f", PRSState.Char.player.criticalMultiplier) .. "x", "#e74856", "l")
    if PRSstats.events.criticalMultiplierChange_id then
        killAnonymousEventHandler(PRSstats.events.criticalMultiplierChange_id)
    end
    PRSstats.events.criticalMultiplierChange_id = registerAnonymousEventHandler("PRSState.Char.player.criticalMultiplier",
        function()
            if PRSState.Char.player.criticalMultiplier then
                criticalMultiplier:echo(string.format("%0.2f", PRSState.Char.player.criticalMultiplier) .. "x", "#e74856",
                    "l")
            end
        end)
    -- Magic Damage & Casting
    local magicDamageHBox = Geyser.HBox:new({
        name = "magicDamageHBox",
        width = "93%"
    }, statsVBox)
    local magicDamageBonusTitle = Geyser.Label:new({
        name = "magicDamageBonusTitle"
    }, magicDamageHBox)
    magicDamageBonusTitle:setColor(0, 0, 0, 0)
    magicDamageBonusTitle:setFontSize(8)
    magicDamageBonusTitle:echo("Magic:", "#aaaaaa", "r")
    local magicDamageBonus = Geyser.Label:new({
        name = "magicDamageBonus"
    }, magicDamageHBox)
    magicDamageBonus:setColor(0, 0, 0, 0)
    magicDamageBonus:setFontSize(8)
    magicDamageBonus:echo("+" .. PRSState.Char.player.magicDamageBonus, "#b4009e", "c")
    if PRSstats.events.magicDamageBonusChange_id then
        killAnonymousEventHandler(PRSstats.events.magicDamageBonusChange_id)
    end
    PRSstats.events.magicDamageBonusChange_id = registerAnonymousEventHandler("PRSState.Char.player.magicDamageBonus",
        function()
            if PRSState.Char.player.magicDamageBonus then
                magicDamageBonus:echo("+" .. PRSState.Char.player.magicDamageBonus, "#b4009e", "c")
            end
        end)
    local magicCasting = Geyser.Label:new({
        name = "magicCasting"
    }, magicDamageHBox)
    magicCasting:setColor(0, 0, 0, 0)
    magicCasting:setFontSize(8)
    magicCasting:echo("cast " .. string.format("%0.2f", PRSState.Char.player.spellCooldown) .. "s", "#61d6d6", "l")
    if PRSstats.events.magicCastingChange_id then
        killAnonymousEventHandler(PRSstats.events.magicCastingChange_id)
    end
    PRSstats.events.magicCastingChange_id = registerAnonymousEventHandler("PRSState.Char.player.spellCooldown", function()
        if PRSState.Char.player.spellCooldown then
            magicCasting:echo("cast " .. string.format("%0.2f", PRSState.Char.player.spellCooldown) .. "s", "#61d6d6", "l")
        end
    end)
    -- Focus
    local focusHBox = Geyser.HBox:new({
        name = "focusHBox",
        width = "93%"
    }, statsVBox)
    local focusTitle = Geyser.Label:new({
        name = "focusTitle"
    }, focusHBox)
    focusTitle:setColor(0, 0, 0, 0)
    focusTitle:setFontSize(8)
    focusTitle:echo("Focus:", "#aaaaaa", "r")
    local focus = Geyser.Label:new({
        name = "focus"
    }, focusHBox)
    focus:setColor(0, 0, 0, 0)
    focus:setFontSize(8)
    focus:echo(PRSState.Char.player.focus, "#3b78ff", "c")
    if PRSstats.events.focusChange_id then
        killAnonymousEventHandler(PRSstats.events.focusChange_id)
    end
    PRSstats.events.focusChange_id = registerAnonymousEventHandler("PRSState.Char.player.focus", function()
        if PRSState.Char.player.focus then
            focus:echo(PRSState.Char.player.focus, "#3b78ff", "c")
        end
    end)
    local focusChance = Geyser.Label:new({
        name = "focusChance"
    }, focusHBox)
    focusChance:setColor(0, 0, 0, 0)
    focusChance:setFontSize(8)
    local resistancesTitle = Geyser.Label:new({
        name = "resistancesTitle",
        height = 30
    }, statsVBox)
    resistancesTitle:setColor(0, 0, 0, 0)
    resistancesTitle:setFontSize(8)
    resistancesTitle:echo("Resistances", "#f2f2f2", "c")
    -- Bludgeon, Arcane, & Acid
    local resist1HBox = Geyser.HBox:new({
        name = "resist1HBox",
        width = "93%"
    }, statsVBox)
    local resistBludgeoningTitle = Geyser.Label:new({
        name = "resistBludgeoningTitle"
    }, resist1HBox)
    resistBludgeoningTitle:setColor(0, 0, 0, 0)
    resistBludgeoningTitle:setFontSize(8)
    resistBludgeoningTitle:echo("Bludgeon: ", "#aaaaaa", "r")
    local resistBludgeoning = Geyser.Label:new({
        name = "resistBludgeoning"
    }, resist1HBox)
    resistBludgeoning:setColor(0, 0, 0, 0)
    resistBludgeoning:setFontSize(8)
    resistBludgeoning:echo(PRSState.Char.player.resistBludgeoning, "#c19c00", "l")
    if PRSstats.events.resistBludgeoningChange_id then
        killAnonymousEventHandler(PRSstats.events.resistBludgeoningChange_id)
    end
    PRSstats.events.resistBludgeoningChange_id = registerAnonymousEventHandler("PRSState.Char.player.resistBludgeoning",
        function()
            if PRSState.Char.player.resistBludgeoning then
                resistBludgeoning:echo(PRSState.Char.player.resistBludgeoning, "#c19c00", "l")
            end
        end)
    local arcaneTitle = Geyser.Label:new({
        name = "arcaneTitle"
    }, resist1HBox)
    arcaneTitle:setColor(0, 0, 0, 0)
    arcaneTitle:setFontSize(8)
    arcaneTitle:echo("Arcane: ", "#aaaaaa", "r")
    local resistArcane = Geyser.Label:new({
        name = "arcane"
    }, resist1HBox)
    resistArcane:setColor(0, 0, 0, 0)
    resistArcane:setFontSize(8)
    resistArcane:echo(PRSState.Char.player.resistArcane, "#61d6d6", "l")
    if PRSstats.events.resistArcaneChange_id then
        killAnonymousEventHandler(PRSstats.events.resistArcaneChange_id)
    end
    PRSstats.events.resistArcaneChange_id = registerAnonymousEventHandler("PRSState.Char.player.resistArcane", function()
        if PRSState.Char.player.resistArcane then
            resistArcane:echo(PRSState.Char.player.resistArcane, "#61d6d6", "l")
        end
    end)
    local resistAcidTitle = Geyser.Label:new({
        name = "resistAcidTitle"
    }, resist1HBox)
    resistAcidTitle:setColor(0, 0, 0, 0)
    resistAcidTitle:setFontSize(8)
    resistAcidTitle:echo("Acid: ", "#aaaaaa", "r")
    local resistAcid = Geyser.Label:new({
        name = "resistAcid"
    }, resist1HBox)
    resistAcid:setColor(0, 0, 0, 0)
    resistAcid:setFontSize(8)
    resistAcid:echo(PRSState.Char.player.resistAcid, "#f9f1a5", "l")
    if PRSstats.events.resistAcidChange_id then
        killAnonymousEventHandler(PRSstats.events.resistAcidChange_id)
    end
    PRSstats.events.resistAcidChange_id = registerAnonymousEventHandler("PRSState.Char.player.resistAcid", function()
        if PRSState.Char.player.resistAcid then
            resistAcid:echo(PRSState.Char.player.resistAcid, "#f9f1a5", "l")
        end
    end)
    -- Resistance Row 2: Pierce, Electric, & Holy
    local resist2HBox = Geyser.HBox:new({
        name = "resist2HBox",
        width = "93%"
    }, statsVBox)
    local resistPiercingTitle = Geyser.Label:new({
        name = "resistPiercingTitle"
    }, resist2HBox)
    resistPiercingTitle:setColor(0, 0, 0, 0)
    resistPiercingTitle:setFontSize(8)
    resistPiercingTitle:echo("Pierce: ", "#aaaaaa", "r")
    local resistPiercing = Geyser.Label:new({
        name = "resistPiercing"
    }, resist2HBox)
    resistPiercing:setColor(0, 0, 0, 0)
    resistPiercing:setFontSize(8)
    resistPiercing:echo(PRSState.Char.player.resistPiercing, "#f9f1a5", "l")
    if PRSstats.events.resistPiercingChange_id then
        killAnonymousEventHandler(PRSstats.events.resistPiercingChange_id)
    end
    PRSstats.events.resistPiercingChange_id = registerAnonymousEventHandler("PRSState.Char.player.resistPiercing",
        function()
            if PRSState.Char.player.resistPiercing then
                resistPiercing:echo(PRSState.Char.player.resistPiercing, "#f9f1a5", "l")
            end
        end)
    local resistElectricTitle = Geyser.Label:new({
        name = "resistElectricTitle"
    }, resist2HBox)
    resistElectricTitle:setColor(0, 0, 0, 0)
    resistElectricTitle:setFontSize(8)
    resistElectricTitle:echo("Electric: ", "#aaaaaa", "r")
    local resistElectric = Geyser.Label:new({
        name = "Electric"
    }, resist2HBox)
    resistElectric:setColor(0, 0, 0, 0)
    resistElectric:setFontSize(8)
    resistElectric:echo(PRSState.Char.player.resistElectric, "#f9f1a5", "l")
    if PRSstats.events.resistElectricChange_id then
        killAnonymousEventHandler(PRSstats.events.resistElectricChange_id)
    end
    PRSstats.events.resistElectricChange_id = registerAnonymousEventHandler("PRSState.Char.player.resistElectric",
        function()
            if PRSState.Char.player.resistElectric then
                resistElectric:echo(PRSState.Char.player.resistElectric, "#f9f1a5", "l")
            end
        end)
    local resistHolyTitle = Geyser.Label:new({
        name = "resistHolyTitle"
    }, resist2HBox)
    resistHolyTitle:setColor(0, 0, 0, 0)
    resistHolyTitle:setFontSize(8)
    resistHolyTitle:echo("Holy: ", "#aaaaaa", "r")
    local resistHoly = Geyser.Label:new({
        name = "Holy"
    }, resist2HBox)
    resistHoly:setColor(0, 0, 0, 0)
    resistHoly:setFontSize(8)
    resistHoly:echo(PRSState.Char.player.resistHoly, "#f2f2f2", "l")
    if PRSstats.events.resistHolyChange_id then
        killAnonymousEventHandler(PRSstats.events.resistHolyChange_id)
    end
    PRSstats.events.resistHolyChange_id = registerAnonymousEventHandler("PRSState.Char.player.resistHoly", function()
        if PRSState.Char.player.resistHoly then
            resistHoly:echo(PRSState.Char.player.resistHoly, "#f2f2f2", "l")
        end
    end)
    -- Row 3: Slash, Fire, & Poison
    local resist3HBox = Geyser.HBox:new({
        name = "resist3HBox",
        width = "93%"
    }, statsVBox)
    local resistSlashingTitle = Geyser.Label:new({
        name = "resistSlashingTitle"
    }, resist3HBox)
    resistSlashingTitle:setColor(0, 0, 0, 0)
    resistSlashingTitle:setFontSize(8)
    resistSlashingTitle:echo("Slash: ", "#aaaaaa", "r")
    local resistSlashing = Geyser.Label:new({
        name = "resistSlashing"
    }, resist3HBox)
    resistSlashing:setColor(0, 0, 0, 0)
    resistSlashing:setFontSize(8)
    resistSlashing:echo(PRSState.Char.player.resistSlashing, "#c50f1f", "l")
    if PRSstats.events.resistSlashingChange_id then
        killAnonymousEventHandler(PRSstats.events.resistSlashingChange_id)
    end
    PRSstats.events.resistSlashingChange_id = registerAnonymousEventHandler("PRSState.Char.player.resistSlashing",
        function()
            if PRSState.Char.player.resistSlashing then
                resistSlashing:echo(PRSState.Char.player.resistSlashing, "#c50f1f", "l")
            end
        end)
    local resistFireTitle = Geyser.Label:new({
        name = "resistFireTitle"
    }, resist3HBox)
    resistFireTitle:setColor(0, 0, 0, 0)
    resistFireTitle:setFontSize(8)
    resistFireTitle:echo("Fire: ", "#aaaaaa", "r")
    local resistFire = Geyser.Label:new({
        name = "Fire"
    }, resist3HBox)
    resistFire:setColor(0, 0, 0, 0)
    resistFire:setFontSize(8)
    resistFire:echo(PRSState.Char.player.resistFire, "#e74856", "l")
    if PRSstats.events.resistFireChange_id then
        killAnonymousEventHandler(PRSstats.events.resistFireChange_id)
    end
    PRSstats.events.resistFireChange_id = registerAnonymousEventHandler("PRSState.Char.player.resistFire", function()
        if PRSState.Char.player.resistFire then
            resistFire:echo(PRSState.Char.player.resistFire, "#e74856", "l")
        end
    end)
    local resistPoisonTitle = Geyser.Label:new({
        name = "resistPoisonTitle"
    }, resist3HBox)
    resistPoisonTitle:setColor(0, 0, 0, 0)
    resistPoisonTitle:setFontSize(8)
    resistPoisonTitle:echo("Poison: ", "#aaaaaa", "r")
    local resistPoison = Geyser.Label:new({
        name = "resistPoison"
    }, resist3HBox)
    resistPoison:setColor(0, 0, 0, 0)
    resistPoison:setFontSize(8)
    resistPoison:echo(PRSState.Char.player.resistPoison, "#13a10e", "l")
    if PRSstats.events.resistPoisonChange_id then
        killAnonymousEventHandler(PRSstats.events.resistPoisonChange_id)
    end
    PRSstats.events.resistPoisonChange_id = registerAnonymousEventHandler("PRSState.Char.player.resistPoison", function()
        if PRSState.Char.player.resistPoison then
            resistPoison:echo(PRSState.Char.player.resistPoison, "#13a10e", "l")
        end
    end)
    -- Ice
    local resist4HBox = Geyser.HBox:new({
        name = "resist4HBox",
        width = "93%"
    }, statsVBox)

    local resistIceTitle = Geyser.Label:new({
        name = "resistIceTitle"
    }, resist4HBox)
    resistIceTitle:setColor(0, 0, 0, 0)
    resistIceTitle:setFontSize(8)
    resistIceTitle:echo("Ice: ", "#aaaaaa", "r")
    local resistIce = Geyser.Label:new({
        name = "Ice"
    }, resist4HBox)
    resistIce:setColor(0, 0, 0, 0)
    resistIce:setFontSize(8)
    resistIce:echo(PRSState.Char.player.resistIce, "#3b78ff", "l")
    if PRSstats.events.resistIceChange_id then
        killAnonymousEventHandler(PRSstats.events.resistIceChange_id)
    end
    PRSstats.events.resistIceChange_id = registerAnonymousEventHandler("PRSState.Char.player.resistIce", function()
        if PRSState.Char.player.resistIce then
            resistIce:echo(PRSState.Char.player.resistIce, "#3b78ff", "l")
        end
    end)
end

local function gaugeUpdate(gauge, curVal, maxVal)
    if curVal > maxVal then
      maxVal = curVal
    end
    return curVal, maxval
end

local function add_gauges()
    -- Hit Points Gauge
    HPbar = SUG:new({
        name = "HP",
        y = 80,
        height = 25,
        width = "95%", -- everything up to here is standard Geyser.Gauge
        updateTime = 0,
        updateEvent = "PRSState.Char.player",
        textTemplate = "HP: |c / |m  (|p%)", -- gauge will show "HP: 500/1000 (50%)" as the text if you had 500 current and 1000 max hp
        currentVariable = "PRSState.Char.player.hp", -- if gmcp.Char.Vitals.hp is nil or unreachable, it will use the defaultCurrent of 50
        maxVariable = "PRSState.Char.player.maxHp", -- if gmcp.Char.Vitals.maxhp is nil or unreachable, it will use the defaultMax of 100
        updateHook = "gaugeUpdate"
    }, GUI.tabwindow1.Vitalscenter)
    HPbar.front:setStyleSheet([[background-color: #63e2b7;
      border-top: 1px black solid;
      border-left: 1px black solid;
      border-bottom: 1px black solid;
      border-radius: 10;
      margin-right: 5px;
      padding: 3px;
    ]])
    HPbar.back:setStyleSheet([[background-color: #303030;
      border-width: 0px;
      border-color: black;
      border-style: solid;
      border-radius: 10;
      margin-right: 5px;
      padding: 3px;
    ]])
    HPbar.text:setStyleSheet([[
      padding-left: 5px;
    ]])

    -- Energy Points Gauge
    ENbar = SUG:new({
        name = "EN",
        y = 115,
        height = 25,
        width = "95%",
        updateTime = 0,
        updateEvent = "PRSState.Char.player",
        textTemplate = "EN: |c / |m  (|p%)",
        currentVariable = "PRSState.Char.player.energy",
        maxVariable = "PRSState.Char.player.maxEnergy",
        updateHook = "gaugeUpdate"
    }, GUI.tabwindow1.Vitalscenter)
    ENbar.front:setStyleSheet([[background-color: #cccccc;
      border-top: 1px black solid;
      border-left: 1px black solid;
      border-bottom: 1px black solid;
      border-radius: 10;
      margin-right: 5px;
      padding: 3px;
    ]])
    ENbar.back:setStyleSheet([[background-color: #303030;
      border-width: 0px;
      border-color: black;
      border-style: solid;
      border-radius: 10;
      margin-right: 5px;
      padding: 3px;
    ]])
    ENbar.text:setStyleSheet([[
      padding-left: 5px;
    ]])

    -- Stamina Points Gauge
    STbar = SUG:new({
        name = "ST",
        y = 150,
        height = 25,
        width = "95%",
        updateTime = 0,
        updateEvent = "PRSState.Char.player",
        textTemplate = "ST: |c / |m  (|p%)",
        currentVariable = "PRSState.Char.player.stamina",
        maxVariable = "PRSState.Char.player.maxStamina",
        updateHook = "gaugeUpdate"
    }, GUI.tabwindow1.Vitalscenter)
    STbar.front:setStyleSheet([[background-color: #f2c97d;
      border-top: 1px black solid;
      border-left: 1px black solid;
      border-bottom: 1px black solid;
      border-radius: 10;
      margin-right: 5px;
      padding: 3px;]])
    STbar.back:setStyleSheet([[background-color: #303030;
      border-width: 0px;
      border-color: black;
      border-style: solid;
      border-radius: 10;
      margin-right: 5px;
      padding: 3px;]])
    STbar.text:setStyleSheet([[
      padding-left: 5px;
    ]])

    -- Food Points Gauge
    FPbar = SUG:new({
        name = "FP",
        y = 185,
        height = 25,
        width = "95%",
        updateTime = 0,
        updateEvent = "PRSState.Char.player",
        textTemplate = "Food: |c / |m  (|p%)",
        currentVariable = "PRSState.Char.player.food",
        maxVariable = "PRSState.Char.player.maxFood",
        updateHook = "gaugeUpdate"
    }, GUI.tabwindow1.Vitalscenter)
    FPbar.front:setStyleSheet([[background-color: #63e2b7;
      border-top: 1px black solid;
      border-left: 1px black solid;
      border-bottom: 1px black solid;
      border-radius: 10;
      margin-right: 5px;
      padding: 3px;
    ]])
    FPbar.back:setStyleSheet([[background-color: #303030;
      border-width: 0px;
      border-color: black;
      border-style: solid;
      border-radius: 10;
      margin-right: 5px;
      padding: 3px;
    ]])
    FPbar.text:setStyleSheet([[
      padding-left: 5px;
    ]])

    -- Rage Points Gauge
    RPbar = SUG:new({
        name = "RP",
        height = 25,
        width = "95%",
        updateTime = 0,
        updateEvent = "PRSState.Char.player",
        textTemplate = "Rage: |c",
        currentVariable = "PRSState.Char.player.rage",
        maxVariable = "PRSState.Char.player.maxRage",
        updateHook = "gaugeUpdate"
    }, GUI.tabwindow2.Combatcenter)
    RPbar.front:setStyleSheet([[background-color: #e74856;
        border-top: 1px black solid;
        border-left: 1px black solid;
        border-bottom: 1px black solid;
        border-radius: 10;
        margin-right: 5px;
        padding: 3px;]])
    RPbar.back:setStyleSheet([[background-color: #303030;
        border-width: 0px;
        border-color: black;
        border-style: solid;
        border-radius: 10;
        margin-right: 5px;
        padding: 3px;]])
    RPbar.text:setStyleSheet([[
      padding-left: 5px;
    ]])

    -- Combo Points Gauge
    CPbar = SUG:new({
        name = "CP",
        y = 45,
        height = 25,
        width = "95%",
        updateTime = 0,
        updateEvent = "PRSState.Char.player",
        textTemplate = "Combo: |c",
        currentVariable = "PRSState.Char.player.combo",
        maxVariable = "PRSState.Char.player.maxCombo",
        updateHook = "gaugeUpdate"
    }, GUI.tabwindow2.Combatcenter)
    CPbar.front:setStyleSheet([[background-color: #e74856;
        border-top: 1px black solid;
        border-left: 1px black solid;
        border-bottom: 1px black solid;
        border-radius: 10;
        margin-right: 5px;
        padding: 3px;]])
    CPbar.back:setStyleSheet([[background-color: #303030;
        border-width: 0px;
        border-color: black;
        border-style: solid;
        border-radius: 10;
        margin-right: 5px;
        padding: 3px;]])
    CPbar.text:setStyleSheet([[
      padding-left: 5px;
    ]])

    -- Experience Points Gauge
    if PRSState.Char.player.xpForNextLevel then

        PRSstats.xp = PRSstats.xp or {}
        PRSstats.xp.current = PRSState.Char.player.xp - PRSState.Char.player.xpForCurrentLevel
        PRSstats.xp.tnl = PRSState.Char.player.xpForNextLevel - PRSState.Char.player.xpForCurrentLevel

        XPbar = SUG:new({
            name = "XP",
            y = 45,
            height = 25,
            width = "95%",
            updateTime = 0,
            updateEvent = "PRSState.Char.player",
            textTemplate = "XP: |c / |m   (|p%)",
            currentVariable = "PRSstats.xp.current",
            maxVariable = "PRSstats.xp.tnl",
        updateHook = "gaugeUpdate"
        }, GUI.tabwindow1.Vitalscenter)
        XPbar.front:setStyleSheet([[background-color: #70c0e8;
        border-top: 1px black solid;
        border-left: 1px black solid;
        border-bottom: 1px black solid;
        border-radius: 10;
        margin-right: 5px;
        padding: 3px;
      ]])
        XPbar.back:setStyleSheet([[background-color: #303030;
        border-width: 0px;
        border-color: black;
        border-style: solid;
        border-radius: 10;
        margin-right: 5px;
        padding: 3px;
      ]])
        XPbar.text:setStyleSheet([[
        padding-left: 5px;
      ]])

        if PRSstats.events.xp_id then
            killAnonymousEventHandler(PRSstats.events.xp_id)
        end
        PRSstats.events.xp_id = registerAnonymousEventHandler("PRSState.Char.player.xp", function()
            PRSstats.xp.current = PRSState.Char.player.xp - PRSState.Char.player.xpForCurrentLevel
        end)

        if PRSstats.events.xpForCurrentLevel_id then
            killAnonymousEventHandler(PRSstats.events.xpForCurrentLevel_id)
        end
        PRSstats.events.xpForCurrentLevel_id = registerAnonymousEventHandler("PRSState.Char.player.xpForCurrentLevel",
            function()
                PRSstats.xp.current = PRSState.Char.player.xp - PRSState.Char.player.xpForCurrentLevel
                PRSstats.xp.tnl = PRSState.Char.player.xpForNextLevel - PRSState.Char.player.xpForCurrentLevel
            end)

        if PRSstats.events.xpForNextLevel_id then
            killAnonymousEventHandler(PRSstats.events.xpForNextLevel_id)
        end
        PRSstats.events.xpForNextLevel_id = registerAnonymousEventHandler("PRSState.Char.player.xpForNextLevel", function()
            if PRSState.Char.player.xpForNextLevel then
                PRSstats.xp.tnl = PRSState.Char.player.xpForNextLevel - PRSState.Char.player.xpForCurrentLevel
            end
        end)
    end
end

function PRSstats.stats()
    if PRSState and PRSState.Char and PRSState.Char.player then
        vitalsHeader()
        statsTab()
        add_gauges()
    else
        local initialize_ev_handler = registerAnonymousEventHandler("PRSState.Char.player", function()
            if PRSState and PRSState.Char and PRSState.Char.player and PRSState.Char.player.name then
                vitalsHeader()
                statsTab()
                add_gauges()
            end
        end, true)
    end
end
