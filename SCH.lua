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
 
 
-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
 
end
 
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
 
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'BurstWeather', 'Helix', 'Acumen')
    state.IdleMode:options('Normal', 'Impact')
   
    state.MagicBurst = M(false, 'Magic Burst')
 
    lowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga',
        'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}
 
    -- gear.macc_hagondes = {name="Hagondes Cuffs", augments={'Phys. dmg. taken -3%','Mag. Acc.+29'}}
   
    -- Additional local binds
    send_command('bind ^` input /ma Stun <t>')
    send_command('bind @` gs c activate MagicBurst')
 
    select_default_macro_book()
end
 
-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind @`')
end
 
 
-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
                  
    ---- Precast Sets ----
   
    -- Precast sets to enhance JAs
    sets.precast.JA['Tabula Rasa'] = {legs="Pedagogy Pants +3"}
	sets.precast.JA['Enlightenment'] = {body="Pedagogy Gown +3"}
	sets.precast.JA['Sublimation'] = {body="Pedagogy Gown +3", head="Academic's Mortarboard +3"}
	sets.precast.JA['Perpetuance'] = {hands="Arbatel Bracers +1"}
	sets.precast.JA['Rapture'] = {hands="Arbatel Bonnet +1"}
	sets.precast.JA['Ebullience'] = {hands="Arbatel Bonnet +1"}
	sets.precast.JA['Light Arts'] = {legs="Academic's Pants +1"}
	sets.precast.JA['Dark Arts'] = {body="Academic's Gown"}
	sets.precast.JA['Modus Veritas'] = {main={ name="Akademos", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}}, sub="Enki Strap", ammo="Pemphredo Tathlum",
        head="Pedagogy Mortarboard +3", body="Merlinic Jubbah", hands="Amalric Gages +1", legs="Pedagogy Pants +3",
        feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+28','Magic burst dmg.+11%','INT+6','Mag. Acc.+8',}},
        neck="Mizukage-no-Kubikazari", left_ear="Barkaro. Earring", right_ear="Regal Earring", left_ring="Stikini Ring +1", right_ring="Stikini Ring +1",
        back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}, waist="Hachirin-no-Obi"}
   
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}
 
 
    -- Fast cast sets for spells
 
    sets.precast.FC = {
        main="",
		sub="",
		ammo="Sapience Orb",
        head="Amalric Coif +1",
        neck="Baetyl Pendant",
		ear1="Barkarole Earring",
        ear2="Malignance Earring",
        body="Shango Robe",
        hands="Volte Gloves",
        ring1="Kishar Ring",
        ring2="Rahab Ring", 
        back={ name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
        waist="Witful Belt",
        legs="Psycloth Lappas",
        feet="Academic's Loafers +3"}
 
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
 
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {legs="Psycloth Lappas"})
 
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Serenity"})
 
    sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.precast.FC.Impact = {
        main="",
		sub="",
		ammo="Sapience Orb",
        head="",
        neck="Baetyl Pendant",
		ear1="Barkarole Earring",
        ear2="Malignance Earring",
        body="",
        hands="Volte Gloves",
        ring1="Kishar Ring",
        ring2="Rahab Ring", 
        back={ name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
        waist="Witful Belt",
        legs="Psycloth Lappas",
        feet="Pedagogy Loafers +3"}
	
	sets.precast.FC.Dispelga = {
        main="",
		sub="",
		ammo="Sapience Orb",
        head="",
        neck="Baetyl Pendant",
		ear1="Barkarole Earring",
        ear2="Malignance Earring",
        body="",
        hands="Volte Gloves",
        ring1="Kishar Ring",
        ring2="Rahab Ring", 
        back={ name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
        waist="Witful Belt",
        legs="Psycloth Lappas",
        feet="Pedagogy Loafers +3"}
	
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {sub="",ammo="Pemphredo Tathlum",
        head="Jhakri Coronal +2",neck="Fotia Gorget",ear1="Barkarole Earring",ear2="Regal Earring",
        body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back="Relucent Cape",waist="Fotia Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
 
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Vidohunir'] = {ammo="Pemphredo Tathlum",
        head="Merlinic Hood",neck="Mizukage-no-Kubikazari",ear1="Barkarole Earring",ear2="Regal Earring",
        body={ name="Merlinic Jubbah", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+10%','AGI+5','"Mag.Atk.Bns."+10',}},
		hands="Amalric Gages",ring1="Shiva Ring +1",ring2="Acumen Ring", feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+28','Magic burst dmg.+11%','INT+6','Mag. Acc.+8',}},
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},waist="Yamabuki-no-Obi",legs="Merlinic Shalwar"}
   
   
    ---- Midcast Sets ----
 
    sets.midcast.FastRecast = {
        head="Amalric Coif +1",ear2="Loquacious Earring",
        body="Shango Robe",hands="Helios Gloves",ring1="Prolix Ring",
        back={ name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}, waist="Witful Belt",legs="Psycloth Lappas",feet="Pedagogy Loafers +3"}
		
	sets.midcast.Impact = {
        head="",ear2="Loquacious Earring",
        body="",hands="Helios Gloves",ring1="Prolix Ring",
        back={ name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}, waist="Witful Belt",legs="Psycloth Lappas",feet="Pedagogy Loafers +3"}
 
    sets.midcast.Cure = {main="Raetic Rod +1", sub="Ammurapi Shield", ammo="Pemphredo Tathlum", back={ name="Lugh's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10','Magic dmg. taken-10%',}},
       head="Kaykaus Mitra +1", body="Kaykaus Bliaut +1", hands="Pedagogy Bracers +3", legs="Kaykaus Tights +1", feet="Kaykaus Boots +1", neck="Incanter's Torque", waist="Hachirin-no-Obi",
       left_ear="Calamitous Earring", right_ear="Magnetic Earring", left_ring="Janniston Ring", right_ring="Stikini Ring"}
 
    sets.midcast.Curaga = sets.midcast.Cure
 
    sets.midcast['Enhancing Magic'] = {main="Pedagogy Staff", sub="", ammo="Incantor Stone", head="Arbatel Bonnet +1",
        body="Pedagogy Gown +3", hands="Arbatel Bracers +1", legs="Academic's Pants +1", feet="Pedagogy Loafers +3",
        neck="Incanter's Torque", left_ear="Andoaa Earring", right_ear="Regal Earring", left_ring="Stikini Ring", right_ring="Stikini Ring",
        back={ name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}, waist="Embla Sash"}
		
	sets.midcast['Phalanx'] = {main="Pedagogy Staff", sub="", ammo="Incantor Stone", head="Telchine Cap",
        body="Pedagogy Gown +3", hands="Arbatel Bracers +1", legs="Telchine Braconi", feet="Telchine Pigaches",
        neck="Incanter's Torque", left_ear="Andoaa Earring", right_ear="Regal Earring", left_ring="Stikini Ring", right_ring="Stikini Ring",
        back={ name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}, waist="Embla Sash"}
		
	sets.midcast['Haste'] = {main="Pedagogy Staff", sub="", ammo="Incantor Stone", head="Telchine Cap",
        body="Pedagogy Gown +3", hands="Arbatel Bracers +1", legs="Telchine Braconi", feet="Telchine Pigaches",
        neck="Incanter's Torque", left_ear="Andoaa Earring", right_ear="Regal Earring", left_ring="Stikini Ring", right_ring="Stikini Ring",
        back={ name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}, waist="Embla Sash"}
		
	sets.midcast['Refresh'] = {main="Pedagogy Staff", sub="", ammo="Incantor Stone", head="Amalric Coif +1",
        body="Pedagogy Gown +3", hands="Arbatel Bracers +1", legs="Telchine Braconi", feet="Telchine Pigaches",
        neck="Incanter's Torque", left_ear="Andoaa Earring", right_ear="Regal Earring", left_ring="Stikini Ring", right_ring="Stikini Ring",
        back={ name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}, waist="Embla Sash"}
		
	sets.midcast['Embrava'] = {main="Pedagogy Staff", sub="", ammo="Incantor Stone", head="Telchine Cap",
        body="Pedagogy Gown +3", hands="Arbatel Bracers +1", legs="Telchine Braconi", feet="Telchine Pigaches",
        neck="Incanter's Torque", left_ear="Andoaa Earring", right_ear="Regal Earring", left_ring="Stikini Ring", right_ring="Stikini Ring",
        back={ name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}, waist="Embla Sash"}
   
    sets.midcast['Regen V'] = {main="Pedagogy Staff", sub="", ammo="Incantor Stone", head="Arbatel Bonnet +1",
        body="Telchine Chasuble", hands="Arbatel Bracers +1", legs="Telchine Braconi", feet="Telchine Pigaches",
        neck="Incanter's Torque", left_ear="Andoaa Earring", right_ear="Regal Earring", left_ring="Stikini Ring", right_ring="Stikini Ring",
        back="Bookworm's Cape", waist="Embla Sash"}
		
	sets.midcast.Klimaform = {main="Gada", sub="Ammurapi Shield", ammo="Incantor Stone", head="Telchine Cap",
        body="Pedagogy Gown +3", hands="Arbatel Bracers +1", legs="Telchine Braconi", feet="Arbatel Loafers +1",
        neck="Incanter's Torque", left_ear="Andoaa Earring", right_ear="Regal Earring", left_ring="Stikini Ring +1", right_ring="Stikini Ring +1",
        back={ name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}, waist="Olympus Sash"}
		
	sets.midcast.Cursna = {main="Gada",
	    sub="Chanter's Shield", ammo="Pemphredo Tathlum", head="Kaykaus Mitra +1", body="Peda. Gown +3", hands="Peda. Bracers +3", legs="Acad. Pants +2",
        feet="Vanya Clogs", neck="Debilis Medallion", waist="Austerity Belt +1", left_ear="Calamitous Earring", right_ear="Magnetic Earring",
        left_ring="Haoma's Ring", right_ring="Haoma's Ring", back="Thauma. Cape"}
 
    sets.midcast['Enfeebling Magic'] = {main="Daybreak", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
        head="Academic's Mortarboard +3",neck="Incanter's Torque",ear1="Regal Earring",ear2="Malignance Earring",
        body="Pedagogy Gown +3",hands="Pedagogy Bracers +3",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back={ name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}, waist="Luminary Sash", legs="Chironic Hose",feet="Academic's Loafers +3"}
 
    sets.midcast['Dark Magic'] = {sub="Lathi",ammo="",
        head="Pixie Hairpin +1",neck="Incanter's Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Shango Robe",hands="Arch. Gloves +1",ring1="Vertigo Ring",ring2="Shiva Ring +1",
        back="Bane Cape",waist="Fucho-no-Obi",legs="Merlinic Shalwar",feet="Merlinic Crackows"}
 
    sets.midcast.Drain = {main="Akademos",ammo="",
        head="Pixie Hairpin +1",neck="Incanter's Torque",ear1="Dignitary's Earring",ear2="Hermetic Earring",
        body="Shango Robe",hands="Jhakri Cuffs +2",ring1="Evanescence Ring",ring2="Archon Ring",
        back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},waist="Fucho-no-Obi",legs="Pedagogy Pants +3",feet="Merlinic Crackows"}
		
	sets.midcast.Kaustra = {main="Akademos",ammo="Enki Strap", ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Mizukage-no-Kubikazari",ear1="Barkarole Earring",ear2="Regal Earring",
        body="Merlinic Jubbah",hands="Amalric Gages +1",ring1="Mujin Band",ring2="Archon Ring",
        back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},waist="Hachirin-no-Obi",legs="Merlinic Shalwar",feet="Arbatel Loafers +1"}
		
	sets.midcast['Noctohelix II'] = {main="Akademos",sub="Enki Strap", ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Mizukage-no-Kubikazari",ear1="Barkarole Earring",ear2="Regal Earring",
        body="Merlinic Jubbah",hands="Amalric Gages +1",ring1="Mujin Band",ring2="Archon Ring",
        back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},waist="Sacro Cord",legs="Merlinic Shalwar",feet="Arbatel Loafers +1"}
		
	sets.midcast['Luminohelix II'] = {main="Daybreak",sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
        head="Pedagogy Mortarboard +3",neck="Mizukage-no-Kubikazari",ear1="Barkarole Earring",ear2="Regal Earring",
        body="Merlinic Jubbah",hands="Amalric Gages +1",ring1="Mujin Band",ring2="Freke Ring",
        back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},waist="Sacro Cord",legs="Merlinic Shalwar",feet="Arbatel Loafers +1"}
   
    sets.midcast.Aspir = {main="Akademos",ammo="",
        head="Pixie Hairpin +1",neck="Incanter's Torque",ear1="Dignitary's Earring",ear2="Hermetic Earring",
        body="Shango Robe",hands="Jhakri Cuffs +2",ring1="Evanescence Ring",ring2="Archon Ring",
        back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},waist="Fucho-no-Obi",legs="Pedagogy Pants +3",feet="Merlinic Crackows"}
 
    sets.midcast['Aspir II'] = {main="Akademos",ammo="",
        head="Pixie Hairpin +1",neck="Incanter's Torque",ear1="Dignitary's Earring",ear2="Hermetic Earring",
        body="Shango Robe",hands="Jhakri Cuffs +2",ring1="Evanescence Ring",ring2="Archon Ring",
        back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},waist="Fucho-no-Obi",legs="Pedagogy Pants +3",feet="Merlinic Crackows"} 
		
    sets.midcast.Impact = {main="Daybreak",sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
        head="",neck="Incanter's Torque",ear1="Barkarole Earring",ear2="Malignance Earring",
        body="",hands="Volte Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},waist="Luminary Sash",legs="Pedagogy Pants +3",feet="Pedagogy Loafers +3"}
		
	sets.midcast['Absorb-TP'] = {main="Daybreak",sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
        head="Academic's Mortarboard +3",neck="Incanter's Torque",ear1="Barkarole Earring",ear2="Malignance Earring",
        body="Academic's Gown +2",hands="Volte Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},waist="Luminary Sash",legs="Pedagogy Pants +3",feet="Pedagogy Loafers +3"}
 
    sets.midcast.Stun = {main="Grioavolr",ammo="Pemphredo Tathlum",
        head="Merlinic Hood",neck="Incanter's Torque",ear1="Barkarole Earring",ear2="Dignitary's Earring",
        body="Shango Robe",hands="Amalric Gages",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},waist="Witful Belt",legs="Psycloth Lappas",feet="Skaoi Boots"}
 
 
    -- Elemental Magic sets
   
    sets.midcast['Elemental Magic'] = {
        main={ name="Akademos", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}}, sub="Enki Strap", ammo="Pemphredo Tathlum",
        head={ name="Merlinic Hood", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Occult Acumen"+4','CHR+10','Mag. Acc.+12','"Mag.Atk.Bns."+15',}},
        body={ name="Merlinic Jubbah", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+10%','AGI+5','"Mag.Atk.Bns."+10',}},
        hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
        legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','"Fast Cast"+4','INT+9','Mag. Acc.+4','"Mag.Atk.Bns."+13',}},
        feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+28','Magic burst dmg.+11%','INT+6','Mag. Acc.+8',}},
        neck="Sanctity Necklace", left_ear="Barkaro. Earring", right_ear="Regal Earring", left_ring="Shiva Ring +1", right_ring="Acumen Ring",
        back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}, waist="Yamabuki-no-Obi"}
		
	sets.midcast['Elemental Magic'].BurstWeather = {main={ name="Akademos", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}}, sub="Enki Strap", ammo="Pemphredo Tathlum",
        head="Pedagogy Mortarboard +3", body="Merlinic Jubbah", hands="Amalric Gages +1",
        legs="Pedagogy Pants +3",
        feet="Arbatel Loafers +1",
        neck="Mizukage-no-Kubikazari", left_ear="Regal Earring", right_ear="Malignance Earring", left_ring="Freke Ring", right_ring="Mujin Band",
        back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}, waist="Hachirin-no-Obi"}
		
	sets.midcast['Elemental Magic'].Helix = {main={ name="Akademos", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}}, sub="Enki Strap", ammo="Pemphredo Tathlum",
        head="Pedagogy Mortarboard +3", body="Merlinic Jubbah", hands="Amalric Gages +1",
        legs="Pedagogy Pants +3",
        feet="Arbatel Loafers +1",
        neck="Mizukage-no-Kubikazari", left_ear="Regal Earring", right_ear="Malignance Earring", left_ring="Freke Ring", right_ring="Mujin Band",
        back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}, waist="Sacro Cord"}

	sets.midcast['Elemental Magic'].Acumen = {ammo="Sapience Orb",
        head="Amalric Coif +1",
        neck="Baetyl Pendant",
		ear1="Barkarole Earring",
        ear2="Malignance Earring",
        body="Shango Robe",
        hands="Volte Gloves",
        ring1="Kishar Ring",
        ring2="Rahab Ring", 
        back={ name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},
        waist="Witful Belt",
        legs="Psycloth Lappas",
        feet="Pedagogy Loafers +3"}
   
    -- Sets to return to when not performing an action.
   
    -- Resting sets
    sets.resting = {main="",ammo="",
        head="",neck="",ear1="Relaxing earring",ear2="Magnetic earring",
                body="Chelona Blazer",hands="Nares Cuffs",back="Vita cape",
        waist="",legs="Assid. Pants +1",feet=""}
   
 
    -- Idle sets
   
    -- Normal refresh idle set
    sets.idle = {main="Malignance Pole",sub="Khonsu",ear1="Odnowa Earring +1",ear2="Odnowa Earring",neck="Loricate Torque +1", head="Acad. Mortar. +3",
        body="Pedagogy Gown +3",hands="Pedagogy Bracers +3",ring1="Defending Ring",ring2="Gelatinous Ring +1", ammo="Staunch Tathlum +1",
        back="Moonbeam Cape",waist="Embla Sash",legs="Assid. Pants +1",feet="Mallquis Clogs +2"}
 
    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT = {ear1="Sanare Earring",ear2="Etiolation Earring",neck="Loricate Torque +1", head="Acad. Mortar. +3",
        body="Mallquis Saio +2",hands="Amalric Gages +1",ring1="Defending Ring",ring2="Vocane Ring",
        back="Moonbeam Cape",waist="Fucho-no-Obi",legs="Assid. Pants +1",feet="Mallquis Clogs +2"}
		
	sets.idle.Impact = {ear1="Sanare Earring",ear2="Etiolation Earring",neck="Loricate Torque +1", head="", main="Daybreak", sub="Ammurapi Shield",
        body="Twilight Cloak",hands="Amalric Gages +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Moonbeam Cape",waist="Fucho-no-Obi",legs="Assid. Pants +1",feet="Mallquis Clogs +2"}
 
    -- Idle mode scopes:
    -- Idle mode when weak.
    sets.idle.Weak = {ear1="Sanare Earring",ear2="Etiolation Earring",neck="Loricate Torque +1", head="Acad. Mortar. +3",
        body="Jhakri Robe +2",hands="Amalric Gages",ring1="Defending Ring",ring2="Vocane Ring",
        back="Moonbeam Cape",waist="Fucho-no-Obi",legs="Assid. Pants +1",feet="Mallquis Clogs +2"}
   
    -- Town gear.
    sets.idle.Town = {main="Daybreak",sub="Genmei Shield",ear1="Odnowa Earring +1",ear2="Odnowa Earring",neck="Loricate Torque +1", head="Acad. Mortar. +3",
        body="Pedagogy Gown +3",hands="Pedagogy Bracers +3",ring1="Defending Ring",ring2="Gelatinous Ring +1", ammo="Staunch Tathlum +1",
        back="Moonbeam Cape",waist="Fucho-no-Obi",legs="Assid. Pants +1",feet="Herald's Gaiters"}
       
    -- Defense sets
 
    sets.defense.PDT = {}
 
    sets.defense.MDT = {}
 
    sets.Kiting = {feet="Herald's Gaiters"}
 
    sets.latent_refresh = {waist="Fucho-no-obi"}
 
    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
 
    sets.magic_burst = {neck="Mizukage-no-Kubikazari"}
 
    -- Engaged sets
 
    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
   
    -- Normal melee group
    sets.engaged = {head="Pedagogy Mortarboard +3", neck="Combatant's Torque", left_ear="Telos Earring", right_ear="Dedition Earring",
		body="Pedagogy Gown +3", hands="Pedagogy Bracers +3", left_ring="Chirich Ring +1", right_ring="Chirich Ring +1",
		back="Relucent Cape", waist="Cetl Belt", legs="Pedagogy Pants +3", feet="Pedagogy Loafers +3"}
		
	organizer_items = {
      echos="Echo Drops",
	  vile="Vile Elixer",
	  vile2="Vile Elixer +1"}
end
 
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spellMap == 'Cure' or spellMap == 'Curaga' then
        gear.default.obi_waist = "Goading Belt"
    elseif spell.skill == 'Elemental Magic' then
        gear.default.obi_waist = ""
        if state.CastingMode.value == 'Proc' then
            classes.CustomClass = 'Proc'
        end
    end
end
 
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
 
end
 
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' and state.MagicBurst.value then
        equip(sets.magic_burst)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
 
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
 
-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end
 
 
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------
 
-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
        --[[ No real need to differentiate with current gear.
        if lowTierNukes:contains(spell.english) then
            return 'LowTierNuke'
        else
            return 'HighTierNuke'
        end
        --]]
    end
end
 
-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
        if  buffactive["Reive Mark"] then
        idleSet = set_combine(sets.idle, {neck="Arciela's Grace +1"})
    end        
       
   
    return idleSet
end
 
 
-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end
 
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
 
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 18)
end