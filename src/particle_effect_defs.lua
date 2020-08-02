PARTICLE_EFFECT_DEFS = {
	['hit-entity'] = {	
		name = 'hit-entity',

		-- sword's edge rbg (172, 193, 198)
		-- a little lighter?
		r1 = 192,
		g1 = 213,
		b1 = 218,

		r2 = 192,
		g2 = 213,
		b2 = 218,

		direction = 'up',
		size = 2,
		n = 8,
		duration = 0.5,
		spreadX = 2,
		spreadY = 4
	},

	['break-object'] = {
		name = 'break-object',

		-- pot rgb(79, 144, 149)
		-- a little darker for pot breaking particles?
		r1 = 59,
		g1 = 124,
		b1 = 129,

		r2 = 0,
		g2 = 0,
		b2 = 0,

		direction = 'down',
		size = 1,
		n = 32,
		duration = 0.75,
		spreadX = 4,
		spreadY = 2
	}
}