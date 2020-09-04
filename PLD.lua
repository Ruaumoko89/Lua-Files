-- NOTE: I do not play run, so this will not be maintained for 'active' use. 
-- It is added to the repository to allow people to have a baseline to build from,
-- and make sure it is up-to-date with the library API.


-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

	-- Load and initialize the include file.
	include('Mote-Include.lua')
	include('organizer-lib.lua') 
end


-- Setup vars that are user-independent.
function job_setup()
    -- Table of entries
    rune_timers = T{}
    -- entry = rune, index, expires
    
    if player.main_job_level >= 65 then
        max_runes = 3
    elseif player.main_job_level >= 35 then
        max_runes = 2
    elseif player.main_job_level >= 5 then
        max_runes = 1
    else
        max_runes = 0
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

function user_setup()
    state.OffenseMode:options('TP', 'Hybrid', 'Turtle')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('DT', 'Resist')
    state.IdleMode:options('DT')

	select_default_macro_book()
end


function init_gear_sets()
    sets.enmity = {ammo="Sapience Orb",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	back={ name="Rudianos's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Enmity+10','Chance of successful block +5',}},
    neck="Moonbeam Necklace", waist="Creed Baudrier", left_ear="Cryptic Earring", right_ear="Friomisi Earring", 
	left_ring="Apeile Ring", right_ring="Apeile Ring +1", hands="Macabre Gaunt. +1"}


	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = {ammo="Sapience Orb",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	back={ name="Rudianos's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Enmity+10','Damage taken-5%',}},
    neck="Warder's Charm +1", waist="Tempus Fugit", left_ear="Cryptic Earring", right_ear="Friomisi Earring", 
	left_ring="Apeile Ring", right_ring="Apeile Ring +1", hands="Macabre Gaunt. +1", legs="Caballarius Breeches +1"}
    sets.precast.JA['Holy Circle'] = {feet="Reverence Leggings +3"}
	sets.precast.JA['Cover'] = {head="Reverence Coronet +1"}
	sets.precast.JA['Rampart'] = {ammo="Sapience Orb", head="Caballarius Coronet +3",
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	back={ name="Rudianos's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Enmity+10','Damage taken-5%',}},
    neck="Warder's Charm +1", waist="Tempus Fugit", left_ear="Cryptic Earring", right_ear="Friomisi Earring", 
	left_ring="Apeile Ring", right_ring="Apeile Ring +1", hands="Macabre Gaunt. +1", legs="Caballarius Breeches +1"}
	sets.precast.JA['Sentinel'] = {ammo="Sapience Orb",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet="Caballarius Leggings +3", back={ name="Rudianos's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Enmity+10','Damage taken-5%',}},
    neck="Warder's Charm +1", waist="Tempus Fugit", left_ear="Cryptic Earring", right_ear="Friomisi Earring", left_ring="Apeile Ring", right_ring="Apeile Ring +1", hands="Macabre Gaunt. +1"}
	sets.precast.JA['Fealty'] = {body="Caballarius Surcoat +1"}
	sets.precast.JA['Divine Emblem'] = {feet="Creed Sabatons +2"} 
	sets.precast.JA['Shield Bash'] = {ammo="Sapience Orb",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	back={ name="Rudianos's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Enmity+10','Chance of successful block +5',}},
    neck="Moonbeam Necklace", waist="Creed Baudrier", left_ear="Cryptic Earring", right_ear="Friomisi Earring", 
	left_ring="Apeile Ring", right_ring="Apeile Ring +1", hands="Caballarius Gauntlets +2"}
	sets.precast.JA['Palisade'] = sets.enmity
	sets.precast.JA['Last Resort'] = sets.enmity
	sets.precast.JA['Souleater'] = sets.enmity
	sets.precast.JA['Vallation'] = sets.enmity
	sets.precast.JA['Pflug'] = sets.enmity
	sets.precast.JA['Swordplay'] = sets.enmity
	sets.precast.JA['Provoke'] = sets.enmity
	
	-- Fast cast sets for spells
    sets.precast.FC = {ammo="Egoist's Tathlum",
            head="Carmine Mask +1", neck="Knight's Bead Necklace +1", ear1="", ear2="",
            body="Reverence Surcoat +3", hands="Souv. Handsch. +1", ring1="Moonbeam Ring", ring2="Moonbeam Ring", back={ name="Rudianos's Mantle", augments={'"Fast Cast"+10',}},
			waist="Creed Baudrier", legs="Souv. Diechlings +1", feet="Carmine Greaves +1"}
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {ear1="Nourishing Earring +1", ear2="Mendicant's Earring"})
-- 

	-- Weaponskill sets
	sets.precast.WS['Swift Blade'] = {ammo="", head="Flamma Zucchetto +2", neck="Fotia Gorget", ear1="Cessance Earring", ear2="Brutal Earring",
            body="Dagon Breastplate", hands="Sulevia's Gauntlets +2", back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    	    ring1="Rufescent Ring", ring2="Regal Ring", feet="Flamma Gambieras +2", waist="Fotia Belt", legs="Sulevia's Cuisses +2"}
	sets.precast.WS['Savage Blade'] = {head={ name="Valorous Mask", augments={'Accuracy+24','Weapon skill damage +4%','STR+9',}}, neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Thrud Earring",
            body="Dagon Breastplate", hands={ name="Odyssean Gauntlets", augments={'Attack+25','Weapon skill damage +4%','STR+7','Accuracy+13',}}, ammo="Ginsen",
		    back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    	    ring1="Rufescent Ring", ring2="Regal Ring", feet="Sulevia's Leggings +2", waist="Metalsinger Belt", legs="Sulevia's Cuisses +2"}
	sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tathlum", head="Pixie Hairpin +1", body="Sacro Breastplate", 
	        hands={ name="Valorous Mitts", augments={'Magic dmg. taken -1%','INT+4','Weapon skill damage +6%','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}, legs={ name="Augury Cuisses +1", augments={'Path: A',}},
            feet={ name="Valorous Greaves", augments={'"Triple Atk."+3','"Mag.Atk.Bns."+18','Weapon skill damage +7%','Accuracy+11 Attack+11',}},
            neck="Baetyl Pendant", waist="Eschan Stone", left_ear="Friomisi Earring", right_ear="Ishvara Earring", left_ring="Defending Ring",
            right_ring="Archon Ring", back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}
	sets.precast.WS['Seraph Blade'] = {head={ name="Valorous Mask", augments={'Accuracy+24','Weapon skill damage +4%','STR+9',}}, 
	        neck="Baetyl Pendant", ear1="Friomisi Earring", ear2="Ishvara Earring", hands="Carmine Finger Gauntlets +1",
            body="Founder's Breastplate", ring1="Regal Ring", ring2="Acumen Ring",
            back="Izdubar Mantle", waist="Eschan Stone", feet="Founder's Greaves", legs="Eschite Cuisses"}
    sets.precast.WS['Requiescat'] = {head="Flamma Zucchetto +2", neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Brutal Earring",
            body="Dagon Breastplate", hands="Sulevia's Gauntlets +2", 
    	    ring1="Shukuyu Ring", ring2="Regal Ring", feet="Flamma Gambieras +2", waist="Fotia Belt", legs="Sulevia's Cuisses +2"}
	sets.precast.WS['Chant du Cygne'] = {head="Lustratio Cap +1", neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Brutal Earring",
            body="Dagon Breastplate", hands="Flamma Manopolas +2", back={ name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    	    ring1="Begrudging Ring", ring2="Regal Ring", feet="Lustratio Leggings +1", waist="Fotia Belt", legs="Lustratio Subligar +1"}
    sets.precast.WS['Resolution'] = {head="Flamma Zucchetto +2", neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Brutal Earring",
            body="Dagon Breastplate", hands="Sulevia's Gauntlets +2", back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    	    ring1="Rufescent Ring", ring2="Regal Ring", feet="Flamma Gambieras +2", waist="Fotia Belt", legs="Sulevia's Cuisses +2"}
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS['Resolution'].Normal, 
        {ammo="Floestone"})
	sets.precast.WS['Torcleaver'] = {head={ name="Odyssean Helm", augments={'Accuracy+24 Attack+24','Weapon skill damage +2%','VIT+9','Attack+10',}}, neck="Knight's Bead Necklace +1", 
	        ear1="Ishvara Earring", ear2="Thrud Earring",
            body="Sulevia's Platemail +2", hands={ name="Odyssean Gauntlets", augments={'Accuracy+20 Attack+20','Weapon skill damage +3%','VIT+13','Attack+5',}},
			back={ name="Rudianos's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}},
    	    ring1="Petrov Ring", ring2="Regal Ring", feet="Sulevia's Leggings +2", waist="Caudata Belt", legs="Sulevia's Cuisses +2"}
	sets.precast.WS['Judgment'] = {head={ name="Valorous Mask", augments={'Accuracy+24','Weapon skill damage +4%','STR+9',}}, neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Thrud Earring",
            body="Dagon Breastplate", hands={ name="Odyssean Gauntlets", augments={'Attack+25','Weapon skill damage +4%','STR+7','Accuracy+13',}}, ammo="Ginsen",
		    back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    	    ring1="Rufescent Ring", ring2="Regal Ring", feet="Sulevia's Leggings +2", waist="Metalsinger Belt", legs="Sulevia's Cuisses +2"}
	sets.precast.WS['Black Halo'] = {head={ name="Valorous Mask", augments={'Accuracy+24','Weapon skill damage +4%','STR+9',}}, neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Thrud Earring",
            body="Dagon Breastplate", hands={ name="Odyssean Gauntlets", augments={'Attack+25','Weapon skill damage +4%','STR+7','Accuracy+13',}}, ammo="Ginsen",
		    back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    	    ring1="Rufescent Ring", ring2="Regal Ring", feet="Sulevia's Leggings +2", waist="Metalsinger Belt", legs="Sulevia's Cuisses +2"}
	sets.precast.WS['Hexa Strike'] = {head="Flamma Zucchetto +2", neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Brutal Earring",
            body="Dagon Breastplate", hands="Flamma Manopolas +2", 
    	    ring1="Shukuyu Ring", ring2="Regal Ring", feet="Lustratio Leggings +1", waist="Fotia Belt", legs="Lustratio Subligar +1"}
	sets.precast.WS['Cataclysm'] = {ammo="Pemphredo Tathlum", head="Pixie Hairpin +1", body="Sacro Breastplate", 
	        hands={ name="Valorous Mitts", augments={'Magic dmg. taken -1%','INT+4','Weapon skill damage +6%','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}, legs={ name="Augury Cuisses +1", augments={'Path: A',}},
            feet={ name="Valorous Greaves", augments={'"Triple Atk."+3','"Mag.Atk.Bns."+18','Weapon skill damage +7%','Accuracy+11 Attack+11',}},
            neck="Baetyl Pendant", waist="Eschan Stone", left_ear="Friomisi Earring", right_ear="Ishvara Earring", left_ring="Defending Ring",
            right_ring="Archon Ring", back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}
	sets.precast.WS['Shattersoul'] = {head="Flamma Zucchetto +2", neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Digni. Earring",
            body="Flamma Korazin +2", hands="Flamma Manopolas +2", back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    	    ring1="Rufescent Ring", ring2="Regal Ring", feet="Flamma Gambieras +2", waist="Fotia Belt", legs="Flamma Dirs +2"}
	sets.precast.WS['Shell Crusher'] = {head="Flamma Zucchetto +2", neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Digni. Earring",
            body="Flamma Korazin +2", hands="Flamma Manopolas +2", back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    	    ring1="Rufescent Ring", ring2="Regal Ring", feet="Flamma Gambieras +2", waist="Fotia Belt", legs="Flamma Dirs +2"}
	sets.precast.WS['Full Swing'] = {head={ name="Valorous Mask", augments={'Accuracy+24','Weapon skill damage +4%','STR+9',}}, neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Thrud Earring",
            body="Dagon Breastplate", hands={ name="Odyssean Gauntlets", augments={'Attack+25','Weapon skill damage +4%','STR+7','Accuracy+13',}}, ammo="Ginsen",
		    back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
    	    ring1="Rufescent Ring", ring2="Regal Ring", feet="Sulevia's Leggings +2", waist="Metalsinger Belt", legs="Sulevia's Cuisses +2"}

	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {}
    sets.midcast['Enhancing Magic'] = {head="Carmine Mask +1", ear1="Etiolation Earring", ear2="Andoaa Earring", hands="Regal Gauntlets", body="", ring1="Stikini Ring +1", ring2="Stikini Ring +1",
	                                   neck="Incanter's Torque", waist="Olympus Sash", legs="Carmine Cuisses +1"}
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'], {hands={ name="Souv. Handsch. +1", augments={'HP+65','Shield skill +15','Phys. dmg. taken -4',}}, 
	                                                                      head={ name="Odyssean Helm", augments={'CHR+3','Crit. hit damage +2%','Phalanx +4','Accuracy+11 Attack+11','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
	                                                                      body={ name="Odyss. Chestplate", augments={'"Store TP"+3','Weapon skill damage +1%','Phalanx +4','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
	                                                                      legs={ name="Odyssean Cuisses", augments={'Weapon skill damage +2%','Accuracy+4','Phalanx +5','Accuracy+5 Attack+5','Mag. Acc.+6 "Mag.Atk.Bns."+6',}},
	                                                                      feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, back="Weard Mantle"})
	sets.midcast['Flash'] = sets.enmity
	sets.midcast['Stun'] = sets.enmity
	sets.midcast['Reprisal'] =  {ammo="Staunch Tathlum +1",
          head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, body="Hjarrandi Breast.", hands="Regal Gauntlets",
          legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
          neck="Sacro Gorget", waist="Tempus Fugit", left_ear="Odnowa Earring", right_ear="Odnowa Earring +1", left_ring="Moonbeam Ring", right_ring="Moonbeam Ring", back="Moonbeam Cape"}
    sets.midcast['Enlight II'] = {ammo="Staunch Tathlum +1",
            head="Jumalik Helm", neck="Incanter's Torque", ear1="Etiolation Earring", ear2="Loquac. Earring",
            body="Reverence Surcoat +3", hands="Eschite Gauntlets", ring1="Stikini Ring", ring2="Stikini Ring",
			waist="Seigel Sash", legs="Eschite Cuisses", feet="Carmine Greaves +1"}
	sets.midcast['Holy'] = {ammo="Pemphredo Tathlum", head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst dmg.+10%','"Refresh"+1',}},
	       back={ name="Rudianos's Mantle", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Mag.Atk.Bns."+10',}},
           body="Sacro Breastplate", hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
           legs={ name="Eschite Cuisses", augments={'"Mag.Atk.Bns."+25','"Conserve MP"+6','"Fast Cast"+5',}}, feet="Valorous Greaves", neck="Sanctity Necklace", waist="Eschan Stone",
           left_ear="Friomisi Earring", right_ear="Digni. Earring", left_ring="Mujin Band", right_ring="Locus Ring"}
	sets.midcast['Holy II'] = {ammo="Pemphredo Tathlum", head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst dmg.+10%','"Refresh"+1',}},
	       back={ name="Rudianos's Mantle", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Mag.Atk.Bns."+10',}},
           body="Sacro Breastplate", hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
           legs="Augury Cuisses +1", feet="Founder's Greaves", neck="Sanctity Necklace", waist="Eschan Stone",
           left_ear="Friomisi Earring", right_ear="Digni. Earring", left_ring="Mujin Band", right_ring="Locus Ring"}
	sets.midcast['Banishga'] = 	{ammo="Staunch Tathlum +1",
          head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
          body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, hands="Macabre Gaunt. +1",
          legs={ name="Carmine Cuisses +1", augments={'MP+80','INT+12','MND+12',}}, feet="Odyssean Greaves",
          neck="Moonbeam Necklace", waist="Rumination Sash", left_ear="Nourish. Earring +1", right_ear="Magnetic Earring", left_ring="Apeile Ring", right_ring="Apeile Ring +1",
          back={ name="Rudianos's Mantle", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%',}},}
    sets.midcast['Aquaveil'] = 	{ammo="Staunch Tathlum +1",
          head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
          body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, hands="Macabre Gaunt. +1",
          legs={ name="Carmine Cuisses +1", augments={'MP+80','INT+12','MND+12',}}, feet="Odyssean Greaves",
          neck="Moonbeam Necklace", waist="Rumination Sash", left_ear="Nourish. Earring +1", right_ear="Magnetic Earring", left_ring="Apeile Ring", right_ring="Apeile Ring +1",
          back={ name="Rudianos's Mantle", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%',}},}
    sets.midcast.Cure = {head="Souveran Schaller +1", neck="Sacro Gorget", lear="Odnowa Earring", rear="Odnowa Earring +1", body="Souveran Cuirass +1", ammo="Egoist's Tathlum",
			           left_ring="Apeile Ring", right_ring="Apeile Ring +1", back={ name="Rudianos's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Enmity+10','Chance of successful block +5',}},
					   waist="Creed Baudrier", legs="Souveran Diechlings +1", hands="Macabre Gauntlets +1", feet="Souveran Schuhs +1"}
	-- Attributes: HP:3327 / Cure Potency +75% / Cure Received +30% / Cure Weather Bonus +25~35% / Enmity +92~122   
					  
	-- Backup Cure Set. Use when SCH or RDM are not main healers, or if I'm not getting regular Aquaveil --
	-- ammo="Staunch Tathlum +1",
    -- head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    -- body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, hands="Macabre Gaunt. +1",
    -- legs={ name="Carmine Cuisses +1", augments={'MP+80','INT+12','MND+12',}}, feet="Odyssean Greaves",
    -- neck="Moonbeam Necklace", waist="Rumination Sash", left_ear="Nourish. Earring +1", right_ear="Magnetic Earring", left_ring="Apeile Ring", right_ring="Apeile Ring +1",
    -- back={ name="Rudianos's Mantle", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%','Spell interruption rate down-10%',}},}
	
    -- Backup Cure Set #2. Use when using the Caballarius Sword. --
	-- ammo="Sapience Orb",
    -- head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    -- body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, hands="Macabre Gaunt. +1",
    -- legs={ name="Carmine Cuisses +1", augments={'MP+80','INT+12','MND+12',}}, feet="Odyssean Greaves",
    -- neck="Moonbeam Necklace", waist="Hachirin-no-Obi", left_ear="Nourish. Earring +1", right_ear="Cryptic Earring", left_ring="Apeile Ring", right_ring="Apeile Ring +1",
    -- back={ name="Rudianos's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Enmity+10','Chance of successful block +5',}},}
	
	-- Placeholder for Cure Set. --
	-- --

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

    sets.idle = {ammo="Staunch Tathlum +1",
            head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, body="Hjarrandi Breast.",
            hands={ name="Souv. Handsch. +1", augments={'HP+65','Shield skill +15','Phys. dmg. taken -4',}}, legs="Souveran Diechlings +1",
            feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
            neck="Knight's Bead Necklace +1", left_ear="Odnowa Earring", right_ear="Odnowa Earring +1", left_ring="Moonbeam Ring", right_ring="Moonbeam Ring",
            back="Moonbeam Cape", waist="Creed Baudrier"}
			
	sets.idle.Speed = {ammo="Staunch Tathlum +1",
            head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, body="Hjarrandi Breast.",
            hands={ name="Souv. Handsch. +1", augments={'HP+65','Shield skill +15','Phys. dmg. taken -4',}}, legs="Carmine Cuisses +1",
            feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
            neck="Knight's Bead Necklace +1", left_ear="Odnowa Earring", right_ear="Odnowa Earring +1", left_ring="Moonbeam Ring", right_ring="Moonbeam Ring",
            back={ name="Rudianos's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Enmity+10','Damage taken-5%',}}, waist="Creed Baudrier"}
           
	sets.idle.HP = {ammo="Staunch Tathlum +1",
            head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, body="Hjarrandi Breast.",
            hands={ name="Souv. Handsch. +1", augments={'HP+65','Shield skill +15','Phys. dmg. taken -4',}}, legs="Souveran Diechlings +1",
            feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
            neck="Knight's Bead Necklace +1", left_ear="Odnowa Earring", right_ear="Odnowa Earring +1", left_ring="Moonbeam Ring", right_ring="Moonbeam Ring",
            back="Moonbeam Cape", waist="Creed Baudrier"}


	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged.TP = {ammo="Staunch Tathlum +1", back={ name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
            head="Hjarrandi Helm", body="Hjarrandi Breastplate", hands="Sulev. Gauntlets +2", legs={ name="Odyssean Cuisses", augments={'Accuracy+17','"Store TP"+5','DEX+2','Attack+15',}},
			feet="Flamma Gambieras +2", neck="Knight's Bead Necklace +1", waist="Tempus Fugit",
            left_ear="Cessance Earring", right_ear="Brutal Earring", left_ring="Moonbeam Ring",right_ring="Moonbeam Ring"}
    sets.engaged.Hybrid = {ammo="Staunch Tathlum +1", back={ name="Rudianos's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Enmity+10','Chance of successful block +5',}},
            head="Odyssean Helm", neck="Knight's Bead Necklace +1", ear1="Thureous Earring", ear2="Odnowa Earring +1",
            body="Hjarrandi Breastplate", hands={ name="Souv. Handsch. +1", augments={'HP+65','Shield skill +15','Phys. dmg. taken -4',}}, 
			ring1="Moonbeam Ring", ring2="Moonbeam Ring", waist="Sailfi Belt +1", legs="Souveran Diechlings +1", feet="Souveran Schuhs +1"}
	sets.engaged.Turtle = {ammo="Staunch Tathlum +1",
            head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, body="Souv. Cuirass +1",
            hands={ name="Souv. Handsch. +1", augments={'HP+65','Shield skill +15','Phys. dmg. taken -4',}}, legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
            feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
            neck="Knight's Bead Necklace +1", left_ear="Odnowa Earring", right_ear="Odnowa Earring +1", left_ring="Moonbeam Ring", right_ring="Moonbeam Ring",
            back={ name="Rudianos's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Enmity+10','Chance of successful block +5',}}, waist="Creed Baudrier"}

end

------------------------------------------------------------------
-- Action events
------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'WAR' then
		set_macro_page(1, 3)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 20)
	elseif player.sub_job == 'SAM' then
		set_macro_page(1, 3)
	else
		set_macro_page(1, 3)
	end
end

function get_obi(element)
    if element and elements.obi_of[element] then
        return (player.inventory[elements.obi_of[element]] or player.wardrobe[elements.obi_of[element]]) and elements.obi_of[element]
    end
end