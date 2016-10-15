return {
	cordecom = {
		acceleration = 0.18,
		activatewhenbuilt = true,
		autoheal = 5,
		brakerate = 1.125,
		buildcostenergy = 12891,
		buildcostmetal = 752,
		builddistance = 112,
		builder = true,
		shownanospray = false,
		buildpic = "CORDECOM.DDS",
		buildtime = 26941,
		candgun = true,
		canmove = true,
		cancapture = true,
		capturespeed = 900,
		category = "ALL WEAPON NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE",
		cloakcost = 30,
		cloakcostmoving = 180,
		collisionvolumeoffsets = "0 -1 0",
		collisionvolumescales = "27 39 27",
		collisionvolumetype = "CylY",
		decoyfor = "corcom",
		description = "Decoy Commander",
		energymake = 15,
		energystorage = 50,
		explodeas = "hugeExplosionGeneric",
		footprintx = 2,
		footprintz = 2,
		hidedamage = true,
		icontype = "corcommander",
		idleautoheal = 5,
		idletime = 1800,
		mass = 5000,
		maxdamage = 3000,
		maxslope = 20,
		maxvelocity = 1.25,
		maxwaterdepth = 35,
		metalmake = 0.5,
		metalstorage = 50,
		mincloakdistance = 50,
		movementclass = "AKBOT2",
		name = "Commander",
		nochasecategory = "VTOL",
		objectname = "CORCOM",
		radardistance = 50,
		reclaimable = false,
		seismicsignature = 0,
		selfdestructas = "hugeExplosionGeneric",
		showplayername = true,
		sightdistance = 377,
		terraformspeed = 750,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 0.825,
		turnrate = 1133,
		upright = true,
		workertime = 150,
		buildoptions = {
			[1] = "cormine1",
			[2] = "cormine2",
			[3] = "cormine3",
			[4] = "corsolar",
			[5] = "corwin",
			[6] = "cormstor",
			[7] = "corestor",
			[8] = "cormex",
			[9] = "cormakr",
			[10] = "cortide",
			[11] = "coruwms",
			[12] = "coruwes",
			[13] = "coruwmex",
			[14] = "corfmkr",
		},
		customparams = {
			death_sounds = "generic",
			paralyzemultiplier = 0.025,
		},
		sfxtypes = { 
 			pieceExplosionGenerators = { 
				"deathceg3",
				"deathceg4",
			},
		},
		sounds = {
			build = "nanlath2",
			canceldestruct = "cancel2",
			capture = "capture2",
			repair = "repair2",
			underattack = "warning1",
			working = "reclaim1",
			cant = {
				[1] = "cantdo4",
			},
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			ok = {
				[1] = "kbcormov",
			},
			select = {
				[1] = "kbcorsel",
			},
		},
		weapondefs = {
			armcomlaser = {
				areaofeffect = 12,
				avoidfeature = false,
				beamtime = 0.1,
				corethickness = 0.1,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				cylindertargeting = 1,
				edgeeffectiveness = 0.99,
				explosiongenerator = "custom:genericshellexplosion-small-sparks-burn",
				firestarter = 70,
				impactonly = 1,
				impulseboost = 0,
				impulsefactor = 0,
				laserflaresize = 7,
				name = "J7Laser",
				noselfdamage = true,
				range = 300,
				reloadtime = 0.4,
				rgbcolor = "1 0 0",
				soundhitdry = "",
				soundhitwet = "sizzle",
				soundhitwetvolume = 0.5,
				soundstart = "lasrfir1",
				soundtrigger = 1,
				targetmoveerror = 0.05,
				thickness = 2,
				tolerance = 10000,
				turret = true,
				weapontype = "BeamLaser",
				weaponvelocity = 900,
				damage = {
					bombers = 180,
					default = 75,
					fighters = 110,
					subs = 5,
				},
			},
			decoy_disintegrator = {
				areaofeffect = 32,
				avoidfeature = false,
				avoidfriendly = false,
				avoidground = false,
				commandfire = true,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				energypershot = 50,
				explosiongenerator = "custom:genericshellexplosion-small",
				impulseboost = 0,
				impulsefactor = 0,
				name = "Disintegrator",
				noexplode = true,
				noselfdamage = true,
				range = 250,
				reloadtime = 1.5,
				soundhit = "xplomas2",
				soundhitwet = "sizzle",
				soundhitwetvolume = 0.5,
				soundstart = "disigun1",
				soundtrigger = true,
				tolerance = 10000,
				turret = true,
				weapontimer = 4.2,
				weapontype = "DGun",
				weaponvelocity = 300,
				damage = {
					default = 20,
				},
			},
		},
		weapons = {
			[1] = {
				def = "ARMCOMLASER",
				onlytargetcategory = "NOTSUB",
			},
			[3] = {
				def = "DECOY_DISINTEGRATOR",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}
