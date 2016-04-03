with argument0
{    
    var sprRight, sprLeft, sprUp, sprDown;
    
    if(wander == true || aggro == true)
    {
        sprRight = sprWalkRight
        sprLeft = sprWalkLeft
        sprUp = sprWalkUp
        sprDown = sprWalkDown        
    }
    
    if(attacking == true)
    {
        sprRight = sprAttackRight
        sprLeft = sprAttackLeft
        sprUp = sprAttackUp
        sprDown = sprAttackDown    
    }

    var d = direction
    if ((d <= 45 && d <= 45) || (d >= 315  && d <= 360))
    {
        sprite_index = sprRight
    }
    else if ((d <= 135 && d >= 90) || (d <= 90 && d >= 45))
    {
        sprite_index = sprUp
    }
    else if ((d <= 225 && d >= 180) || (d >= 135 && d <= 180))
    {
        sprite_index = sprLeft
    }
    else if ((d <= 315 && d >= 270) || (d >= 225 && d <= 270))
    {
        sprite_index = sprDown
    }
}
