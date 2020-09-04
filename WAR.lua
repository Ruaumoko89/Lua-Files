-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
--[[ Updated 9/18/2014, functions with Mote's new includes.
-- Have not played WAR recently, please PM me with any errors
                        BG: Fival
                        FFXIAH: Asura.Fiv
]]--
-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
 
        -- Load and initialize the include file.
        include('Mote-Include.lua')
end
 
 
-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
                        state.Buff['Aftermath'] = buffactive['Aftermath: Lv.1'] or
            buffactive['Aftermath: Lv.2'] or
            buffactive['Aftermath: Lv.3'] or false
                        state.Buff['Mighty Strikes'] = buffactive['Mighty Strikes'] or false
end
 
 
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
 
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
        state.OffenseMode:options('Regular', 'DT', 'DTHP')
        state.IdleMode:options('Normal', 'Regen')
      
        update_melee_groups()
        select_default_macro_book()
       
        -- Additional Binds
        --send_command('alias g510_m1g13 input /ws "Ukko\'s Fury" <t>;')
        --send_command('alias g510_m1g14 input /ws "King\'s Justice" <t>;')
        --send_command('alias g510_m1g15 input /ws "Upheaval" <t>;')
end
 
function init_gear_sets()
       
        --------------------------------------
        -- Precast sets
        --------------------------------------
       
        -- Sets to apply to arbitrary JAs
        sets.precast.JA.Berserk = {body="Pummeler's Lorica +3",feet="Agoge Calligae +1"}
        sets.precast.JA['Aggressor'] = {head="Pummeler's Mask +1",body="Agoge Lorica +1"}
        sets.precast.JA['Mighty Strikes'] = {hands="Agoge Mufflers"}
        sets.precast.JA['Blood Rage'] = {body="Boii Lorica +1", ammo="Sapience Orb", head="Souveran Schaller +1", hands="Eschite Gauntlets",
        legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	    back="Moonbeam Cape", neck="Moonbeam Necklace", waist="Sinew Belt", left_ear="Cryptic Earring", right_ear="Friomisi Earring", left_ring="Apeile Ring", right_ring="Apeile Ring +1"}
        sets.precast.JA['Warcry'] = {head="Agoge Mask +2", ammo="Sapience Orb",
        body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, hands="Eschite Gauntlets",
        legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	    back="Moonbeam Cape", neck="Moonbeam Necklace", waist="Sinew Belt", left_ear="Cryptic Earring", right_ear="Friomisi Earring", left_ring="Apeile Ring", right_ring="Apeile Ring +1"}
        sets.precast.JA['Tomahawk'] = {ammo="Thr. Tomahawk",feet="Agoge Calligae +1"}
		sets.precast.JA['Restraint'] = {hands="Boii Mufflers +1"}
		sets.precast.JA['Retaliation'] = {feet="Boii Calligae +1"}
		sets.precast.JA['Warrior\s Charge'] = {legs="Agoge Cuisses +1"}
		sets.precast.JA['Provoke'] = {ammo="Sapience Orb", hands="Eschite Gauntlets", head="Souveran Schaller +1",
        body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	    back="Moonbeam Cape", neck="Moonbeam Necklace", waist="Sinew Belt", left_ear="Cryptic Earring", right_ear="Friomisi Earring", left_ring="Apeile Ring", right_ring="Apeile Ring +1"}
	    sets.precast.JA['Vallation'] = {head="Halitus Helm", body="Emet Harness +1", waist="Trance Belt", neck="Warder's Charm +1", legs="Odyssean Cuisses", ammo="Sapience Orb", ear1="Cryptic Earring", ear2="Friomisi Earring",
		                               ring1="Petrov Ring", ring2="Supershear Ring"}
	    sets.precast.JA['Pflug'] = {head="Halitus Helm", body="Emet Harness +1", waist="Trance Belt", neck="Warder's Charm +1", legs="Odyssean Cuisses", ammo="Sapience Orb", ear1="Cryptic Earring", ear2="Friomisi Earring",
		                               ring1="Petrov Ring", ring2="Supershear Ring"}
        -- Sets to apply to any actions of spell.type
        sets.precast.Waltz = {}
               
        -- Sets for specific actions within spell.type
        sets.precast.Waltz['Healing Waltz'] = {}
 
    -- Sets for fast cast gear for spells
        sets.precast.FC = {ammo="Staunch Tathlum",
            head="Carmine Mask +1", neck="Baetyl Pendant", ear1="Etiolation Earring", ear2="Loquac. Earring",
            body="Odyssean Chestplate", hands="Leyline Gloves", ring1="Rahab Ring", ring2="Kishar Ring",
			waist="Seigel Sash", legs="Eschite Cuisses", feet="Carmine Greaves +1"}
			
    -- Fast cast gear for specific spells or spell maps
        sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})
 
        -- Weaponskill sets
        sets.precast.WS = {ammo="Yetshila",
        head="Boii Mask +1",neck="Caro Necklace",ear1="Telos Earring",ear2="Moonshade Earring",
        body="Argosy Hauberk",hands="Flamma Manopolas +1",ring1="Begrudging Ring",ring2="Niqmaddu Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},waist="Grunfeld Rope",legs="Argosy Breeches",feet="Boii Calligae +1"}
       
        -- Specific weaponskill sets.
        sets.precast.WS['Upheaval'] = {ammo="Knobkierrie",
        head="Agoge Mask +2",neck="Fotia Gorget",waist="Fotia Belt",ear1="Thrud Earring",ear2="Moonshade Earring",
        body="Pummeler's Lorica +3",hands="Sulevia's Gauntlets +2",ring1="Regal Ring",ring2="Niqmaddu Ring",
        back={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}},legs="Sulevia's Cuisses +2",feet="Sulevia's Leggings +2"}
		
		sets.precast.WS['Full Break'] = {body="Flamma Korazin +2", back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	    neck="Caro Necklace", hands="Flamma Manopolas +2", waist="Grunfeld Rope", legs="Flamma Dirs +2", feet="Flamma Gambieras +2", 
		ring1="Rufescent Ring", ring2="Niqmaddu Ring", head="Flamma Zucchetto +2", ear1="Dignitary's Earring", ear2="Moonshade Earring"}
		
		sets.precast.WS['Armor Break'] = {body="Flamma Korazin +2", back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	    neck="Caro Necklace", hands="Flamma Manopolas +2", waist="Grunfeld Rope", legs="Flamma Dirs +2", feet="Flamma Gambieras +2", 
		ring1="Rufescent Ring", ring2="Niqmaddu Ring", head="Flamma Zucchetto +2", ear1="Dignitary's Earring", ear2="Moonshade Earring"}
		
		sets.precast.WS['Weapon Break'] = {body="Flamma Korazin +1", back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	    neck="Caro Necklace", hands="Flamma Manopolas +2", waist="Grunfeld Rope", legs="Flamma Dirs +1", feet="Flamma Gambieras +2", 
		ring1="Rufescent Ring", ring2="Niqmaddu Ring", head="Flamma Zucchetto +2", ear1="Dignitary's Earring", ear2="Moonshade Earring"}
		
		sets.precast.WS['Shield Break'] = {body="Flamma Korazin +1", back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	    neck="Caro Necklace", hands="Flamma Manopolas +2", waist="Grunfeld Rope", legs="Flamma Dirs +1", feet="Flamma Gambieras +2", 
		ring1="Rufescent Ring", ring2="Niqmaddu Ring", head="Flamma Zucchetto +2", ear1="Dignitary's Earring", ear2="Moonshade Earring"}
		
		sets.precast.WS['Raging Rush'] = {ammo="Knobkierrie",
        head="Hjarrandi Helm",neck="Warrior's Bead Necklace +1",ear1="Moonshade Earring",ear2="Brutal Earring",
        body="Hjarrandi Breastplate",hands="Flamma Manopolas +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},waist="Fotia Belt",legs="Argosy Breeches +1",feet="Pummeler's Calligae +3"}
		
		sets.precast.WS["King's Justice"] = {ammo="Seething Bomblet +1",
        head="Argosy Celata +1",neck="Caro Necklace",ear1="Telos Earring",ear2="Moonshade Earring",
        body="Argosy Hauberk +1",hands="Argosy Mufflers +1",ring1="Regal Ring",ring2="Niqmaddu Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},waist="Metalsinger Belt",legs="Argosy Breeches +1",feet="Argosy Sollerets +1"}
		
		sets.precast.WS["Ukko's Fury"] = {ammo="Yetshila +1",
        head="Agoge Mask +2",neck="Warrior's Bead Necklace +1",ear1="Moonshade Earring",ear2="Brutal Earring",
        body="Hjarrandi Breastplate",hands="Flamma Manopolas +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist="Metalsinger Belt",legs="Argosy Breeches +1",feet="Boii Calligae +1"}
		
		sets.precast.WS["Keen Edge"] = {ammo="Knobkierrie",
        head="Hjarrandi Helm",neck="Warrior's Bead Necklace +1",ear1="Moonshade Earring",ear2="Brutal Earring",
        body="Hjarrandi Breastplate",hands="Flamma Manopolas +2",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},waist="Fotia Belt",legs="Argosy Breeches +1",feet="Pummeler's Calligae +3"}
		
		sets.precast.WS['Steel Cyclone'] = {ammo="Knobkierrie",
        head={ name="Valorous Mask", augments={'Accuracy+24','Weapon skill damage +4%','STR+9',}},neck="Caro Necklace",ear1="Ishvara Earring",ear2="Thrud Earring",
        body="Pumm. Lorica +3",hands="Odyssean Gauntlets",ring1="Regal Ring",ring2="Niqmaddu Ring", legs={ name="Odyssean Cuisses", augments={'Accuracy+30','Weapon skill damage +4%','AGI+9','Attack+1',}},
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist="Metalsinger Belt",feet="Sulevia's Leggings +2"}
              
        sets.precast.WS['Savage Blade'] = {ammo="Knobkierrie",
        head="Agoge Mask +2",neck="Warrior's Bead Necklace +1",ear1="Ishvara Earring",ear2="Ishvara Earring",
        body="Pumm. Lorica +3",hands="Odyssean Gauntlets",ring1="Regal Ring",ring2="Niqmaddu Ring", legs={ name="Odyssean Cuisses", augments={'Accuracy+30','Weapon skill damage +4%','AGI+9','Attack+1',}},
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist="Metalsinger Belt",feet="Sulevia's Leggings +2"}
		
		sets.precast.WS['Flat Blade'] = {body="Flamma Korazin +1", back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	    neck="Caro Necklace", hands="Flamma Manopolas +2", waist="Grunfeld Rope", legs="Flamma Dirs +1", feet="Flamma Gambieras +2", 
		ring1="Rufescent Ring", ring2="Niqmaddu Ring", head="Flamma Zucchetto +2", ear1="Dignitary's Earring", ear2="Moonshade Earring"}
		
		sets.precast.WS['Sanguine Blade'] = {ammo="Knobkierrie",
        head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Founder's Breastplate",hands="Founder's Gauntlets",ring1="Shiva Ring +1",ring2="Archon Ring",
        back="Izdubar Mantle",waist="Eschan Stone",legs="Eschite Cuisses",feet="Founder's Greaves"}
		
		sets.precast.WS['Vorpal Blade'] = {ammo="Seething Bomblet +1", head="Argosy Celata +1", body="Argosy Hauberk +1", back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}, 
		neck="Fotia Gorget", hands="Argosy Mufflers +1", waist="Fotia Belt", legs="Argosy Breeches +1", feet="Argosy Sollerets +1", ring1="Regal Ring", ring2="Niqmaddu Ring", ear1="Telos Earring", ear2="Moonshade Earring"}
		
		sets.precast.WS['Rampage'] = {ammo="Seething Bomblet +1", head="Argosy Celata +1", body="Argosy Hauberk +1", back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}, 
		neck="Fotia Gorget", hands="Argosy Mufflers +1", waist="Fotia Belt", legs="Argosy Breeches +1", feet="Argosy Sollerets +1", ring1="Regal Ring", ring2="Niqmaddu Ring", ear1="Telos Earring", ear2="Moonshade Earring"}
		
		sets.precast.WS['Decimation'] = {ammo="Seething Bomblet +1", head="Argosy Celata +1", body="Argosy Hauberk +1", back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}, 
		neck="Fotia Gorget", hands="Argosy Mufflers +1", waist="Fotia Belt", legs="Argosy Breeches +1", feet="Pummeler's Calligae +3", ring1="Regal Ring", ring2="Niqmaddu Ring", ear1="Telos Earring", ear2="Brutal Earring"} 
		
	    sets.precast.WS['Cloudsplitter'] = {ammo="Knobkierrie",
        head="Jumalik Helm",neck="Sanctity Necklace",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Pummeler's Lorica +3",hands="Founder's Gauntlets",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist="Eschan Stone",legs="Eschite Cuisses",feet="Sulevia's Leggings +2"}
		
		sets.precast.WS['Mistral Axe'] = {ammo="Knobkierrie",
        head="Agoge Mask +2",neck="Caro Necklace",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Pumm. Lorica +3",hands="Odyssean Gauntlets",ring1="Regal Ring",ring2="Niqmaddu Ring", legs={ name="Odyssean Cuisses", augments={'Accuracy+30','Weapon skill damage +4%','AGI+9','Attack+1',}},
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist="Metalsinger Belt",feet="Sulevia's Leggings +2"}
		
		sets.precast.WS['Bora Axe'] = {ammo="Knobkierrie",
        head={ name="Valorous Mask", augments={'Accuracy+24','Weapon skill damage +4%','STR+9',}},neck="Caro Necklace",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Pumm. Lorica +3",hands="Odyssean Gauntlets",ring1="Regal Ring",ring2="Niqmaddu Ring", legs={ name="Odyssean Cuisses", augments={'Accuracy+30','Weapon skill damage +4%','AGI+9','Attack+1',}},
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist="Metalsinger Belt",feet="Sulevia's Leggings +2"}
		
		sets.precast.WS['Ruinator'] = {head="Argosy Celata +1", body="Argosy Hauberk +1", back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}, 
		neck="Fotia Gorget", hands="Argosy Mufflers +1", waist="Fotia Belt", legs="Argosy Breeches +1", feet="Argosy Sollerets +1", ring1="Shukuyu Ring", 
		ring2="Niqmaddu Ring", ear1="Telos Earring", ear2="Moonshade Earring"} 
		
		sets.precast.WS['Smash Axe'] = {body="Flamma Korazin +1", back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	    neck="Caro Necklace", hands="Flamma Manopolas +2", waist="Grunfeld Rope", legs="Flamma Dirs +1", feet="Flamma Gambieras +2", 
		ring1="Rufescent Ring", ring2="Niqmaddu Ring", head="Flamma Zucchetto +2", ear1="Dignitary's Earring", ear2="Moonshade Earring"}
		
		sets.precast.WS['Requiscat'] = {ammo="Floestone",
        head="Gavialis Helm",neck="Fotia Gorget",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Boii Lorica +1",hands="Boii Mufflers +1",ring1="Leviathan Ring",ring2="Leviathan Ring",
        back="Mauler's Mantle",waist="Fotia Belt",legs="Boii Cuisses +1",feet="Boii Calligae +1"}
		
		sets.precast.WS['Realmrazer'] = {ammo="Seething Bomblet +1",
        head="Valorous Mask",neck="Lacono Necklace +1",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Valorous Mail",hands="Odyssean Gauntlets",ring1="Apate Ring",ring2="Petrov Ring",
        back="Mauler's Mantle",waist="Metalsinger Belt",legs="Boii Cuisses +1",feet="Boii Calligae +1"}
		
		sets.precast.WS['Black Halo'] = {ammo="Knobkierrie",
        head="Agoge Mask +2",neck="Caro Necklace",ear1="Thrud Earring",ear2="Moonshade Earring",
        body="Pumm. Lorica +3",hands="Odyssean Gauntlets",ring1="Regal Ring",ring2="Niqmaddu Ring", legs={ name="Odyssean Cuisses", augments={'Accuracy+30','Weapon skill damage +4%','AGI+9','Attack+1',}},
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist="Metalsinger Belt",feet="Sulevia's Leggings +2"}
		
		sets.precast.WS['Hexa Strike'] = {ammo="Seething Bomblet +1", head="Argosy Celata +1", body="Argosy Hauberk +1", back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}, 
		neck="Fotia Gorget", hands="Argosy Mufflers +1", waist="Fotia Belt", legs="Argosy Breeches +1", feet="Argosy Sollerets +1", ring1="Regal Ring", ring2="Niqmaddu Ring", ear1="Telos Earring", ear2="Moonshade Earring"}
		
		sets.precast.WS['Judgement'] = {ammo="Seething Bomblet +1",
        head="Valorous Mask",neck="Lacono Necklace +1",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Valorous Mail",hands="Odyssean Gauntlets",ring1="Apate Ring",ring2="Petrov Ring",
        back="Mauler's Mantle",waist="Metalsinger Belt",legs="Boii Cuisses +1",feet="Boii Calligae +1"}
       
        sets.precast.WS['Fell Cleave'] = {ammo="Knobkierrie",
        head="Agoge Mask +2",neck="Caro Necklace",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Pumm. Lorica +3",hands="Odyssean Gauntlets",ring1="Shukuyu Ring",ring2="Niqmaddu Ring", legs={ name="Odyssean Cuisses", augments={'Accuracy+30','Weapon skill damage +4%','AGI+9','Attack+1',}},
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist="Grunfeld Rope",feet="Sulevia's Leggings +2"}
       
        sets.precast.WS['Resolution'] = {ammo="Seething Bomblet +1", head="Argosy Celata +1", body="Argosy Hauberk +1", back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}, 
		neck="Fotia Gorget", hands="Argosy Mufflers +1", waist="Fotia Belt", legs="Argosy Breeches +1", feet="Argosy Sollerets +1", ring1="Regal Ring", ring2="Niqmaddu Ring", ear1="Telos Earring", ear2="Moonshade Earring"} 
		
		sets.precast.WS['Scourge'] = {ammo="Knobkierrie",
        head="Agoge Mask +2",neck="Caro Necklace",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Sulevia's Platemail +2",hands="Odyssean Gauntlets",ring1="Shukuyu Ring",ring2="Niqmaddu Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist="Grunfeld Rope",legs="Sulevia's Cuisses +2",feet="Sulevia's Leggings +2"}

        sets.precast.WS['Stardiver'] = {ammo="Seething Bomblet +1", head="Argosy Celata +1", body="Argosy Hauberk +1", back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}, 
		neck="Fotia Gorget", hands="Argosy Mufflers +1", waist="Fotia Belt", legs="Argosy Breeches +1", feet="Argosy Sollerets +1", ring1="Regal Ring", ring2="Niqmaddu Ring", ear1="Telos Earring", ear2="Moonshade Earring"} 

        sets.precast.WS['Impulse Drive'] = {ammo="Knobkierrie",
        head="Agoge Mask +2",neck="Caro Necklace",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Pumm. Lorica +3",hands="Odyssean Gauntlets",ring1="Regal Ring",ring2="Niqmaddu Ring", legs={ name="Valor. Hose", augments={'Attack+14','Weapon skill damage +1%','STR+15','Accuracy+15',}},
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist="Metalsinger Belt",feet="Sulevia's Leggings +2"}		
		
		sets.precast.WS['Sonic Thrust'] = {ammo="Knobkierrie",
        head="Agoge Mask +2",neck="Caro Necklace",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Pumm. Lorica +3",hands="Odyssean Gauntlets",ring1="Regal Ring",ring2="Niqmaddu Ring", legs={ name="Valor. Hose", augments={'Attack+14','Weapon skill damage +1%','STR+15','Accuracy+15',}},
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist="Metalsinger Belt",feet="Sulevia's Leggings +2"}		
		
		sets.precast.WS['Evisceration'] = {ammo="Knobkierrie",
        head={ name="Valorous Mask", augments={'Accuracy+24','Weapon skill damage +4%','STR+9',}},neck="Caro Necklace",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Pumm. Lorica +3",hands="Odyssean Gauntlets",ring1="Regal Ring",ring2="Niqmaddu Ring", legs={ name="Odyssean Cuisses", augments={'Accuracy+30','Weapon skill damage +4%','AGI+9','Attack+1',}},
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist="Metalsinger Belt",feet="Sulevia's Leggings +2"}
 
        --------------------------------------
        -- Midcast sets
        --------------------------------------
 
    -- Generic spell recast set
        sets.midcast.FastRecast = {}
               
        -- Specific spells
        sets.midcast.Utsusemi = {}
		sets.midcast['Stun'] = {head="Halitus Helm", body="Emet Harness +1", waist="Trance Belt", neck="Warder's Charm +1", legs="Odyssean Cuisses", ammo="Sapience Orb", ear1="Cryptic Earring", ear2="Friomisi Earring",
		                               ring1="Petrov Ring", ring2="Supershear Ring"}
 
       
        --------------------------------------
        -- Idle/resting/defense/etc sets
        --------------------------------------
       
        -- Resting sets
        sets.resting = {}
       
 
        -- Idle sets
        sets.idle = {ammo="Staunch Tathlum",
                        head="Sulevia's Mask +2",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
                        body="Sulevia's Platemail +2",hands="Sulevia's Gauntlets",ring1="Defending Ring",ring2="Vocane Ring",
                        back="Moonbeam Cape",waist="Nierenschutz",legs="Sulevia's Cuisses +2",feet="Sulevia's Leggings +2"}
 
        sets.idle.Town = {ammo="Staunch Tathlum",
                        head="Sulevia's Mask +2",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
                        body="Sulevia's Platemail +2",hands="Sulevia's Gauntlets",ring1="Defending Ring",ring2="Vocane Ring",
                        back="Solemnity Cape",waist="Nierenschutz",legs="Sulevia's Cuisses +2",feet="Sulevia's Leggings +2"}
       
        sets.idle.Regen = {ammo="Staunch Tathlum +1",
            head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, body="Hjarrandi Breast.",
            hands="Sulevia's Gauntlets +2", legs="Souveran Diechlings +1",
            feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
            neck="Loricate Torque +1", left_ear="Odnowa Earring", right_ear="Odnowa Earring +1", left_ring="Moonbeam Ring", right_ring="Moonbeam Ring",
            back="Moonbeam Cape"}
       
        sets.idle.Weak = {}
       
        -- Defense sets
        sets.defense.PDT = {}
        sets.defense.Reraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})
        sets.defense.MDT = {}
 
    -- Gear to wear for kiting
        sets.Kiting = {feet="Hermes' Sandals +1"}
 
        --------------------------------------
        -- Engaged sets
        --------------------------------------
 
        -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
        -- sets if more refined versions aren't defined.
        -- If you create a set with both offense and defense modes, the offense mode should be first.
        -- EG: sets.engaged.Dagger.Accuracy.Evasion
       
        -- Normal melee group
        -- If using a weapon that isn't specified later, the basic engaged sets should automatically be used.
        -- Equip the weapon you want to use and engage, disengage, or force update with f12, the correct gear will be used; default weapon is whats equip when file loads.
        sets.engaged = {ammo="Ginsen",
        head={ name="Valorous Mask", augments={'Accuracy+21 Attack+21','"Store TP"+8','Accuracy+11',}},neck="Lissome Necklace",ear1="Telos Earring",ear2="Cessance Earring",
        body="Boii Lorica +1",hands="Flamma Manopolas +1",ring1="Petrov Ring",ring2="Niqmaddu Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},waist="Ioskeha Belt",legs="Odyssean Cuisses",feet="Flamma Gambieras +1"}
		sets.engaged.Regular = {ammo="Ginsen", neck="Warrior's Bead Necklace +1",ear1="Telos Earring",ear2="Dedition Earring",
        head={ name="Valorous Mask", augments={'Accuracy+21 Attack+21','"Store TP"+8','Accuracy+11',}},
        body="Hjarrandi Breastplate",hands="Sulevia's Gauntlets +2",ring1="Regal Ring",ring2="Chirich Ring +1",
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},waist="Ioskeha Belt +1",legs="Pummeler's Cuisses +3", feet="Pummeler's Calligae +3"}
		sets.engaged.DTHP = {ammo="Ginsen",
        head="Hjarrandi Helm", body="Hjarrandi Breast.",
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}, neck="Warrior's Bead Necklace +1",
        hands="Flamma Manopolas +2", waist="Tempus Fugit",
        legs="Pummeler's Cuisses +3",feet="Pummeler's Calligae +3",
        ring1="Defending Ring", ring2="Sulevia's Ring",
        ear1="Telos Earring",ear2="Dedition Earring"}
		sets.engaged.DT = {ammo="Staunch Tathlum +1",
        head="Hjarrandi Helm", body="Hjarrandi Breast.",
        back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}, neck="Warrior's Bead Necklace +1",
        hands="Sulevia's Gauntlets +2", waist="Tempus Fugit",
        legs="Pummeler's Cuisses +3",feet="Pummeler's Calligae +3",
        ring1="Moonbeam Ring", ring2="Moonbeam Ring",
        ear1="Odnowa Earring",ear2="Odnowa Earring +1"}
       
        --------------------------------------
        -- Custom buff sets
        --------------------------------------
		-- Restraint Active 
		sets.buff.Restraint = {hands="Boii Mufflers +1"}
