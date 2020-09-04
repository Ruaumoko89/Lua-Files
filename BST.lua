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
    state.Buff['Killer Instinct'] = buffactive['Killer Instinct'] or false
end

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    -- Options: Override default values', 'DT')
    state.OffenseMode:options('Normal', 'SubtleDD', 'CounterDT', 'PetDuo', 'DT')
    state.HybridMode:options('Normal', 'PDT')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('DT','PetDT', 'PetDD')
    state.PhysicalDefenseMode:options('PDT', 'MDT')
end
 
-- Define sets and vars used by this job file.
function init_gear_sets()

    sets.precast.JA['Killer Instinct'] = {head="Ankusa Helm +3"}
	sets.precast.JA['Call Beast'] = {hands="Ankusa Gloves +3"}
	sets.precast.JA['Bestial Loyalty'] = {hands="Ankusa Gloves +3"}
    sets.precast.JA['Reward'] = {feet="Ankusa Gaiters +3", legs="Ankusa Trousers", body="Totemic Jackcoat +2", ammo="Pet Food Theta"}
	sets.precast.JA['Familiar'] = {legs="Ankusa Trousers"}
	sets.precast.JA['Ready'] = {hands="Nukumi Manoplas +1"}
	sets.precast.JA['Spur'] = {back="Artio's Mantle"}
	
    -- Fast cast sets for spells
     
    sets.precast.FC = {ammo="Sapience Orb",ear1="Etiolation Earring",ear2="Loquacious Earring",hands="Leyline Gloves",ring1="Rahab Ring",
	                   head="Herculean Helm",body="Passion Jacket",neck="Magoraga Beads",legs="Malignance Tights",feet="Malignance Boots",back="Moonbeam Cape"}
     
    -- Midcast Sets
    sets.midcast.FastRecast = {ammo="Sapience Orb",ear1="Etiolation Earring",ear2="Loquacious Earring",hands="Leyline Gloves",ring1="Prolix Ring",
	                           head="Herculean Helm",body="Passion Jacket",neck="Magoraga Beads"}  
	sets.midcast['Flash'] = {hands="Kurys Gloves", back="Reiki Cloak", legs="Wukong's Hakama +1", feet="Ahosi Leggings", head="Halitus Helm",
	               neck="Warder's Charm +1", ring1="Petrov Ring", ring2="Supershear Ring", body="Emet Harness +1", waist="Sinew Belt",
				   ear1="Friomisi Earring", ear2="Cryptic Earring", ammo="Sapience Orb"}
				   
	sets.midcast.Pet['Sweeping Gouge'] = {head="Emicho Coronet +1", body={ name="Valorous Mail", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Dbl. Atk."+3','Pet: VIT+8',}}, 
	                                 legs="Emicho Hose +1", feet="Emicho Gambieras +1", hands="Nukumi Manoplas +1",
									 back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10','System: 1 ID: 1246 Val: 4',}},
	                                 neck="Bst. Collar +1", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Domesticator's Earring", ring1="Cath Palug Ring"}
	sets.midcast.Pet['Zealous Snort'] = {head="Tali'ah Turban +2", body="Tali'ah Manteel +2", legs="Tali'ah Seraweels +2", feet="Tali'ah Crackows +2", hands="Nukumi Manoplas +1",
	                                      neck="Bst. Collar +1", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Domesticator's Earring"}	
	sets.midcast.Pet['Tickling Tendrils'] = {head="Emicho Coronet +1", body={ name="Valorous Mail", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Dbl. Atk."+3','Pet: VIT+8',}}, 
	                                 legs="Emicho Hose +1", feet="Emicho Gambieras +1", hands="Nukumi Manoplas +1", ammo="Voluspa Tathlum",
	                                 neck="Bst. Collar +1", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Domesticator's Earring", ring1="Tali'ah Ring", ring2="Cath Palug Ring"}
	sets.midcast.Pet['Stink Bomb'] = {head={ name="Valorous Mask", augments={'Pet: "Mag.Atk.Bns."+26','Pet: Haste+1','Pet: INT+9','Pet: Accuracy+3 Pet: Rng. Acc.+3','Pet: Attack+4 Pet: Rng.Atk.+4',}}, 
	                                  body="Udug Jacket", legs={ name="Valor. Hose", augments={'Pet: "Mag.Atk.Bns."+30','Pet: INT+7',}}, feet={ name="Valorous Greaves", augments={'Pet: "Mag.Atk.Bns."+30',}}, 
									  back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Haste+10','System: 1 ID: 1246 Val: 4',}}, ammo="Voluspa Tathlum",
									  hands="Nukumi Manoplas +1", neck="Adad Amulet", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Kyrene's Earring", ring1="Tali'ah Ring", ring2="Cath Palug Ring"}
	sets.midcast.Pet['Pentapeck'] = {head="Emicho Coronet +1", body={ name="Valorous Mail", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Dbl. Atk."+3','Pet: VIT+8',}}, 
	                                 legs="Emicho Hose +1", feet="Emicho Gambieras +1", hands="Nukumi Manoplas +1", ammo="Voluspa Tathlum",
	                                 neck="Bst. Collar +1", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Domesticator's Earring", ring1="Tali'ah Ring", ring2="Cath Palug Ring"}
	sets.midcast.Pet['Chomp Rush'] = {head="Emicho Coronet +1", body={ name="Valorous Mail", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Dbl. Atk."+3','Pet: VIT+8',}}, 
	                                 legs="Emicho Hose +1", feet="Emicho Gambieras +1", hands="Nukumi Manoplas +1", ammo="Voluspa Tathlum",
	                                 neck="Bst. Collar +1", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Domesticator's Earring", ring1="Cath Palug Ring"}
	sets.midcast.Pet['Ripper Fang'] = {head="Emicho Coronet +1", body={ name="Valorous Mail", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Dbl. Atk."+3','Pet: VIT+8',}}, 
	                                 legs="Emicho Hose +1", feet="Emicho Gambieras +1", hands="Nukumi Manoplas +1", ammo="Voluspa Tathlum",
	                                 neck="Bst. Collar +1", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Domesticator's Earring", ring1="Tali'ah Ring", ring2="Cath Palug Ring"}
	sets.midcast.Pet['Corrosive Ooze'] = {head={ name="Valorous Mask", augments={'Pet: "Mag.Atk.Bns."+26','Pet: Haste+1','Pet: INT+9','Pet: Accuracy+3 Pet: Rng. Acc.+3','Pet: Attack+4 Pet: Rng.Atk.+4',}}, 
	                                  body="Udug Jacket", legs={ name="Valor. Hose", augments={'Pet: "Mag.Atk.Bns."+30','Pet: INT+7',}}, feet="Tali'ah Crackows +2",
									  back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10',}}, ammo="Voluspa Tathlum",
									  hands="Nukumi Manoplas +1", neck="Adad Amulet", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Kyrene's Earring", ring1="Tali'ah Ring", ring2="Cath Palug Ring"}
    sets.midcast.Pet['Purulent Ooze'] = {head={ name="Valorous Mask", augments={'Pet: "Mag.Atk.Bns."+26','Pet: Haste+1','Pet: INT+9','Pet: Accuracy+3 Pet: Rng. Acc.+3','Pet: Attack+4 Pet: Rng.Atk.+4',}}, 
	                                  body="Udug Jacket", legs={ name="Valor. Hose", augments={'Pet: "Mag.Atk.Bns."+30','Pet: INT+7',}}, feet="Tali'ah Crackows +2",
									  back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10',}}, ammo="Voluspa Tathlum",
									  hands="Nukumi Manoplas +1", neck="Adad Amulet", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Kyrene's Earring", ring1="Tali'ah Ring", ring2="Cath Palug Ring"}
	sets.midcast.Pet['Foul Waters'] = {head={ name="Valorous Mask", augments={'Pet: "Mag.Atk.Bns."+26','Pet: Haste+1','Pet: INT+9','Pet: Accuracy+3 Pet: Rng. Acc.+3','Pet: Attack+4 Pet: Rng.Atk.+4',}}, 
	                                  body="Udug Jacket", legs={ name="Valor. Hose", augments={'Pet: "Mag.Atk.Bns."+30','Pet: INT+7',}}, feet="Tali'ah Crackows +2",
									  back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10',}}, ammo="Voluspa Tathlum",
									  hands="Nukumi Manoplas +1", neck="Adad Amulet", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Kyrene's Earring", ring1="Tali'ah Ring", ring2="Cath Palug Ring"}
	sets.midcast.Pet['Pestilent Plume'] = {head={ name="Valorous Mask", augments={'Pet: "Mag.Atk.Bns."+26','Pet: Haste+1','Pet: INT+9','Pet: Accuracy+3 Pet: Rng. Acc.+3','Pet: Attack+4 Pet: Rng.Atk.+4',}}, 
	                                  body="Udug Jacket", legs={ name="Valor. Hose", augments={'Pet: "Mag.Atk.Bns."+30','Pet: INT+7',}}, feet="Tali'ah Crackows +2",
									  back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10',}}, ammo="Voluspa Tathlum",
									  hands="Nukumi Manoplas +1", neck="Adad Amulet", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Kyrene's Earring", ring1="Tali'ah Ring", ring2="Cath Palug Ring"}
	sets.midcast.Pet['Sheep Song'] = {head="Tali'ah Turban +2", body="udug Jacket", legs="Tali'ah Seraweels +2", feet="Tali'ah Crackows +2", hands="Nukumi Manoplas +1",
	                                      neck="Adad Amulet", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Domesticator's Earring", ring2="Cath Palug Ring"}
	sets.midcast.Pet['Rage'] = {hands="Nukumi Manoplas +1"}	
	sets.midcast.Pet['Rhinowrecker'] = {head="Emicho Coronet +1", body={ name="Valorous Mail", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Dbl. Atk."+3','Pet: VIT+8',}}, 
	                                 legs="Emicho Hose +1", feet="Emicho Gambieras +1", hands="Nukumi Manoplas +1",
									 back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10','System: 1 ID: 1246 Val: 4',}},
	                                 neck="Bst. Collar +1", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Domesticator's Earring", ring1="Cath Palug Ring", ring2="Tali'ah Ring"}
	sets.midcast.Pet['Venom Shower'] = {head={ name="Valorous Mask", augments={'Pet: "Mag.Atk.Bns."+26','Pet: Haste+1','Pet: INT+9','Pet: Accuracy+3 Pet: Rng. Acc.+3','Pet: Attack+4 Pet: Rng.Atk.+4',}}, 
	                                  body="Udug Jacket", legs={ name="Valor. Hose", augments={'Pet: "Mag.Atk.Bns."+30','Pet: INT+7',}}, feet="Tali'ah Crackows +2", 
									  back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10',}}, ammo="Voluspa Tathlum",
									  hands="Nukumi Manoplas +1", neck="Adad Amulet", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Kyrene's Earring", ring1="Tali'ah Ring", ring2="Cath Palug Ring"}
	sets.midcast.Pet['Scissor Guard'] = {hands="Nukumi Manoplas +1"}	
	sets.midcast.Pet['Bubble Curtain'] = {hands="Nukumi Manoplas +1"}
	sets.midcast.Pet['Metallic Body'] = {hands="Nukumi Manoplas +1"}
	sets.midcast.Pet['Mega Scissors'] = {head="Emicho Coronet +1", body={ name="Valorous Mail", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Dbl. Atk."+3','Pet: VIT+8',}}, 
	                                 legs="Emicho Hose +1", feet="Emicho Gambieras +1", hands="Nukumi Manoplas +1",
									 back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10','System: 1 ID: 1246 Val: 4',}},
	                                 neck="Bst. Collar +1", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Domesticator's Earring", ring1="Cath Palug Ring", ring2="Tali'ah Ring"}	
	sets.midcast.Pet['Hoof Volley'] = {head="Emicho Coronet +1", body={ name="Valorous Mail", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Dbl. Atk."+3','Pet: VIT+8',}}, 
	                                 legs="Emicho Hose +1", feet="Emicho Gambieras +1", hands="Nukumi Manoplas +1",
									 back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10','System: 1 ID: 1246 Val: 4',}},
	                                 neck="Bst. Collar +1", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Domesticator's Earring", ring1="Cath Palug Ring", ring2="Tali'ah Ring"}	
	sets.midcast.Pet['Choke Breath'] = {head={ name="Valorous Mask", augments={'Pet: "Mag.Atk.Bns."+26','Pet: Haste+1','Pet: INT+9','Pet: Accuracy+3 Pet: Rng. Acc.+3','Pet: Attack+4 Pet: Rng.Atk.+4',}}, 
	                                  body="Udug Jacket", legs={ name="Valor. Hose", augments={'Pet: "Mag.Atk.Bns."+30','Pet: INT+7',}}, feet={ name="Valorous Greaves", augments={'Pet: "Mag.Atk.Bns."+30',}}, 
									  back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10',}}, ammo="Voluspa Tathlum",
									  hands="Nukumi Manoplas +1", neck="Adad Amulet", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Kyrene's Earring", ring1="Tali'ah Ring", ring2="Cath Palug Ring"}
	sets.midcast.Pet['Jettatura'] = {head="Tali'ah Turban +2", body="Udug Jacket", legs="Tali'ah Seraweels +2", feet="Tali'ah Crackows +2", 
									  back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10',}}, ammo="Voluspa Tathlum",
									  hands="Nukumi Manoplas +1", neck="Adad Amulet", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Kyrene's Earring", ring1="Tali'ah Ring", ring2="Cath Palug Ring"}
	sets.midcast.Pet['Nihility Song'] = {head="Tali'ah Turban +2", body="Udug Jacket", legs="Tali'ah Seraweels +2", feet="Tali'ah Crackows +2", 
									  back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10',}}, ammo="Voluspa Tathlum",
									  hands="Nukumi Manoplas +1", neck="Adad Amulet", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Kyrene's Earring", ring1="Tali'ah Ring", ring2="Cath Palug Ring"}
	sets.midcast.Pet['Fantod'] = {hands="Nukumi Manoplas +1"}
	sets.midcast.Pet['Blaster'] = {head="Tali'ah Turban +2", body="Udug Jacket", legs="Tali'ah Seraweels +2", feet="Tali'ah Crackows +2", 
									  back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10',}}, ammo="Voluspa Tathlum",
									  hands="Nukumi Manoplas +1", neck="Adad Amulet", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Kyrene's Earring", ring1="Tali'ah Ring", ring2="Cath Palug Ring"}
	sets.midcast.Pet['Chaotic Eye'] = {head="Tali'ah Turban +2", body="Udug Jacket", legs="Tali'ah Seraweels +2", feet="Tali'ah Crackows +2", 
									  back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10',}}, ammo="Voluspa Tathlum",
									  hands="Nukumi Manoplas +1", neck="Adad Amulet", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Kyrene's Earring", ring1="Tali'ah Ring", ring2="Cath Palug Ring"}
	sets.midcast.Pet['Frenzied Rage'] = {hands="Nukumi Manoplas +1"}
	sets.midcast.Pet['Charged Whisker'] = {head={ name="Valorous Mask", augments={'Pet: "Mag.Atk.Bns."+26','Pet: Haste+1','Pet: INT+9','Pet: Accuracy+3 Pet: Rng. Acc.+3','Pet: Attack+4 Pet: Rng.Atk.+4',}}, 
	                                  body="Udug Jacket", legs={ name="Valor. Hose", augments={'Pet: "Mag.Atk.Bns."+30','Pet: INT+7',}}, feet="Tali'ah Crackows +2", 
									  back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10',}}, ammo="Voluspa Tathlum",
									  hands="Nukumi Manoplas +1", neck="Adad Amulet", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Kyrene's Earring", ring1="Tali'ah Ring", ring2="Cath Palug Ring"}
	sets.midcast.Pet['Crossthrash'] = {head="Emicho Coronet +1", body={ name="Valorous Mail", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Dbl. Atk."+3','Pet: VIT+8',}}, 
	                                 legs="Emicho Hose +1", feet="Emicho Gambieras +1", hands="Nukumi Manoplas +1",
									 back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10','System: 1 ID: 1246 Val: 4',}},
	                                 neck="Bst. Collar +1", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Domesticator's Earring", ring1="Cath Palug Ring", ring2="Tali'ah Ring"}
	sets.midcast.Pet['Roar'] = {head="Tali'ah Turban +2", body="Udug Jacket", legs="Tali'ah Seraweels +2", feet="Tali'ah Crackows +2", 
									  back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10',}}, ammo="Voluspa Tathlum",
									  hands="Nukumi Manoplas +1", neck="Adad Amulet", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Kyrene's Earring", ring1="Tali'ah Ring", ring2="Cath Palug Ring"}
	sets.midcast.Pet['Predatory Glare'] = {head="Tali'ah Turban +2", body="Udug Jacket", legs="Tali'ah Seraweels +2", feet="Tali'ah Crackows +2", 
									  back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10',}}, ammo="Voluspa Tathlum",
									  hands="Nukumi Manoplas +1", neck="Adad Amulet", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Kyrene's Earring", ring1="Tali'ah Ring", ring2="Cath Palug Ring"}
	sets.midcast.Pet['Fireball'] = {head={ name="Valorous Mask", augments={'Pet: "Mag.Atk.Bns."+26','Pet: Haste+1','Pet: INT+9','Pet: Accuracy+3 Pet: Rng. Acc.+3','Pet: Attack+4 Pet: Rng.Atk.+4',}}, 
	                                  body="Udug Jacket", legs={ name="Valor. Hose", augments={'Pet: "Mag.Atk.Bns."+30','Pet: INT+7',}}, feet="Tali'ah Crackows +2", 
									  back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10',}}, ammo="Voluspa Tathlum",
									  hands="Nukumi Manoplas +1", neck="Adad Amulet", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Kyrene's Earring", ring1="Tali'ah Ring", ring2="Cath Palug Ring"}
	sets.midcast.Pet['Digest'] = {head={ name="Valorous Mask", augments={'Pet: "Mag.Atk.Bns."+26','Pet: Haste+1','Pet: INT+9','Pet: Accuracy+3 Pet: Rng. Acc.+3','Pet: Attack+4 Pet: Rng.Atk.+4',}}, 
	                                  body="Udug Jacket", legs={ name="Valor. Hose", augments={'Pet: "Mag.Atk.Bns."+30','Pet: INT+7',}}, feet="Tali'ah Crackows +2", 
									  back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10',}}, ammo="Voluspa Tathlum",
									  hands="Nukumi Manoplas +1", neck="Adad Amulet", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Kyrene's Earring", ring1="Tali'ah Ring", ring2="Cath Palug Ring"}
	sets.midcast.Pet['Fluid Spread'] = {head="Emicho Coronet +1", body={ name="Valorous Mail", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Dbl. Atk."+3','Pet: VIT+8',}}, 
	                                 legs="Emicho Hose +1", feet="Emicho Gambieras +1", hands="Nukumi Manoplas +1",
									 back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10','System: 1 ID: 1246 Val: 4',}},
	                                 neck="Bst. Collar +1", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Domesticator's Earring", ring1="Cath Palug Ring", ring2="Tali'ah Ring"}
	sets.midcast.Pet['Fluid Toss'] = {head="Emicho Coronet +1", body={ name="Valorous Mail", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Dbl. Atk."+3','Pet: VIT+8',}}, 
	                                 legs="Emicho Hose +1", feet="Emicho Gambieras +1", hands="Nukumi Manoplas +1",
									 back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10','System: 1 ID: 1246 Val: 4',}},
	                                 neck="Bst. Collar +1", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Domesticator's Earring", ring1="Cath Palug Ring", ring2="Tali'ah Ring"}
	sets.midcast.Pet['TP Drainkiss'] = {head="Tali'ah Turban +2", body="Udug Jacket", legs="Tali'ah Seraweels +2", feet="Tali'ah Crackows +2", 
									  back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10',}}, ammo="Voluspa Tathlum",
									  hands="Nukumi Manoplas +1", neck="Adad Amulet", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Kyrene's Earring", ring1="Tali'ah Ring", ring2="Cath Palug Ring"}
	sets.midcast.Pet['Acid Mist'] = {head="Tali'ah Turban +2", body="Udug Jacket", legs="Tali'ah Seraweels +2", feet="Tali'ah Crackows +2", 
									  back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10',}}, ammo="Voluspa Tathlum",
									  hands="Nukumi Manoplas +1", neck="Adad Amulet", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Kyrene's Earring", ring1="Tali'ah Ring", ring2="Cath Palug Ring"}
	sets.midcast.Pet['Suction'] = {head="Tali'ah Turban +2", body="Udug Jacket", legs="Tali'ah Seraweels +2", feet="Tali'ah Crackows +2", 
									  back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10','Pet: "Regen"+10',}}, ammo="Voluspa Tathlum",
									  hands="Nukumi Manoplas +1", neck="Adad Amulet", waist="Incarnation Sash", ear1="Enmerkar Earring", ear2="Kyrene's Earring", ring1="Tali'ah Ring", ring2="Cath Palug Ring"}
	
         
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {head="Argosy Celata +1", body="Argosy Hauberk +1", back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
		neck="Fotia Gorget", hands="Argosy Mufflers +1", waist="Fotia Belt", legs="Argosy Breeches +1", feet="Argosy Sollerets +1", ring1="Regal Ring", ring2="Gere Ring", ear1="Telos Earring", ear2="Brutal Earring"} 
 
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Decimation"] = {head="Argosy Celata +1", body="Argosy Hauberk +1", back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}, ammo="Voluspa Tathlum",
		neck="Fotia Gorget", hands="Argosy Mufflers +1", waist="Fotia Belt", legs="Argosy Breeches +1", feet="Argosy Sollerets +1", ring1="Regal Ring", ring2="Gere Ring", ear1="Sherida Earring", ear2="Brutal Earring"}
		 
	sets.precast.WS["Ruinator"] = {head="Argosy Celata +1", body="Argosy Hauberk +1", back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}, ammo="Voluspa Tathlum",
		neck="Fotia Gorget", hands="Argosy Mufflers +1", waist="Fotia Belt", legs="Argosy Breeches +1", feet="Argosy Sollerets +1", ring1="Regal Ring", ring2="Gere Ring", ear1="Telos Earring", ear2="Brutal Earring"}
		 
	sets.precast.WS["Rampage"] = {head="Lustratio Cap +1", body="Argosy Hauberk +1", back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
		neck="Fotia Gorget", hands="Lustratio Mittens +1", waist="Fotia Belt", legs="Lustratio Subligar +1", feet="Lustratio Leggings +1", ring1="Regal Ring", ring2="Gere Ring", ear1="Telos Earring", ear2="Brutal Earring"}
	
	sets.precast.WS["Mistral Axe"] = {head="Ankusa Helm +3", body="Argosy Hauberk +1", ammo="Voluspa Tathlum",
	    back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}, ring1="Regal Ring", ring2="Gere Ring", ear1="Thrud Earring", ear2="Moonshade Earring",
		neck="Caro Necklace", hands="Meghanada Gloves +2", waist="Metalsinger Belt", legs="Argosy Breeches +1", feet="Argosy Sollerets +1"}
	
	sets.precast.WS["Calamity"] = {head="Ankusa Helm +3", body="Argosy Hauberk +1", ammo="Voluspa Tathlum",
	    back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}, ring1="Regal Ring", ring2="Gere Ring", ear1="Thrud Earring", ear2="Moonshade Earring",
		neck="Caro Necklace", hands="Meghanada Gloves +2", waist="Metalsinger Belt", legs="Argosy Breeches +1", feet="Argosy Sollerets +1"}
																	 
    sets.precast.WS["Bora Axe"] = {head="Ankusa Helm +3", body={ name="Valorous Mail", augments={'Accuracy+29','Weapon skill damage +2%','STR+10','Attack+10',}}, 
	    back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}, ring1="Regal Ring", ring2="Gere Ring", ear1="Ishvara Earring", ear2="Moonshade Earring",
		neck="Caro Necklace", hands="Meghanada Gloves +2", waist="Metalsinger Belt", legs="Argosy Breeches +1", feet="Argosy Sollerets +1"}	 
		
	sets.precast.WS["Cloudsplitter"] = {ammo="Pemphredo Tathlum",
        head={ name="Valorous Mask", augments={'"Mag.Atk.Bns."+26','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
		hands="Valorous Mitts",
        legs="Augury Cuisses +1", back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
        feet={ name="Valorous Greaves", augments={'Pet: INT+2','Pet: Accuracy+19 Pet: Rng. Acc.+19','Weapon skill damage +7%','Accuracy+15 Attack+15','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
        neck="Sanctity Necklace", body="Sacro Breastplate", waist="Eschan Stone", left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Thrud Earring", left_ring="Regal Ring", right_ring="Gere Ring"}
	
	sets.precast.WS["Primal Rend"] = {ammo="Pemphredo Tathlum",
        head={ name="Valorous Mask", augments={'"Mag.Atk.Bns."+26','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
		hands="Valorous Mitts",
        legs="Augury Cuisses +1", back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
        feet={ name="Valorous Greaves", augments={'Pet: INT+2','Pet: Accuracy+19 Pet: Rng. Acc.+19','Weapon skill damage +7%','Accuracy+15 Attack+15','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
        neck="Sanctity Necklace", body="Sacro Breastplate", waist="Eschan Stone", left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Thrud Earring", left_ring="Regal Ring", right_ring="Gere Ring"}
		
	sets.precast.WS["Savage Blade"] = {head="Ankusa Helm +3", body={ name="Valorous Mail", augments={'Accuracy+29','Weapon skill damage +2%','STR+10','Attack+10',}}, ammo="Voluspa Tathlum",
	    back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}, ring1="Regal Ring", ring2="Gere Ring", ear1="Thrud Earring", ear2="Moonshade Earring",
		neck="Caro Necklace", hands="Meghanada Gloves +2", waist="Metalsinger Belt", legs="Argosy Breeches +1", feet="Argosy Sollerets +1"}
		 
     
    -- Resting sets
    sets.resting = {head="Yaoyotl Helm",neck="Wiglen Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Ares' cuirass +1",hands="Cizin Mufflers",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Letalis Mantle",waist="Goading Belt",legs="Blood Cuisses",feet="Ejekamal Boots"}
     
 
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle.Town = {head="Malignance Chapeau", neck="Loricate Torque +1", ear1="Odnowa Earring +1", ear2="Odnowa Earring",	
           body="Malignance Tabard", hands="Malignance Gloves", waist="Flume Belt",
           legs="Malignance Tights", feet="Malignance Boots", left_ring="Defending Ring", right_ring="Gelatinous Ring +1"}
     
    sets.idle.DT = {
        head="Malignance Chapeau", neck="Loricate Torque +1", ear1="Odnowa Earring +1", ear2="Odnowa Earring",	
           body="Malignance Tabard", hands="Malignance Gloves", waist="Flume Belt",
           legs="Malignance Tights", feet="Malignance Boots", left_ring="Defending Ring", right_ring="Gelatinous Ring +1"}
		 
	sets.idle.PetDT = {head="Malignance Chapeau", neck="Shepherd's Chain", ear1="Enmerkar Earring", ear2="Rimeice Earring",	
           body="Totemic Jackcoat +3", hands="Ankusa Gloves +3", waist="Isa Belt", ammo="Staunch Tathlum +1",
		   back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Haste+10','System: 1 ID: 1246 Val: 4',}},
           legs="Tali'ah Seraweels +2", feet="Ankusa Gaiters +3", left_ring="Defending Ring", right_ring="C. Palug Ring"}
		   
	sets.idle.PetDD = {ammo="Voluspa Tathlum",
           head={ name="Emicho Coronet +1", augments={'Pet: Accuracy+20','Pet: Attack+20','Pet: "Dbl. Atk."+4',}},
           body={ name="Valorous Mail", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Dbl. Atk."+3','Pet: VIT+8',}},
           hands={ name="Emi. Gauntlets +1", augments={'Accuracy+25','"Dual Wield"+6','Pet: Accuracy+25',}},
           legs={ name="Emicho Hose +1", augments={'Pet: Accuracy+20','Pet: Attack+20','Pet: "Dbl. Atk."+4',}},
           feet={ name="Emi. Gambieras +1", augments={'Pet: Accuracy+20','Pet: Attack+20','Pet: "Dbl. Atk."+4',}}, neck={ name="Bst. Collar +1", augments={'Path: A',}},
		   back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Haste+10','System: 1 ID: 1246 Val: 4',}},
           waist="Incarnation Sash", left_ear="Enmerkar Earring", right_ear="Domes. Earring", left_ring="Tali'ah Ring", right_ring="C. Palug Ring"}
 
    -- Engaged sets
 
    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
     
    -- Normal melee group
    sets.engaged = {legs="Meghanada Chausses +2", 
	    feet="Valorous Greaves", neck="Anu Torque", waist="Sailfi Belt +1", left_ear="Sherida Earring", ammo="Paeapua",
        right_ear="Suppanomimi", left_ring="Epona's Ring", right_ring="Gere Ring", head="Skormoth Mask", body="Tali'ah Manteel +2",
		back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','System: 1 ID: 640 Val: 4',}}, hands="Emicho Gauntlets +1"}
	sets.engaged.SubtleDD = {legs="Meghanada Chausses +2", feet="Valorous Greaves", neck="Bathy Choker +1", waist="Sailfi Belt +1", 
	    left_ear="Sherida Earring", ammo="Paeapua",
        right_ear="Eabani Earring", left_ring="Epona's Ring", right_ring="Gere Ring", head="Skormoth Mask", body="Sacro Breastplate",
		back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','System: 1 ID: 640 Val: 4',}}, hands="Emicho Gauntlets +1"}
	sets.engaged.CounterDT = {legs="Malignance Tights", feet="Malignance Boots", neck="Bathy Choker +1", waist="Sailfi Belt +1", left_ear="Sherida Earring", ammo="Staunch Tathlum +1",
        right_ear="Eabani Earring", left_ring="Defending Ring", right_ring="Moonbeam Ring", head="Malignance Chapeau", body="Sacro Breastplate",
		back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','System: 1 ID: 640 Val: 4',}}, hands="Emicho Gauntlets +1"}
	sets.engaged.PetDuo = {legs="Emicho Hose +1", feet="Tali'ah Crackows +2", neck="Bst. Collar +1", waist="Sailfi Belt +1", left_ear="Sherida Earring",
        right_ear="Suppanomimi", left_ring="Epona's Ring", right_ring="Gere Ring", ammo="Ginsen", head="Emicho Coronet +1", body="Tali'ah Manteel +2",
		back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}, hands="Emicho Gauntlets +1"}
	sets.engaged.DT = {ammo="Staunch Tathlum +1", neck="Anu Torque", waist="Sailfi Belt +1", left_ear="Eabani Earring", right_ear="Sherida Earring", 
        head="Malignance Chapeau", body="Malignance Tabard", hands="Emicho Gauntlets +1",
		back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
        legs="Malignance Tights", feet="Malignance Boots", left_ring="Defending Ring", right_ring="Moonbeam Ring"}
		
	sets.buff['Killer Instinct'] = {head="Ankusa Helm +3", body="Nukumi Gausape +1"}
	
end
    
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------
 
-- Set eventArgs.handled to true if we don't want any automatic target handling to be done.
function job_pretarget(spell, action, spellMap, eventArgs)
 
end

function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type == "WeaponSkill" then
        if state.Buff['Killer Instinct'] then
            equip(sets.buff['Killer Instinct'])
		elseif state.Buff['Holy Circle'] then
		    equip(sets.buff['Killer Instinct'])
		elseif state.Buff['Arcane Circle'] then
		    equip(sets.buff['Killer Instinct'])
		elseif state.Buff['Warding Circle'] then
		    equip(sets.buff['Killer Instinct'])
		elseif state.Buff['Ancient Circle'] then
		    equip(sets.buff['Killer Instinct'])
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