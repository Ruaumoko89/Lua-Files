-- Local Settings, setting the zones prior to use
toau_zones = S{"Leujaoam Sanctum","Mamool Ja Training Grounds","Lebros Cavern","Periqia","Ilrusi Atoll",
        "Nyzul Isle","Bhaflau Remnants","Arrapago Remnants","Silver Sea Remnants","Zhayolm Remnants"}

resSpells = S{"Barstonra","Barwatera","Baraera","Barfira","Barblizzara","Barthundra","Barstone","Barwater","Baraero","Barfire","Barblizzard",
			"Barthunder"}
Cure_Spells = S{"Cure","Cure II","Cure III","Cure IV","Curaga","Curaga II"}
FC_Spells = S{"Flurry II","Haste II","Haste","Utsusemi: Ichi","Utsusemi: Ni","Regen","Regen II","Firestorm","Hailstorm","Windstorm","Rainstorm","Sandstorm"}
Refresh_Spells = S{"Refresh","Refresh II","Refresh III"}
Self_Spells = S{"Enstone","Enwater","Enaero","Enfire","Enblizzard","Enthunder","Enstone II","Enwater II","Enaero II","Enfire II","Enblizzard II",
			"Enthunder II","Temper","Temper II","Gain-STR","Gain-DEX","Gain-MND","Gain-INT","Gain-VIT","Gain-AGI","Gain-CHR","Stoneskin","Aquaveil","Phalanx","Phalanx II"}

Gear_Debug = 0
Melee_Enabled = 0

