--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    ico_customicons.lua
--  author:  Dave Rodgers and reworked by tovernaar123
--
--  Copyright (C) 2007.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
-- To add a unit simply add it in the units config table the format is:
-- unit name = path_icon, size.
-- Every entry will auto add a _scav version with the metatable.
-- Tovernaar123 dec 31, 2020
--------------------------------------------------------------------------------

function gadget:GetInfo()
	return {
		name = "CustomIcons",
		desc = "Sets custom unit icons",
		author = "trepan,BrainDamage,TheFatController,Floris,tovernaar123",
		date = "dec 31, 2020", --Yes 1 day before 2021 :P
		license = "GNU GPL, v2 or later",
		layer = -100,
		enabled = true  --  loaded by default?
	}
end


--------------------------------------------------------------------------------

if gadgetHandler:IsSyncedCode() then
	return false
end

--------------------------------------------------------------------------------

local iconScale = 1
if Spring.GetConfigFloat then
	iconScale = Spring.GetConfigFloat("UnitIconScale", 1)
end

local spSetUnitDefIcon = Spring.SetUnitDefIcon
local spFreeUnitIcon = Spring.FreeUnitIcon
local myPlayerID = Spring.GetMyPlayerID()

local units = {
	armaak = { "amphib_t2_aa.png", 1.67999995 },
	armaap = { "factory_air_t2.png", 1.9425 },
	armaas = { "ship_t2_aa.png", 1.73249984 },
	armaca = { "air_t2_worker.png", 1.62749982 },
	armack = { "bot_t2_worker.png", 1.39649999 },
	armacsub = { "sub_t2_worker.png", 1.74299991 },
	armacv = { "vehicle_t2_worker.png", 1.36499989 },
	armadvsol = { "energy2_1.18.png", 1.23899984 },
	armafus = { "energy5_1.85.png", 1.9425 },
	armageo = { "hazardous.png", 1.88999987 },
	armah = { "hover_aa.png", 1.15499997 },
	armalab = { "factory_bot_t2.png", 1.9425 },
	armamb = { "armamb_1.5.png", 1.57499993 },
	armamd = { "antinuke.png", 1.67999995 },
	armamex = { "mex_t1_0.77.png", 0.80849993 },
	armamph = { "armamph_1.3.png", 1.36499989 },
	armamsub = { "factory_amph.png", 1.52250004 },
	armanac = { "hover_gun.png", 1.10249984 },
	armanni = { "armanni_1.95.png", 2.0474999 },
	armap = { "factory_air.png", 1.52250004 },
	armapt3 = { "factory_air_t3.png", 1.52250004 },
	armarad = { "radar_t2_1.2.png", 1.25999999 },
	armart = { "armart_1.png", 1.04999995 },
	armaser = { "bot_t2_jammer.png", 1.34399986 },
	armason = { "radar_t2_1.2.png", 1.25999999 },
	armasp = { "armasp_2.4.png", 2.51999998 },
	armassimilator = { "bot_t3.png", 1.99499989 },
	armasy = { "factory_ship_t2.png", 1.9425 },
	armatl = { "defence_2_naval.png", 1.46999991 },
	armatlas = { "air_trans.png", 1.36499989 },
	armavp = { "factory_vehicle_t2.png", 1.9425 },
	armawac = { "air_t2_radar.png", 1.39649999 },
	armbanth = { "bantha.png", 2.83500004 },
	armbats = { "ship_t2_battleship.png", 2.67749977 },
	armbeamer = { "defence_0_laser2_0.94.png", 0.98699993 },
	armbeaver = { "amphib_worker.png", 1.36499989 },
	armblade = { "air_t2_hover_missile.png", 1.46999991 },
	armbrawl = { "air_t2_hover.png", 1.46999991 },
	armbrtha = { "armbrtha_2.5.png", 2.625 },
	armbull = { "vehicle_t2_tank.png", 1.46999991 },
	armca = { "air_worker.png", 1.25999999 },
	armcarry = { "ship_t2_carrier.png", 2.51999998 },
	armch = { "hover_worker.png", 1.25999999 },
	armcir = { "aa.png", 1.15499997 },
	armck = { "bot_worker.png", 0.99749994 },
	armckfus = { "fusion.png", 1.46999991 },
	armclaw = { "wall_0.4.png", 0.41999999 },
	armcom = { "armcom.png", 1.83749986 },
	armcomboss = { "armcomboss.png", 4.19999981 },
	armconsul = { "armconsul_1.35.png", 1.41750002 },
	armcroc = { "armcroc_1.6.png", 1.67999995 },
	armcrus = { "ship_t2_cruiser.png", 2.25749993 },
	armcs = { "ship_worker.png", 1.39649999 },
	armcsa = { "air_worker.png", 1.25999999 },
	armcv = { "vehicle_worker.png", 0.99749994 },
	armdecade = { "ship_raid.png", 1.15499997 },
	armdecom = { "armcom.png", 1.83749986 },
	armdf = { "fusion.png", 1.46999991 },
	armdfly = { "air_trans.png", 1.83749986 },
	armdl = { "defence_1_naval.png", 1.10249984 },
	armdrag = { "wall_0.4.png", 0.41999999 },
	armemp = { "emp.png", 1.88999987 },
	armepoch = { "ship_t2_flagship.png", 3.46499968 },
	armestor = { "energystorage.png", 1.10249984 },
	armeyes = { "eye.png", 0.89249998 },
	armfark = { "engineer_small.png", 0.94499993 },
	armfast = { "bot_t2_raid.png", 1.15499997 },
	armfatf = { "targetting.png", 1.36499989 },
	armfav = { "vehicle.png", 0.57749999 },
	armfboy = { "armfboy_1.6.png", 1.67999995 },
	armfdrag = { "wall_0.4.png", 0.41999999 },
	armfepocht4 = { "air_t4_flagship.png", 3.3599999 },
	armferret = { "aa.png", 1.15499997 },
	armfflak = { "aa_flak_1.4.png", 1.46999991 },
	armfgate = { "shield.png", 1.57499993 },
	armfhlt = { "defence_1_laser_1.05.png", 1.10249984 },
	armfhp = { "factory_hover.png", 1.52250004 },
	armfido = { "armfido_1.28.png", 1.34399986 },
	armfig = { "air.png", 0.86099994 },
	armflak = { "aa_flak_1.4.png", 1.46999991 },
	armflash = { "vehicle_t1_raid.png", 0.89249998 },
	armflea = { "bot_t1_flea.png", 0.53549999 },
	armfmine3 = { "mine.png", 0.55649996 },
	armfmkr = { "metalmaker_t1_0.75.png", 0.78749996 },
	armfort = { "wall_0.4.png", 0.41999999 },
	armfrad = { "radar_t1_0.9.png", 0.94499993 },
	armfrock = { "aa.png", 0.89249998 },
	armfrt = { "aa.png", 0.89249998 },
	armfus = { "fusion.png", 1.46999991 },
	armgate = { "shield.png", 1.57499993 },
	armgeo = { "energy6_1.3.png", 1.36499989 },
	armgmm = { "fusion.png", 1.46999991 },
	armgplat = { "defence_0_0.8.png", 0.83999997 },
	armgremlin = { "eye.png", 1.23899984 },
	armguard = { "armguard_1.3.png", 1.36499989 },
	armham = { "armham_1.05.png", 1.10249984 },
	armhawk = { "air_t2.png", 1.02899992 },
	armhlt = { "defence_1_laser_1.05.png", 1.10249984 },
	armhp = { "factory_hover.png", 1.52250004 },
	armjam = { "vehicle_t2_jammer.png", 1.36499989 },
	armjamt = { "jammer_t1_0.9.png", 0.94499993 },
	armjanus = { "armjanus_1.2.png", 1.25999999 },
	armjeth = { "armjeth_0.95.png", 0.99749994 },
	armjuno = { "jammer_t2.png", 1.25999999 },
	armkam = { "air_hover.png", 1.25999999 },
	armlab = { "factory_bot.png", 1.52250004 },
	armlance = { "air_t2_torpbomber.png", 1.67999995 },
	armlatnk = { "armlatnk_1.3.png", 1.36499989 },
	armliche = { "air_liche.png", 2.0999999 },
	armllt = { "defence_0_laser_0.8.png", 0.83999997 },
	armlun = { "armlun_1.8.png", 1.88999987 },
	armlunchbox = { "allterrain.png", 2.0474999 },
	armmakr = { "metalmaker_t1_0.75.png", 0.78749996 },
	armmanni = { "armmanni_1.55.png", 1.62749982 },
	armmar = { "amphib_t3.png", 2.20499969 },
	armmark = { "bot_t2_radar.png", 1.34399986 },
	armmart = { "armmart_1.3.png", 1.36499989 },
	armmav = { "armmav_1.3.png", 1.36499989 },
	armmeatball = { "amphib_t3.png", 2.20499969 },
	armmercury = { "aa_longrange_1.8.png", 1.88999987 },
	armmerl = { "armmerl_1.55.png", 1.62749982 },
	armmex = { "mex_t1_0.77.png", 0.80849993 },
	armmh = { "hover_t1_missile.png", 1.41750002 },
	armmine1 = { "mine.png", 0.37799999 },
	armmine2 = { "mine.png", 0.46199998 },
	armmine3 = { "mine.png", 0.55649996 },
	armminivulc = { "armvulc_3.1.png", 1.88999987 },
	armmls = { "shipengineer.png", 1.57499993 },
	armmlv = { "armmlv_1.0.png", 1.04999995 },
	armmmkr = { "metalmaker_t2_1.15.png", 1.20749986 },
	armmoho = { "mex_t2_1.15.png", 1.20749986 },
	armmship = { "ship_t2_missile.png", 2.0999999 },
	armmstor = { "metalstorage.png", 1.10249984 },
	armnanotc = { "armnanotc_0.92.png", 0.96599996 },
	armnanotcplat = { "armnanotcplat_0.92.png", 0.96599996 },
	armpb = { "armpb_1.4.png", 1.46999991 },
	armpeep = { "air_los.png", 0.78749996 },
	armpincer = { "amphib_tank.png", 1.25999999 },
	armplat = { "factory_air.png", 1.52250004 },
	armpnix = { "air_t2_bomber.png", 1.74299991 },
	armpship = { "ship_pship.png", 1.25999999 },
	armpt = { "ship_tiny.png", 0.83999997 },
	armptl = { "aa.png", 0.89249998 },
	armpw = { "bot_t1_raid_0.7.png", 0.73499995 },
	armpwt4 = { "armpwt4.png", 2.30999994 },
	armrad = { "radar_t1_0.9.png", 0.94499993 },
	armrattet4 = { "armrattet4.png", 3.09749985 },
	armraz = { "armraz_1.75.png", 1.83749986 },
	armrecl = { "sub_t2_worker.png", 1.74299991 },
	armrectr = { "bot_t1_tinyworker.png", 0.69300002 },
	armrectrt4 = { "bot_worker.png", 2.0999999 },
	armrl = { "aa.png", 0.89249998 },
	armrock = { "armrock_1.png", 1.04999995 },
	armroy = { "ship_destroyer.png", 1.51199996 },
	armsaber = { "air_hover.png", 1.25999999 },
	armsam = { "vehicle_t1_missile.png", 1.04999995 },
	armsb = { "air_bomber.png", 1.41750002 },
	armscab = { "antinukemobile.png", 1.46999991 },
	armsd = { "seismic.png", 1.46999991 },
	armseap = { "air_torp.png", 1.57499993 },
	armseer = { "vehicle_t2_radar.png", 1.36499989 },
	armsehak = { "air_t2_radar.png", 1.39649999 },
	armserp = { "sub.png", 1.39649999 },
	armsfig = { "air.png", 0.86099994 },
	armsh = { "hover_raid.png", 1.10249984 },
	armshltx = { "factory_gantry.png", 2.51999998 },
	armshltxuw = { "factory_gantry.png", 2.51999998 },
	armsilo = { "nuke.png", 2.51999998 },
	armsjam = { "ship_t2_jammer.png", 1.73249984 },
	armsnipe = { "armsnipe_1.3.png", 1.36499989 },
	armsolar = { "energy1_1.0.png", 1.04999995 },
	armsonar = { "radar_t1_0.9.png", 0.94499993 },
	armspid = { "allterrain_emp.png", 1.04999995 },
	armsptk = { "armsptk_1.44.png", 1.51199996 },
	armsptkt4 = { "armsptkt4.png", 2.30999994 },
	armspy = { "spy.png", 1.18 },
	armstil = { "armstil_1.66.png", 1.74299991 },
	armstone = { "blank.png", 1.04999995 },
	armstump = { "vehicle_t1_tank.png", 1.15499997 },
	armsub = { "sub.png", 1.39649999 },
	armsubk = { "sub.png", 1.39649999 },
	armsy = { "factory_ship.png", 1.52250004 },
	armtarg = { "targetting.png", 1.36499989 },
	armthor = { "armthor.png", 2.4 },
	armthovr = { "hovertrans.png", 1.78499997 },
	armthund = { "air_bomber.png", 1.41750002 },
	armthundt4 = { "armthundt4.png", 3.3599999 },
	armtide = { "energy1_1.0.png", 1.04999995 },
	armtl = { "defence_1_naval.png", 1.10249984 },
	armtorps = { "ship.png", 1.25999999 },
	armtship = { "shiptrans.png", 2.0999999 },
	armuwadves = { "energystorage_t2.png", 1.3125 },
	armuwadvms = { "metalstorage_t2.png", 1.3125 },
	armuwes = { "energystorage.png", 1.10249984 },
	armuwfus = { "fusion.png", 1.46999991 },
	armuwmex = { "mex_t1_0.77.png", 0.80849993 },
	armuwmme = { "mex_t2_1.15.png", 1.20749986 },
	armuwmmm = { "metalmaker_t2_1.15.png", 1.20749986 },
	armuwms = { "metalstorage.png", 1.10249984 },
	armvader = { "armvader_0.9.png", 0.94499993 },
	armvadert4 = { "armvadert4.png", 2.625 },
	armvang = { "allterrain_vanguard_2.4.png", 2.51999998 },
	armveil = { "jammer_t2.png", 1.25999999 },
	armvp = { "factory_vehicle.png", 1.52250004 },
	armvulc = { "armvulc_3.1.png", 3.25499964 },
	armwar = { "armwar_1.15.png", 1.20749986 },
	armwin = { "wind.png", 1.04999995 },
	armyork = { "vehicle_t2_aa.png", 1.36499989 },
	armzeus = { "armzeus_1.28.png", 1.34399986 },
	chicken1 = { "chicken.png", 0.94499993 },
	chicken1b = { "chicken.png", 0.94499993 },
	chicken1c = { "chicken.png", 0.94499993 },
	chicken1d = { "chicken.png", 0.94499993 },
	chicken1x = { "chicken.png", 0.94499993 },
	chicken1y = { "chicken.png", 0.94499993 },
	chicken1z = { "chicken.png", 0.94499993 },
	chicken2 = { "chicken.png", 1.25999999 },
	chicken2b = { "chicken.png", 1.25999999 },
	chicken_dodo1 = { "chicken.png", 0.94499993 },
	chicken_dodo2 = { "chicken.png", 0.94499993 },
	chickena1 = { "chicken.png", 1.57499993 },
	chickena1b = { "chicken.png", 1.57499993 },
	chickena1c = { "chicken.png", 1.57499993 },
	chickena2 = { "chicken.png", 1.57499993 },
	chickena2b = { "chicken.png", 1.57499993 },
	chickenc1 = { "chicken.png", 1.57499993 },
	chickenc2 = { "chicken.png", 1.57499993 },
	chickenc3 = { "chicken.png", 1.25999999 },
	chickenc3b = { "chicken.png", 1.25999999 },
	chickenc3c = { "chicken.png", 1.25999999 },
	chickend1 = { "chicken_roost.png", 1.57499993 },
	chickenf1 = { "chicken_air.png", 1.78499997 },
	chickenf1b = { "chicken_air.png", 1.78499997 },
	chickenf2 = { "chicken_air.png", 1.78499997 },
	chickenh1 = { "chicken.png", 0.94499993 },
	chickenh1b = { "chicken.png", 0.94499993 },
	chickenh2 = { "chicken.png", 1.25999999 },
	chickenh3 = { "chicken.png", 1.25999999 },
	chickenh4 = { "chicken.png", 0.94499993 },
	chickenh5 = { "chicken.png", 1.57499993 },
	chickenp1 = { "chicken.png", 1.57499993 },
	chickenr1 = { "chicken.png", 1.57499993 },
	chickenr2 = { "chicken.png", 1.57499993 },
	chickenr3 = { "chicken.png", 2.72999978 },
	chickens1 = { "chicken.png", 1.25999999 },
	chickens2 = { "chicken.png", 1.57499993 },
	chickens3 = { "chicken_air.png", 1.36499989 },
	chickenw1 = { "chicken_air.png", 1.36499989 },
	chickenw1b = { "chicken_air.png", 1.36499989 },
	chickenw1c = { "chicken_air.png", 1.36499989 },
	chickenw1d = { "chicken_air.png", 1.36499989 },
	chickenw2 = { "chicken_air.png", 1.36499989 },
	chip = { "blank.png", 1.04999995 },
	coraak = { "amphib_t2_aa.png", 1.67999995 },
	coraap = { "factory_air_t2.png", 1.9425 },
	coraca = { "air_t2_worker.png", 1.62749982 },
	corack = { "bot_t2_worker.png", 1.39649999 },
	coracsub = { "sub_t2_worker.png", 1.74299991 },
	coracv = { "vehicle_t2_worker.png", 1.36499989 },
	coradvsol = { "energy2_1.18.png", 1.23899984 },
	corafus = { "energy5_1.85.png", 1.9425 },
	corageo = { "hazardous.png", 1.88999987 },
	corah = { "hover_aa.png", 1.15499997 },
	corak = { "bot_t1_raid_0.7.png", 0.73499995 },
	coralab = { "factory_bot_t2.png", 1.9425 },
	coramph = { "coramph_1.3.png", 1.36499989 },
	coramsub = { "factory_amph.png", 1.52250004 },
	corap = { "factory_air.png", 1.52250004 },
	corape = { "air_t2_hover_missile.png", 1.46999991 },
	corapt3 = { "factory_air_t3.png", 1.52250004 },
	corarad = { "radar_t2_1.2.png", 1.25999999 },
	corarch = { "ship_t2_aa.png", 1.73249984 },
	corason = { "radar_t2_1.2.png", 1.25999999 },
	corasp = { "corasp_2.4.png", 2.51999998 },
	corasy = { "factory_ship_t2.png", 1.9425 },
	coratl = { "defence_2_naval.png", 1.46999991 },
	coravp = { "factory_vehicle_t2.png", 1.9425 },
	corawac = { "air_t2_radar.png", 1.39649999 },
	corban = { "corban_1.6.png", 1.67999995 },
	corbats = { "ship_t2_battleship.png", 2.67749977 },
	corbhmth = { "corbhmth_1.55.png", 1.62749982 },
	corblackhy = { "ship_t2_flagship.png", 3.46499968 },
	corbuzz = { "corbuzz_3.85.png", 4.04249954 },
	corbw = { "air_bladew.png", 0.78749996 },
	corca = { "air_worker.png", 1.25999999 },
	corcan = { "corcan_1.28.png", 1.34399986 },
	corcarry = { "ship_t2_carrier.png", 2.51999998 },
	corcat = { "corcat_1.9.png", 1.99499989 },
	corch = { "hover_worker.png", 1.25999999 },
	corck = { "bot_worker.png", 0.99749994 },
	corcom = { "corcom.png", 1.83749986 },
	corcomboss = { "corcomboss.png", 4.19999981 },
	corcrash = { "corcrash_0.95.png", 0.99749994 },
	corcrus = { "ship_t2_cruiser.png", 2.25749993 },
	corcrw = { "air_krow.png", 2.0999999 },
	corcrwt4 = { "corcrwt4.png", 3.3599999 },
	corcs = { "ship_worker.png", 1.39649999 },
	corcsa = { "air_worker.png", 1.25999999 },
	corcut = { "air_hover.png", 1.25999999 },
	corcv = { "vehicle_worker.png", 0.99749994 },
	cordecom = { "corcom.png", 1.83749986 },
	cordemont4 = { "cordemont4.png", 2.625 },
	cordl = { "defence_1_naval.png", 1.10249984 },
	cordoom = { "cordoom_1.95.png", 2.0474999 },
	cordrag = { "wall_0.4.png", 0.41999999 },
	corenaa = { "aa_flak_1.4.png", 1.46999991 },
	corerad = { "aa.png", 1.15499997 },
	corestor = { "energystorage.png", 1.10249984 },
	coresupp = { "ship_raid.png", 1.15499997 },
	coreter = { "vehicle_t2_jammer.png", 1.36499989 },
	corexp = { "mex_t1_0.77.png", 0.80849993 },
	coreyes = { "eye.png", 0.89249998 },
	corfast = { "corfast_1.3.png", 1.36499989 },
	corfatf = { "targetting.png", 1.36499989 },
	corfav = { "vehicle.png", 0.57749999 },
	corfblackhyt4 = { "air_t4_flagship.png", 3.3599999 },
	corfdrag = { "wall_0.4.png", 0.41999999 },
	corfgate = { "shield.png", 1.57499993 },
	corfhlt = { "defence_1_laser_1.05.png", 1.10249984 },
	corfhp = { "factory_hover.png", 1.52250004 },
	corfink = { "air_los.png", 0.78749996 },
	corflak = { "aa_flak_1.4.png", 1.46999991 },
	corfmd = { "antinuke.png", 1.67999995 },
	corfmine3 = { "mine.png", 0.55649996 },
	corfmkr = { "metalmaker_t1_0.75.png", 0.78749996 },
	corfort = { "wall_0.4.png", 0.41999999 },
	corfrad = { "radar_t1_0.9.png", 0.94499993 },
	corfrock = { "aa.png", 0.89249998 },
	corfrt = { "aa.png", 0.89249998 },
	corfus = { "fusion.png", 1.46999991 },
	corgant = { "factory_gantry.png", 2.51999998 },
	corgantuw = { "factory_gantry.png", 2.51999998 },
	corgarp = { "amphib_tank.png", 1.25999999 },
	corgate = { "shield.png", 1.57499993 },
	corgator = { "vehicle_t1_raid.png", 0.89249998 },
	corgatreap = { "vehicle_t2.png", 1.36499989 },
	corgeo = { "energy6_1.3.png", 1.36499989 },
	corgol = { "corgol_1.75.png", 1.83749986 },
	corgolt4 = { "armrattet4.png", 3.09749985 },
	corgplat = { "defence_0_0.8.png", 0.83999997 },
	corhal = { "corhal_1.33.png", 1.39649999 },
	corhllt = { "defence_0_laser2_0.94.png", 0.98699993 },
	corhlt = { "defence_1_laser_1.05.png", 1.10249984 },
	corhp = { "factory_hover.png", 1.52250004 },
	corhrk = { "corhrk_1.35.png", 1.41750002 },
	corhunt = { "air_t2_radar.png", 1.39649999 },
	corhurc = { "air_t2_bomber.png", 1.74299991 },
	corint = { "corint_2.3.png", 2.41499972 },
	corintr = { "vehicle_trans.png", 1.78499997 },
	corjamt = { "jammer_t1_0.9.png", 0.94499993 },
	corjugg = { "juggernaut.png", 3.14999986 },
	corjuno = { "jammer_t2.png", 1.25999999 },
	corkarg = { "corkarg_2.05.png", 2.15249991 },
	corkarganetht4 = { "corkarganetht4.png", 3.14999986 },
	corkorg = { "mech.png", 3.46499968 },
	corlab = { "factory_bot.png", 1.52250004 },
	corlevlr = { "corlevlr_1.2.png", 1.25999999 },
	corllt = { "defence_0_laser_0.8.png", 0.83999997 },
	cormabm = { "antinukemobile.png", 1.46999991 },
	cormadsam = { "aa.png", 1.15499997 },
	cormakr = { "metalmaker_t1_0.75.png", 0.78749996 },
	cormando = { "commando.png", 1.41750002 },
	cormart = { "cormart_1.3.png", 1.36499989 },
	cormaw = { "wall_0.4.png", 0.41999999 },
	cormex = { "mex_t1_0.77.png", 0.80849993 },
	cormexp = { "mex_t2_1.15.png", 1.20749986 },
	cormh = { "hover_t1_missile.png", 1.41750002 },
	cormine1 = { "mine.png", 0.37799999 },
	cormine2 = { "mine.png", 0.46199998 },
	cormine3 = { "mine.png", 0.55649996 },
	cormine4 = { "mine.png", 0.46199998 },
	corminibuzz = { "corbuzz_3.85.png", 1.88999987 },
	cormist = { "vehicle_t1_missile.png", 1.04999995 },
	cormls = { "shipengineer.png", 1.57499993 },
	cormlv = { "cormlv_1.0.png", 1.04999995 },
	cormmkr = { "metalmaker_t2_1.15.png", 1.20749986 },
	cormoho = { "mex_t2_1.15.png", 1.20749986 },
	cormort = { "cormort_1.3.png", 1.36499989 },
	cormship = { "ship_t2_missile.png", 2.0999999 },
	cormstor = { "metalstorage.png", 1.10249984 },
	cormuskrat = { "amphib_worker.png", 1.36499989 },
	cornanotc = { "cornanotc_0.92.png", 0.96599996 },
	cornanotcplat = { "cornanotcplat_0.92.png", 0.96599996 },
	cornecro = { "bot_t1_tinyworker.png", 0.69300002 },
	corparrow = { "corparrow_1.55.png", 1.62749982 },
	corplat = { "factory_air.png", 1.52250004 },
	corpship = { "ship_pship.png", 1.25999999 },
	corpt = { "ship_tiny.png", 0.83999997 },
	corptl = { "aa.png", 0.89249998 },
	corpun = { "corpun_1.3.png", 1.36499989 },
	corpyro = { "corpyro_1.15.png", 1.20749986 },
	corrad = { "radar_t1_0.9.png", 0.94499993 },
	corraid = { "vehicle_t1_tank.png", 1.15499997 },
	correap = { "vehicle_t2_tank.png", 1.46999991 },
	correcl = { "sub_t2_worker.png", 1.74299991 },
	corrl = { "aa.png", 0.89249998 },
	corroach = { "corroach_0.9.png", 0.94499993 },
	corroy = { "ship_destroyer.png", 1.51199996 },
	corsb = { "air_bomber.png", 1.41750002 },
	corscreamer = { "aa_longrange_1.8.png", 1.88999987 },
	corsd = { "seismic.png", 1.46999991 },
	corseah = { "air_trans.png", 1.83749986 },
	corseal = { "corseal_1.45.png", 1.52250004 },
	corseap = { "air_torp.png", 1.57499993 },
	corsent = { "vehicle_t2_aa.png", 1.36499989 },
	corsfig = { "air.png", 0.86099994 },
	corsh = { "hover_raid.png", 1.10249984 },
	corshad = { "air_bomber.png", 1.41750002 },
	corshark = { "sub_t2.png", 1.78499997 },
	corshiva = { "corshiva_2.1.png", 2.20499969 },
	corshroud = { "jammer_t2.png", 1.25999999 },
	corsilo = { "nuke.png", 2.51999998 },
	corsjam = { "ship_t2_jammer.png", 1.73249984 },
	corsktl = { "mine.png", 0.55649996 },
	corsnap = { "hover_gun.png", 1.10249984 },
	corsok = { "corsok_1.8.png", 1.88999987 },
	corsolar = { "energy1_1.0.png", 1.04999995 },
	corsonar = { "radar_t1_0.9.png", 0.94499993 },
	corspec = { "bot_t2_jammer.png", 1.34399986 },
	corspy = { "spy.png", 1.18 },
	corssub = { "sub.png", 1.39649999 },
	corstone = { "blank.png", 1.04999995 },
	corstorm = { "corstorm_1.png", 1.04999995 },
	corsub = { "sub.png", 1.39649999 },
	corsumo = { "corsumo_1.66.png", 1.74299991 },
	corsy = { "factory_ship.png", 1.52250004 },
	cortarg = { "targetting.png", 1.36499989 },
	cortermite = { "cortermite_1.5.png", 1.57499993 },
	corthovr = { "hovertrans.png", 1.78499997 },
	corthud = { "corthud_1.05.png", 1.10249984 },
	cortide = { "energy1_1.0.png", 1.04999995 },
	cortitan = { "air_t2_torpbomber.png", 1.67999995 },
	cortl = { "defence_1_naval.png", 1.10249984 },
	cortoast = { "cortoast_1.5.png", 1.57499993 },
	cortrem = { "cortrem_1.85.png", 1.9425 },
	cortron = { "tacnuke.png", 1.88999987 },
	cortship = { "shiptrans.png", 2.0999999 },
	coruwadves = { "energystorage_t2.png", 1.3125 },
	coruwadvms = { "metalstorage_t2.png", 1.3125 },
	coruwes = { "energystorage.png", 1.10249984 },
	coruwfus = { "fusion.png", 1.46999991 },
	coruwmex = { "mex_t1_0.77.png", 0.80849993 },
	coruwmme = { "mex_t2_1.15.png", 1.20749986 },
	coruwmmm = { "metalmaker_t2_1.15.png", 1.20749986 },
	coruwms = { "metalstorage.png", 1.10249984 },
	corvalk = { "air_trans.png", 1.36499989 },
	corvamp = { "air_t2.png", 1.02899992 },
	corveng = { "air.png", 0.86099994 },
	corvipe = { "corvipe_1.4.png", 1.46999991 },
	corvoyr = { "bot_t2_radar.png", 1.34399986 },
	corvp = { "factory_vehicle.png", 1.52250004 },
	corvrad = { "vehicle_t2_radar.png", 1.36499989 },
	corvroc = { "corvroc_1.6.png", 1.67999995 },
	corwin = { "wind.png", 1.04999995 },
	corwolv = { "corwolv_1.png", 1.04999995 },
	critter_ant = { "blank.png", 1.04999995 },
	critter_duck = { "blank.png", 1.04999995 },
	critter_goldfish = { "blank.png", 1.04999995 },
	critter_gull = { "blank.png", 1.04999995 },
	critter_penguin = { "blank.png", 1.04999995 },
	critter_penguinbro = { "blank.png", 1.04999995 },
	critter_penguinking = { "blank.png", 1.04999995 },
	dbg_sphere = { "allterrain.png", 1.04999995 },
	dice = { "blank.png", 1.04999995 },
	e_chickenq = { "chicken_queen.png", 4.19999981 },
	epic_chickenq = { "chicken_queen.png", 4.19999981 },
	freefusion = { "fusion.png", 1.46999991 },
	h_chickenq = { "chicken_queen.png", 4.19999981 },
	hat_viking_teamcolored = { "blank.png", 1.83749986 },
	hat_viking_teamcolored = { "building.png", 1.04999995 },
	lootboxbronze = { "lootbox.png", 1.04999995 },
	lootboxgold = { "lootboxt3.png", 1.20749986 },
	lootboxnano_t1_var1 = { "scavnanotc_t1.png", 1.57499993 },
	lootboxnano_t1_var2 = { "scavnanotc_t1.png", 1.57499993 },
	lootboxnano_t1_var3 = { "scavnanotc_t1.png", 1.57499993 },
	lootboxnano_t1_var4 = { "scavnanotc_t1.png", 1.57499993 },
	lootboxnano_t2_var1 = { "scavnanotc_t2.png", 1.96874988 },
	lootboxnano_t2_var2 = { "scavnanotc_t2.png", 1.96874988 },
	lootboxnano_t2_var3 = { "scavnanotc_t2.png", 1.96874988 },
	lootboxnano_t2_var4 = { "scavnanotc_t2.png", 1.96874988 },
	lootboxnano_t3_var1 = { "scavnanotc_t3.png", 2.46749973 },
	lootboxnano_t3_var2 = { "scavnanotc_t3.png", 2.46749973 },
	lootboxnano_t3_var3 = { "scavnanotc_t3.png", 2.46749973 },
	lootboxnano_t3_var4 = { "scavnanotc_t3.png", 2.46749973 },
	lootboxnano_t4_var1 = { "scavnanotc_t4.png", 3.09749985 },
	lootboxnano_t4_var2 = { "scavnanotc_t4.png", 3.09749985 },
	lootboxnano_t4_var3 = { "scavnanotc_t4.png", 3.09749985 },
	lootboxnano_t4_var4 = { "scavnanotc_t4.png", 3.09749985 },
	lootboxplatinum = { "lootboxt4.png", 1.25999999 },
	lootboxsilver = { "lootboxt2.png", 1.15499997 },
	lootdroppod_gold = { "mine.png", 0.55649996 },
	lootdroppod_printer = { "mine.png", 0.55649996 },
	meteor = { "blank.png", 1.04999995 },
	mission_command_tower = { "mission_command_tower.png", 2.46749973 },
	n_chickenq = { "chicken_queen.png", 4.19999981 },
	nuketest = { "aa.png", 0.89249998 },
	nuketestcor = { "aa.png", 0.89249998 },
	nuketestcororg = { "aa.png", 0.89249998 },
	nuketestorg = { "aa.png", 0.89249998 },
	resourcecheat = { "building.png", 1.36499989 },
	roost = { "chicken_roost.png", 1.57499993 },
	scavempspawner = { "aa.png", 0.89249998 },
	scavengerdroppod = { "mine.png", 0.55649996 },
	scavengerdroppodbeacon = { "beacon.png", 1.74299991 },
	scavengerdroppodfriendly = { "mine.png", 0.55649996 },
	scavmist = { "blank.png", 1.04999995 },
	scavmistxl = { "blank.png", 1.04999995 },
	scavmistxxl = { "blank.png", 1.04999995 },
	scavsafeareabeacon = { "beacon.png", 1.74299991 },
	scavtacnukespawner = { "aa.png", 0.89249998 },
	ve_chickenq = { "chicken_queen.png", 4.19999981 },
	vh_chickenq = { "chicken_queen.png", 4.19999981 },
	xmasball = { "blank.png", 1.04999995 },
	xmasball2 = { "blank.png", 1.04999995 },
	corfdoom = { "cordoom_1.95.png", 1.5 },
}

