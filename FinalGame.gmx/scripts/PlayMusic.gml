//arguments: music

var music = argument0;

if not sound_isplaying(music) {
    /*
    if g_music != -1 and g_music != music {
        g_removingMusic = g_music
        //sound_fade(g_music, 0, 3000)
    }
    */
    
    sound_stop_all()
    
    //sound_volume(music, 1)
    sound_play(music)
    sound_loop(music)
    
    /*
    if g_removingMusic == -1
        sound_loop(music)
    */
}

g_music = music
