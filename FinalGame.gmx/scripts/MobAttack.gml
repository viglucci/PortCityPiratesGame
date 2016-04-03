with argument0
{
    if(canAttack == false)
        exit

    if(attacking == false)
    {
        speed = 0
        attacking = true
        canAttack = false
        alarm[1] = room_speed * attackSpeed
        PlayerTakeDamage(attackDamage)
        
        var objName = object_get_name(object_index);
        if objName == 'obj_mob_skeleton'
            sound_play(sound_thump1)
        else
            sound_play(sound_sword2)
    }
}
