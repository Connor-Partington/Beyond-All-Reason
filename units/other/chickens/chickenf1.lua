return {
	chickenf1 = {
		acceleration = 0.8,
		airhoverfactor = 0,
		attackrunlength = 32,
		bmcode = "1",
		brakerate = 0.4,
		buildcostenergy = 4550,
		buildcostmetal = 212,
		builder = false,
		buildpic = "chickens/chickenf1.dds",
		buildtime = 6250,
		canattack = true,
		canfly = true,
		canguard = true,
		canland = true,
		canmove = true,
		canpatrol = true,
		canstop = "1",
		cansubmerge = true,
		category = "ALL MOBILE WEAPON NOTLAND VTOL NOTSUB NOTSHIP NOTHOVER CHICKEN",
		collide = false,
		collisionvolumeoffsets = "0 8 -2",
		collisionvolumescales = "70 14 48",
		collisionvolumetype = "box",
		corpse = "chicken_egg",
		cruisealt = 240,
		defaultmissiontype = "Standby",
		description = "Flying Chicken Bomber",
		explodeas = "TALON_DEATH",
		footprintx = 3,
		footprintz = 3,
		hidedamage = 1,
		idleautoheal = 5,
		idletime = 0,
		maneuverleashlength = "20000",
		mass = 227.5,
		maxdamage = 1350,
		maxvelocity = 6.2,
		moverate1 = "32",
		name = "Talon",
		noautofire = false,
		nochasecategory = "VTOL",
		objectname = "ChickenDefenseModels/chickenf.s3o",
		script = "ChickenDefenseScripts/chickenf1.cob",
		seismicsignature = 0,
		selfdestructas = "TALON_DEATH",
		side = "THUNDERBIRDS",
		sightdistance = 1000,
		smoothanim = true,
		steeringmode = "2",
		tedclass = "VTOL",
		turninplace = true,
		turnrate = 1600,
		unitname = "chickenf1",
		workertime = 0,
		customparams = {
			subfolder = "other/chickens/",
		},
		featuredefs = {
			dead = {},
			heap = {},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:blood_spray",
				[2] = "custom:blood_explode",
				[3] = "custom:dirt",
			},
		},
		weapondefs = {
			weapon = {
				accuracy = 1000,
				areaofeffect = 128,
				avoidfeature = false,
				avoidfriendly = false,
				burst = 8,
				burstrate = 0.24,
				collidefriendly = false,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.3,
				explosiongenerator = "custom:gundam_MISSILE_EXPLOSION",
				impulseboost = 1,
				impulsefactor = 1,
				interceptedbyshieldtype = 0,
				model = "ChickenDefenseModels/chickeneggyellow.s3o",
				name = "GooBombs",
				noselfdamage = true,
				range = 800,
				reloadtime = 7,
				soundhit = "chickens/junohit2edit",
				sprayangle = 2000,
				weapontype = "AircraftBomb",
				damage = {
					default = 310,
					hvyboats = 310,
				},
			},
		},
		weapons = {
			[1] = {
				def = "WEAPON",
			},
		},
	},
}
