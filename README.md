# Legend of 50

Assignment 5 of EDX/HarvardX's *CS50 Introduction to Games Development* course was to develop features for **Legend of 50**, a game heavily inspired by the SNES Legend of Zelda titles. The game uses the LÖVE 2D game engine (version 10.2) and was programmed in Lua.

### Requirements
- LÖVE 2D 0.10.2 [Super Toast] *https://github.com/love2d/love/releases/tag/0.10.2*

### Topics
 Some of the topics that we explored over the course of this exercise were:
- Games in top-down perspective
- Generative level design
- Hit/hurtboxes
- Events
- Screen scrolling 
- Data-driven Design

### Assessment Criteria
- Implement hearts that sometimes drop from vanquished enemies at random, which will heal the player for a full heart when picked up.
- Add pots to the game world at random that the player can pick up, at which point their animation will change to reflect them carrying the pot. The player should not be able to swing their sword when in this state.
- When carrying a pot, the player should be able to throw the pot. When thrown, the pot will travel in a straight line based on where the player is looking. When it collides with a wall, travels more than four tiles, or collides with an enemy, it should disappear. When it collides with an enemy, it should do 1 point of damage to that enemy as well.



### Links
Learn more about CS50g:
*https://www.edx.org/course/cs50s-introduction-to-game-development*

Learn more about LÖVE:
*https://love2d.org/*

The distribution code for this assignment can be found here: 
*cdn.cs50.net/games/2019/x/assignments/5/assignment5.zip*
