with argument0
{
    //face the player
    //direction = point_direction(x, y, obj_player.x, obj_player.y)
    
    image_speed = mobImageSpeed
    
    //move towards player
    var moved = mp_potential_step_object(obj_player.x, obj_player.y, runSpeed, obj_collider)
}