-- Start Functions here
-- Gear Sets
function get_sets()
		
	sets.TP = {}
	sets.TP.index = {'Standard', 'Accuracy', 'DT'}
	--1=Standard, 2=Accuracy, 3=DT
	TP_ind = 1
	TP_ind2 = 1
	CP_Mode = 0
	
	sets.TP.Standard = {main="", sub="", ammo="Staunch Tathlum +1",
                head="Malignance Chapeau", body="Malignance Tabard", hands="Malignance Gloves",
                legs="Malignance Tights", feet="Malignance Boots", neck="Loricate Torque +1", waist="Sarissaphoroi Belt", left_ear="Sherida Earring", right_ear="Brutal Earring",
                left_ring="Hetairoi Ring", right_ring="Chirich Ring +1", back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},}				
	sets.TP.Accuracy = {ammo="",
			    head="Highwing helm",neck="Iqabi necklace", ear1="Brutal earring", ear2="Suppanomimi",
			    body="Espial gambison",hands="Umuthi gloves",ring1="Ramuh ring +1",ring2="Rajas ring",
			    back="Grounded mantle",waist="Anguinus belt",legs="Espial hose",feet="Rager ledelsens +1"}	
	sets.TP.DT = {ammo="",
			    head="Ayanmo Zucchetto +1",neck="Loricate Torque +1", ear1="Odnowa Earring +1", ear2="Odnowa Earring",
			    body="Ayanmo Corazza +1",hands="Ayanmo Manopolas +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
			    back="Moonbeam Cape",waist="Flume Belt",legs="Ayanmo Cosciales +1",feet="Ayanmo Gambieras +1"}
	sets.CDC = {ammo="Yetshila +1",
			    head="Ayanmo Zucchetto +2",neck="Fotia Gorget",ear1="Sherida Earring", ear2="Brutal Earring",
			    body="Ayanmo Corazza +2",hands="Ayanmo Manopolas +2",ring1="Ilabrat Ring",ring2="Begrudging Ring",
			    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}},waist="Fotia Belt",legs="Taeon Tights",feet="Thereoid Greaves"}
	sets.Evisceration = {ammo="Yetshila",
			    head="Ayanmo Zucchetto +2",neck="Fotia Gorget",ear1="Sherida Earring", ear2="Brutal Earring",
			    body="Ayanmo Corazza +2",hands="Ayanmo Manopolas +2",ring1="Ilabrat Ring",ring2="Begrudging Ring",
			    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}},waist="Fotia Belt",legs="Malignance Tights",feet="Thereoid Greaves"}
	sets.Requiescat = {ammo="Hydrocera",
			    head="Carmine Mask +1",neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Ishvara Earring",
			    body="Jhakri Robe +1",hands="Jhakri Cuffs +1",ring1="Rufescent Ring",ring2="Leviathan Ring",
			    back="Sucellos's Cape",waist="Fotia Belt",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
    sets.Flat = {ammo="Regal Gem",
		       head="Carmine Mask +1",neck="Sanctity Necklace",ear1="Dignitary's Earring",ear2="Moonshade Earring",
		       body="Ayanmo Corazza +1",hands="Ayanmo Manopolas +1",ring1="Cacoethic Ring",ring2="Cacoethic Ring +1",
		       back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist="Eschan Stone",legs="Jhakri Slops +1",feet="Ayanmo Gambieras +1"}
	sets.DB = {ammo="Hydrocera",
			    head="Carmine Mask +1",neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Telos Earring",
			    body="Jhakri Robe +1",hands="Jhakri Cuffs +1",ring1="Rufescent Ring",ring2="Shukuyu Ring",
			    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist="Fotia Belt",legs="Jhakri Slops +1",feet="Carmine Greaves +1"}
	sets.Savage = {ammo="Amar Cluster",
			    head="Vitiation Chapeau +3",neck="Caro Necklace", ear1="Moonshade Earring", ear2="Ishvara Earring",
			    body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Rufescent Ring",ring2="Shukuyu Ring",
			    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}, waist="Metalsinger Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
	sets.SB = {ammo="Pemphredo Tathlum",
               head="Pixie Hairpin +1", body="Amalric Doublet +1", hands="Jhakri Cuffs +2", legs="Volte Brais", feet={ name="Vitiation Boots +3", augments={'Enhances "Paralyze II" effect',}},
               neck="Duelist's Torque +1", waist="Hachirin-no-Obi", left_ear="Friomisi Earring", right_ear="Regal Earring", left_ring="Shiva Ring +1", right_ring="Archon Ring",
               back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}},}
    sets.Edge = {ammo="Pemphredo Tathlum",
		       head="Merlinic Hood",neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",
		       body="Merlinic Jubbah",hands="Jhakri Cuffs +1",ring1="Acumen Ring",ring2="Ilabrat Ring",
		       back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},waist="Yamabuki-no-Obi",legs="Merlinic Shalwar",feet="Merlinic Crackows"}
	sets.Seraph = {ammo="Pemphredo Tathlum",
		       head="Vitiation Chapeau +3", body="Jhakri Robe +2", hands="Jhakri Cuffs +2", legs="Volte Brais", feet={ name="Vitiation Boots +3", augments={'Enhances "Paralyze II" effect',}},
               neck="Sanctity Necklace", waist="Eschan Stone", left_ear="Moonshade Earring", right_ear="Ishvara Earring", left_ring="Shiva Ring +1", right_ring="Weatherspoon Ring",
               back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},}
    sets.Lotus = {ammo="Pemphredo Tathlum",
		       head="Jhakri Coronal +2", body="Jhakri Robe +2", hands="Jhakri Cuffs +2", legs="Volte Brais", feet={ name="Vitiation Boots +3", augments={'Enhances "Paralyze II" effect',}},
               neck="Sanctity Necklace", waist="Eschan Stone", left_ear="Friomisi Earring", right_ear="Crematio Earring", left_ring="Shiva Ring +1", right_ring="Rufescent Ring",
               back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}},}
    sets.Drain = {ammo="Pemphredo Tathlum",
		       head="Pixie Hairpin +1",neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",
		       body="Merlinic Jubbah",hands="Amalric Gages",ring1="Acumen Ring",ring2="Archon Ring",
		       back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}},waist="Yamabuki-no-Obi",legs="Merlinic Shalwar",feet="Merlinic Crackows"}
	sets.Halo = {ammo="Amar Cluster",
			    head="Vitiation Chapeau +3",neck="Caro Necklace", ear1="Moonshade Earring", ear2="Ishvara Earring",
			    body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Rufescent Ring",ring2="Shukuyu Ring",
			    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}, waist="Metalsinger Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
	sets.Empyreal = {ammo="",
			    head="Malignance Chapeau",neck="Sanctity Necklace", ear1="Moonshade Earring", ear2="Telos Earring",
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
			    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}, waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
	
	sets.aftercast_Idle_refresh = {main="Daybreak",sub="Sacro Bulwark",ammo="Staunch Tathlum +1",
		head="Vitiation Chapeau +3",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
		body="Jhakri Robe +2",hands="Volte Gloves",ring1="Defending Ring",ring2="Vocane Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"}
	
	sets.aftercast_Move = sets.aftercast_Idle_refresh

	sets.aftercast_Idle = sets.aftercast_Idle_refresh	
	
	sets.precast_Cure = {ammo="Sapience Orb",
		head="Atrophy chapeau +1",neck="Nodens Gorget",ear1="Etiolation Earring",ear2="Mendi. Earring",
		body="Vitiation Tabard +3",hands="Leyline Gloves",ring1="Weatherspoon Ring",ring2="Kishar Ring",
		back="Pahtli Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Vanya Clogs"}
		
	sets.precast_FastCast = {
		head="Atrophy Chapeau +1",neck="Baetyl Pendant",ear1="Malignance Earring",ear2="Etiolation Earring",
		body="Vitiation Tabard +3",hands="Leyline Gloves",ring1="Rahab Ring",ring2="Kishar Ring",
		back="Moonbeam Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Carmine Greaves +1"}
	
	sets.precast_Haste = {main="Oranyan", ammo="Sapience Orb",
		head="Atrophy chapeau +1",neck="Incanter's Torque",ear1="Estoqueur's earring",ear2="Etiolation Earring",
		body="Vitiation Tabard +1",hands="Leyline Gloves",ring1="Weatherspoon Ring",ring2="Kishar Ring",
		back="Moonbeam Cape",waist="Siegel Sash",legs="Psycloth Lappas",feet="Carmine Greaves +1"}
	
	sets.precast_Devotion = {}

	sets.Resting = {head="Vitiation Chapeau +3",neck="Loricate Torque +1",ear1="Sanare earring",ear2="Etiolation Earring",
		body="Witching Robe",hands="Leyline Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Solemnity Cape",waist="Fucho-no-obi",legs="Carmine Cuisses",feet="Medium's Sabots"}
	
	sets.midcast_EnfeeblingMagic = {main="Daybreak", sub="Ammurapi Shield", ammo="Regal Gem",
		head="Vitiation Chapeau +3",neck="Duelist's Torque +1",ear1="Malignance Earring",ear2="Regal Earring",
		body="Lethargy Sayon +1",hands="Lethargy Gantherots +1",ring1="Stikini Ring",ring2="Kishar Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%',}}, waist="Rumination Sash",legs="Chironic Hose",feet="Vitiation Boots +3"}
		
	sets.midcast_Poison = {main="Daybreak", sub="Ammurapi Shield", ammo="Regal Gem",
		head="Vitiation Chapeau +3",neck="Incanter's Torque",ear1="Dignitary's Earring",ear2="Hermetic Earring",
		body="Chango Robe",hands="Lethargy Gantherots +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}}, waist="Rumination Sash",legs="Psycloth Lappas",feet="Skaoi Boots"}
		
	sets.midcast_Dia = {main="Daybreak", sub="Ammurapi Shield", ammo="Regal Gem",
		head="Vitiation Chapeau +3",neck="Incanter's Torque",ear1="Dignitary's Earring",ear2="Hermetic Earring",
		body="Lethargy Sayon +1",hands="Lethargy Gantherots +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%',}}, waist="Rumination Sash",legs="Psycloth Lappas",feet="Skaoi Boots"}
		
	sets.midcast_DarkMagic = {ranged="Hydrocera",
		head="Merlinic Hood",neck="Incanter's Torque",ear1="Lifestorm Earring",ear2="Psystorm Earring",
		body="Merlinic Jubbah",hands="Lethargy Gantherots +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Refraction Cape",waist="Fucho-no-obi",legs="Psycloth Lappas",feet="Merlinic Crackows"}
						
	sets.midcast_EnhancingMagic = {main="",sub="",ammo="Ammurapi Shield",head="Befouled Crown",
		neck="Duelist's Torque +1",ear1="Gifted Earring",ear2="Andoaa Earring",body="Vitiation Tabard +3",hands="Atrophy Gloves +3",
		ring1="Stikini Ring",ring2="Stikini Ring", back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%',}},
		waist="Embla Sash",legs="Atrophy Tights +1",feet="Lethargy Houseaux +1"}
		
	sets.midcast_SelfSpell = {main="",sub="",ammo="Ammurapi Shield",head="Befouled Crown",
		neck="Duelist's Torque +1",ear1="Gifted Earring",ear2="Andoaa Earring",body="Vitiation Tabard +3",hands="Vitiation Gloves +3",
		ring1="Stikini ring +1",ring2="Stikini Ring +1", back="Sucellos's Cape",
		waist="Embla Sash",legs="Atrophy Tights +1",feet="Lethargy Houseaux +1"}
		
	sets.midcast_Duration = {main="Daybreak", sub="Ammurapi Shield", head="Lethargy Chappel +1",
		neck="Duelist's Torque +1",ear1="Andoaa Earring",ear2="Gifted Earring", body="Vitiation Tabard +3",hands="Atrophy Gloves +3",
		ring1="Stikini Ring",ring2="Stikini Ring", back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%',}},
		waist="Embla Sash",legs="Lethargy Fuseau +1",feet="Lethargy Houseaux +1"}
	
	sets.midcast_RefreshSpell = {
		sub="Ammurapi Shield",
		head="Amalric Coif +1",
		neck="Incanter's Torque",
		ear1="Andoaa Earring",
		ear2="Gifted Earring", 
		body="Vitiation Tabard +3",
		hands="Atrophy gloves +3",
		ring1="Stikini Ring",
		ring2="Stikini Ring",
	    back="Sucellos's Cape",
		waist="Embla Sash",
		legs="Lethargy Fuseau +1",
		feet="Lethargy Houseaux +1"}
	
	sets.midcast_MAB = {ammo="Pemphredo Tathlum",
		head="Ea Hat",neck="Mizukage-no-Kubikazari",ear1="Malignance Earring",ear2="Regal Earring",
		body="Ea Houppelande",hands="Amalric Gages +1",ring1="Freke Ring",ring2="Mujin Band",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}},waist="Sacro Cord",legs="Ea Slops",feet="Jhakri Pigaches +2"}

	sets.midcast_Impact = {
        ammo="Regal Gem", body="Twilight Cloak", hands="Viti. Gloves +3",
        legs={ name="Chironic Hose", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','Mag. Acc.+15',}},
        feet="Vitiation Boots +3", neck="Incanter's Torque", waist="Sacro Cord",
        left_ear="Digni. Earring", right_ear="Regal Earring", left_ring="Stikini Ring +1", right_ring="Stikini Ring +1",
        back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}},}		
		
    sets.midcast_Cure = {main="Chatoyant Staff", sub="Enki Strap", ammo="Regal Gem",
		head="Kaykaus Mitra +1",neck="Incanter's Torque",ear1="Regal Earring",ear2="Malignance Earring",
		body="Kaykaus Bliaut +1",hands="Kaykaus Cuffs +1",ring1="Kuchekula Ring",ring2="Janniston Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10',}}, waist="Hachirin-no-Obi",legs="Atrophy Tights +1",feet="Vanya Clogs"}	
		
	sets.midcast_MeleeCure = {ammo="Regal Gem",
		head="Kaykaus Mitra +1",neck="Nodens Gorget",ear1="Regal Earring",ear2="Mendi. Earring",
		body="Kaykaus Bliaut +1",hands="Kaykaus Cuffs +1",ring1="Kuchekula Ring",ring2="Lebeche Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%',}},waist="Hachirin-no-Obi",legs="Kaykaus Tights +1",feet="Vanya Clogs"}	
	
    sets.midcast_Stun = {ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +1",neck="Incanter's Torque",ear1="Dignitary's Earring",ear2="Hermetic Earring",
		body="Shango Robe",hands="Jhakri Cuffs +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%',}}, waist="Rumination Sash",legs="Chironic Hose",feet="Skaoi Boots"}

end

-- --- Precast ---

function precast(spell)	
	--if buffactive['Nightingale'] then
	--	equip(sets.midcast.whatever)
	--else
	--	equip(sets.precast.whatever)
	--end
	if spell.english == 'Chant du Cygne' then
		equip(sets.CDC)	
	elseif spell.english == 'Requiescat' then
		equip(sets.Requiescat)
	elseif spell.english == 'Evisceration' then
		equip(sets.Evisceration)
	elseif spell.english == 'Death Blossom' then
		equip(sets.DB)
	elseif spell.english == 'Sanguine Blade' then
		equip(sets.SB)
	elseif spell.english == 'Seraph Blade' then
		equip(sets.Seraph)
	elseif spell.english == 'Red Lotus Blade' then
		equip(sets.Lotus)
	elseif spell.english == 'Savage Blade' then
		equip(sets.Savage)
	elseif spell.english == 'Flat Blade' then
		equip(sets.Flat)
	elseif spell.english == 'Aeolian Edge' then
	    equip(sets.Edge)
    elseif spell.english == 'Energy Drain' then
		equip(sets.Drain)
	elseif spell.english == 'Black Halo' then
		equip(sets.Halo)
	elseif spell.english == 'Empyreal Arrow' then
		equip(sets.Empyreal)
	elseif Cure_Spells:contains(spell.name) then		
		equip(sets.precast_Cure)					
	elseif FC_Spells:contains(spell.name) then
		equip(sets.precast_Haste)
	elseif spell.name == 'Impact' then
		equip({body="Twilight cloak"})
	elseif spell.name == 'Stun' then
		equip(sets.stun)
	elseif spell.english == "Chainspell" then
		equip({body="Vitiation Tabard +1"})
	elseif spell.english == "Saboteur" then
		equip({hands="Lethargy Gantherots +1"})
	elseif spell.type == 'JobAbility' then
		return
	else
		equip(sets.precast_FastCast)	
	end
end
-- --- MidCast ---
function midcast(spell)
	if Cure_Spells:contains(spell.name) then
		if Melee_Enabled == 1 then
			equip(sets.midcast_MeleeCure)		
		else
			equip(sets.midcast_Cure)
		end
	elseif spell.name == "Stun" then
		equip(sets.midcast_Stun) 
	elseif spell.skill == 'Enfeebling Magic' then
		equip(sets.midcast_EnfeeblingMagic)
	elseif spell.name == "Poison II" then
			equip(sets.midcast_Poison)
	elseif spell.name == "Dia III" then
			equip(sets.midcast_Dia)
	elseif spell.skill == 'Enhancing Magic' then		
		if FC_Spells:contains(spell.name) then
			equip(sets.midcast_Duration)
		elseif Self_Spells:contains(spell.name) then
			equip(sets.midcast_SelfSpell)
		elseif Refresh_Spells:contains(spell.name) then
			equip(sets.midcast_RefreshSpell)
		else
			equip(sets.midcast_EnhancingMagic)
		end
	elseif spell.skill == 'Elemental Magic' then
		if spell.name == 'Impact' then	
			equip(sets.midcast_Impact)
		else
			equip(sets.midcast_MAB)
		end
	elseif spell.skill == 'Dark Magic' then
		equip(sets.midcast_DarkMagic)
	else
	end
end		

-- --- Aftercast ---

function aftercast(spell)
	if player.status == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_ind2]])
	else
		if Gear_Debug == 0 then
			equip(sets.aftercast_Idle_refresh)
		else
		end
	end
