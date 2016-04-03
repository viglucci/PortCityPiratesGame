//Called by a NPC ship when they want to try firing in an adjacent player ship

if current_time - cbFireDelay < lastFiredTime
    exit

if distance_to_object(playerShip) > 1600 {   //TODO: Totally arbitrary number. Maybe make depend on cbFlyTime. Or maybe not.
    exit
}

var shipDir = image_angle;

var nearest, aimDir, left, right;
nearest = instance_nearest(x, y, playerShip)
aimDir = point_direction(x, y, nearest.x, nearest.y)

left = shipDir - 90
if left < 0
    left += 360
right = shipDir + 90
if right >= 360
    right -= 360

var leftDiff = abs(aimDir - left)
if leftDiff > 180
    leftDiff = 360 - leftDiff

var rightDiff = abs(aimDir - right)
if rightDiff > 180
    rightDiff = 360 - rightDiff

var straightDiff = abs(aimDir - shipDir)
if straightDiff > 180
    straightDiff = 360 - straightDiff

var cb0Dir, cb1Dir, cb3Dir, cb4Dir;
var bStraight = false

if leftDiff < 10 and leftDiff < rightDiff {
    aimDir = left
    cb0Dir = aimDir + 10
    cb1Dir = aimDir + 5
    cb3Dir = aimDir - 5
    cb4Dir = aimDir - 10
    //exit   //TODO REMOVE
}
else if rightDiff < 10 and rightDiff < leftDiff {
    aimDir = right
    cb0Dir = aimDir - 10
    cb1Dir = aimDir - 5
    cb3Dir = aimDir + 5
    cb4Dir = aimDir + 10
    //exit   //TODO REMOVE
}
else if straightDiff < 10 and random(1) < .5 {
    bStraight = true
    aimDir = shipDir
    cb0Dir = aimDir + 10
    cb1Dir = aimDir + 5
    cb3Dir = aimDir - 5
    cb4Dir = aimDir - 10
}
else
    exit

//show_message(string(shipDir) + " " + string(left) + " " + string(right))

if bStraight
    cb0 = instance_create(x + lengthdir_x(60, shipDir+60), y + lengthdir_y(60, shipDir+60), cannonball)
else
    cb0 = instance_create(x + lengthdir_x(25, shipDir), y + lengthdir_y(25, shipDir), cannonball)
cb0.direction = cb0Dir
cb0.speed = cbSpeed
cb0.sourceShip = id
cb0.damage = dealCannonDamage
cb0.alarm[0] = cbFlyTime

if bStraight
    cb1 = instance_create(x + lengthdir_x(100, shipDir+20), y + lengthdir_y(100, shipDir+20), cannonball)
else
    cb1 = instance_create(x + lengthdir_x(25, shipDir), y + lengthdir_y(25, shipDir), cannonball)
cb1.direction = cb1Dir
cb1.speed = cbSpeed
cb1.sourceShip = id
cb1.damage = dealCannonDamage
cb1.alarm[0] = cbFlyTime

if bStraight
    cb2 = instance_create(x + lengthdir_x(120, shipDir), y + lengthdir_y(120, shipDir), cannonball)
else
    cb2 = instance_create(x, y, cannonball)
cb2.direction = aimDir
cb2.speed = cbSpeed
cb2.sourceShip = id
cb2.damage = dealCannonDamage
cb2.alarm[0] = cbFlyTime

if bStraight
    cb3 = instance_create(x + lengthdir_x(100, shipDir-20), y + lengthdir_y(100, shipDir-20), cannonball)
else
    cb3 = instance_create(x + lengthdir_x(25, shipDir-180), y + lengthdir_y(25, shipDir-180), cannonball)
cb3.direction = cb3Dir
cb3.speed = cbSpeed
cb3.sourceShip = id
cb3.damage = dealCannonDamage
cb3.alarm[0] = cbFlyTime

if bStraight
    cb4 = instance_create(x + lengthdir_x(60, shipDir-60), y + lengthdir_y(60, shipDir-60), cannonball)
else
    cb4 = instance_create(x + lengthdir_x(25, shipDir-180), y + lengthdir_y(25, shipDir-180), cannonball)
cb4.direction = cb4Dir
cb4.speed = cbSpeed
cb4.sourceShip = id
cb4.damage = dealCannonDamage
cb4.alarm[0] = cbFlyTime

lastFiredTime = current_time
bTurningToFire = false   //Do this regardless of whether we were actually turning to fire or not.

sound_play(sound_cannon2)