end
 
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
 
-- Set eventArgs.handled to true if we don't want any automatic target handling to be done.
function job_pretarget(spell, action, spellMap, eventArgs)
 
end
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
 
end
 
-- Run after the default precast() is done.
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.

 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
        if spell.english == "Tomahawk" and not spell.interrupted then
                send_command('timers create "Tomahawk" 90 down')
        end
end
 
-- Run after the default aftercast() is done.
-- eventArgs is the same one used in job_aftercast, in case information needs to be persisted.
function job_post_aftercast(spell, action, spellMap, eventArgs)
 
end
 
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
 
-- Called when the player's status changes.
function job_status_change(newStatus, oldStatus, eventArgs)
        update_melee_groups()
end
 
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
        if buff == "Aftermath: Lv.3" or buff == "Aftermath" then
                classes.CustomMeleeGroups:clear()
                if (buff == "Aftermath: Lv.3" and gain) or buffactive["Aftermath: Lv.3"] then
                        if player.equipment.main == "Conqueror" then
                                classes.CustomMeleeGroups:append('AM3')
                                if gain then
                                        send_command('timers create "Aftermath: Lv.3" 180 down;wait 120;input /echo Aftermath: Lv.3 [WEARING OFF IN 60 SEC.];wait 30;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 20;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
                                else
                                        send_command('timers delete "Aftermath: Lv.3"')
                    add_to_chat(123,'AM3: [OFF]')
                                end
                        end
                end
                if (buff == "Aftermath" and gain) or buffactive.Aftermath then
                        if player.equipment.main == "Bravura" and state.HybridMode.value == 'PDT' then
                                classes.CustomMeleeGroups:append('AM')
                        end
                end
        end
        if buff == "Aftermath: Lv.3" or buff == "Aftermath" then
                handle_equipping_gear(player.status)
        end
        if buff == 'Blood Rage' and gain then
                send_command('timers create "Blood Rage" 60 down abilities/00255.png')
                else
                send_command('timers delete "Blood Rage"')
        end
        if buff == 'Warcry' and gain then
                send_command('timers create "Warcry" 60 down abilities/00255.png')
                else
                send_command('timers delete "Warcry"')
        end
        if buff == "sleep" and gain and player.hp > 200 and player.status == "Engaged" then
                equip({neck="Berserker's Torque"})
                else
                handle_equipping_gear(player.status)
        end
end
 
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------
 
-- Return a customized weaponskill mode to use for weaponskill sets.
-- Don't return anything if you're not overriding the default value.
function get_custom_wsmode(spell, spellMap, default_wsmode)
        local wsmode = ''
        if state.Buff['Mighty Strikes'] then
        wsmode = wsmode .. 'MS'
    end
        if wsmode ~= '' then
            return wsmode
    end
end
 
-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
        if buffactive["Mighty Strikes"] then
                meleeSet = set_combine(meleeSet, sets.buff.MS)
        end
        return meleeSet
end

-- Restraint Active
function customize_melee_set(meleeSet)
        if buffactive["Restraint"] then
                meleeSet = set_combine(meleeSet, sets.buff.Restraint)
        end
        return meleeSet
end
 
-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
        update_melee_groups()
end
 
-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
local msg = 'Melee'
if state.CombatForm.has_value then
msg = msg .. ' (' .. state.CombatForm.value .. ')'
end
if state.CombatWeapon.has_value then
msg = msg .. ' (' .. state.CombatWeapon.value .. ')'
end
msg = msg .. ': '
msg = msg .. state.OffenseMode.value
if state.HybridMode.value ~= 'Normal' then
msg = msg .. '/' .. state.HybridMode.value
end
msg = msg .. ', WS: ' .. state.WeaponskillMode.value
if state.DefenseMode.value ~= 'None' then
msg = msg .. ', ' .. 'Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
end
if state.Kiting.value == true then
msg = msg .. ', Kiting'
end
if state.PCTargetMode.value ~= 'default' then
msg = msg .. ', Target PC: '..state.PCTargetMode.value
end
if state.SelectNPCTargets.value == true then
msg = msg .. ', Target NPCs'
end
add_to_chat(122, msg)
eventArgs.handled = true
end
 
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
 
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
        -- Default macro set/book
        if player.sub_job == 'WAR' then
                set_macro_page(1, 13)
        elseif player.sub_job == 'NIN' then
                set_macro_page(5, 20)
        elseif player.sub_job == 'SAM' then
                set_macro_page(1, 13)
		elseif player.sub_job == 'DNC' then
                set_macro_page(1, 8)
        else
                set_macro_page(5, 20)
        end
end
 
function update_melee_groups()
        classes.CustomMeleeGroups:clear()
        if buffactive['Aftermath: Lv.3'] and player.equipment.main == "Conqueror" then
                classes.CustomMeleeGroups:append('AM3')
        end
        if buffactive.Aftermath and player.equipment.main == "Bravura" and state.HybridMode.value == 'PDT' then
                classes.CustomMeleeGroups:append('AM')
        end
end
 
function is_sc_element_today(spell)
    if spell.type ~= 'WeaponSkill' then
        return
    end
 
   local weaponskill_elements = S{}:
    union(skillchain_elements[spell.skillchain_a]):
    union(skillchain_elements[spell.skillchain_b]):
    union(skillchain_elements[spell.skillchain_c])
 
    if weaponskill_elements:contains(world.day_element) then
        return true
    else
        return false
    end
end