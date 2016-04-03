//Called from player or NPC ship collision event

//The "bounce off" method has problems with large objects, so for now we're going to use
//a simpler method to deal with terrain collisions.
if object_get_parent(other.object_index) == terrain {
    x = xprevious
    y = yprevious
}
else {
    var dirToOther, xoff, yoff;
    dirToOther = point_direction(x, y, other.x, other.y)
    xOffsetToOther = lengthdir_x(1, dirToOther)
    yOffsetToOther = lengthdir_y(1, dirToOther)
    
    //Progressively move away from the other instance until there's no more collision
    while(place_meeting(x, y, other)) {
        x -= xOffsetToOther;
        y -= yOffsetToOther;
        speed -= speed/5   //Slow down
        direction = image_angle
    }
}
