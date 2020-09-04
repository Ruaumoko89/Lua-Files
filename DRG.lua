-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
end
 
-- //gs debugmode
-- //gs showswaps
function binds_on_load()
-- F9-F12
    send_command('bind f9 gs c cycle OffenseMode')
    send_command('bind f10 gs c cycle HybridMode')
    send_command('bind f11 gs c cycle CastingMode')
    send_command('bind f12 gs c cycle IdleMode')
-- ALT F9-12
    send_command('bind !f9 gs c update user')
    send_command('bind !f10 gs c cycle RangedMode')
    send_command('bind !f11 gs c cycle WeaponskillMode')
    send_command('bind !f12 gs c cycle Kiting')
-- CRTL F9-F12
    send_command('bind ^f9 gs c set DefenseMode Physical')
    send_command('bind ^f10 gs c set DefenseMode Magical')
    send_command('bind ^f11 gs c cycle PhysicalDefenseMode')
    send_command('bind ^f12 gs c reset DefenseMode')
end

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    -- Options: Override default values', 'DT')
    state.OffenseMode:options('Normal', 'Jump', 'DT', 'DW')
    state.HybridMode:options('Normal', 'PDT')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal','PDT')
    state.PhysicalDefenseMode:options('PDT', 'MDT')
end
 
