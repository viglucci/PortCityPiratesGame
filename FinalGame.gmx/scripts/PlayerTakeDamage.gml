with obj_player{
    hp = hp - (argument0 * g_armorLevel)
    if(hp <= 0)
    {
        PlayerAvatarDie()
    }
}
