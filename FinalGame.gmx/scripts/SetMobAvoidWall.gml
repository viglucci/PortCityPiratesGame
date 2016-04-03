with argument0{
    var d = direction
    if ((d <= 45 && d <= 45) || (d >= 315  && d <= 360))
    {
        direction = 180
    }
    else if ((d <= 135 && d >= 90) || (d <= 90 && d >= 45))
    {
        direction = 270
    }
    else if ((d <= 225 && d >= 180) || (d >= 135 && d <= 180))
    {
        direction = 0
    }
    else if ((d <= 315 && d >= 270) || (d >= 225 && d <= 270))
    {
        direction = 90
    }
    
    //alarm[11] = 0
}