-- Define sets and vars used by this job file.
function init_gear_sets()

    sets.precast.JA['Spirit Link'] = {hands="Peltast's Vmbrc. +1", head="Vishap Armet +1", ear1="Pratik Earring"}
    sets.precast.JA['Call Wyvern'] = {body="Pteroslaver Mail +3"}
    sets.precast.JA['Spirit Surge'] = {body="Pteroslaver Mail +3"}
	sets.precast.JA['Ancient Circle'] = {body="Founder's Breastplate", legs="Vishap Brais +3"}
	sets.precast.JA['Deep Breathing'] = {head="Pteroslaver Armet +3"}
	sets.precast.JA['Steady Wing'] = {body="Emicho Haubert", legs="Vishap Brais +3", hands="Despair Finger Gauntlets", feet="Pteroslaver Greaves +3", back="Updraft Mantle"}
	sets.precast.JA['Angon'] = {ammo="Angon", hands="Pteroslaver Finger Gauntlets +3"}
	
    -- Precast sets to enhance JAs
    sets.precast.JA.Jump = {ammo="Ginsen",
        head="Hjarrandi Helm",neck="Dragoon's Collar +1",
		ear1="Sherida Earring",ear2="Dedition Earring",
        body="Pteroslaver Mail +3",hands="Flamma Manopolas +2",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
        back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},waist="Ioskeha Belt +1",legs="Vishap Brais +3",feet="Ostro Greaves"}
    sets.precast.JA['High Jump'] = {ammo="Ginsen",
        head="Hjarrandi Helm",neck="Dragoon's Collar +1",
		ear1="Sherida Earring",ear2="Dedition Earring",
        body="Pteroslaver Mail +3",hands="Vishap Finger Gauntlets +2",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
        back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},waist="Ioskeha Belt +1",legs="Vishap Brais +3",feet="Ostro Greaves"}
    sets.precast.JA['Soul Jump'] = {ammo="Ginsen",
        head="Hjarrandi Helm",neck="Dragoon's Collar +1",
		ear1="Sherida Earring",ear2="Dedition Earring",
        body="Pteroslaver Mail +3",hands="Vishap Finger Gauntlets +2",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
        back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},waist="Ioskeha Belt +1",legs="Vishap Brais +3",feet="Ostro Greaves"}
    sets.precast.JA['Spirit Jump'] = {ammo="Ginsen",
        head="Hjarrandi Helm",neck="Dragoon's Collar +1",
		ear1="Sherida Earring",ear2="Dedition Earring",
        body="Pteroslaver Mail +3",hands="Vishap Finger Gauntlets +2",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
        back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},waist="Ioskeha Belt +1",legs="Vishap Brais +3",feet="Ostro Greaves"}
    sets.precast.JA['Super Jump'] = {ammo="Ginsen", 
        head="Valorous Mask",neck="Combatant's Torque",ear1="Tripudio Earring",ear2="Cessance Earring",
        body="Peltast's Plackart +1",hands="Emicho Gauntlets",ring1="Rajas Ring",ring2="Petrov Ring",
        back="Updraft Mantle",waist="Kentarch Belt +1",legs="Peltast's Cuissots +1",feet="Peltast's Schynbalds +1"}
     
    -- Healing Breath sets
    sets.HB = {}
    sets.HB.Pre = {body="Emicho Haubert", head="Pteroslaver Armet +3", legs="Vishap Brais +3", hands="Despair Finger Gauntlets", feet="Pteroslaver Greaves +3", back="Brigantia's Mantle"}
    sets.HB.Mid = {body="Emicho Haubert", head="Pteroslaver Armet +3", legs="Vishap Brais +3", hands="Despair Finger Gauntlets", feet="Pteroslaver Greaves +3", back="Brigantia's Mantle"}
         
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
         
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
 
    sets.midcast.Breath = 
    set_combine(
        sets.midcast.FastRecast, 
        { head="Vishap Armet +1" })
     
    -- Fast cast sets for spells
     
    sets.precast.FC = {head="Vishap Armet +1", body="Sulevia's Breastplate +2", legs="Carmine Cuisses +1", feet="Carmine Greaves +1", neck="Baetyl Pendant", ear1="Etiolation Earring", ear2="Loquacious Earring",
	                   ring1="Defending Ring", ring2="Weatherspoon Ring", ammo="Sapience Orb"}
     
    -- Midcast Sets
    sets.midcast.FastRecast = {head="Vishap Armet +1", body="Jumalik Mail", legs="Carmine Cuisses +1", feet="Carmine Greaves +1", neck="Baetyl Pendant", ear1="Etiolation Earring", ear2="Loquacious Earring",
	                   ring1="Defending Ring", ring2="Weatherspoon Ring", ammo="Sapience Orb"}  
         
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Knobkierrie",
        head="Pteroslaver Armet +3", body="Pteroslaver Mail +3",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}, hands="Pteroslaver Finger Gauntlets +3",
		neck="Fotia Gorget", waist="Fotia Belt", legs="Pteroslaver Brais +3", feet="Pteroslaver Greaves +3", ring1="Niqmaddu Ring", ring2="Regal Ring", ear1="Sherida Earring", ear2="Moonshade Earring"}
 
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Stardiver'] = {ammo="Knobkierrie",
        head="Pteroslaver Armet +3", body="Dagon Breastplate",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}, hands="Sulevia's Gauntlets +2",
		neck="Fotia Gorget", waist="Fotia Belt", legs="Sulevia's Cuisses +2", feet="Emicho Gambieras +1", ring1="Niqmaddu Ring", ring2="Regal Ring", ear1="Sherida Earring", ear2="Moonshade Earring"}
	
    sets.precast.WS['Drakesbane'] = set_combine(sets.precast.WS, {feet="Flamma Gambieras +2", legs="Peltast's Cuissots +1", body="Hjarrandi Breastplate",
	    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10',}},
	    ring1="Niqmaddu Ring", ring2="Regal Ring", hands="Flamma Manopolas +2", waist="Grunfeld Rope", neck="Dragoon's Collar +1"})
																 
	sets.precast.WS['Impulse Drive'] = set_combine(sets.precast.WS, {body="Vishap Mail +3", ammo="Knobkierrie", hands="Pteroslaver Finger Gauntlets +3",
	    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}, neck="Dragoon's Collar +1", 
	    waist="Metalsinger Belt", legs="Vishap Brais +3", feet="Sulevia's Leggings +2", ring1="Niqmaddu Ring", ring2="Regal Ring", head="Hjarrandi Helm",
		ear1="Thrud Earring", ear2="Moonshade Earring"})
		
	sets.precast.WS['Wheeling Thrust'] = set_combine(sets.precast.WS, {body="Sulevia's Platemail +1",  
	    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}, neck="Caro Necklace", 
	    waist="Grunfeld Rope", legs="Vishap Brais +3", feet="Sulevia's Leggings +2", ring1="Niqmaddu Ring", ring2="Shukuyu Ring", 
		ear1="Ishvara Earring", ear2="Moonshade Earring"})
		
	sets.precast.WS['Sonic Thrust'] = set_combine(sets.precast.WS, {body="Sulevia's Platemail +2", head="Flamma Zucchetto +2",
	    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}, neck="Caro Necklace", hands="Pteroslaver Finger Gauntlets +3",
	    waist="Metalsinger Belt", legs="Vishap Brais +3", feet="Sulevia's Leggings +2", ring1="Niqmaddu Ring", ring2="Regal Ring", 
		ear1="Thrud Earring", ear2="Moonshade Earring"})
		
    sets.precast.WS['Leg Sweep'] = set_combine(sets.precast.WS, {body="Flamma Korazin +2", back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	    neck="Combatant's Torque", hands="Flamma Manopolas +2", waist="Eschan Stone", legs="Flamma Dirs +2", feet="Flamma Gambieras +2", ring1="Niqmaddu Ring", ring2="Rufescent Ring", head="Flamma Zucchetto +2",
		ear1="Dignitary's Earring", ear2="Moonshade Earring"})
																  
	sets.precast.WS["Camlann's Torment"] = set_combine(sets.precast.WS, {body="Vishap Mail +3", ammo="Knobkierrie", hands="Pteroslaver Finger Gauntlets +3",
	    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}, neck="Dragoon's Collar +1", 
	    waist="Metalsinger Belt", legs="Vishap Brais +3", feet="Sulevia's Leggings +2", ring1="Niqmaddu Ring", ring2="Regal Ring", 
		ear1="Ishvara Earring", ear2="Thrud Earring"})
 
    sets.precast.WS['Full Swing'] = set_combine(sets.precast.WS, {body="Pteroslaver Mail +3", ammo="Knobkierrie", hands="Pteroslaver Finger Gauntlets +3",
	    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}, neck="Dragoon's Collar +1", 
	    waist="Metalsinger Belt", legs="Vishap Brais +3", feet="Sulevia's Leggings +2", ring1="Niqmaddu Ring", ring2="Regal Ring", head="Pteroslaver Armet +3",
		ear1="Ishvara Earring", ear2="Moonshade Earring"})
		
	sets.precast.WS['Retribution'] = set_combine(sets.precast.WS, {body="Pteroslaver Mail +3", ammo="Knobkierrie", hands="Pteroslaver Finger Gauntlets +3",
	    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}, neck="Dragoon's Collar +1", 
	    waist="Metalsinger Belt", legs="Vishap Brais +3", feet="Sulevia's Leggings +2", ring1="Niqmaddu Ring", ring2="Regal Ring", head="Pteroslaver Armet +3",
		ear1="Ishvara Earring", ear2="Moonshade Earring"})
 
    sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS, {body="Vishap Mail +3", ammo="Knobkierrie", hands="Pteroslaver Finger Gauntlets +3",
	    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}, neck="Dragoon's Collar +1", 
	    waist="Metalsinger Belt", legs="Vishap Brais +3", feet="Sulevia's Leggings +2", ring1="Niqmaddu Ring", ring2="Regal Ring", 
		ear1="Ishvara Earring", ear2="Moonshade Earring"})
		
	sets.precast.WS['Vorpal Blade'] = set_combine(sets.precast.WS, {feet="Flamma Gambieras +2", legs="Peltast's Cuissots +1", body="Hjarrandi Breastplate",
	    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10',}},
	    ring1="Niqmaddu Ring", ring2="Regal Ring", hands="Flamma Manopolas +2", waist="Grunfeld Rope", neck="Dragoon's Collar +1"})
 
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {head="Yaoyotl Helm",back="Letalis Mantle"})
     
    -- Resting sets
    sets.resting = {head="Yaoyotl Helm",neck="Wiglen Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Ares' cuirass +1",hands="Cizin Mufflers",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Letalis Mantle",waist="Goading Belt",legs="Blood Cuisses",feet="Ejekamal Boots"}
     
    -- Idle sets
    sets.idle = {ammo="Ginsen",
        head="Sulevia's Mask +2", body="Jumalik Mail",
        back="Moonbeam Cape", neck="Loricate Torque +1",
        hands="Sulevia's Gauntlets +1", waist="Nierenschutz",
        legs="Carmine Cuisses +1",feet="Amm Greaves",
        ring1="Defending Ring", ring2="Moonbeam Ring",
        ear1="Odnowa Earring", ear2="Odnowa Earring +1"}
 
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle.Town = {ammo="Staunch Tathlum +1",
        head="Sulevia's Mask +2", body="Vishap Mail +3",
        back="Moonbeam Cape", neck="Dragoon's Collar +1",
        hands="Sulevia's Gauntlets +2", waist="Flume Belt",
        legs="Carmine Cuisses +1",feet="Amm Greaves",
        ring1="Defending Ring", ring2="Vocane Ring",
        ear1="Odnowa Earring", ear2="Odnowa Earring +1"}
     
    sets.idle.Field = {
        ammo="Staunch Tathlum +1",
        head="Sulevia's Mask +2", body="Vishap Mail +3",
        back="Moonbeam Cape", neck="Dragoon's Collar +1",
        hands="Sulevia's Gauntlets +2", waist="Flume Belt",
        legs="Carmine Cuisses +1",feet="Amm Greaves",
        ring1="Defending Ring", ring2="Vocane Ring",
        ear1="Odnowa Earring", ear2="Odnowa Earring +1"}
 
    sets.idle.Weak = {
        ammo="Ginsen",
        head="Sulevia's Mask +2", body="Sulevia's Platemail +2",
        back="Moonbeam Cape", neck="Loricate Torque +1",
        hands="Sulevia's Gauntlets +2", waist="Nierenschutz",
        legs="Carmine Cuisses",feet="Amm Greaves",
        ring1="Defending Ring", ring2="Gelatinous Ring +1",
        ear1="Odnowa Earring", ear2="Odnowa Earring +1"}
     
    -- Defense sets
    sets.defense.PDT = {ammo="Hagneia Stone",
        head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Mikinaak Breastplate",hands="Cizin Mufflers",ring1="Dark Ring",ring2="Dark Ring",
        back="Letalis Mantle",waist="Goading Belt",legs="Cizin Breeches",feet="Karieyh Sollerets +1"}
 
    sets.defense.Reraise = {
        head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Twilight Mail",hands="Buremte Gloves",ring1="Dark Ring",ring2="Paguroidea Ring",
        back="Letalis Mantle",waist="Goading Belt",legs="Cizin Breeches",feet="Karieyh Sollerets +1"}
 
    sets.defense.MDT = {ammo="Demonry Stone",
        head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Mikinaak Breastplate",hands="Cizin Mufflers",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Engulfer Cape",waist="Goading Belt",legs="Cizin Breeches",feet="Karieyh Sollerets +1"}
 
    sets.Kiting = {legs="Blood Cuisses"}
 
    sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
 
    -- Engaged sets
 
    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
     
    -- Normal melee group
        sets.engaged = {
        ammo="Ginsen",
        head="Hjarrandi Helm", 
		body="Hjarrandi Breastplate",
        back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}, neck="Dragoon's Collar +1",
        hands="Sulevia's Gauntlets +2", waist="Ioskeha Belt +1",
        legs="Pteroslaver Brais +3", feet="Flamma Gambieras +2",
        ring1="Niqmaddu Ring", ring2="Defending Ring",
        ear1="Sherida Earring", ear2="Cessance Earring"}
        -- 19~26% Haste (Trishula/Geirrothr) / 1306 Accuracy / 54% Double Attack / 71 Store TP.
		-- This set will still cap Haste with Haste II and Honor March (19% + 20% + 45% = Overcapped)
	sets.engaged.Jump = {ammo="Ginsen",
        head="Hjarrandi Helm", 
		body="Hjarrandi Breastplate",
        back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}, neck="Dragoon's Collar +1",
        hands="Flamma Manopolas +2", waist="Ioskeha Belt +1",
        legs="Vishap Brais +3", feet="Flamma Gambieras +2",
        ring1="Niqmaddu Ring", ring2="Chirich Ring +1",
        ear1="Sherida Earring", ear2="Telos Earring"}
		-- Modification of the base TP set. The difference here is that there is some Wyvern HP+ worked in to increase the damage of Jump attacks.
    sets.engaged.DT = {
        ammo="Ginsen",
        head="Hjarrandi Helm", body="Hjarrandi Breastplate",
        back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}, neck="Dragoon's Collar +1",
        hands="Flamma Manopolas +2", waist="Ioskeha Belt +1",
        legs="Pteroslaver Brais +3",feet="Flamma Gambieras +2",
        ring1="Defending Ring", ring2="Vocane Ring",
        ear1="Telos Earring", ear2="Cessance Earring"}
		-- 26% Equipment Haste when using Geirrothr, 19% when not. 
		-- About Haste: 20% from Wyvern/Hasso. 19~26% from Equipment. 80% is the total cap, so 37~41% Magic Haste is needed to fully cap. Very simple to achieve, even with Trusts.
	sets.engaged.DW = {
        ammo="Ginsen",
        head="Valorous Mask", 
		body="Hjarrandi Breastplate",
        back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}, neck="Dragoon's Collar +1",
        hands="Emicho Gauntlets +1", waist="Ioskeha Belt +1",
        legs="Pteroslaver Brais +3", feet="Flamma Gambieras +2",
        ring1="Niqmaddu Ring", ring2="Chirich Ring +1",
        ear1="Sherida Earring", ear2="Suppanomimi"}
		
	sets.buff.Circle = set_combine(sets.engaged, {body="Founder's Breastplate"})
