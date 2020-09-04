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
 
-- Setup vars that are user-independent.
function job_setup()
    state.Buff['Aftermath'] = buffactive['Aftermath'] or false
    state.Buff['Souleater'] = buffactive['Souleater'] or false
    state.Buff['Blood Weapon'] = buffactive['Blood Weapon'] or false
    state.Buff['Soul Enslavement'] = buffactive['Soul Enslavement'] or false
end
 
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    -- Options: Override default values
    state.OffenseMode:options('Normal', 'LR', 'Aftermath')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'PDT')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal','PDT')
    state.PhysicalDefenseMode:options('PDT', 'MDT')
 
    LowTierNuke = S{
        'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga',
        'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}
   
    update_combat_form()
    update_melee_groups()
 
    select_default_macro_book()
end
 
-- Called when this job file is unloaded (eg: job change)
function file_unload()
    if binds_on_unload then
        binds_on_unload()
    end
end
 
-- Define sets and vars used by this job file.
function init_gear_sets()
-- Precast sets
    sets.precast.JA['Diabolic Eye'] = {hands="Fallen's Finger Gauntlets +3"}
	sets.precast.JA['Dark Seal'] = {head="Fallen's Burgeonet +2"}
    sets.precast.JA['Arcane Circle'] = {feet="Ignominy Sollerets"}
    sets.precast.JA['Nether Void'] = {legs="Heathen's Flanchard +1"}
    sets.precast.JA['Souleater'] = {head="Ignominy Burgeonet +3"}
    sets.precast.JA['Last Resort'] = {back="Ankou's Mantle", feet="Fallen's Sollerets +3"}
    sets.precast.JA['Weapon Bash'] = {hands="Ignominy Gauntlets +3"}
    sets.precast.JA['Blood Weapon'] = {body="Fallen's Cuirass +1"}
 
-- Waltz set (chr and vit)
    sets.precast.Waltz = {}
 
-- Fast cast sets for spells
    sets.precast.FC = {
        ammo="Sapience Orb",
        head="Carmine Mask +1", body="Odyssean Chestplate",
        back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}, neck="Baetyl Pendant",
        hands="Leyline Gloves", waist="",
        legs="Eschite Cuisses", feet="Carmine Greaves +1",
        ring1="Weatherspoon Ring", ring2="Kishar Ring",
        ear1="Etiolation Earring", ear2="Loquacious Earring"}
 
    sets.precast.FC['Dark Magic'] = sets.precast.FC
 
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {
        head=empty,body="Twilight Cloak"})
 
-- Midcast Sets
    sets.midcast.FastRecast = {
        ammo="Sapience Orb",
        head="Carmine Mask +1", body="Odyssean Chestplate",
        back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}, neck="Baetyl Pendant",
        hands="Leyline Gloves", waist="",
        legs="Eschite Cuisses", feet="Odyssean Greaves",
        ring1="Weatherspoon Ring", ring2="Kishar Ring",
        ear1="Etiolation Earring", ear2="Loquacious Earring"}
 
