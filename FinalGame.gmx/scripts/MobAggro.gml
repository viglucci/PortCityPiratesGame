if not ds_list_empty(g_dlg) or instance_exists(tutorialMgr)
    exit

with argument0
{
    //check vicinity to player
    if(aggro == false)
    {
        if(distance_to_object(obj_player) <= aggroRange)
        {
            speed = 0  
            image_speed = 0
            
            //set aggro flag
            aggro = true
            //stop wandering
            wander = false
        }
    }
    else
    {
        if(distance_to_object(obj_player) > aggroRange)
        {
            //lose aggro
            aggro = false
            //start wandering again
            wander = true
        }        
        
        if(distance_to_object(obj_player) > attackRange)
        {
            var dirToOther = point_direction(x, y, obj_player.x, obj_player.y);
            var xOffsetToOther = lengthdir_x(10, dirToOther);
            var yOffsetToOther = lengthdir_y(10, dirToOther);
            
            //TODO maybe change this to obj_collider
            if not place_meeting(x, y, obj_player_collider)
                MobFollow(self)
            else {
                //TODO?
            }
        }
        else if(distance_to_object(obj_player) <= attackRange)
        {
            MobAttack(self)
        }
    }
}