end
    
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------
 
-- Set eventArgs.handled to true if we don't want any automatic target handling to be done.
function job_pretarget(spell, action, spellMap, eventArgs)
 
end
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
    equip(sets.precast.FC)
    end
end
 
-- Run after the default precast() is done.
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
function job_post_precast(spell, action, spellMap, eventArgs)
 
end
 
function job_buff_change(buff, gain)
    if buff == 'Ancient Circle' then
        if gain then
            equip(sets.buff.Circle)
            disable('body')
        else
            enable('body')
        end
    end
end
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
        if spell.action_type == 'Magic' then
        equip(sets.midcast.FastRecast)
        if player.hpp < 51 then
            classes.CustomClass = "Breath" -- This would cause it to look for sets.midcast.Breath 
        end
    end
end
 
-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
     
--  if state.DefenseMode == 'Reraise' or
--      (state.Defense.Active and state.Defense.Type == 'Physical' and state.Defense.PhysicalMode == 'Reraise') then
--      equip(sets.Reraise)
--  end
end
 
-- Runs when a pet initiates an action.
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_pet_midcast(spell, action, spellMap, eventArgs)
if spell.english:startswith('Healing Breath') or spell.english == 'Restoring Breath' then
        equip(sets.HB.Mid)
    end
end
 