-- Specific spells
    sets.midcast['Dark Magic'] = {
        ammo="Pemphredo Tathlum",
        head="Carmine Mask +1", body="Carmine Scale Mail",
        back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}, neck="Erra Pendant",
        hands="Flamma Manopolas +1", waist="Eschan Stone",
        legs="Eschite Cuisses", feet="Flamma Gambieras +1",
        ring1="Evanescence Ring", ring2="Kishar Ring",
        ear1="Dignitary's Earring", ear2="Hermetic Earring"}
		
	sets.midcast.Break = {
        ammo="Pemphredo Tathlum",
        head="Flamma Zucchetto +1", body="Flamma Korazin +1",
        back="Chuparrosa Mantle", neck="Incanter's Torque",
        hands="Flamma Manopolas +1", waist="Eschan Stone",
        legs="Flamma Dirs +1", feet="Flamma Gambieras +1",
        ring1="Stikini Ring", Ring2="Stikini Ring",
        ear1="Dignitary's Earring", ear2="Hermetic Earring"}
		
	sets.midcast.Silence = {
        ammo="Pemphredo Tathlum",
        head="Flamma Zucchetto +1", body="Flamma Korazin +1",
        back="Chuparrosa Mantle", neck="Incanter's Torque",
        hands="Flamma Manopolas +1", waist="Eschan Stone",
        legs="Flamma Dirs +1", feet="Flamma Gambieras +1",
        ring1="Stikini Ring", Ring2="Stikini Ring",
        ear1="Dignitary's Earring", ear2="Hermetic Earring"}
 
     sets.midcast.Drain = {
        ammo="Pemphredo Tathlum",
        head="", body="Lugra Cloak +1",
        back="Niht Mantle", neck="Erra Pendant",
        hands="Fallen's Finger Gauntlets +3", waist="Austerity Belt +1",
        legs="Eschite Cuisses", feet="Flamma Gambieras +1",
        ring1="Evanescence Ring", Ring2="Archon Ring",
        ear1="Dignitary's Earring", ear2="Hermetic Earring"}
		
	sets.midcast['Drain II'] = {
        ammo="Pemphredo Tathlum",
        head="", body="Lugra Cloak +1",
        back="Niht Mantle", neck="Erra Pendant",
        hands="Fallen's Finger Gauntlets +3", waist="Austerity Belt +1",
        legs="Eschite Cuisses", feet="Ratri Sollerets",
        ring1="Evanescence Ring", Ring2="Excelsis Ring",
        ear1="Dignitary's Earring", ear2="Malignance Earring"}
		
	sets.midcast['Drain III'] = {ammo="Pemphredo Tathlum",
        head="Fallen's Burgeonet +2", body="Carmine Scale Mail",
        back="Niht Mantle", neck="Erra Pendant",
        hands="Fallen's Finger Gauntlets +3", waist="Austerity Belt +1",
        legs="Eschite Cuisses", feet="Ratri Sollerets",
        ring1="Evanescence Ring", Ring2="Archon Ring",
        ear1="Dignitary's Earring", ear2="Malignance Earring"}
 
    sets.midcast.Aspir = sets.midcast.Drain
 
    sets.midcast['Enfeebling Magic'] = {
        ammo="Pemphredo Tathlum",
        head="Carmine Mask +1", body="Carmine Scale Mail",
        back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}, neck="Incanter's Torque",
        hands="Leyline Gloves", waist="Luminary Sash",
        legs="Eschite Cuisses", feet="Heathen's Sollerets +1",
        ring1="Globidonta Ring", Ring2="Vertigo Ring",
        ear1="Dignitary's Earring", ear2="Hermetic Earring"}
 
    sets.midcast['Dread Spikes'] = {
        ammo="",
        head="Ratri Sallet", body="Heathen's Cuirass +1",
        back="Niht Mantle", neck="Erra Pendant",
        hands="Ratri Gadlings", waist="Austerity Belt +1",
        legs="Flamma Dirs +2", feet="Ratri Sollerets",
        ring1="Evanescence Ring", Ring2="Stikini Ring",
        ear1="", ear2=""}
 
    sets.midcast.Absorb = {
        ammo="Pemphredo Tathlum",
        head="Ignominy Burgonet +3", body="Carmine Scale Mail",
        back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}, neck="Erra Pendant",
        hands="Fallen's Finger Gauntlets +3", waist="Eschan Stone",
        legs="Fallen's Flanchard +3", feet="Ratri Sollerets",
        ring1="Evanescence Ring", ring2="Kishar Ring",
        ear1="Dignitary's Earring", ear2="Malignance Earring"}
    sets.midcast.Absorb.Resistant = {
        ammo="Pemphredo Tathlum",
        head="Carmine Mask +1", body="Carmine Scale Mail",
        back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}, neck="Incanter's Torque",
        hands="Flamma Manopolas +1", waist="Eschan Stone",
        legs="Eschite Cuisses", feet="Flamma Gambieras +1",
        ring1="Evanescence Ring", Ring2="Stikini Ring",
        ear1="Dignitary's Earring", ear2="Hermetic Earring"}
 
    sets.midcast['Absorb-TP'] = set_combine(sets.midcast.Absorb, {hands="Heathen's Gauntlets +1", head="Carmine Mask +1", legs="Eschite Cuisses", feet="Flamma Gambieras +2"})
    sets.midcast['Absorb-TP'].Resistant = set_combine(sets.midcast.Absorb.Resistant, {hands="Heathen's Gauntlets +1"})
 
    sets.midcast['Absorb-STR'] = sets.midcast.Absorb
    sets.midcast['Absorb-STR'].Resistant = sets.midcast.Absorb.Resistant
       
    sets.midcast['Absorb-DEX'] = sets.midcast.Absorb
    sets.midcast['Absorb-DEX'].Resistant = sets.midcast.Absorb.Resistant
       
    sets.midcast['Absorb-AGI'] = sets.midcast.Absorb
    sets.midcast['Absorb-AGI'].Resistant = sets.midcast.Absorb.Resistant
 
    sets.midcast['Absorb-MND'] = sets.midcast.Absorb
    sets.midcast['Absorb-MND'].Resistant = sets.midcast.Absorb.Resistant
       
    sets.midcast['Absorb-VIT'] = sets.midcast.Absorb
    sets.midcast['Absorb-VIT'].Resistant = sets.midcast.Absorb.Resistant
   
    sets.midcast['Absorb-ACC'] = sets.midcast.Absorb
    sets.midcast['Absorb-ACC'].Resistant = sets.midcast.Absorb.Resistant
       
    sets.midcast['Absorb-Attri'] = sets.midcast.Absorb
    sets.midcast['Absorb-Attri'].Resistant = sets.midcast.Absorb.Resistant
 
    sets.midcast.Stun = {
        ammo="Pemphredo Tathlum", head="Carmine Mask +1",
        body="Flamma Korazin +1", hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs="Flamma Dirs +1", feet="Flam. Gambieras +1", neck="Erra Pendant", waist="Eschan Stone", left_ear="Digni. Earring", right_ear="Hermetic Earring",
        left_ring="Weather. Ring", right_ring="Kishar Ring", back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}},}    

    sets.midcast.Flash = {hands="Redan Gloves", back="Reiki Cloak", legs="Odyssean Cuisses", feet="", head="Halitus Helm",
	               neck="Warder's Charm +1", ring1="Defending Ring", ring2="Supershear Ring", body="Emet Harness", 
				   ear1="Friomisi Earring", ear2="Cryptic Earring", ammo="Sapience Orb"}		
 
    sets.midcast.Impact = set_combine(sets.midcast['Dark Magic'], {head=empty, body="Twilight Cloak", hands="Flamma Manopolas +1", feet="Heathen's Sollerets +1"})
 
-- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast.LowTierNuke = {
        ammo="Pemphredo Tathlum",
        head="Jumalik Helm", body="Founder's Breastplate",
        back="Toro Cape", neck="Sanctity Necklace",
        hands="Founder's Gauntlets", waist="Eschan Stone",
        legs="Eschite Cuisses", feet="Founder's Greaves",
        ring1="Acumen Ring", Ring2="Stikini Ring",
        ear1="Crematio Earring", ear2="Friomisi Earring"}
 
    sets.midcast.LowTierNuke.Resistant = {
        ammo="Pemphredo Tathlum",
        head="Valorous Mask", body="Carmine Scale Mail",
        back="Izdubar Mantle", neck="Eddy Necklace",
        hands="Fallen's Finger Gauntlets", waist="Ninurta's Sash",
        legs="Odyssean Cuisses",feet="Ignominy Sollerets +1",
        ring1="Shiva Ring +1", ring2="Shiva Ring +1",
        ear1="Crematio Earring", ear2="Friomisi Earring"}
 
    -- Custom classes for high-tier nukes.
    sets.midcast.HighTierNuke = sets.midcast.LowTierNuke
    sets.midcast.HighTierNuke.Resistant = sets.midcast.LowTierNuke.Resistant
 
-- Resting sets
    sets.resting = {
        ammo="Ginsen",
        head="Baghere Salade", body="Fallen's Cuirass +1",
        back="Xucau Mantle", neck="Coatl Gorget +1",
        hands="Redan Gloves", waist="Flume Belt +1",
        legs="Carmine Cuisses",feet="Amm Greaves",
        ring1="Sheltered Ring", ring2="Paguroidea Ring",
        ear1="Infused Earring", ear2="Infused Earring"}
 
-- Idle sets
    sets.idle = {
        ammo="Staunch Tathlum +1",
        head="Sulevia's Mask +2", body="Sulevia's Platemail +2",
        back="Moonbeam Cape", neck="Loricate Torque +1",
        hands="Sulevia's Gauntlets +2", waist="Nierenschutz",
        legs="Carmine Cuisses +1",feet="Sulevia's Leggings +2",
        ring1="Defending Ring", ring2="Gelatinous Ring +1",
        ear1="Odnowa Earring", ear2="Odnowa Earring +1"}
 
    sets.idle.PDT = {
        ammo="Brigantia Pebble",
        head="Sulevia's Mask +1", body="Sulevia's Platemail +1",
        back="Solemnity Cape", neck="Loricate Torque +1",
        hands="Sulevia's Gauntlets +1", waist="Nierenschutz",
        legs="Sulevia's Cuisses +1",feet="Amm Greaves",
        ring1="Defending Ring", ring2="Gelatinous Ring +1",
        ear1="Odnowa Earring", ear2="Odnowa Earring +1"}
 
    sets.idle.Town = {
        ammo="Staunch Tathlum",
        head="", body="Lugra Cloak +1",
        back="Moonbeam Cape", neck="Loricate Torque +1",
        hands="Sulevia's Gauntlets +2", waist="Nierenschutz",
        legs="Carmine Cuisses +1",feet="Amm Greaves",
        ring1="Defending Ring", ring2="Moonbeam Ring",
        ear1="Odnowa Earring", ear2="Odnowa Earring +1"}
 
    sets.idle.Weak = {head="Twilight Helm", body="Twilight Mail"}
 
-- Defense sets
    sets.defense.PDT = {
        ammo="Ginsen",
        head="Xaddi Headgear", body="Emet Harness +1",
        back="Xucau Mantle", neck="Twilight Torque",
        hands="Redan Gloves", waist="Flume Belt +1",
        legs="Valorous Hose",feet="Amm Greaves",
        ring1="Defending Ring", ring2="Patricius Ring",
        ear1="Dignitary's Earring", ear2="Zennaroi Earring"}
 
    sets.defense.MDT = {
        ammo="Ginsen",
        head="Xaddi Headgear", body="Emet Harness +1",
        back="Xucau Mantle", neck="Twilight Torque",
        hands="Redan Gloves", waist="Flume Belt +1",
        legs="Valorous Hose",feet="Amm Greaves",
        ring1="Defending Ring", ring2="Patricius Ring",
        ear1="Dignitary's Earring", ear2="Zennaroi Earring"}
 
    sets.Kiting = {legs="Carmine Cuisses"}
 
    sets.Reraise = {head="Twilight Helm", body="Twilight Mail"}
 
