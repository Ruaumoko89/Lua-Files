-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Migawari = buffactive.migawari or false
    state.Buff.Doom = buffactive.doom or false
    state.Buff.Yonin = buffactive.Yonin or false
    state.Buff.Innin = buffactive.Innin or false
    state.Buff.Futae = buffactive.Futae or false

    determine_haste_group()
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'TPEva', 'DT')
    state.CastingMode:options('Normal', 'Burst')
	state.IdleMode:options('idle', 'Town', 'DW')


    gear.MovementFeet = {name="Danzo Sune-ate"}
    
    select_movement_feet()
    select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Mijin Gakure'] = {legs="Mochizuki Hakama"}
    sets.precast.JA['Futae'] = {legs="Hattori Tekko +1"}
    sets.precast.JA['Sange'] = {legs="Mochizuki Chainmail"}
	sets.precast.JA['Provoke'] = {hands="Kurys Gloves", back="Reiki Cloak", legs="Wukong's Hakama +1", feet="Ahosi Leggings", head="",
	               neck="Warder's Charm +1", ring1="Petrov Ring", ring2="Supershear Ring", body="Emet Harness +1", waist="Sinew Belt",
				   ear1="Friomisi Earring", ear2="Cryptic Earring", ammo="Sapience Orb"}
	sets.precast.JA['Pflug'] = {hands="Kurys Gloves", back="Reiki Cloak", legs="Wukong's Hakama +1", feet="Ahosi Leggings", head="",
	               neck="Warder's Charm +1", ring1="Petrov Ring", ring2="Supershear Ring", body="Emet Harness +1", waist="Sinew Belt",
				   ear1="Friomisi Earring", ear2="Cryptic Earring", ammo="Sapience Orb"}
	sets.precast.JA['Vallation'] = {hands="Kurys Gloves", back="Reiki Cloak", legs="Wukong's Hakama +1", feet="Ahosi Leggings", head="",
	               neck="Warder's Charm +1", ring1="Petrov Ring", ring2="Supershear Ring", body="Emet Harness +1", waist="Sinew Belt",
				   ear1="Friomisi Earring", ear2="Cryptic Earring", ammo="Sapience Orb"}
    sets.precast.JA['Swordplay'] = {hands="Kurys Gloves", back="Reiki Cloak", legs="Wukong's Hakama +1", feet="Ahosi Leggings", head="",
	               neck="Warder's Charm +1", ring1="Petrov Ring", ring2="Supershear Ring", body="Emet Harness +1", waist="Sinew Belt",
				   ear1="Friomisi Earring", ear2="Cryptic Earring", ammo="Sapience Orb"}
	sets.precast.JA['Innin'] = {head="Mochizuki Hatsuburi +3"}
	sets.precast.JA['Yonin'] = {head="Mochizuki Hatsuburi +3"}
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Sonia's Plectrum",
        head="Felistris Mask",
        body="Hachiya Chainmail +1",hands="Buremte Gloves",ring1="Spiral Ring",
        back="Iximulew Cape",waist="Caudata Belt",legs="Nahtirah Trousers",feet="Otronif Boots +1"}
        -- Uk'uxkaj Cap, Daihanshi Habaki
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Set for acc on steps, since Yonin drops acc a fair bit
    sets.precast.Step = {
        head="Whirlpool Mask",neck="Ej Necklace",
        body="Otronif Harness +1",hands="Buremte Gloves",ring1="Patricius Ring",
        back="Yokaze Mantle",waist="Chaac Belt",legs="Manibozho Brais",feet="Otronif Boots +1"}

    sets.precast.Flourish1 = {waist="Chaac Belt"}

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="",ear1="Etiolation Earring",ear2="Loquacious Earring",hands="Leyline Gloves",ring1="Kishar Ring", ring2="Rahab Ring", back={ name="Andartia's Mantle", augments={'"Fast Cast"+10',}},
	                   head="Herculean Helm",body="Dread Jupon",neck="Baetyl Pendant",legs="Gyve Trousers",feet="Hattori Kyahan +1"}
    sets.precast.FC.Utsusemi = {ammo="Date Shuriken", head="Malignance Chapeau", body="Malignance Tabard", hands="Malignance Gloves", legs="Malignance Tights", feet="Malignance Boots",
        neck="Bathy Choker +1", left_ear="Infused Earring", right_ear="Eabani Earring", left_ring="Ilabrat Ring", right_ring="Defending Ring",
        back={ name="Andartia's Mantle", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Dual Wield"+10','Phys. dmg. taken-10%',}}, waist="Svelt. Gouriz +1"}

    -- Snapshot for ranged
    sets.precast.RA = {}
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Seki Shuriken",
        head="Rao Kabuto +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
        body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Ilabrat Ring",ring2="Regal Ring",
        back="Sacro Mantle",
		waist="Fotia Belt",feet={ name="Herculean Boots", augments={'Accuracy+22','"Triple Atk."+4','DEX+8','Attack+2',}},legs="Ryuo Hakama +1"}
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Jukukik Feather",hands="Buremte Gloves",
        back="Yokaze Mantle"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Blade: Jin'] = {legs="Ta'lab Trousers", body="Abnoba Kaftan", ring1="Hetairoi Ring", ring1="Ilabrat Ring", ring2="Regal Ring", head="Adhemar Bonnet +1", hands="Adhemar Wristbands +1",
	left_ear="Moonshade Earring", right_ear="Brutal Earring", feet={ name="Herculean Boots", augments={'Accuracy+29','STR+15','Attack+12',}}, neck="Fotia Gorget", waist="Fotia Belt",
	back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Crit.hit rate+10',}},}

    sets.precast.WS['Blade: Hi'] = {ammo="Date Shuriken",
        head="Adhemar Bonnet +1", body="Abnoba Kaftan", hands="Ryuo Tekko +1", legs="Hiza. Hizayoroi +2",
        feet="Ryuo Sune-ate +1", neck="Ninja Nodowa +1", waist="Grunfeld Rope",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
        right_ear="Ishvara Earring", left_ring="Ilabrat Ring", right_ring="Regal Ring", back={ name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','AGI+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},}
		
	sets.precast.WS['Blade: Ten'] = {head="Hachiya Hatsuburi +3", 
	    body={ name="Herculean Vest", augments={'Accuracy+28','Weapon skill damage +2%','DEX+12','Attack+9',}},
        hands={ name="Herculean Gloves", augments={'Accuracy+25 Attack+25','Magic dmg. taken -2%','STR+14',}},
        legs="Hiza. Hizayoroi +2",feet={ name="Herculean Boots", augments={'Accuracy+29','STR+15','Attack+12',}},
        neck="Fotia Gorget", waist="Grunfeld Rope", left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
        right_ear="Ishvara Earring", left_ring="Ilabrat Ring", right_ring="Gere	Ring", back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}

    sets.precast.WS['Blade: Ku'] = {ammo="Seki Shuriken",
        head="Rao Kabuto +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
        body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Ilabrat Ring",ring2="Regal Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
		waist="Fotia Belt",feet={ name="Herculean Boots", augments={'Accuracy+22','"Triple Atk."+4','DEX+8','Attack+2',}},legs="Ryuo Hakama +1"}
	
    sets.precast.WS['Blade: Shun'] = sets.precast.WS
	
	sets.precast.WS['Blade: Yu'] = {ammo="Seething Bomblet +1",head="Mochizuki Hatsuburi +3",
        body={ name="Samnuha Coat", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+5','"Dual Wield"+5',}},
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs="Hizamaru Hizayoroi +2",
        feet={ name="Herculean Boots", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Weapon skill damage +2%','"Mag.Atk.Bns."+13',}},
        neck="Sanctity Necklace",waist="Orpheus's Sash",left_ear="Friomisi Earring",right_ear="Moonshade Earring",
	    left_ring="Dingir Ring",right_ring="Shukuyu Ring",back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}
    
	sets.precast.WS['Blade: Teki'] = {ammo="Seething Bomblet +1",head="Mochizuki Hatsuburi +3",
        body={ name="Samnuha Coat", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+5','"Dual Wield"+5',}},
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs="Hizamaru Hizayoroi +2",
        feet={ name="Herculean Boots", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Weapon skill damage +2%','"Mag.Atk.Bns."+13',}},
        neck="Sanctity Necklace",waist="Orpheus's Sash",left_ear="Friomisi Earring",right_ear="Moonshade Earring",
	    left_ring="Dingir Ring",right_ring="Shukuyu Ring",back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}
	
	sets.precast.WS['Blade: Chi'] = {ammo="Seething Bomblet +1",head="Mochizuki Hatsuburi +3",
        body={ name="Samnuha Coat", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+5','"Dual Wield"+5',}},
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs="Hizamaru Hizayoroi +2",
        feet={ name="Herculean Boots", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Weapon skill damage +2%','"Mag.Atk.Bns."+13',}},
        neck="Fotia Gorget",waist="Sinew Belt",left_ear="Friomisi Earring",right_ear="Moonshade Earring",
	    left_ring="Shukuyu Ring",right_ring="Gere Ring",back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}
	
	sets.precast.WS['Aeolian Edge'] = {ammo="Seething Bomblet +1",head="Mochizuki Hatsuburi +3",
        body={ name="Samnuha Coat", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+5','"Dual Wield"+5',}},
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs="Hizamaru Hizayoroi +2",
        feet={ name="Herculean Boots", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Weapon skill damage +2%','"Mag.Atk.Bns."+13',}},
        neck="Fotia Gorget",waist="Orpheus's Sash",left_ear="Friomisi Earring",right_ear="Moonshade Earring",
	    left_ring="Shukuyu Ring",right_ring="Gere Ring",back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}
	
	sets.precast.WS['Blade: Ei'] = {ammo="Seething Bomblet +1",head="Pixie Hairpin +1",
        body={ name="Samnuha Coat", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+5','"Dual Wield"+5',}},
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs="Hizamaru Hizayoroi +2",
        feet={ name="Herculean Boots", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Weapon skill damage +2%','"Mag.Atk.Bns."+13',}},
        neck="Sanctity Necklace",waist="Orpheus's Sash",left_ear="Friomisi Earring",right_ear="Moonshade Earring",
	    left_ring="Dingir Ring",right_ring="Archon Ring",back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}
		
	sets.precast.WS['Tachi: Ageha'] = {head="Malignance Chapeau",neck="Sanctity Necklace",ear1="Dignitary's Earring",ear2="Moonshade Earring",
        hands="Malignance Gloves",body="Malignance Tabard",ring1="Chirich Ring +1",ring2="Chirich Ring +1",waist="Eschan Stone",
        back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}, feet="Malignance Boots", legs="Malignance Tights"}
		
	sets.precast.WS['Tachi: Jinpu'] = {ammo="Seething Bomblet +1",head="Mochizuki Hatsuburi +3",
        body={ name="Samnuha Coat", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+5','"Dual Wield"+5',}},
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs="Hizamaru Hizayoroi +2",
        feet={ name="Herculean Boots", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Weapon skill damage +2%','"Mag.Atk.Bns."+13',}},
        neck="Fotia Gorget",waist="Sinew Belt",left_ear="Friomisi Earring",right_ear="Moonshade Earring",
	    left_ring="Shukuyu Ring",right_ring="Gere Ring",back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}
		
	sets.precast.WS['Tachi: Enpi'] = {head="Hachiya Hatsuburi +3", 
	    body={ name="Herculean Vest", augments={'Accuracy+28','Weapon skill damage +2%','DEX+12','Attack+9',}},
        hands={ name="Herculean Gloves", augments={'Accuracy+25 Attack+25','Magic dmg. taken -2%','STR+14',}},
        legs="Hiza. Hizayoroi +2",feet={ name="Herculean Boots", augments={'Accuracy+29','STR+15','Attack+12',}},
        neck="Fotia Gorget", waist="Grunfeld Rope", left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
        right_ear="Ishvara Earring", left_ring="Ilabrat Ring", right_ring="Gere	Ring", back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}
		
	sets.precast.WS['Tachi: Kasha'] = {head="Hachiya Hatsuburi +3", 
	    body={ name="Herculean Vest", augments={'Accuracy+28','Weapon skill damage +2%','DEX+12','Attack+9',}},
        hands={ name="Herculean Gloves", augments={'Accuracy+25 Attack+25','Magic dmg. taken -2%','STR+14',}},
        legs="Hiza. Hizayoroi +2",feet={ name="Herculean Boots", augments={'Accuracy+29','STR+15','Attack+12',}},
        neck="Fotia Gorget", waist="Grunfeld Rope", left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
        right_ear="Ishvara Earring", left_ring="Ilabrat Ring", right_ring="Gere	Ring", back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}
		
	sets.precast.WS['Dragon Kick'] = {head="Hachiya Hatsuburi +3", 
	    body={ name="Herculean Vest", augments={'Accuracy+28','Weapon skill damage +2%','DEX+12','Attack+9',}},
        hands={ name="Herculean Gloves", augments={'Accuracy+25 Attack+25','Magic dmg. taken -2%','STR+14',}},
        legs="Hiza. Hizayoroi +2",feet={ name="Herculean Boots", augments={'Accuracy+29','STR+15','Attack+12',}},
        neck="Fotia Gorget", waist="Grunfeld Rope", left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
        right_ear="Ishvara Earring", left_ring="Ilabrat Ring", right_ring="Regal Ring", back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}
	
	
    --------------------------------------
    -- Midcast sets
    --------------------------------------
        
    sets.midcast.Utsusemi = {hands="Kurys Gloves", back={ name="Andartia's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Enmity+10',}}, legs="Malignance Trousers", feet="Hattori Kyahan +1", head="Herculean Helm",
	               neck="Warder's Charm +1", ring1="Petrov Ring", ring2="Supershear Ring", body="Emet Harness +1", waist="Sinew Belt",
				   ear1="Friomisi Earring", ear2="Cryptic Earring",}

    sets.midcast.ElementalNinjutsu =   {ammo="Pemphredo Tathlum",head="Mochizuki Hatsuburi +3",
        body={ name="Samnuha Coat", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+5','"Dual Wield"+5',}},
        hands="Hattori Tekko +1", legs="Herculean Trousers",
        feet={ name="Herculean Boots", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Weapon skill damage +2%','"Mag.Atk.Bns."+13',}},
        neck="Baetyl Pendant",waist="Eschan Stone",left_ear="Friomisi Earring",right_ear="Crematio Earring",
	    left_ring="Mujin Band",right_ring="Locus Ring",back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},}

    sets.midcast.ElementalNinjutsu.Burst =  {ammo="Pemphredo Tathlum",head="Mochizuki Hatsuburi +3",
        body={ name="Samnuha Coat", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+5','"Dual Wield"+5',}},
        hands="Hattori Tekko +1",
        legs={ name="Herculean Trousers", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','INT+9','Mag. Acc.+8','"Mag.Atk.Bns."+15',}},
        feet="Mochizuki Kyahan +3", neck="Sanctity Necklace",waist="Eschan Stone",left_ear="Friomisi Earring",right_ear="Dignitary's Earring",left_ring="Mujin Band",
        right_ring="Locus Ring",back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},}

    sets.midcast.NinjutsuDebuff = {
        head="Hachiya Hatsuburi +3",neck="Incanter's Torque",ear1="Dignitary's Earring",ear2="Hermetic Earring",
        hands="Malignance Gloves",body="Malignance Tabard",ring1="Stikini Ring",ring2="Stikini Ring",waist="Eschan Stone",
        back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}, feet="Hachiya Kyahan +3", legs="Malignance Tights"}

    sets.midcast.NinjutsuBuff = {head="Hachiya Hatsuburi +3", neck="Incanter's Torque", ear1="Odnowa Earring +1", ear2="Odnowa Earring",
        hands="Mochizuki Tekko +1", body="Malignance Tabard", ring1="Stikini Ring", ring2="Stikini Ring",
        back="Andartia's Mantle",legs="Malignance Tights",feet="Hattori Kyahan +1"}
		
	sets.midcast.Flash = {hands="Kurys Gloves", back="Reiki Cloak", legs="Wukong's Hakama +1", feet="Mochizuki Kyahan +3", head="",
	               neck="Warder's Charm +1", ring1="Petrov Ring", ring2="Supershear Ring", body="Emet Harness +1", waist="Sinew Belt",
				   ear1="Friomisi Earring", ear2="Cryptic Earring", ammo="Sapience Orb"}
	
	sets.midcast.Stun = {hands="Kurys Gloves", back="Reiki Cloak", legs="Wukong's Hakama +1", feet="Mochizuki Kyahan +3", head="",
	               neck="Warder's Charm +1", ring1="Petrov Ring", ring2="Supershear Ring", body="Emet Harness +1", waist="Sinew Belt",
				   ear1="Friomisi Earring", ear2="Cryptic Earring", ammo="Sapience Orb"}

    sets.midcast.RA = {
        ammo="Seki Shuriken",
        head="Kendatsuba Jinpachi", neck="Erudition Necklace", ear1="Cessance Earring", ear2="Telos Earring",
        body="Kendatsuba Samue", hands="Hachiya Tekko +3", ring1="Ilabrat Ring", ring2="Epona's Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}, waist="Kentarch Belt +1", legs="Samnuha Tights",
		feet={ name="Herculean Boots", augments={'Accuracy+22','"Triple Atk."+4','DEX+8','Attack+2',}}}
    -- Hachiya Hakama/Thurandaut Tights +1

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",
        ring1="Sheltered Ring",ring2="Paguroidea Ring"}
    
    -- Idle sets
    sets.idle = {ammo="Date Shuriken",
        head="Malignance Chapeau",neck="Bathy Choker +1",ear1="Infused Earring",ear2="Eabani Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Defending Ring",
        back={ name="Andartia's Mantle", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
		waist="Sveltesse Gouriz +1",legs="Malignance Tights",feet="Malignance Boots"}

    sets.idle.Speed = {ammo="Staunch Tathlum +1",
        head="Genmei Kabuto",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Odnowa Earring +1",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Engraved Belt",legs="Malignance Tights",feet="Hachiya Kyahan +3"}
    
    sets.idle.DW =  {ammo="Staunch Tathlum +1",
    head={ name="Ryuo Somen", augments={'Ninjutsu skill +15','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    body={ name="Mochi. Chainmail +3", augments={'Enhances "Sange" effect',}},
    hands="Malignance Gloves",
    legs={ name="Mochi. Hakama +1", augments={'Enhances "Mijin Gakure" effect',}},
    feet="Hizamaru Sune-ate +1",
    neck="Loricate Torque +1",
    left_ear="Suppanomimi",
    right_ear="Eabani Earring",
    left_ring="Gelatinous Ring +1",
    right_ring="Defending Ring",
    back={ name="Andartia's Mantle", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
	waist="Engraved Belt"}
    
    -- Defense sets
    sets.defense.Evasion = {
        head="Felistris Mask",neck="Ej Necklace",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Beeline Ring",
        back="Yokaze Mantle",waist="Flume Belt",legs="Nahtirah Trousers",feet="Otronif Boots +1"}

    sets.defense.PDT = {ammo="Iron Gobbet",
        head="Whirlpool Mask",neck="Twilight Torque",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Shadow Mantle",waist="Flume Belt",legs="Nahtirah Trousers",feet="Otronif Boots +1"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Whirlpool Mask",neck="Twilight Torque",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape",waist="Flume Belt",legs="Nahtirah Trousers",feet="Otronif Boots +1"}


    sets.Kiting = {feet=gear.MovementFeet}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {ammo="Seki Shuriken",
        head="Adhemar Bonnet +1", neck="Ninja Nodowa +1", ear1="Brutal Earring", ear2="Cessance Earring",
        body="Ashera Harness", hands="Ryuo Tekko +1", ring1="Epona's Ring", ring2="Gere Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}, waist="Sailfi Belt +1", legs="Ryuo Hakama +1", 
		feet={ name="Herculean Boots", augments={'Accuracy+22','"Triple Atk."+4','DEX+8','Attack+2',}}}
	sets.engaged.TPEva = {ammo="Date Shuriken",
        head="Malignance Chapeau", neck="Ninja Nodowa +1", ear1="Brutal Earring", ear2="Cessance Earring",
        body="Malignance Tabard", hands="Malignance Gloves", ring1="Ilabrat Ring", ring2="Defending Ring",
        back={ name="Andartia's Mantle", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','AGI+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}, waist="Kentarch Belt +1", legs="Malignance Tights", feet="Malignance Boots"}
    sets.engaged.DT = {ammo="Date Shuriken",
        head="Malignance Chapeau", neck="Loricate Torque +1", ear1="Odnowa Earring", ear2="Odnowa Earring +1",
        body="Malignance Tabard", hands="Malignance Gloves", ring1="Ilabrat Ring", ring2="Defending Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}, waist="Engraved Belt", legs="Malignance Tights", feet="Malignance Boots"}

    --------------------------------------
    -- Custom buff sets
    --------------------------------------
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the general midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if state.Buff.Doom then
        equip(sets.buff.Doom)
    end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted and spell.english == "Migawari: Ichi" then
        state.Buff.Migawari = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    -- If we gain or lose any haste buffs, adjust which gear set we target.
    if S{'haste','march','embrava','haste samba'}:contains(buff:lower()) then
        determine_haste_group()
        handle_equipping_gear(player.status)
    elseif state.Buff[buff] ~= nil then
        handle_equipping_gear(player.status)
    end
end

function job_status_change(new_status, old_status)
    if new_status == 'Idle' then
        select_movement_feet()
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Get custom spell maps
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == "Ninjutsu" then
        if not default_spell_map then
            if spell.target.type == 'SELF' then
                return 'NinjutsuBuff'
            else
                return 'NinjutsuDebuff'
            end
        end
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if state.Buff.Migawari then
        idleSet = set_combine(idleSet, sets.buff.Migawari)
    end
    if state.Buff.Doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
    end
    return idleSet
end


-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if state.Buff.Migawari then
        meleeSet = set_combine(meleeSet, sets.buff.Migawari)
    end
    if state.Buff.Doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
    end
    return meleeSet
end

-- Called by the default 'update' self-command.
function job_update(cmdParams, eventArgs)
    select_movement_feet()
    determine_haste_group()
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function determine_haste_group()
    -- We have three groups of DW in gear: Hachiya body/legs, Iga head + Patentia Sash, and DW earrings
    
    -- Standard gear set reaches near capped delay with just Haste (77%-78%, depending on HQs)

    -- For high haste, we want to be able to drop one of the 10% groups.
    -- Basic gear hits capped delay (roughly) with:
    -- 1 March + Haste
    -- 2 March
    -- Haste + Haste Samba
    -- 1 March + Haste Samba
    -- Embrava
    
    -- High haste buffs:
    -- 2x Marches + Haste Samba == 19% DW in gear
    -- 1x March + Haste + Haste Samba == 22% DW in gear
    -- Embrava + Haste or 1x March == 7% DW in gear
    
    -- For max haste (capped magic haste + 25% gear haste), we can drop all DW gear.
    -- Max haste buffs:
    -- Embrava + Haste+March or 2x March
    -- 2x Marches + Haste
    
    -- So we want four tiers:
    -- Normal DW
    -- 20% DW -- High Haste
    -- 7% DW (earrings) - Embrava Haste (specialized situation with embrava and haste, but no marches)
    -- 0 DW - Max Haste
    
    classes.CustomMeleeGroups:clear()
    
    if buffactive.embrava and (buffactive.march == 2 or (buffactive.march and buffactive.haste)) then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.march == 2 and buffactive.haste then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.embrava and (buffactive.haste or buffactive.march) then
        classes.CustomMeleeGroups:append('EmbravaHaste')
    elseif buffactive.march == 1 and buffactive.haste and buffactive['haste samba'] then
        classes.CustomMeleeGroups:append('HighHaste')
    elseif buffactive.march == 2 then
        classes.CustomMeleeGroups:append('HighHaste')
    end
end


function select_movement_feet()
    if world.time >= 17*60 or world.time < 7*60 then
        gear.MovementFeet.name = gear.NightFeet
    else
        gear.MovementFeet.name = gear.DayFeet
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(4, 3)
    elseif player.sub_job == 'THF' then
        set_macro_page(5, 3)
    else
        set_macro_page(1, 12)
    end
end