setmetatable(units, { __index =
function(table, key)
	if string.find(key, "_scav") then
		local new_key = key:gsub("_scav", "")
		local normal_icon = units[new_key]
		local new_object;
		if normal_icon then
			local new_path = "inverted/"..normal_icon[1]
			new_object = {new_path, normal_icon[2]} -- new path old
		end
		return new_object
	end
end})

local iconTypes = {}
function addUnitIcon(name, path, size)
    Spring.AddUnitIcon(name, path, size)
    iconTypes[name] = path
end

function loadUnitIcons()
	local root = 'icons/'
	for id, unit in ipairs(UnitDefs) do
		local name = unit.name
		local icon = units[name]
		if icon then
			local path = root..icon[1]
			local size = icon[2]
			spFreeUnitIcon(name) --Free the icon so it can be used
			addUnitIcon(name, path, size * iconScale) -- Create the icon in the enigne
			spSetUnitDefIcon(id, name)  -- Set the unit icon
		else
			Spring.Echo("No icon for: " ..name)
		end
	end
end

function gadget:GotChatMsg(msg, playerID)
	if playerID == myPlayerID then
		if string.sub(msg, 1, 14) == "uniticonscale " then
			iconScale = tonumber(string.sub(msg, 15))
			Spring.SetConfigFloat("UnitIconScale", iconScale)
			loadUnitIcons()
		end
	end
end

function GetIconTypes()
	return iconTypes
end

function gadget:Initialize()
  gadgetHandler:RegisterGlobal('GetIconTypes', GetIconTypes)
  loadUnitIcons()
end

function gadget:Shutdown()
  gadgetHandler:DeregisterGlobal("GetIconTypes")
end 