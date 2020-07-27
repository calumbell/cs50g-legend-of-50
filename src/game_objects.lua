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