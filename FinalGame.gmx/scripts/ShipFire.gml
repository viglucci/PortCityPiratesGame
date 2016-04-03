//TODO use this? probably not. i think this would be for NPC ships though. may need modification.
//Arguments: target object

var targetObj = argument0;

if current_time - cbFireDelay < lastFiredTime
    exit

var nearest, aimDir, left, right;
nearest = instance_nearest(x, y, targetObj)
aimDir = point_direction(x, y, nearest.x, nearest.y)

left = direction - 90
if left < 0
    left += 360
right = direction + 90
if right >= 360
    right -= 360

if abs(aimDir - left) < abs(aimDir - right)
    aimDir = left
else
    aimDir = right

//show_message(string(direction) + " " + string(left) + " " + string(right))

cb1 = instance_create(x + lengthdir_x(25, direction), y + lengthdir_y(25, direction), cannonball)
cb1.direction = aimDir - 5
cb1.speed = cbSpeed
cb1.sourceShip = id
cb1.damage = dealCannonDamage
cb1.alarm[0] = cbFlyTime

cb2 = instance_create(x, y, cannonball)
cb2.direction = aimDir
cb2.speed = cbSpeed
cb2.sourceShip = id
cb2.damage = dealCannonDamage
cb2.alarm[0] = cbFlyTime

cb3 = instance_create(x + lengthdir_x(25, direction-180), y + lengthdir_y(25, direction-180), cannonball)
cb3.direction = aimDir + 5
cb3.speed = cbSpeed
cb3.sourceShip = id
cb3.damage = dealCannonDamage
cb3.alarm[0] = cbFlyTime

lastFiredTime = current_time