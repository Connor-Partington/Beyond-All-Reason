return {
	leginf = {
		acceleration = 0.0098,
		brakerate = 0.0196,
		buildcostenergy = 30000,
		buildcostmetal = 2000,
		buildpic = "LEGINF.DDS",
		buildtime = 33000,
		canmove = true,
		category = "ALL WEAPON NOTSUB NOTAIR NOTHOVER SURFACE TANK EMPABLE",
		collisionvolumeoffsets = "0 -5 3",
		collisionvolumescales = "37 51 51",
		collisionvolumetype = "Box",
		corpse = "DEAD",
		explodeas = "hugeexplosiongeneric",
		footprintx = 4,
		footprintz = 4,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		mass = 5001,
		maxdamage = 3300,
		--maxreversevelocity = 0.762,
		maxslope = 14,
		maxvelocity = 1.25,
		maxwaterdepth = 15,
		movementclass = "HTANK4",
		nochasecategory = "VTOL",
		objectname = "Units/scavboss/leginf.s3o",
		script = "Units/scavboss/LEGINF.cob",
		seismicsignature = 0,
		selfdestructas = "hugeExplosionGenericSelfd",
		sightdistance = 351,
		trackoffset = -8,
		trackstrength = 8,
		tracktype = "corwidetracks",
		trackwidth = 50,
		turninplace = true,
		turninplaceanglelimit = 90,
		turninplacespeedlimit = 0.95832,
		turnrate = 169.39999,
		customparams = {
			unitgroup = 'weapon',
			model_author = "Mr Bob",
			normaltex = "unittextures/cor_normal.dds",
			subfolder = "corvehicles/t2",
			techlevel = 2,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "1.25984954834 -1.01012474365 0.475593566895",
				collisionvolumescales = "55.5426483154 42.2261505127 61.5749359131",
				collisionvolumetype = "Box",
				damage = 2000,
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 8,
				hitdensity = 100,
				metal = 1200,
				object = "Units/scavboss/leginf_dead.s3o",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "35.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 1500,
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 2,
				hitdensity = 100,
				metal = 550,
				object = "Units/cor2X2B.s3o",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:barrelshot-medium",
			},
			pieceexplosiongenerators = {
				[1] = "deathceg2",
				[2] = "deathceg3",
				[3] = "deathceg4",
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
				[1] = "tcormove",
			},
			select = {
				[1] = "tcorsel",
			},
		},
		weapondefs = {
			rapidnapalm = {
				areaofeffect = 90,
				avoidfeature = false,
				cegtag = "burnflame",
				colormap = "0.5 0.95 0.9 0.032   0.25 0.55 0.40 0.028   0.15 0.28 0.19 0.024   0.016 0.018 0.011 0.04   0.0 0.0 0.0 0.01",
				craterareaofeffect = 90,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				explosiongenerator = "custom:burnblack",
				flamegfxtime = 1,
				gravityaffected = "true",
				impulseboost = 0.123,
				impulsefactor = 0.123,
				--mygravity = 0.2,
				name = "HeavyCannon",
				noselfdamage = true,
				projectiles = 3,
				range = 1050,
				reloadtime = 0.6,
				rgbcolor = "1 0.25 0.1",
				size = 2,
				soundhitdry = "flamhit1",
				soundhitwet = "sizzle",
				soundstart = "cannhvy2",
				sprayangle = 2500,
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 300,
				damage = {
					bombers = 10,
					default = 30,
					fighters = 10,
					subs = 10,
					vtol = 10,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "RAPIDNAPALM",
				maindir = "0 0 1",
				maxangledif = 180,
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