-- Run after the default pet midcast() is done.
-- eventArgs is the same one used in job_pet_midcast, in case information needs to be persisted.
function job_pet_post_midcast(spell, action, spellMap, eventArgs)
     
end
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
--function job_aftercast(spell, action, spellMap, eventArgs)
--if state.DefenseMode == 'Reraise' or
        --(state.Defense.Active and state.Defense.Type == 'Physical' and state.Defense.PhysicalMode == 'Reraise') then
    --end
--end
 
-- Run after the default aftercast() is done.
-- eventArgs is the same one used in job_aftercast, in case information needs to be persisted.
function job_post_aftercast(spell, action, spellMap, eventArgs)
 
end
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_pet_aftercast(spell, action, spellMap, eventArgs)
 
end
 
-- Run after the default pet aftercast() is done.
-- eventArgs is the same one used in job_pet_aftercast, in case information needs to be persisted.
function job_pet_post_aftercast(spell, action, spellMap, eventArgs)
 
end
 
 
-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------
 
-- Called before the Include starts constructing melee/idle/resting sets.
-- Can customize state or custom melee class values at this point.
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_handle_equipping_gear(status, eventArgs)
 
end
 
-- Return a customized weaponskill mode to use for weaponskill sets.
-- Don't return anything if you're not overriding the default value.
function get_custom_wsmode(spell, action, spellMap)
 
