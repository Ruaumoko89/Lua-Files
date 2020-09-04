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
    state.OffenseMode:options('Normal', 'Impetus', 'Footwork', 'ImpetWork', 'DT', 'CounterCritical')
    state.HybridMode:options('Normal', 'PDT')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal','Boost')
    state.PhysicalDefenseMode:options('PDT', 'MDT')
end
 
-- Define sets and vars used by this job file.
function init_gear_sets()

    sets.precast.JA['Mantra'] = {feet="Hesychast's Gaiters +3"}
    sets.precast.JA['Chi Blast'] = {head="Hesychast's Crown +3"}
    sets.precast.JA['Formless Strikes'] = {body="Hesychast's Cyclas +3"}	
	sets.precast.JA['Footwork'] = {feet="Shukuyu Sune-Ate"}
	sets.precast.JA['Impetus'] = {body="Bhikku Cyclas +1"}
	sets.precast.JA['Hundred Fists'] = {legs="Hesychast's Hose +3"}
	sets.precast.JA['Chakra'] = {body="Anchorite's Cyclas +3", hands="Hesychast's Gloves +3"}
	sets.precast.JA['Dodge'] = {feet="Anchorite's Gaiters +3"}
	sets.precast.JA['Focus'] = {head="Anchorite's Crown +3"}
	sets.precast.JA['Boost'] = {back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}, waist="Ask Sash", ammo="Knobkierrie",
	                                                                 neck="Caro Necklace", ring1="Niqmaddu Ring", ring2="Regal Ring", legs="Hizamaru Hizayoroi +2", hands="Anchorite's Gloves +3",
	                                                                 head="Hesychast's Crown +3", body="Adhemar Jacket +1"}
	sets.precast.JA['Warcry'] = {hands="Kurys Gloves", back="Reiki Cloak", legs="Wukong's Hakama +1", feet="Ahosi Leggings", head="Halitus Helm",
	               neck="Warder's Charm +1", ring1="Petrov Ring", ring2="Supershear Ring", body="Emet Harness +1", waist="Sinew Belt",
				   ear1="Friomisi Earring", ear2="Cryptic Earring", ammo="Sapience Orb"}
    sets.precast.JA['Provoke'] = {hands="Kurys Gloves", back="Reiki Cloak", legs="Wukong's Hakama +1", feet="Ahosi Leggings", head="Halitus Helm",
	               neck="Warder's Charm +1", ring1="Petrov Ring", ring2="Supershear Ring", body="Emet Harness +1", waist="Sinew Belt",
				   ear1="Friomisi Earring", ear2="Cryptic Earring", ammo="Sapience Orb"}
	sets.precast.JA['Vallation'] = {hands="Kurys Gloves", back="Reiki Cloak", legs="Wukong's Hakama +1", feet="Ahosi Leggings", head="Halitus Helm",
	               neck="Warder's Charm +1", ring1="Petrov Ring", ring2="Supershear Ring", body="Emet Harness +1", waist="Sinew Belt",
				   ear1="Friomisi Earring", ear2="Cryptic Earring", ammo="Sapience Orb"}
	sets.precast.JA['Pflug'] = {hands="Kurys Gloves", back="Reiki Cloak", legs="Wukong's Hakama +1", feet="Ahosi Leggings", head="Halitus Helm",
	               neck="Warder's Charm +1", ring1="Petrov Ring", ring2="Supershear Ring", body="Emet Harness +1", waist="Sinew Belt",
				   ear1="Friomisi Earring", ear2="Cryptic Earring", ammo="Sapience Orb"}
	sets.precast.JA['Swordplay'] = {hands="Kurys Gloves", back="Reiki Cloak", legs="Wukong's Hakama +1", feet="Ahosi Leggings", head="Halitus Helm",
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
    sets.precast.WS = {head={ name="Rao Kabuto", augments={'STR+10','DEX+10','Attack+15',}},feet={ name="Herculean Boots", augments={'Accuracy+29','STR+15','Attack+12',}},body="Ryuo Domaru",
		hands={ name="Herculean Gloves", augments={'Accuracy+25 Attack+25','Magic dmg. taken -2%','STR+14',}}, legs="Rao Haidate",
		ring1="Shukuyu Ring",ring2="Apate Ring",back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}, waist="Fotia Belt", neck="Fotia Gorget",
		ear1="Moonshade Earring",ear2="Cessance Earring",}
 
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Victory Smite'] = {back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10',}}, left_ear="Sherida Earring", right_ear="Moonshade Earring",
	                                                                 waist="Moonbow Belt +1", neck="Fotia Gorget", hands="Ryuo Tekko +1", ammo="Knobkierrie",
	                                                                 ring1="Niqmaddu Ring", ring2="Regal Ring", feet="Ryuo Sune-Ate +1",
										                             legs="Hesychast's Hose +3", head="Adhemar Bonnet +1", body="Bhikku Cyclas +1"}
																	 
	sets.precast.WS["Ascetic's Fury"] = {back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}, left_ear="Sherida Earring", right_ear="Brutal Earring",
	                                                                 waist="Moonbow Belt +1", neck="Rancor Collar", hands="Anchorite's Gloves +3", ammo="Knobkierrie",
	                                                                 ring1="Niqmaddu Ring", ring2="Regal Ring", feet="Ryuo Sune-Ate +1",
										                             legs="Hizamaru Hizayoroi +2", head="Hesychast's Crown +3", body="Bhikku Cyclas +1"}
																	 
	sets.precast.WS['Howling Fist'] = set_combine(sets.precast.WS, {back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}, waist="Moonbow Belt +1", ammo="Knobkierrie",
	                                                                 neck="Fotia Gorget", ring1="Niqmaddu Ring", ring2="Gere Ring", legs="Hizamaru Hizayoroi +2", hands="Anchorite's Gloves +3",
	                                                                 head="Hesychast's Crown +3", body="Adhemar Jacket +1", 
																	 ear1="Ishvara Earring", ear2="Moonshade Earring"})
																	 
    sets.precast.WS['One Inch Punch'] = set_combine(sets.precast.WS, {back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}, waist="Moonbow Belt +1", ammo="Knobkierrie",
	                                                                 neck="Fotia Gorget", ring1="Niqmaddu Ring", ring2="Regal Ring", legs="Hizamaru Hizayoroi +2", hands="Anchorite's Gloves +3",
	                                                                 head="Hesychast's Crown +3", body={ name="Herculean Vest", augments={'Accuracy+28','Weapon skill damage +2%','DEX+12','Attack+9',}}, 
																	 ear1="Sherida Earring", ear2="Moonshade Earring"})																	 
																	 
    sets.precast.WS['Shoulder Tackle'] = set_combine(sets.precast.WS, {back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}, waist="Moonbow Belt +1", ammo="Knobkierrie",
	                                                                 neck="Sanctity Necklace", ring1="Niqmaddu Ring", ring2="Chirich Ring +1", legs="Hesychast's Hose +3", hands="Hesychast's Gloves +3", feet="Hesychast's Gaiters +3",
	                                                                 head="Hesychast's Crown +3", body="Hesychast's Cyclas +3", ear1="Dignitary's Earring", ear2="Moonshade Earring"})																 
																	 
    sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS, {back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}, waist="Moonbow Belt +1", 
	                                                                 neck="Caro Necklace", ring1="Niqmaddu Ring", ring2="Shukuyu Ring", legs="Hizamaru Hizayoroi +2", hands="Anchorite's Gloves +3",
	                                                                 head="Hesychast's Crown +3", body={ name="Herculean Vest", augments={'Accuracy+28','Weapon skill damage +2%','DEX+12','Attack+9',}}, 
																	 ear1="Ishvara Earring", ear2="Moonshade Earring"})																	 
																	 
	sets.precast.WS['Dragon Kick'] = set_combine(sets.precast.WS, {back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
                                                                   ammo="Knobkierrie", head="Hesychast's Crown +3", body={ name="Herculean Vest", augments={'Accuracy+28','Weapon skill damage +2%','DEX+12','Attack+9',}},
                                                                   hands="Anchorite's Gloves +3", legs="Hiza. Hizayoroi +2", feet="Anchorite's Gaiters +3",
                                                                   neck="Fotia Gorget", waist="Moonbow Belt +1", left_ear="Sherida Earring", right_ear="Moonshade Earring", left_ring="Niqmaddu Ring", right_ring="Gere Ring"})
																	 
    sets.precast.WS['Tornado Kick'] = set_combine(sets.precast.WS, {back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
                                                                   ammo="Knobkierrie", head="Hesychast's Crown +3", body="Adhemar Jacket +1",
                                                                   hands="Anchorite's Gloves +3", legs="Hiza. Hizayoroi +2", feet="Anchorite's Gaiters +3",
                                                                   neck="Fotia Gorget", waist="Moonbow Belt +1", left_ear="Sherida Earring", right_ear="Moonshade Earring", left_ring="Niqmaddu Ring", right_ring="Gere Ring"})

    sets.precast.WS['Raging Fists'] = {back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	                                                                feet={ name="Herculean Boots", augments={'Accuracy+29','STR+15','Attack+12',}}, head="Hesychast's Crown +3",													
	                                                                body="Adhemar Jacket +1", hands="Anchorite's Gloves +3", legs="Hizamaru Hizayoroi +2", ammo="Knobkierrie", ring1="Niqmaddu Ring",ring2="Gere Ring",
																	waist="Moonbow Belt +1", neck="Fotia Gorget", ear1="Moonshade Earring",ear2="Sherida Earring",}			

    sets.precast.WS['Asuran Fists'] = {head="Rao Kabuto +1", feet={ name="Herculean Boots", augments={'Accuracy+29','STR+15','Attack+12',}},
	                                                                body="Adhemar Jacket +1", hands="Hesychast's Gloves +3", legs="Ryuo Hakama", ammo="Knobkierrie",
		                                                            ring1="Niqmaddu Ring",ring2="Regal Ring",back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}, 
																	waist="Fotia Belt", neck="Fotia Gorget", ear1="Moonshade Earring",ear2="Cessance Earring",}																				

    sets.precast.WS['Shijin Spiral'] = {head="Adhemar Bonnet +1", feet={ name="Herculean Boots", augments={'Accuracy+22','"Triple Atk."+4','DEX+8','Attack+2',}},
	                                                                body="Adhemar Jacket +1", hands="Adhemar Wristbands +1", legs="Ryuo Hakama +1", ammo="Expeditious Pinion",
		                                                            ring1="Niqmaddu Ring",ring2="Mujin Band",back="Sacro Mantle", 
																	waist="Moonbow Belt +1", neck="Fotia Gorget", ear1="Sherida Earring",ear2="Brutal Earring"}	
																	
    sets.precast.WS['Shell Crusher'] = set_combine(sets.precast.WS, {back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}, waist="Moonbow Belt +1", ammo="Knobkierrie",
	                                                                 neck="Sanctity Necklace", ring1="Niqmaddu Ring", ring2="Chirich Ring +1", legs="Hesychast's Hose +3", hands="Hesychast's Gloves +3", feet="Hesychast's Gaiters +3",
	                                                                 head="Hesychast's Crown +3", body="Hesychast's Cyclas +3", ear1="Dignitary's Earring", ear2="Moonshade Earring"})																	
															  
	sets.precast.WS['Cataclysm'] = {ammo="Knobkierrie", body="Samnuha Coat", hands="Leyline Gloves", left_ring="Shiva Ring +1", right_ring="Archon Ring", head="Pixie Hairpin +1",	                               
	                               back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	                               legs={ name="Herculean Trousers", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','INT+9','Mag. Acc.+8','"Mag.Atk.Bns."+15',}}, neck="Sanctity Necklace", waist="Eschan Stone",
                                   feet={ name="Herculean Boots", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Weapon skill damage +2%','"Mag.Atk.Bns."+13',}}, left_ear="Ishvara Earring", right_ear="Moonshade Earring"}
								   
    sets.precast.WS['Shattersoul'] = {head="Rao Kabuto", feet={ name="Herculean Boots", augments={'Accuracy+29','STR+15','Attack+12',}},
	                                                                body="Adhemar Jacket +1", hands="Adhemar Wristbands +1", legs="Ryuo Hakama", ammo="Knobkierrie",
		                                                            ring1="Niqmaddu Ring",ring2="Regal Ring",back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}, 
																	waist="Fotia Belt", neck="Fotia Gorget", ear1="Moonshade Earring",ear2="Cessance Earring",}									   
								   
	sets.precast.WS['Earth Crusher'] = {ammo="Knobkierrie", body="Samnuha Coat", hands="Leyline Gloves", left_ring="Shiva Ring +1", right_ring="Archon Ring",
	                               head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+24','Weapon skill damage +4%','Mag. Acc.+11',}},
	                               back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	                               legs={ name="Herculean Trousers", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','INT+9','Mag. Acc.+8','"Mag.Atk.Bns."+15',}}, neck="Sanctity Necklace", waist="Eschan Stone",
                                   feet={ name="Herculean Boots", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Weapon skill damage +2%','"Mag.Atk.Bns."+13',}}, left_ear="Ishvara Earring", right_ear="Moonshade Earring"}
								   
	sets.precast.WS['Full Swing'] = set_combine(sets.precast.WS, {back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}, waist="Moonbow Belt +1", ammo="Knobkierrie",
	                                                                 neck="Caro Necklace", ring1="Niqmaddu Ring", ring2="Regal Ring", legs="Hizamaru Hizayoroi +2", hands="Anchorite's Gloves +3",
	                                                                 head="Hesychast's Crown +3", body={ name="Herculean Vest", augments={'Accuracy+28','Weapon skill damage +2%','DEX+12','Attack+9',}}, 
																	 ear1="Ishvara Earring", ear2="Moonshade Earring"})
																	 
	sets.precast.WS['Retribution'] = set_combine(sets.precast.WS, {back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}, waist="Moonbow Belt +1", ammo="Knobkierrie",
	                                                                 neck="Caro Necklace", ring1="Niqmaddu Ring", ring2="Regal Ring", legs="Hizamaru Hizayoroi +2", hands="Anchorite's Gloves +3",
	                                                                 head="Hesychast's Crown +3", body={ name="Herculean Vest", augments={'Accuracy+28','Weapon skill damage +2%','DEX+12','Attack+9',}}, 
																	 ear1="Ishvara Earring", ear2="Moonshade Earring"})
     
    -- Resting sets
    sets.resting = {head="Yaoyotl Helm",neck="Wiglen Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Ares' cuirass +1",hands="Cizin Mufflers",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Letalis Mantle",waist="Goading Belt",legs="Blood Cuisses",feet="Ejekamal Boots"}
     
 
    -- Idle sets
    sets.idle = {head="Genmei Kabuto",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Odnowa Earring +1",
        body="Ashera Harness",hands="Kurys Gloves",ring1="Vocane Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Ask Sash",legs="Mummu Kecks +2",feet="Ahosi Leggings"}
		
	sets.idle.Boost = {head="",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Odnowa Earring +1",
        body="",hands="",ring1="Vocane Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Ask Sash",legs="",feet=""}
 
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle.Town = {head="Genmei Kabuto",neck="Monk's Nodowa +1",ear1="Odnowa Earring",ear2="Odnowa Earring +1",
        body="Hesychast's Cyclas +3",hands="Kurys Gloves",ring1="Vocane Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Ask Sash",legs="Mummu Kecks +2",feet="Herald's Gaiters"}
     
    sets.idle.Field = {
        ammo="Staunch Tathlum +1", head="Malignance Chapeau", neck="Monk's Nodowa +1",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
        hands="Malignance Gloves", waist="Ask Sash", body="Malignance Tabard",
        legs="Malignance Tights", feet="Malignance Boots", ring1="Niqmaddu Ring", ring2="Defending Ring", ear1="Sherida Earring", ear2="Telos Earring"}
 
    sets.idle.Weak = {
        ammo="Staunch Tathlum",
                        head="Genmei Kabuto",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
                        body="Hizamaru Haramaki +1",hands="Kurys Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
                        back="Moonbeam Cape",waist="Flume Belt",legs="Ryuo Hakama",feet="Ahosi Leggings"}
     
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
        ammo="Expeditious Pinion", head="Malignance Chapeau", neck="Monk's Nodowa +1",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
        hands="Malignance Gloves", waist="Moonbow Belt +1", body="Malignance Tabard",
        legs="Malignance Tights", feet="Malignance Boots", ring1="Niqmaddu Ring", ring2="Gere Ring", ear1="Sherida Earring", ear2="Telos Earring"}
	sets.engaged.Impetus = {
        ammo="Expeditious Pinion", head="Adhemar Bonnet +1", neck="Monk's Nodowa +1",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
        hands="Ryuo Tekko +1", waist="Moonbow Belt +1", body="Bhikku Cyclas +1",
        legs="Malignance Tights", feet="Malignance Boots", ring1="Niqmaddu Ring", ring2="Gere Ring", ear1="Sherida Earring", ear2="Telos Earring"}
	sets.engaged.Footwork = {
        ammo="Expeditious Pinion", head="Malignance Chapeau", neck="Monk's Nodowa +1",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
        hands="Malignance Gloves", waist="Moonbow Belt +1", body="Malignance Tabard",
        legs="Hesychast's Hose +3", feet="Anchorite's Gaiters +3", ring1="Niqmaddu Ring", ring2="Gere Ring", ear1="Sherida Earring", ear2="Telos Earring"}
	sets.engaged.ImpetWork = {
        ammo="Expeditious Pinion", head="Adhemar Bonnet +1", neck="Monk's Nodowa +1",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
        hands="Ryuo Tekko +1", waist="Moonbow Belt +1", body="Bhikku Cyclas +1",
        legs="Hesychast's Hose +3", feet="Anchorite's Gaiters +3", ring1="Niqmaddu Ring", ring2="Gere Ring", ear1="Sherida Earring", ear2="Telos Earring"}
	sets.engaged.DT = {
        ammo="Staunch Tathlum +1", head="Malignance Chapeau", neck="Monk's Nodowa +1",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
        hands="Malignance Gloves", waist="Moonbow Belt +1", body="Hesychast's Cyclas +3",
        legs="Anchorite's Hose +3", feet="Malignance Boots", ring1="Niqmaddu Ring", ring2="Defending Ring", ear1="Sherida Earring", ear2="Telos Earring"}
	sets.engaged.CounterCritical = {
        ammo="Staunch Tathlum +1", head="Malignance Chapeau", neck="Monk's Nodowa +1",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
        hands="Adhemar Wristbands +1", waist="Moonbow Belt +1", body="Bhikku Cyclas +1",
        legs="Hesychast's Hose +3", feet="Hesychast's Gaiters +3", ring1="Niqmaddu Ring", ring2="Defending Ring", ear1="Sherida Earring", ear2="Telos Earring"}
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
    set_macro_page(1, 14)
end