--Engaged Sets
    -- Normal Zone
    -- 7 hit - 0 STP - No Grips.
        -- tp 163 per hit. no stp /sam. = 7 hit ==1141tp
 
    -- 6 hit
        -- tp 177 per hit. 10 stp /sam. = 6 hit = 1062tp
        -- tp 191 per hit. 20 stp /sam. = 6 hit = 1146tp
 
    --5 hit
        -- tp 205 per hit. 30 stp /sam. = 5 hit = 1025tp
        -- tp 220 per hit. 40 stp /sam. = 5 hit = 1100tp
        -- tp 234 per hit. 50 stp /sam. = 5 hit = 1170tp
        -- tp 248 per hit. 60 stp /sam. = 5 hit = 1240tp
   
    --4 hit
        -- tp 251 per hit. 62 stp /sam. = 4 hit = 1004tp
 
    --Engaged
        -- 43 stp 952 acc

	sets.engaged = {ammo="Yetshila +1",
        head="Volte Salade", 
		body={ name="Valorous Mail", augments={'INT+9','"Dbl.Atk."+2','Quadruple Attack +3','Accuracy+5 Attack+5','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
        back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}, neck="Abyssal Bead Necklace +2",
        hands="Sulevia's Gauntlets +2", waist="Ioskeha Belt +1",
        legs="Ignominy Flanchard +3", feet="Flamma Gambieras +2",
        ring1="Niqmaddu Ring", ring2="Chirich Ring +1",
        ear1="Brutal Earring", ear2="Cessance Earring"}
	sets.engaged.LR = {ammo="Yetshila +1",
        head="Flamma Zucchetto +2", 
		body="Dagon Breastplate",
        back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}, neck="Abyssal Bead Necklace +2",
        hands="Sulevia's Gauntlets +2", waist="Ioskeha Belt +1",
        legs="Ignominy Flanchard +3", feet="Fallen's Sollerets +3",
        ring1="Niqmaddu Ring", ring2="Chirich Ring +1",
        ear1="Brutal Earring", ear2="Cessance Earring"}
	sets.engaged.Aftermath = {ammo="Yetshila +1",
        head="Ignominy Burgonet +3", 
		body="Hjarrandi Breastplate",
        back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Phys. dmg. taken-10%',}}, neck="Abyssal Bead Necklace +2",
        hands="Flamma Manopolas +2", waist="Ioskeha Belt +1",
        legs="Ignominy Flanchard +3", feet="Thereoid Greaves",
        ring1="Niqmaddu Ring", ring2="Chirich Ring +1",
        ear1="Brutal Earring", ear2="Cessance Earring"}
    sets.engaged.DT = {
        ammo="Staunch Tathlum +1",
        head="Hjarrandi Helm", body="Hjarrandi Breastplate",
        back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}, neck="Abyssal Bead Necklace +2",
        hands="Flamma Manopolas +2", waist="Tempus Fugit",
        legs="Ignominy Flanchard +3",feet="Amm Greaves",
        ring1="Defending Ring", ring2="Vocane Ring",
        ear1="Telos Earring", ear2="Dedition Earring"}
 
    --Engaged PDT
    sets.engaged.PDT = {
        ammo="Ginsen",
        head="Xaddi Headgear", body="Emet Harness +1",
        back="Xucau Mantle", neck="Twilight Torque",
        hands="Redan Gloves", waist="Flume Belt +1",
        legs="Valorous Hose",feet="Amm Greaves",
        ring1="Defending Ring", ring2="Patricius Ring",
        ear1="Dignitary's Earring", ear2="Zennaroi Earring"}
 
