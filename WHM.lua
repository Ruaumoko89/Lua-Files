-- Local Settings, setting the zones prior to use
toau_zones = S{"Leujaoam Sanctum","Mamool Ja Training Grounds","Lebros Cavern","Periqia","Ilrusi Atoll",
        "Nyzul Isle","Bhaflau Remnants","Arrapago Remnants","Silver Sea Remnants","Zhayolm Remnants"}

naSpells = S{"Paralyna","Silena","Viruna","Erase","Stona","Blindna","Poisona"}

resSpells = S{"Barstonra","Barwatera","Baraera","Barfira","Barblizzara","Barthundra",
	"Barstone","Barwater","Baraero","Barfire","Barblizzard","Barthunder"}
ST_Cure_Spells = S{"Cure","Cure II","Cure III","Cure IV","Cure V","Cure VI","Full Cure"}
MT_Cure_Spells = S{"Curaga","Curaga II","Curaga III","Curaga IV","Curaga V","Cura","Cura II","Cura III"}
FC_Spells = S{"Haste","Utsusemi: Ichi","Utsusemi: Ni","Refresh","Flurry"}
Regen_Spells = S{"Regen","Regen II","Regen III","Regen IV"}
Holy_Spells = S{"Banish","Banish II","Banish III","Banishga","Banishga II","Holy","Holy II"}
Gear_Debug = 0