end

-- Status Change - ie. Resting

function status_change(new,old)
	if new == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_ind2]])
	else
		equip(sets.aftercast_Idle_refresh)
	end
end


-- Self Commands -- ie. Defender 

function self_command(command)
	if command == 'equip TP set' then
		TP_ind = 1
		TP_ind2 = 1
		Melee_Enabled = 1
		equip(sets.TP[sets.TP.index[TP_ind2]])
		send_command('@input /echo Current Set '..sets.TP.index[TP_ind2]..' Equiped')
	elseif command == 'equip Idle set' then
		TP_ind = 1
		TP_ind2 = 1
		equip(sets.aftercast_Idle_refresh)
		send_command('@input /echo Changed to Idle')
	elseif command == 'equip Accuracy set' then
		TP_ind = 2
		TP_ind2 = 2
		equip(sets.TP[sets.TP.index[TP_ind2]])
		send_command('@input /echo Current Set '..sets.TP.index[TP_ind2]..' Equiped')
	elseif command == 'equip DT set' then
		TP_ind = 3		
		equip(sets.TP[sets.TP.index[TP_ind]])
		send_command('@input /echo Changed to DT mode')
	elseif command == 'equip set' then				
		equip(sets.TP[sets.TP.index[TP_ind2]])
		send_command('@input /echo Current Set '..sets.TP.index[TP_ind2]..' Equiped')
	elseif command == 'enable CP mode' then				
		CP_Mode = 1
		equip({back="Mercistopins mantle"})
		send_command('@input CP Mode enabled')
	elseif command == 'change debug mode' then
		if Gear_Debug == 1 then
			Gear_Debug = 0
			send_command('@input /echo Debug Mode Set to 0')
		else
			Gear_Debug = 1
			send_command('@input /echo Debug Mode Set to 1')
		end
	end
    
end

-- This function is user defined, but never called by GearSwap itself. It's just a user function that's only called from user functions. I wanted to check the weather and equip a weather-based set for some spells, so it made sense to make a function for it instead of replicating the conditional in multiple places.

function weathercheck(spell_element,set)
	if spell_element == world.weather_element or spell_element == world.day_element then
		equip(set,sets['Obi_'..spell_element])
	else
		equip(set)
	end
end
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'SCH' then
		set_macro_page(8, 1)
	elseif player.sub_job == 'WHM' then
		set_macro_page(8, 1)
	elseif player.sub_job == 'DNC' then
		set_macro_page(8, 1)
	elseif player.sub_job == 'NIN' then
		set_macro_page(8, 1)
	end
end