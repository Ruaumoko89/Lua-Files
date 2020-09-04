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

function job_setup()
    state.Buff['Climactic Flourish'] = buffactive['Climactic Flourish'] or false
	state.Buff['Building Flourish'] = buffactive['Building Flourish'] or false
end

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    -- Options: Override default values', 'DT')
    state.OffenseMode:options('Normal', 'DT', 'MEVA')
    state.HybridMode:options('Normal', 'PDT')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal','Speed')
    state.PhysicalDefenseMode:options('PDT', 'MDT')
end
 
-- Define sets and vars used by this job file.
function init_gear_sets()

    sets.precast.JA['Haste Samba'] = {head="Maxixi Tiara +2"}
	sets.precast.JA['Drain Samba III'] = {head="Maxixi Tiara +2"}
	sets.precast.JA['Chocobo Jig II'] = {legs="Horos Tights +3", feet="Maxixi Toe Shoes +2"}
	sets.precast.JA['Spectral Jig'] = {legs="Horos Tights +3", feet="Maxixi Toe Shoes +2"}
	sets.precast.JA['Quickstep'] = {hands="Maxixi Bangles +3", head="Maxixi Tiara +2", feet="Horos Toe Shoes +3"}
	sets.precast.JA['Box Step'] = {hands="Maxixi Bangles +3", head="Maxixi Tiara +2", feet="Horos Toe Shoes +3"}
	sets.precast.JA['Stutter Step'] = {hands="Maxixi Bangles +3", head="Maxixi Tiara +2", feet="Horos Toe Shoes +3"}
	sets.precast.JA['Feather Step'] = {hands="Maxixi Bangles +3", head="Maxixi Tiara +2", feet="Maculele Toeshoes +1"}
	sets.precast.JA['Climactic Flourish'] = {head="Maculele Tiara +1"}
	sets.precast.JA['No Foot Rise'] = {body="Horos Casaque +3"}
	
	sets.precast.JA['Trance'] = {head="Horos Tiara +3"}
	
	sets.precast.JA['Violent Flourish'] = {ammo="Yamarang", neck="Sanctity Necklace", waist="Eschan Stone", left_ear="Telos Earring", right_ear="Sherida Earring", 
        head="Malignance Chapeau", body="Horos Casaque +3", hands="Malignance Gloves",
		back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
        legs="Malignance Tights", feet="Malignance Boots", left_ring="Ilabrat Ring", right_ring="Gere Ring"}
		
	sets.precast.JA['Reverse Flourish'] = {back="Toetapper Mantle", hands="Maculele Bangles +1"}
	
	sets.precast.Waltz = {
        head="Horos Tiara +3",
		neck="Etoile Gorget +1",
        body="Maxixi Casaque +3",
		hands="Maxixi Bangles +3",
		legs="Horos Tights +3",
		feet="Maxixi Toeshoes +3",
		waist="Aristo Belt",
		back={ name="Senuna's Mantle", augments={'CHR+20','Eva.+20 /Mag. Eva.+20','CHR+10','Enmity+10','Phys. dmg. taken-10%',}},
		left_ring="Carbuncle Ring",
		right_ring="Carbuncle Ring"}
		
	sets.precast.JA['Provoke'] = {hands="Kurys Gloves", back="Reiki Cloak", legs="Wukong's Hakama +1", feet="Ahosi Leggings", head="",
	               neck="Warder's Charm +1", ring1="Petrov Ring", ring2="Supershear Ring", body="Emet Harness +1", waist="Sinew Belt",
				   ear1="Friomisi Earring", ear2="Cryptic Earring", ammo="Sapience Orb"} 
	
	sets.precast.JA['Animated Flourish'] = {hands="Kurys Gloves", back="Reiki Cloak", legs="Wukong's Hakama +1", feet="Ahosi Leggings", head="",
	               neck="Warder's Charm +1", ring1="Petrov Ring", ring2="Supershear Ring", body="Emet Harness +1", waist="Sinew Belt",
				   ear1="Friomisi Earring", ear2="Cryptic Earring", ammo="Sapience Orb"}
	
	
    -- Fast cast sets for spells
     
    sets.precast.FC = {ammo="Sapience Orb",ear1="Etiolation Earring",ear2="Loquacious Earring",hands="Leyline Gloves",ring1="Rahab Ring",
	                   head="Herculean Helm",body="Passion Jacket",neck="Magoraga Beads",legs="Malignance Tights",feet="Malignance Boots",back="Moonbeam Cape"}
     
    -- Midcast Sets
    sets.midcast.FastRecast = {ammo="Sapience Orb",ear1="Etiolation Earring",ear2="Loquacious Earring",hands="Leyline Gloves",ring1="Prolix Ring",
	                           head="Herculean Helm",body="Passion Jacket",neck="Magoraga Beads"}  
	sets.midcast['Flash'] = {hands="Kurys Gloves", back="Reiki Cloak", legs="Wukong's Hakama +1", feet="Ahosi Leggings", head="Halitus Helm",
	               neck="Warder's Charm +1", ring1="Petrov Ring", ring2="Supershear Ring", body="Emet Harness +1", waist="Sinew Belt",
				   ear1="Friomisi Earring", ear2="Cryptic Earring", ammo="Sapience Orb"}
         
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {body="Abnoba Kaftan", hands="Meg. Gloves +2", legs="Lustr. Subligar +1", feet="Lustra. Leggings +1", neck="Etoile Gorget +1", ammo="Expeditious Pinion",
	     waist="Grunfeld Rope", left_ear="Moonshade Earring",  right_ear="Ishvara Earring", left_ring="Regal Ring", right_ring="Ilabrat Ring", back="", head="Lustratio Cap +1"}
 
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Rudra's Storm"] = {body="Herculean Vest", hands="Maxixi Bangles +3", legs="Horos Tights +3", feet="Lustra. Leggings +1", neck="Etoile Gorget +1", 
	     back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}, ammo="Charis Feather",
	     waist="Grunfeld Rope", left_ear="Moonshade Earring",  right_ear="Ishvara Earring", left_ring="Regal Ring", right_ring="Ilabrat Ring", head="Lustratio Cap +1"}
		 
	sets.precast.WS["Shark Bite"] = {body="Herculean Vest", hands="Maxixi Bangles +3", legs="Horos Tights +3", feet="Lustra. Leggings +1", neck="Etoile Gorget +1", 
	     back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}, ammo="Charis Feather",
	     waist="Grunfeld Rope", left_ear="Moonshade Earring",  right_ear="Ishvara Earring", left_ring="Regal Ring", right_ring="Ilabrat Ring", head="Lustratio Cap +1"}
		 
	sets.precast.WS["Viper Bite"] = {body="Herculean Vest", hands="Meg. Gloves +2", legs="Horos Tights +3", feet="Lustra. Leggings +1", neck="Etoile Gorget +1", 
	     back="Sacro Mantle", ammo="Charis Feather",
	     waist="Grunfeld Rope", left_ear="Moonshade Earring",  right_ear="Ishvara Earring", left_ring="Regal Ring", right_ring="Ilabrat Ring", head="Lustratio Cap +1"}
	
	sets.precast.WS["Evisceration"] = {left_ear="Moonshade Earring",  right_ear="Ishvara Earring", ammo="Charis Feather",
        head="Adhemar bonnet +1", body="Abnoba Kaftan", hands="Adhemar Wristbands +1", ring1="Begrudging Ring", ring2="Ilabrat ring", neck="Fotia Gorget", waist="Fotia Belt",
		back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}, legs="Maxixi Tights +3", feet="Lustra. Leggings +1"}
	
	sets.precast.WS["Pyrrhic Kleos"] = {body="Adhemar Jacket +1", hands="Adhemar Wristbands +1", legs="Maxixi Tights +3", feet="Lustra. Leggings +1", neck="Fotia Gorget", 
	     back="Sacro Mantle", ammo="Expeditious Pinion",
	     waist="Fotia Belt", left_ear="Brutal Earring",  right_ear="Sherida Earring", left_ring="Regal Ring", right_ring="Ilabrat Ring", head="Lustratio Cap +1"}
																	 
    sets.precast.WS["Exenterator"] = {hands="Meg. Gloves +2", legs="Lustr. Subligar +1", feet="Lustra. Leggings +1", neck="Fotia Gorget", waist="Fotia Belt", back="Sacro Mantle",
	     left_ear="Moonshade Earring",  right_ear="Ishvara Earring", left_ring="Regal Ring", right_ring="Ilabrat Ring", legs="Maxixi Tights +2", head="Adhemar Bonnet +1"}	
		 
	sets.precast.WS["Aeolian Edge"] = {head={ name="Herculean Helm", augments={'Mag. Acc.+12 "Mag.Atk.Bns."+12','Weapon skill damage +2%','INT+6','Mag. Acc.+3','"Mag.Atk.Bns."+13',}},
         body="Samnuha Coat", hands="Leyline Gloves", legs={ name="Herculean Trousers", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','INT+9','Mag. Acc.+8','"Mag.Atk.Bns."+15',}},
         feet={ name="Herculean Boots", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Weapon skill damage +2%','"Mag.Atk.Bns."+13',}}, neck="Sanctity Necklace",
         left_ear="Ishvara Earring", right_ear="Moonshade Earring", left_ring="Dingir Ring", right_ring="Acumen Ring", ammo="Pemphredo Tathlum",
	     back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}, waist="Hachirin-no-Obi"}

    sets.precast.WS["Dragon Kick"] = {body="Herculean Vest", hands="Maxixi Bangles +3", legs="Horos Tights +3", feet="Lustra. Leggings +1", neck="Etoile Gorget +1", 
	     back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}, ammo="Charis Feather",
	     waist="Grunfeld Rope", left_ear="Moonshade Earring",  right_ear="Ishvara Earring", left_ring="Regal Ring", right_ring="Ilabrat Ring", head="Lustratio Cap +1"}	

    sets.precast.WS["Tornado Kick"] = {body="Herculean Vest", hands="Maxixi Bangles +3", legs="Horos Tights +3", feet="Lustra. Leggings +1", neck="Etoile Gorget +1", 
	     back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}, ammo="Charis Feather",
	     waist="Grunfeld Rope", left_ear="Moonshade Earring",  right_ear="Ishvara Earring", left_ring="Regal Ring", right_ring="Ilabrat Ring", head="Lustratio Cap +1"}		 
		 
     
    -- Resting sets
    sets.resting = {head="Yaoyotl Helm",neck="Wiglen Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Ares' cuirass +1",hands="Cizin Mufflers",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Letalis Mantle",waist="Goading Belt",legs="Blood Cuisses",feet="Ejekamal Boots"}
     
 
    -- Idle sets
    sets.idle = {head="Malignance Chapeau", neck="Bathy Choker +1", ear1="Eabani Earring", ear2="Infused Earring",	
           body="Malignance Tabard", hands="Malignance Gloves", waist="Sveltesse Gouriz +1",
           legs="Malignance Tights", feet="Malignance Boots", left_ring="Defending Ring", right_ring="Vocane Ring"}
		
	sets.idle.Speed = {head="Malignance Chapeau", neck="Loricate Torque +1", ear1="Odnowa Earring +1", ear2="Odnowa Earring",	
           body="Malignance Tabard", hands="Malignance Gloves", waist="Flume Belt",
           legs="Malignance Tights", feet="Tandava Crackows", left_ring="Defending Ring", right_ring="Vocane Ring"}
 
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle.Town = {head="Malignance Chapeau", neck="Loricate Torque +1", ear1="Odnowa Earring +1", ear2="Odnowa Earring",	
           body="Malignance Tabard", hands="Malignance Gloves", waist="Flume Belt",
           legs="Malignance Tights", feet="Malignance Boots", left_ring="Defending Ring", right_ring="Vocane Ring"}
     
    sets.idle.Field = {head="Malignance Chapeau", neck="Bathy Choker +1", ear1="Eabani Earring", ear2="Infused Earring",	
           body="Malignance Tabard", hands="Malignance Gloves", waist="Sveltesse Gouriz +1",
           legs="Malignance Tights", feet="Malignance Boots", left_ring="Defending Ring", right_ring="Gelatinous Ring +1"}
 
    sets.idle.Weak = {
        head="Malignance Chapeau", neck="Loricate Torque +1", ear1="Odnowa Earring +1", ear2="Odnowa Earring",	
           body="Malignance Tabard", hands="Malignance Gloves", waist="Flume Belt",
           legs="Malignance Tights", feet="Malignance Boots", left_ring="Defending Ring", right_ring="Vocane Ring"}
 
    -- Engaged sets
 
    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
     
    -- Normal melee group
    sets.engaged = {
        ammo="Charis Feather", neck="Etoile Gorget +1", waist="Sailfi Belt +1", left_ear="Brutal Earring", right_ear="Sherida Earring", 
        head="Adhemar Bonnet +1", body="Horos Casaque +3", hands="Adhemar Wristbands +1",
		back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
        legs="Meg. Chausses +2", feet="Horos Toe Shoes +3", left_ring="Epona's Ring", right_ring="Gere Ring"}
	sets.engaged.DT = {ammo="Yamarang", neck="Bathy Choker +1", waist="Sveltesse Gouriz +1", left_ear="Telos Earring", right_ear="Sherida Earring", 
        head="Malignance Chapeau", body="Malignance Tabard", hands="Malignance Gloves",
		back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
        legs="Malignance Tights", feet="Malignance Boots", left_ring="Defending Ring", right_ring="Ilabrat Ring"}
	sets.engaged.MEVA = {ammo="Staunch Tathlum +1", neck="Etoile Gorget +1", waist="Chiner's Belt +1", left_ear="Telos Earring", right_ear="Sherida Earring", 
        head="Malignance Chapeau", body="Horos Casaque +3", hands="Malignance Gloves",
		back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
        legs="Malignance Tights", feet="Malignance Boots", left_ring="Defending Ring", right_ring="Gere Ring"}
		
	sets.buff['Climactic Flourish'] = {ammo="Charis Feather",head="Maculele Tiara +1",neck="Etoile Gorget +1",body="Meg. Cuirie +2"}
	
end
    
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------
 
-- Set eventArgs.handled to true if we don't want any automatic target handling to be done.
function job_pretarget(spell, action, spellMap, eventArgs)
 
end

function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type == "WeaponSkill" then
        if state.Buff['Climactic Flourish'] then
            equip(sets.buff['Climactic Flourish'])
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
function job_buff_change(buff,gain)
    if buff == 'Saber Dance' or buff == 'Climactic Flourish' or buff == 'Fan Dance' then
        handle_equipping_gear(player.status)
    end
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
    set_macro_page(1, 14)
end