-- Start Functions here
-- Gear Sets
function get_sets()

    sets.TP = {}
	sets.TP.index = {'Standard'}
	TP_ind = 1
	TP_ind2 = 1
	CP_Mode = 0
	
	sets.TP.Standard = {main="Izcalli", sub="Sindri", head="Ayanmo Zucchetto +2", body="Ayanmo Corazza +2", legs="Ayanmo Cosciales +2", hands="Ayanmo Manopolas +2", feet="Ayanmo Gambieras +2",
             	back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
				waist="Cetl Belt", neck="Lissome Necklace", ear1="Telos Earring", 
				ear2="Dedition Earring", ring1="Chirich Ring +1", ring2="Chirich Ring +1", ammo="Staunch Tathlum +1"}				
	sets.Realmrazer = {main="Izcalli", sub="Sindri",ammo="Amar Cluster",
			    head={ name="Chironic Hat", augments={'Accuracy+20','"Fast Cast"+1','MND+15','Attack+14',}},neck="Fotia Gorget",ear1="Cessance Earring", ear2="Telos Earring",
			    body="Ayanmo Corazza +2",hands={ name="Chironic Gloves", augments={'Accuracy+10 Attack+10','Weapon Skill Acc.+15','MND+10',}},
                legs={ name="Chironic Hose", augments={'Accuracy+20','"Fast Cast"+2','MND+15','Attack+15',}},
				ring1="Rufescent Ring",ring2="Ilabrat Ring", back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
				waist="Fotia Belt",feet="Chironic Slippers"}
	sets.Hexa = {main="Izcalli", sub="Sindri",ammo="Amar Cluster",
			    head={ name="Chironic Hat", augments={'Accuracy+20','"Fast Cast"+1','MND+15','Attack+14',}},neck="Fotia Gorget",ear1="Moonshade Earring", ear2="Telos Earring",
			    body="Ayanmo Corazza +2",hands={ name="Chironic Gloves", augments={'Accuracy+10 Attack+10','Weapon Skill Acc.+15','MND+10',}},
                legs={ name="Chironic Hose", augments={'Accuracy+20','"Fast Cast"+2','MND+15','Attack+15',}},
				ring1="Rufescent Ring",ring2="Ilabrat Ring", back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
				waist="Fotia Belt",feet="Ayanmo Gambieras +2"}
	sets.Halo = {ammo="Hydrocera",
			    head={ name="Chironic Hat", augments={'Accuracy+20','"Fast Cast"+1','MND+15','Attack+14',}},neck="Caro Necklace",ear1="Ishvara Earring", ear2="Moonshade Earring",
			    body="Ayanmo Corazza +2",hands={ name="Chironic Gloves", augments={'Accuracy+10 Attack+10','Weapon Skill Acc.+15','MND+10',}},ring1="Rufescent Ring",ring2="Ilabrat Ring",
			    back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
				waist="Grunfeld Rope",legs="Ayanmo Cosciales +2",feet="Chironic Slippers"}
	sets.Judgment = {ammo="Hydrocera",
			    head={ name="Chironic Hat", augments={'Accuracy+20','"Fast Cast"+1','MND+15','Attack+14',}},neck="Caro Necklace",ear1="Ishvara Earring", ear2="Moonshade Earring",
			    body="Ayanmo Corazza +2",hands={ name="Chironic Gloves", augments={'Accuracy+10 Attack+10','Weapon Skill Acc.+15','MND+10',}},ring1="Rufescent Ring",ring2="Ilabrat Ring",
			    back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
				waist="Grunfeld Rope",legs="Ayanmo Cosciales +2",feet="Chironic Slippers"}
	sets.Mystic = {ammo="Hydrocera",
			    head={ name="Chironic Hat", augments={'Accuracy+20','"Fast Cast"+1','MND+15','Attack+14',}},neck="Caro Necklace",ear1="Ishvara Earring", ear2="Moonshade Earring",
			    body="Ayanmo Corazza +2",hands={ name="Chironic Gloves", augments={'Accuracy+10 Attack+10','Weapon Skill Acc.+15','MND+10',}},ring1="Rufescent Ring",ring2="Ilabrat Ring",
			    back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
				waist="Grunfeld Rope",legs="Ayanmo Cosciales +2",feet="Chironic Slippers"}
	sets.Nova = {ammo="Pemphredo Tathlum",
		        head="Ipoca Beret",neck="Mizukage-no-Kubikazari",ear1="Friomisi Earring",ear2="Static Earring",
		        body="Vedic Coat",hands="Fanatic Gloves",ring1="Locus Ring",ring2="Mujin Band",
		        back="Seshaw Cape",waist="Hachirin-no-obi",legs="Lengo Pants",feet="Chironic Slippers"}
  
    include('organizer-lib.lua')
		
	sets.aftercast_Idle_refresh = {main="Piety Wand",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Ayanmo Zucchetto +2",neck="Loricate Torque +1",ear1="Gifted Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands="Ayanmo Manopolas +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Moonbeam Cape",waist="Fucho-no-obi",legs="Ayanmo Cosciales +2",feet="Ayanmo Gambieras +2"}
	
	sets.aftercast_Move = sets.aftercast_Idle_refresh

	sets.aftercast_Idle = sets.aftercast_Idle_refresh
	
	sets.precast_Cure = {main="Queller Rod",sub="Sors Shield",ammo="Sapience Orb",
		head="Nahtirah Hat",neck="Baetyl Pendant",ear1="Nourish. Earring +1",ear2="Mendi. Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Defending Ring",ring2="Kishar Ring",
		back={ name="Alaunus's Cape", augments={'"Fast Cast"+10',}}, waist="Witful Belt",legs="Ayanmo Cosciales +2",feet="Vanya Clogs"}
		
	sets.precast_FastCast = {main="Beneficus",sub="Chanter's Shield",ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Baetyl Pendant",ear1="Loquacious Earring",ear2="Etiolation Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Rahab Ring",ring2="Kishar Ring",
		back={ name="Alaunus's Cape", augments={'"Fast Cast"+10',}}, waist="Siegel Sash",legs="Lengo Pants",feet="Regal Pumps +1"}
	
	sets.precast_Haste = {main="",sub="Chanter's Shield",ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Orison locket",ear1="Loquacious Earring",ear2="Etiolation Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Weatherspoon Ring",ring2="Kishar Ring",
		back={ name="Alaunus's Cape", augments={'"Fast Cast"+10',}}, waist="Siegel Sash",legs="Lengo Pants",feet="Regal Pumps +1"}
		
	sets.midcast_Haste = {main="Gada",sub="Ammurapi Shield",ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Orison locket",ear1="Loquacious Earring",ear2="Etiolation Earring",
		body="Telchine Chasuble",hands="Dynasty Mitts",ring1="Weatherspoon Ring",ring2="Kishar Ring",
		back={ name="Alaunus's Cape", augments={'"Fast Cast"+10',}}, waist="Witful belt",legs="Telchine Braconi",feet="Telchine Pigaches"}
	
	sets.precast_Devotion = {head="Piety Cap"}
	
	sets.precast_Benediction = {body="Piety Briault +1"}
	
	sets.precast_Solace = {feet="Piety Duckbills +1"}
	
	sets.precast_Misery = {legs="Piety Pantaloons +1"}

	sets.Resting = {ammo="Incantor Stone",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Sanare earring",ear2="Etiolation Earring",
		body="Witching Robe",hands="Theo. Mitts +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back="Solemnity Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Medium's Sabots"}
	
	sets.midcast_EnfeeblingMagic = {main="Queller Rod",sub="Chanter's Shield",ranged="",ammo="Hydrocera",
		head="Befouled Crown",neck="Incanter's Torque",ear1="Dignitary's Earring",ear2="Hermetic Earring",
		body="Vanya Robe",hands="Inyanga Dastanas +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Alaunus's Cape",waist="Luminary Sash",legs="Inyanga Shalwar +2",feet="Skaoi Boots"}
	
	sets.midcast_BarSpells_Solace = {main="Beneficus",sub="",ammo="Incantor Stone",head="Ebers Cap +1",
		neck="Incanter's torque",ear1="Gifted earring",ear2="Andoaa Earring",body="Ebers Bliaud +1",hands="Inyanga Dastanas +1",
		ring1="Stikini Ring",ring2="Stikini Ring",back="Alaunus's Cape",waist="Olympus Sash",legs="Piety Pantaloons +1",feet="Ebers Duckbills +1"}
		
	sets.midcast_Barspells_noSolace = sets.midcast_BarSpells_Solace

	sets.midcast_EnhancingMagic = {main="Gada",sub="Ammurapi Shield",ammo="Incantor Stone",head="Befouled Crown",
		neck="Incanter's torque",ear1="Sanare earring",ear2="Andoaa Earring",body="Telchine Chasuble",hands="Dynasty Mitts",
		ring1="Stikini Ring",ring2="Stikini Ring",back="Mending Cape",waist="Embla Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
	
	sets.midcast_MAB = {ammo="Pemphredo Tathlum",
		head="Ipoca Beret",neck="Mizukage-no-Kubikazari",ear1="Friomisi Earring",ear2="Static Earring",
		body="Vedic Coat",hands="Fanatic Gloves",ring1="Locus Ring",ring2="Mujin Band",
		back="Seshaw Cape",waist="Hachirin-no-obi",legs="Lengo Pants",feet="Chironic Slippers"}
		
	sets.midcast_Banish = {ammo="Pemphredo Tathlum",
		head="Ipoca Beret",neck="Jokushu Chain",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Vedic Coat",hands="Fanatic Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Disperer's Cape",waist="Hachirin-no-obi",legs="Lengo Pants",feet="Inyanga Crackows +1"}
		
	sets.midcast_Impact = {main="Serenity",sub="Mephitis grip",ammo="Dosis tathlum",
		neck="Eddy necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Twilight cloak",hands="Lurid Mitts",ring1="Sangoma ring",ring2="Strendu Ring",
		back="Refraction cape",waist="Sekhmet corset",legs="Artsieq hose",feet="Umbani boots"}	
		
	sets.midcast_Regen = {main="Bolelabunga",head="Inyanga Tiara +2",legs="Theo. Pant. +1",body="Piety Briault +1",hands="Ebers Mitts +1",neck="Incanter's Torque",waist="Embla Sash",feet="Telchine Pigaches",
	                      back="Merciful Cape", ring1="Stikini Ring", ring2="Stikini Ring", ear1="Andoaa Earring", ear2="Gifted Earring"}
	
	sets.midcast_Auspice = {main="Gada",sub="Ammurapi Shield",ammo="Incantor Stone",head="Telchine Cap",
		neck="Incanter's torque",ear1="Sanare earring",ear2="Andoaa Earring",body="Telchine Chasuble",hands="Dynasty Mitts",
		ring1="Stikini Ring",ring2="Stikini Ring",back="Mending Cape",waist="Embla Sash",legs="Telchine Braconi",feet="Ebers Duckbills +1"}
	
	sets.midcast_Erase = {neck="Cleric's Torque"}
	
	sets.midcast_Cure = {main="Raetic Rod +1",sub="Ammurapi Shield",ammo="Hydrocera",
		head="Kaykaus Mitra +1",neck="Cleric's Torque",ear1="Nourish. Earring +1",ear2="Glorious Earring",
		body="Ebers Bliaud +1",hands="Theophany Mitts +3",ring1="Kuchekula Ring",ring2="Janniston Ring",
		back="Mending Cape",waist="Hachirin-no-obi",legs="Sifahir Slacks",feet="Vanya Clogs"}
	
	sets.midcast_Curaga = {main="Raetic Rod +1",sub="Ammurapi Shield",ammo="Hydrocera",
		head="Kaykaus Mitra +1",neck="Cleric's Torque",ear1="Nourish. Earring +1",ear2="Glorious Earring",
		body="Kaykaus Bliaut +1",hands="Theophany Mitts +3",ring1="Kuchekula Ring",ring2="Janniston Ring",
		back="Mending Cape",waist="Hachirin-no-obi",legs="Sifahir Slacks",feet="Vanya Clogs"}
		
    sets.midcast_Cura = {main="Queller Rod",sub="Sors Shield",ammo="Hydrocera",
		head="Ebers Cap +1",neck="Cleric's Torque",ear1="Nourish. Earring +1",ear2="Glorious Earring",
		body="Kaykaus Bliaut",hands="Theophany Mitts +3",ring1="Kuchekula Ring",ring2="Lebeche Ring",
		back="Mending Cape",waist="Hachirin-no-obi",legs="Ebers Pantaloons +1",feet="Vanya Clogs"}
		
	sets.midcast_Stoneskin = sets.midcast_EnhancingMagic
	
	sets.midcast_DebuffRemoval = {main="Piety Wand",sub="Sors shield",ammo="Incantor Stone",
		head="Ebers Cap +1",neck="Cleric's Torque",ear1="Gifted earring",ear2="Loquacious Earring",
	    body="Ebers Briault +1",hands="Ebers Mitts +1",ring1="Weatherspoon Ring",ring2="Prolix Ring",
		back="Mending cape",waist="Witful Belt",legs="Ebers Pantaloons +1",feet="Vanya Clogs"}

	sets.midcast_Cursna = {main="Beneficus",sub="Chanter's Shield",ammo="Incantor Stone",
		head="Kaykaus Mitra",neck="Malison Medallion",ear1="Nourish. Earring +1",ear2="Glorious Earring",
		body="Ebers Briault +1",hands="Fanatic Gloves",ring1="Ephedra Ring",ring2="Ephedra Ring",
		back="Alaunus's Cape",waist="Witful Belt",legs="Theo. Pant. +1",feet="Vanya Clogs"}
		
	sets.midcast_Esuna = {main="Piety Wand",sub="Chanter's Shield",ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Cleric's Torque",ear1="Loquacious Earring",ear2="Etiolation Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Rahab Ring",ring2="Kishar Ring",
		back={ name="Alaunus's Cape", augments={'"Fast Cast"+10',}}, waist="Witful Belt",legs="Ayanmo Cosciales +2",feet="Regal Pumps +1"}
	
	organizer_items = {
      echos="Echo Drops",
	  elixer="Vile Elixer",
	  elixer2="Vile Elixer +1",
	  trail="Trail Cookie"}
	
	sets.Obi = {}
	sets.Obi.Fire = {waist='Karin Obi',back='Twilight Cape'}
	sets.Obi.Earth = {waist='Dorin Obi',back='Twilight Cape'}
	sets.Obi.Water = {waist='Suirin Obi',back='Twilight Cape'}
	sets.Obi.Wind = {waist='Furin Obi',back='Twilight Cape'}
	sets.Obi.Ice = {waist='Hyorin Obi',back='Twilight Cape'}
	sets.Obi.Thunder = {waist='Rairin Obi',back='Twilight Cape'}
	sets.Obi.Light = {waist='Korin Obi',back='Twilight Cape'}
	sets.Obi.Dark = {waist='Anrin Obi',back='Twilight Cape'}
	
	sets.staves = {}
	
	sets.staves.damage = {}
	
	sets.staves.accuracy = {}
	sets.staves.damage.Thunder = {}


end

-- --- Precast ---

function precast(spell)	
	if spell.english == 'Realmrazer' then
		equip(sets.Realmrazer)	
	elseif spell.english == 'Hexa Strike' then
		equip(sets.Hexa)
	elseif spell.english == 'Mystic Boon' then
		equip(sets.Mystic)
	elseif spell.english == 'Flash Nova' then
		equip(sets.Nova)
    elseif spell.english == 'Judgment' then
      	equip(sets.Judgment)
    elseif spell.english == 'Black Halo' then
		equip(sets.Halo)		
	elseif spell.english == 'Afflatus Solace' then
		equip(sets.precast_Solace)	
    elseif spell.english == 'Afflatus Misery' then
		equip(sets.precast_Misery)
    elseif spell.english == 'Benediction' then
		equip(sets.precast_Benediction)		
    elseif spell.english == 'Devotion' then
		equip(sets.precast_Devotion)				
	elseif ST_Cure_Spells:contains(spell.name) then
		equip(sets.precast_Cure)
		--send_command('@input /echo Cure Precast Set')
	elseif MT_Cure_Spells:contains(spell.name) then
		equip(sets.precast_Cure)
		--send_command('@input /echo Cure Precast Set')
	elseif naSpells:contains(spell.name) then
		equip(sets.precast_FastCast)
		--send_command('@input /echo NA Precast Set')
	elseif FC_Spells:contains(spell.name) then
		equip(sets.precast_Haste)
		--send_command('@input /echo Haste Precast Set')
	else
		equip(sets.precast_FastCast)
		--send_command('@input /echo Precast Set')
	end
end
-- --- MidCast ---
function midcast(spell)
	if spell.english == 'Realmrazer' then
		equip(sets.Realmrazer)	
	elseif spell.english == 'Hexa Strike' then
		equip(sets.Hexa)
	elseif spell.english == 'Mystic Boon' then
		equip(sets.Mystic)
	elseif spell.english == 'Flash Nova' then
		equip(sets.Nova)
    elseif spell.english == 'Black Halo' then
		equip(sets.Halo)
    elseif spell.english == 'Judgment' then
		equip(sets.Judgment)
	elseif ST_Cure_Spells:contains(spell.name) then 
		equip(sets.midcast_Cure)
	elseif MT_Cure_Spells:contains(spell.name) then
		equip(sets.midcast_Curaga)
	elseif spell.name == 'Cura' then
		equip(sets.midcast_Cura)
	elseif naSpells:contains(spell.name) then
		equip(sets.midcast_DebuffRemoval)
	elseif Regen_Spells:contains(spell.name) then
		equip(sets.midcast_Regen)
	elseif spell.name == 'Cursna' then
		equip(sets.midcast_Cursna)
	elseif spell.name == 'Esuna' then
	    equip(sets.midcast_Esuna)
	elseif spell.skill == 'Enfeebling Magic' then
		equip(sets.midcast_EnfeeblingMagic)
	elseif spell.skill == 'Enhancing Magic' then		
		if resSpells:contains(spell.name) then					
			equip(sets.midcast_BarSpells_Solace)
		elseif spell.name == 'Haste' then
			equip(sets.midcast_Haste)
		else
			equip(sets.midcast_EnhancingMagic)
		end	
	elseif Holy_Spells:contains(spell.name) then
		equip(sets.midcast_MAB)
			
	elseif spell.skill == 'Elemental Magic' then
		if spell.name == 'Impact' then
			equip(sets.midcast_Impact)
		else
			equip(sets.midcast_MAB)	
		end
	else
		equip(sets.midcast_Haste)
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

function status_change(new,tab)
	if new == 'Resting' then
		equip(sets['Resting'])
	else
		equip(sets['aftercast_Idle'])
	end
end


-- Self Commands -- ie. Defender 

function self_command(command)	
	if command == 'equip Idle set' then				
		equip(sets.aftercast_Idle_refresh)	
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
