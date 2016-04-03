//Play the music that is situationally appropriate to the current room and/or moment in the game

if room == rm_town {
    if g_townId == 'town1' or g_townId == 'town1Tavern' {
        if g_openingCinematic
            PlayMusic(music_mexicanLoveAffair)
        else
            PlayMusic(music_lostAndForgotten)
    }
    else if g_townId == 'town2' or g_townId == 'town2Tavern' {
        PlayMusic(music_mexicanLoveAffair)
    }
    else if g_townId == 'town3' or g_townId == 'town3Tavern' {
        PlayMusic(music_morningOfWarHorn)
    }
    else if g_townId == 'town4' {
        PlayMusic(music_morningOfWarHorn)
    }
    else if g_townId == 'town5' or g_townId == 'town5Tavern' {
        PlayMusic(music_walkAlongWire)
    }
}
else if room == rm_ocean {
    if not sound_isplaying(music_lostShip) and not sound_isplaying(music_stillWater) {
        PlayMusic(choose(music_lostShip, music_stillWater))
    }
}
else if room == rm_cave {
    PlayMusic(music_reflectionAbsoluteWorld)
}
else if room == rm_dungeon_test2 {
    PlayMusic(music_nightCreeper)
}
else if room == rm_final_ship_boss {
    if g_finalCinematic
        PlayMusic(music_secretOfLife)
    else {
        //PlayMusic(music_callOfPolarStar)
        PlayMusic(music_toBalagopalanGanapathy)
    }
}
