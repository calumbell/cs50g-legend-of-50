--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

GAME_OBJECT_DEFS = {
    ['switch'] = {
        type = 'switch',
        texture = 'switches',
        frame = 2,
        width = 16,
        height = 16,
        solid = false,
        breakable = false,
        defaultState = 'unpressed',
        states = {
            ['unpressed'] = {
                frame = 2
            },
            ['pressed'] = {
                frame = 1
            }
        }
    },

    ['heart'] = {
        type = 'heart',
        texture = 'hearts',
        frame = 5,
        width = 16,
        height = 16,
        solid = false,
        breakable = false,
        floating = true,
        floatOffsetMax = 3,
        floatRate = 14,
        defaultState = 'collectable',
        states = {
            ['collectable'] = {
                frame = 5
            }
        }
    },

    ['pot'] = {
        type = 'pot',
        texture = 'tiles',
        frameOffsets = {0, 1, 2, 19, 20, 21, 38, 39, 40},
        frame = 14,
        width = 16,
        height = 16,
        solid = true,
        breakable = true,
        liftable = true,
        defaultState = 'onGround',
        states = {
            ['onGround'] = {
                frame = 14
            },

            ['lifted'] = {
                frame = 14
            }
        }
    }
}