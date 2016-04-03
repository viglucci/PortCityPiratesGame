//Create whatever auto-dialogues and other stuff that is supposed to exist in the ocean right now.

//By the way, it's important to create these things a little distance away from the ports,
//so if the player emerges from a port, the player doesn't immediately crash into them!
//That would actually trigger a warp back into the port town, thus making the game basically
//unplayable.

//Important: Gold goals are checked for in navalMgr


if room == rm_final_ship_boss {
    TryAutoDialogue('boss_ship_intro', true)
    exit
}


TryAutoDialogue('oa1', true)

//Saintalmain's ship
if ds_list_find_index(g_townMarkers, 'ship_spawn1') != -1 {
    var new = instance_create(g_town2X+100, g_town2Y+200, specialShip1);
    new.direction = g_town2Dir
    new.image_angle = new.direction
}

//Priest's ship
if g_shipwreckUnlocked {
    var new = instance_create(5904, 7504, specialShip2);
    new.direction = 75
    new.image_angle = new.direction
}

//Dufont's ship
if ds_list_find_index(g_townMarkers, 'ship_spawn5') != -1 {
    var new = instance_create(g_town3X-550, g_town3Y+200, specialShip5);
    new.direction = 200
    new.image_angle = new.direction
}
