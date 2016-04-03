//Player movement
//Arguments: none

if not ds_list_empty(g_dlg) or instance_exists(tutorialMgr) {
    speed = 0
    image_speed = 0
    exit
}

bKeyDirectionIsPressed = false
bKeyDirectionIsReleased = false

//Check for new arrow key or WASD presses
if keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord('D')) {
    keyDirection = g_RIGHT
    bKeyDirectionIsPressed = true
}
else if keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord('W')) {
    keyDirection = g_UP
    bKeyDirectionIsPressed = true
}
else if keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord('A')) {
    keyDirection = g_LEFT
    bKeyDirectionIsPressed = true
}
else if keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord('S')) {
    keyDirection = g_DOWN
    bKeyDirectionIsPressed = true
}
else if speed == 0 {   //No new key has been pressed, but we're stalled.
    //Grab whatever currently-held movement key we can get.
    if keyboard_check(vk_right) or keyboard_check(ord('D')) {
        bKeyDirectionIsPressed = true
        keyDirection = g_RIGHT
    }
    else if keyboard_check(vk_up) or keyboard_check(ord('W')) {
        bKeyDirectionIsPressed = true
        keyDirection = g_UP
    }
    else if keyboard_check(vk_left) or keyboard_check(ord('A')) {
        bKeyDirectionIsPressed = true
        keyDirection = g_LEFT
    }
    else if keyboard_check(vk_down) or keyboard_check(ord('S')) {
        bKeyDirectionIsPressed = true
        keyDirection = g_DOWN
    }
}

//Check for arrow key or WASD releases, to deal with movement key clashes.
if keyboard_check_released(vk_right)
or keyboard_check_released(vk_up)
or keyboard_check_released(vk_left)
or keyboard_check_released(vk_down)
or keyboard_check_released(ord('D'))
or keyboard_check_released(ord('W'))
or keyboard_check_released(ord('A'))
or keyboard_check_released(ord('S')) {
    bKeyDirectionIsReleased = true
    keyDirection = -1   //Clear direction state
    
    //Grab whatever currently-held movement key we can get.
    if keyboard_check(vk_right) or keyboard_check(ord('D'))
        keyDirection = g_RIGHT
    else if keyboard_check(vk_up) or keyboard_check(ord('W'))
        keyDirection = g_UP
    else if keyboard_check(vk_left) or keyboard_check(ord('A'))
        keyDirection = g_LEFT
    else if keyboard_check(vk_down) or keyboard_check(ord('S'))
        keyDirection = g_DOWN
}

//Set speed and direction when key pressed
if bKeyDirectionIsPressed {
    direction = keyDirection
    speed = g_AVATAR_SPEED
    image_speed = .15   //Start animation
}

//Set speed and direction when key released
if bKeyDirectionIsReleased {
    if keyDirection == -1 {
        speed = 0   //Stop if no direction is pressed
        image_speed = 0
    }
    else {
        direction = keyDirection
        speed = g_AVATAR_SPEED
    }
}

if (bKeyDirectionIsPressed or bKeyDirectionIsReleased) and keyDirection != -1 {
    if direction == g_RIGHT
        sprite_index = spr_playerRight
    else if direction == g_UP
        sprite_index = spr_playerUp
    else if direction == g_LEFT
        sprite_index = spr_playerLeft
    else if direction == g_DOWN
        sprite_index = spr_playerDown
}


//Prevent the player from leaving the room
bLeaving = false
if bbox_left < 0 {
    bLeaving = true
    do { x += 1 } until bbox_left == 0
}
if bbox_right > room_width {
    bLeaving = true
    do { x -= 1 } until bbox_right == room_width
}
if bbox_top < 0 {
    bLeaving = true
    do { y += 1 } until bbox_top == 0
}
if bbox_bottom > room_height {
    bLeaving = true
    do  { y -= 1 } until bbox_bottom == room_height
}


//---------------------
//---Prevent collisions
//---------------------

if place_meeting(x + hspeed, y, obj_player_collider)
    speed = 0
if place_meeting(x, y + vspeed, obj_player_collider)
    speed = 0