-- Weaponskill sets
    sets.precast.WS = {
        ammo="Seething Bomblet +1",
        head={ name="Valorous Mask", augments={'Accuracy+19','Sklchn.dmg.+5%','STR+9','Attack+14',}}, body="Argosy Hauberk",
        back="Niht Mantle", neck="Fotia Gorget",
        hands="Valorous Mitts", waist="Fotia Belt",
        legs="Valorous Hose", feet="Argosy Sollerets +1",
        ring1="Rufescent Ring", ring2="Apate Ring",
        ear1="Ishvara Earring", ear2="Cessance Earring"}
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {
        ring1="Ramuh Ring +1", ring2="Ramuh Ring +1",
        ear1="Dignitary's Earring", ear2="Dignitary's Earring"})
 
    -- Catastrophe - FTP 2.75 - STR 40%, INT 40%
    -- No Gorget/Belt - Single Hit
    -- Darkness/Gravitation
    sets.precast.WS['Catastrophe'] = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
        head="Ratri Sallet", body="Ignominy Cuirass +3",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}, neck="Abyssal Bead Necklace +2",
        hands="Ratri Gadlings", waist="Metalsinger Belt", legs="Fallen's Flanchard +3", feet="Sulevia's Leggings +2", ring1="Regal Ring", ring2="Rufescent Ring",
        ear1="Thrud Earring", ear2="Moonshade Earring"})
    sets.precast.WS['Catastrophe'].Acc = set_combine(sets.precast.WS.Acc, {
        head="Valorous Mask", body="Valorous Mail",
        neck="Fotia Gorget", waist="Fotia Belt",
        ring1="Ramuh Ring +1", ring2="Ramuh Ring +1",
        ear1="Dignitary's Earring", ear2="Dignitary's Earring"})
 
    -- FTP 0.75, 1.25, 2.0, - INT 85%
    -- Use Gorget/Belt - 4 Hit
    -- Gravitation/Reverberation
    sets.precast.WS['Entropy'] = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
        head="Ratri Sallet", body="Ignominy Cuirass +3",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}, neck="Fotia Gorget",
        hands="Ratri Gadlings", waist="Fotia Belt",
        legs="Fallen's Flanchard +3", feet="Sulevia's Leggings +2",
        ring1="Niqmaddu Ring", ring2="Regal Ring",
        ear1="Moonshade Earring", ear2="Ishvara Earring"})
    sets.precast.WS['Entropy'].Acc = set_combine(sets.precast.WS.Acc, {
        head="Valorous Mask", body="Valorous Mail",
        neck="Fotia Gorget", waist="Fotia Belt",
        ring1="Ramuh Ring +1", ring2="Ramuh Ring +1",
        ear1="Dignitary's Earring", ear2="Dignitary's Earring"})
   
    -- Insurgency - FTP 0.5, 3.25, 6.0 - STR 20%, INT 20%
    -- Use Gorget/Belt - 4 Hit
    -- Fusion/Compression
    sets.precast.WS['Insurgency'] = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
        head="Ratri Sallet", body="Ignominy Cuirass +3",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}, neck="Abyssal Bead Necklace +2",
        hands="Ratri Gadlings", waist="Metalsinger Belt",
        legs="Fallen's Flanchard +3", feet="Sulevia's Leggings +2",
        ring1="Niqmaddu Ring", ring2="Regal Ring",
        ear1="Moonshade Earring", ear2="Brutal Earring"})
    sets.precast.WS['Insurgency'].Acc = set_combine(sets.precast.WS.Acc, {
        neck="Fotia Gorget", waist="Fotia Belt",
        ring1="Ramuh Ring +1", ring2="Ramuh Ring +1",
        ear1="Dignitary's Earring", ear2="Dignitary's Earring"})
 
    -- Quietus - FTP 3.0, - STR 60% MND 60%
    -- No Gorget/Belt - Triple Dmg, Ignores Defense
    -- Darkness/Distortion
    sets.precast.WS['Quietus'] = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
        head="Ratri Sallet", body="Ignominy Cuirass +3",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}, neck="Abyssal Bead Necklace +2",
        hands="Ratri Gadlings", waist="Metalsinger Belt", legs="Fallen's Flanchard +3", feet="Sulevia's Leggings +2", ring1="Niqmaddu Ring", ring2="Rufescent Ring",
        ear1="Ishvara Earring", ear2="Thrud Earring"})
    sets.precast.WS['Quietus'].Acc = set_combine(sets.precast.WS.Acc, {
        head="Valorous Mask", body="Valorous Mail",
        neck="Fotia Gorget", waist="Fotia Belt",
        ring1="Ramuh Ring +1", ring2="Ramuh Ring +1",
        ear1="Dignitary's Earring", ear2="Dignitary's Earring"})
		
	sets.precast.WS['Spinning Scythe'] = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
        head="Ratri Sallet", body="Ratri Breastplate",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}, neck="Fotia Gorget",
        hands="Ratri Gadlings", waist="Grunfeld Rope", legs="Fallen's Flanchard +3", feet="Sulevia's Leggings +2", ring1="Niqmaddu Ring", ring2="Rufescent Ring",
        ear1="Ishvara Earring", ear2="Moonshade Earring"})
    sets.precast.WS['Spinning Scythe'].Acc = set_combine(sets.precast.WS.Acc, {
        head="Valorous Mask", body="Valorous Mail",
        neck="Fotia Gorget", waist="Fotia Belt",
        ring1="Ramuh Ring +1", ring2="Ramuh Ring +1",
        ear1="Dignitary's Earring", ear2="Dignitary's Earring"})
       
    -- Vorpal Scythe - FTP 1.0 - STR 100%
    -- No Gorget/Belt - Singe Hit Crit
    -- Transfixion/Scission
    sets.precast.WS['Vorpal Scythe'] = set_combine(sets.precast.WS, {
        ammo="Ginsen",
        head="Valorous Mask", body="Lustratio Harness",
        back="Niht Mantle", neck="Fotia Gorget",
        hands="Odyssean Gauntlets", waist="Fotia Belt",
        legs="Valorous Hose", feet="Valorous Greaves",
        ring1="Ifrit Ring +1", ring2="Ifrit Ring +1",
        ear1="Ishvara Earring", ear2="Moonshade Earring"})
    sets.precast.WS['Vorpal Scythe'].Acc = set_combine(sets.precast.WS.Acc, {
        head="Valorous Mask", body="Valorous Mail",
        neck="Fotia Gorget", waist="Fotia Belt",
        ring1="Ramuh Ring +1", ring2="Ramuh Ring +1",
        ear1="Dignitary's Earring", ear2="Dignitary's Earring"})
 
    -- Guillotine - FTP 0.875 - STR 30% MND 50%
    -- Use Gorget/Belt - 4 Hit
    -- Induration
    sets.precast.WS['Guillotine'] = set_combine(sets.precast.WS, {
        ammo="Seething Bomblet +1",
        head="Flamma Zucchetto +2", body="Flamma Korazin +2",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}, neck="Caro Necklace",
        hands="Flamma Manopolas +2", waist="Grunfeld Rope",
        legs="Flamma Dirs +1", feet="Flamma Gambieras +2",
        ring1="Shukuyu Ring", ring2="Rufescent Ring",
        ear1="Moonshade Earring", ear2="Dignitary's Earring"})
    sets.precast.WS['Guillotine'].Acc = set_combine(sets.precast.WS.Acc, {
        head="Valorous Mask", body="Valorous Mail",
        neck="Fotia Gorget", waist="Fotia Belt",
        ring1="Ramuh Ring +1", ring2="Ramuh Ring +1",
        ear1="Dignitary's Earring", ear2="Dignitary's Earring"})
		
	sets.precast.WS['Nightmare Scythe'] = set_combine(sets.precast.WS, {
        ammo="Pemphredo Tathlum",
        head="Flamma Zucchetto +2", body="Flamma Korazin +2",
        back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10',}}, neck="Erra Pendant",
        hands="Flamma Manopolas +2", waist="Eschan Stone",
        legs="Flamma Dirs +1", feet="Flamma Gambieras +2",
        ring1="Weatherspoon Ring", ring2="Rufescent Ring",
        ear1="Moonshade Earring", ear2="Dignitary's Earring"})
    sets.precast.WS['Nightmare Scythe'].Acc = set_combine(sets.precast.WS.Acc, {
        head="Valorous Mask", body="Valorous Mail",
        neck="Fotia Gorget", waist="Fotia Belt",
        ring1="Ramuh Ring +1", ring2="Ramuh Ring +1",
        ear1="Dignitary's Earring", ear2="Dignitary's Earring"})	
		
	sets.precast.WS['Cross Reaper'] = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
        head="Ratri Sallet", body="Ignominy Cuirass +3",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}, neck="Abyssal Bead Necklace +2",
        hands="Ratri Gadlings", waist="Metalsinger Belt", legs="Fallen's Flanchard +3", feet="Sulevia's Leggings +2", ring1="Niqmaddu Ring", ring2="Regal Ring",
        ear1="Ishvara Earring", ear2="Thrud Earring"})
    sets.precast.WS['Cross Reaper'].Acc = set_combine(sets.precast.WS.Acc, {
        head="Valorous Mask", body="Valorous Mail",
        neck="Fotia Gorget", waist="Fotia Belt",
        ring1="Ramuh Ring +1", ring2="Ramuh Ring +1",
        ear1="Dignitary's Earring", ear2="Dignitary's Earring"})
		
	sets.precast.WS['Fell Cleave'] = {
        ammo="Knobkierrie",
        head="Odyssean Helm", body="Ignominy Cuirass +3",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}, neck="Caro Necklace",
        hands="Odyssean Gauntlets", waist="Metalsinger Belt",
        legs="Fallen's Flanchard +3", feet="Sulevia's Leggings +2",
        ring1="Shukuyu Ring", ring2="Regal Ring",
        ear1="Ishvara Earring", ear2="Thrud Earring"}
    sets.precast.WS['Fell Cleave'].Acc = set_combine(sets.precast.WS.Acc, {
        head="Valorous Mask", body="Valorous Mail",
        neck="Fotia Gorget", waist="Fotia Belt",
        ring1="Ramuh Ring +1", ring2="Ramuh Ring +1",
        ear1="Dignitary's Earring", ear2="Dignitary's Earring"})
		
	sets.precast.WS['Armor Break'] = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
        head="Flamma Zucchetto +2", body="Flamma Korazin +2",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}, neck="Abyssal Bead Necklace +2",
        hands="Flamma Manopolas +2", waist="Metalsinger Belt",
        legs="Flamma Dirs +2", feet="Flamma Gambieras +2",
        ring1="Shukuyu Ring", ring2="Regal Ring",
        ear1="Moonshade Earring", ear2="Dignitary's Earring"})
    sets.precast.WS['Armor Break'].Acc = set_combine(sets.precast.WS.Acc, {
        head="Valorous Mask", body="Valorous Mail",
        neck="Fotia Gorget", waist="Fotia Belt",
        ring1="Ramuh Ring +1", ring2="Ramuh Ring +1",
        ear1="Dignitary's Earring", ear2="Dignitary's Earring"})
		
	sets.precast.WS['Full Break'] = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
        head="Flamma Zucchetto +2", body="Flamma Korazin +2",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}, neck="Abyssal Bead Necklace +2",
        hands="Flamma Manopolas +2", waist="Metalsinger Belt",
        legs="Flamma Dirs +2", feet="Flamma Gambieras +2",
        ring1="Shukuyu Ring", ring2="Regal Ring",
        ear1="Moonshade Earring", ear2="Dignitary's Earring"})
    sets.precast.WS['Full Break'].Acc = set_combine(sets.precast.WS.Acc, {
        head="Valorous Mask", body="Valorous Mail",
        neck="Fotia Gorget", waist="Fotia Belt",
        ring1="Ramuh Ring +1", ring2="Ramuh Ring +1",
        ear1="Dignitary's Earring", ear2="Dignitary's Earring"})
 
    -- Spiral Hell - FTP 1.375, 2.75, 4.75, - STR 50% INT 50%
    -- No Gorget/Belt - Single Hit
    -- Distortion/Scission
    sets.precast.WS['Spiral Hell'] = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
        head="Ratri Sallet", body="Ignominy Cuirass +3",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}, neck="Abyssal Bead Necklace +2",
        hands="Ratri Gadlings", waist="Metalsinger Belt", legs="Fallen's Flanchard +3", feet="Sulevia's Leggings +2", ring1="Niqmaddu Ring", ring2="Regal Ring",
        ear1="Ishvara Earring", ear2="Moonshade Earring"})
    sets.precast.WS['Cross Reaper'].Acc = set_combine(sets.precast.WS.Acc, {
        head="Valorous Mask", body="Valorous Mail",
        neck="Fotia Gorget", waist="Fotia Belt",
        ring1="Ramuh Ring +1", ring2="Ramuh Ring +1",
        ear1="Dignitary's Earring", ear2="Dignitary's Earring"})
		
	sets.precast.WS['Infernal Scythe'] = {
        ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1", body="Founder's Breastplate",
        back="Ankou's Mantle", neck="Sanctity Necklace",
        hands="Founder's Gauntlets", waist="Eschan Stone",
        legs="Eschite Cuisses", feet="Founder's Greaves",
        ring1="Acumen Ring", Ring2="Archon Ring",
        ear1="Ishvara Earring", ear2="Friomisi Earring"}
		
	sets.precast.WS['Shadow of Death'] = {
        ammo="Seething Bomblet +1",
        head="Pixie Hairpin +1", body="Founder's Breastplate",
        back="Niht Mantle", neck="Sanctity Necklace",
        hands="Founder's Gauntlets", waist="Eschan Stone",
        legs="Eschite Cuisses", feet="Heathen's Sollerets +1",
        ring1="Acumen Ring", Ring2="Archon Ring",
        ear1="Ishvara Earring", ear2="Friomisi Earring"}
 
    -- Resolution - FTP .71, 1.5, 2.25, - STR 85%
    -- Use Gorget/Belt - 5 Hit
    -- Fragmentation/Scission
    sets.precast.WS['Resolution'] = {
        ammo="Seething Bomblet +1",
        head="Argosy Celata +1", body="Argosy Hauberk +1",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}, neck="Fotia Gorget",
        hands="Argosy Mufflers +1", waist="Fotia Belt",
        legs="Ignominy Flanchard +3", feet="Argosy Sollerets +1",
        ring1="Niqmaddu Ring", ring2="Regal Ring",
        ear1="Moonshade Earring", ear2="Cessance Earring"}
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, {
        head="Valorous Mask", body="Valorous Mail",
        neck="Fotia Gorget", waist="Fotia Belt",
        ring1="Ramuh Ring +1", ring2="Ramuh Ring +1",
        ear1="Dignitary's Earring", ear2="Dignitary's Earring"})
 
    -- Torcleaver - FTP 4.75, 7.5, 10, - VIT 80%
    -- No Gorget/Belt - Deals Triple DMG
    -- Light/Distortion
    sets.precast.WS['Torcleaver'] = {
        ammo="Knobkierrie",
        head={ name="Odyssean Helm", augments={'Accuracy+24 Attack+24','Weapon skill damage +2%','VIT+9','Attack+10',}}, body="Ignominy Cuirass +3",
        back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}}, neck="Abyssal Bead Necklace +2",
        hands={ name="Odyssean Gauntlets", augments={'Accuracy+20 Attack+20','Weapon skill damage +3%','VIT+13','Attack+5',}}, waist="Caudata Belt",
        legs="Fallen's Flanchard +3", feet="Sulevia's Leggings +2",
        ring1="Niqmaddu Ring", ring2="Regal Ring",
        ear1="Thrud Earring", ear2="Moonshade Earring"}
    sets.precast.WS['Torcleaver'].Acc = set_combine(sets.precast.WS.Acc, {
        head="Valorous Mask", body="Valorous Mail",
        neck="Fotia Gorget", waist="Fotia Belt",
        ring1="Ramuh Ring +1", ring2="Ramuh Ring +1",
        ear1="Dignitary's Earring", ear2="Dignitary's Earring"})
		
	sets.precast.WS['Scourge'] = {
        ammo="Knobkierrie",
        head="Odyssean Helm", body="Ignominy Cuirass +3",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}, neck="Caro Necklace",
        hands="Odyssean Gauntlets", waist="Metalsinger Belt",
        legs={ name="Odyssean Cuisses", augments={'Accuracy+30','Weapon skill damage +4%','AGI+9','Attack+1',}}, feet="Sulevia's Leggings +2",
        ring1="Niqmaddu Ring", ring2="Regal Ring",
        ear1="Ishvara Earring", ear2="Moonshade Earring"}
    sets.precast.WS['Scourge'].Acc = set_combine(sets.precast.WS.Acc, {
        head="Valorous Mask", body="Valorous Mail",
        neck="Fotia Gorget", waist="Fotia Belt",
        ring1="Ramuh Ring +1", ring2="Ramuh Ring +1",
        ear1="Dignitary's Earring", ear2="Dignitary's Earring"})
		
	sets.precast.WS['Shockwave'] = {
        ammo="Knobkierrie",
        head={ name="Odyssean Helm", augments={'Accuracy+24 Attack+24','Weapon skill damage +2%','VIT+9','Attack+10',}}, body="Ignominy Cuirass +3",
        back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}}, neck="Abyssal Bead Necklace +2",
        hands={ name="Odyssean Gauntlets", augments={'Accuracy+20 Attack+20','Weapon skill damage +3%','VIT+13','Attack+5',}}, waist="Caudata Belt",
        legs="Fallen's Flanchard +3", feet="Sulevia's Leggings +2",
        ring1="Niqmaddu Ring", ring2="Regal Ring",
        ear1="Ishvara Earring", ear2="Moonshade Earring"}
    sets.precast.WS['Shockwave'].Acc = set_combine(sets.precast.WS.Acc, {
        head="Valorous Mask", body="Valorous Mail",
        neck="Fotia Gorget", waist="Fotia Belt",
        ring1="Ramuh Ring +1", ring2="Ramuh Ring +1",
        ear1="Dignitary's Earring", ear2="Dignitary's Earring"})
		
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
        head="Odyssean Helm", body="Ignominy Cuirass +3",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}, neck="Caro Necklace",
        hands="Valorous Mitts", waist="Grunfeld Rope",
        legs={ name="Valor. Hose", augments={'Accuracy+25 Attack+25','"Store TP"+6','STR+6','Attack+15',}}, feet="Sulevia's Leggings +2",
        ring1="Shukuyu Ring", ring2="Regal Ring",
        ear1="Ishvara Earring", ear2="Moonshade Earring"})
    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {
        head="Valorous Mask", body="Valorous Mail",
        neck="Fotia Gorget", waist="Fotia Belt",
        ring1="Ramuh Ring +1", ring2="Ramuh Ring +1",
        ear1="Dignitary's Earring", ear2="Dignitary's Earring"})
		
	sets.precast.WS['Steel Cyclone'] = {
        ammo="Knobkierrie",
        head="Odyssean Helm", body="Ignominy Cuirass +3",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}, neck="Caro Necklace",
        hands="Odyssean Gauntlets", waist="Metalsinger Belt",
        legs={ name="Odyssean Cuisses", augments={'Accuracy+30','Weapon skill damage +4%','AGI+9','Attack+1',}}, feet="Sulevia's Leggings +2",
        ring1="Niqmaddu Ring", ring2="Regal Ring",
        ear1="Ishvara Earring", ear2="Moonshade Earring"}
    sets.precast.WS['Steel Cyclone'].Acc = set_combine(sets.precast.WS.Acc, {
        head="Valorous Mask", body="Valorous Mail",
        neck="Fotia Gorget", waist="Fotia Belt",
        ring1="Ramuh Ring +1", ring2="Ramuh Ring +1",
        ear1="Dignitary's Earring", ear2="Dignitary's Earring"})
		
	sets.precast.WS['Upheaval'] = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
        head="Ignominy Burgonet +3",neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
        body="Ignominy Cuirass +3",hands="Sulevia's Gauntlets +2",ring1="Regal Ring",ring2="Niqmaddu Ring",
        back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},waist="Fotia Gorget",legs="Ignominy Flanchard +3",feet="Sulevia's Leggings +2"})
    sets.precast.WS['Upheaval'].Acc = set_combine(sets.precast.WS.Acc, {
        head="Valorous Mask", body="Valorous Mail",
        neck="Fotia Gorget", waist="Fotia Belt",
        ring1="Ramuh Ring +1", ring2="Ramuh Ring +1",
        ear1="Dignitary's Earring", ear2="Dignitary's Earring"})
		
		--------------------------------------
        -- Custom buff sets
        --------------------------------------
		-- Souleater Active 
		sets.buff.Souleater = set_combine(sets.engaged, {head="Ignominy Burgonet +3"})
end
 
-- Rules
function job_precast(spell, action, spellMap, eventArgs)
 
end

--Customize Defense Set
function customize_defense_set(defenseSet)
    if state.Buff.Doom then
        defenseSet = set_combine(defenseSet, sets.buff.Doom)
    end
 
    return defenseSet
end
 
 -- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    update_combat_form()
    update_melee_groups()
end
 
function update_combat_form()
 
end
 
function update_melee_groups()
    classes.CustomMeleeGroups:clear()
 
    if buffactive['Souleater'] then
        classes.CustomMeleeGroups:append('Souleater')
    end
end
 
-- Functions past here we know work.
 
 
-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
        if LowTierNuke:contains(spell.english) then
            return 'LowTierNuke'
        else
            return 'HighTierNuke'
        end
    end
end
 
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 6)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 7)
    elseif player.sub_job == 'RDM' then
        set_macro_page(1, 7)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 7)
    else
        set_macro_page(1, 6)
    end
end