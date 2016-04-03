with argument0{
    if(hp <= 0)
    {
        image_alpha -= .02
        if(image_alpha <= 0)
        {
            if(random(1) <= POTION_DROP_RATE)
                instance_create(x+POTION_X_OFFSET, y+POTION_Y_OFFSET, potionDrop)
            
            if(object_get_name(object_index) == 'obj_mob_bright') {
                TryAutoDialogue('final_boss_death', true)
                g_beatFinalBoss = true
            }
            
            instance_destroy()
        }
        exit
    }
}
