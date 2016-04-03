//Called from player ship step event
//TODO outdated, should probably remove this someday



//Old physics code; TODO remove
/*
with argument0 {
    if keyboard_check(vk_up) {
        physics_apply_local_force(0, 0, 0, -200)
        
        phy_angular_velocity *= .9;
        
        //phy_linear_velocity_x = 0;
        
        //phy_linear_velocity_y = 0;
    }
    
    else if keyboard_check(vk_down)
        physics_apply_local_force(0, 0, 0, 300)
    
    if keyboard_check(vk_left) {
        if abs(phy_angular_velocity) > 0
           phy_angular_velocity -= sign(phy_angular_velocity) * 0.2;
        else
           phy_angular_velocity = 0;
        
        if abs(phy_linear_velocity_x) > 0
           phy_linear_velocity_x -= sign(phy_linear_velocity_x) * 0.3;
        else
           phy_linear_velocity_x = 0;
        
        if abs(phy_linear_velocity_y) > 0
           phy_linear_velocity_y -= sign(phy_linear_velocity_y) * 0.3;
        else
           phy_linear_velocity_y = 0;
        
        //phy_rotation -= 1
        physics_apply_torque(-1000)
    }
    else if keyboard_check(vk_right) {
        if abs(phy_angular_velocity) > 0
           phy_angular_velocity -= sign(phy_angular_velocity) * 0.1;
        else
           phy_angular_velocity = 0;
        
        //phy_rotation += 1
        physics_apply_torque(1000)
    }
    if not keyboard_check(vk_up) and not keyboard_check(vk_down) and
       not keyboard_check(vk_left) and not keyboard_check(vk_right) {
        if abs(phy_angular_velocity) > 0
           phy_angular_velocity -= sign(phy_angular_velocity) * 0.8;
        else
           phy_angular_velocity = 0;
        
        if abs(phy_linear_velocity_x) > 0
           phy_linear_velocity_x -= sign(phy_linear_velocity_x) * 0.8;
        else
           phy_linear_velocity_x = 0;
        
        if abs(phy_linear_velocity_y) > 0
           phy_linear_velocity_y -= sign(phy_linear_velocity_y) * 0.8;
        else
           phy_linear_velocity_y = 0;
    }
}
*/
