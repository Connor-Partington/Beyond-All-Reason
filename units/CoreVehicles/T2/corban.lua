return {
	corban = {
		acceleration = 0.0209,
		brakerate = 0.0594,
		buildcostenergy = 20000,
		buildcostmetal = 1000,
		buildpic = "CORBAN.DDS",
		buildtime = 23129,
		canmove = true,
		category = "ALL TANK WEAPON NOTSUB NOTAIR NOTHOVER SURFACE",
		collisionvolumeoffsets = "0 -9 1",
		collisionvolumescales = "42 42 42",
		collisionvolumetype = "CylZ",
		corpse = "DEAD",
		description = "Heavy Missile Tank",
		energymake = 1.1,
		energystorage = 22,
		energyuse = 1.1,
		explodeas = "largeExplosionGeneric",
		footprintx = 4,
		footprintz = 4,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		maxdamage = 2250,
		maxslope = 20,
		maxvelocity = 1.9,
		maxwaterdepth = 20,
		metalstorage = 4,
		movementclass = "HTANK4",
		name = "Banisher",
		nochasecategory = "VTOL",
		objectname = "CORBAN",
		seismicsignature = 0,
		selfdestructas = "largeExplosionGenericSelfd",
		sightdistance = 546,
		trackoffset = 8,
		trackstrength = 10,
		tracktype = "StdTank",
		trackwidth = 42,
		turninplace = true,
		turninplaceanglelimit = 110,
		turninplacespeedlimit = 1.2573,
		turnrate = 375.10001,
		customparams = {
			
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0.597640991211 -2.38606030273 0.928077697754",
				collisionvolumescales = "41.3831787109 15.9763793945 46.5609588623",
				collisionvolumetype = "Box",
				damage = 2000,
				description = "Banisher Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 3,
				footprintz = 3,
				height = 30,
				hitdensity = 100,
				metal = 510,
				object = "corban_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 1500,
				description = "Banisher Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 3,
				footprintz = 3,
				height = 5,
				hitdensity = 100,
				metal = 244,
				object = "3X3A",
                collisionvolumescales = "55.0 4.0 6.0",
                collisionvolumetype = "cylY",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = { 
 			pieceExplosionGenerators = { 
				"deathceg2",
				"deathceg3",
				"deathceg4",
			},
			explosiongenerators = {
				[1] = "custom:rocketflare-large",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			underattack = "warning1",
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
				[1] = "vcormove",
			},
			select = {
				[1] = "vcorsel",
			},
		},
		weapondefs = {
			banisher = {
				areaofeffect = 128,
				avoidfeature = false,
				craterareaofeffect = 128,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.4,
				cegTag = "missiletraillarge",
				explosiongenerator = "custom:genericshellexplosion-large",
				firestarter = 20,
				flighttime = 2.5,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				model = "corban_a",
				name = "Banisher",
				noselfdamage = true,
				range = 800,
				reloadtime = 7.5,
				smoketrail = false,
				soundhit = "corban_b",
				soundhitwet = "splsmed",
				soundhitwetvolume = 0.5,
				soundstart = "corban_a",
				startvelocity = 100,
				tolerance = 9000,
				tracks = true,
				trajectoryheight = 0.45,
				turnrate = 22000,
				turret = true,
				weaponacceleration = 200,
				weapontimer = 5,
				weapontype = "MissileLauncher",
				weaponvelocity = 680,
				damage = {
					commanders = 1000,
					default = 1000,
					subs = 5,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "BANISHER",
				maindir = "0 0 1",
				maxangledif = 270,
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}
