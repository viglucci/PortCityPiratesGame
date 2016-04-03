with obj_player{
    if current_time - lastAttackTime < RAPIER_ATTACK_DELAY
        exit
    lastAttackTime = current_time
    
    if(dead == true)
        exit
    
    var attackPrototype = spr_attackRight;
    tempXOffset = sprite_width / 2;
    tempYOffset = sprite_height / 2;
    
    if(direction == g_RIGHT){
        tempXOffset += 30;
        tempYOffset += -10;
        attackSprite = spr_attackRight;
    } else if(direction == g_LEFT) {
        tempXOffset += -30;
        tempYOffset += -10;
        attackSprite = spr_attackLeft;      
    } else if(direction == g_UP) {
        tempXOffset += 5;
        tempYOffset += -20;
        attackSprite = spr_attackUp;
    } else if(direction == g_DOWN) {
        tempXOffset += 5;
        tempYOffset += 20;
        attackSprite = spr_attackDown;    
    }
    
    with instance_create(x + tempXOffset, y + tempYOffset, obj_rapier){
        //xOffset = other.tempXOffset;
        //yOffset = other.tempYOffset;
        sprite_index = other.attackSprite;
    }
    
    sound_play(sound_sword1)
}