end
 
-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    return idleSet
end
 
-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    return meleeSet
end
 
-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------
 
-- Called when the player's status changes.
function job_status_change(newStatus, oldStatus, eventArgs)
 
end
 
-- Called when the player's pet's status changes.
function job_pet_status_change(newStatus, oldStatus, eventArgs)
 
end
 
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
 
end
 
function job_update(cmdParams, eventArgs)
    --state.CombatForm = get_combat_form()
end
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------
 
-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
 
end
 
--function get_combat_form()
--  if areas.Adoulin:contains(world.area) and buffactive.ionis then
--      return 'Adoulin'
--  end
--end
 
-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    classes.CustomMeleeGroups:clear()
    if areas.Adoulin:contains(world.area) and buffactive.ionis then
        classes.CustomMeleeGroups:append('Adoulin')
    end
end
 
-- Job-specific toggles.
function job_toggle(field)
 
end
 
-- Request job-specific mode lists.
-- Return the list, and the current value for the requested field.
function job_get_mode_list(field)
 
end
 
-- Set job-specific mode values.
-- Return true if we recognize and set the requested field.
function job_set_mode(field, val)
 
end
 
-- Handle auto-targetting based on local setup.
function job_auto_change_target(spell, action, spellMap, eventArgs)
 
end
 
-- Handle notifications of user state values being changed.
function job_state_change(stateField, newValue)
 
end
 
-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
 
end
 
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
function select_default_macro_book()
    set_macro_page(1, 7)
end