//Note: See SaveGame() for a list of the variables that are not saved.


if g_pausedRoom != -1 {
    if ds_list_find_index(g_removePersistenceFrom, g_pausedRoom) == -1
        ds_list_add(g_removePersistenceFrom, g_pausedRoom)
}


ini_open('save.ini')

/*
g_removePersistenceFrom = ds_list_create()
var str = ini_read_string("Lists", "g_removePersistenceFrom", "");
if str != ""
    ds_list_read(g_removePersistenceFrom, str)
*/

g_townMarkers = ds_list_create()
str = ini_read_string("Lists", "g_townMarkers", "");
if str != ""
    ds_list_read(g_townMarkers, str)

//Note: Shouldn't be necessary, since we only save when there's no dialogue, but anyway.
g_dlg = ds_list_create()
str = ini_read_string("Lists", "g_dlg", "");
if str != ""
    ds_list_read(g_dlg, str)

g_usedChests = ds_list_create()
str = ini_read_string("Lists", "g_usedChests", "");
if str != ""
    ds_list_read(g_usedChests, str)


g_town2Unlocked = ini_read_real('Unlocked', 'g_town2Unlocked', g_town2Unlocked)
g_town3Unlocked = ini_read_real('Unlocked', 'g_town3Unlocked', g_town3Unlocked)
g_town5Unlocked = ini_read_real('Unlocked', 'g_town5Unlocked', g_town5Unlocked)
g_finalIslandUnlocked = ini_read_real('Unlocked', 'g_finalIslandUnlocked', g_finalIslandUnlocked)

g_shipX = ini_read_real('Location', 'g_shipX', g_shipX)
g_shipY = ini_read_real('Location', 'g_shipY', g_shipY)
g_shipDir = ini_read_real('Location', 'g_shipDir', g_shipDir)
g_shipLastPortX = ini_read_real('Location', 'g_shipLastPortX', g_shipLastPortX)
g_shipLastPortY = ini_read_real('Location', 'g_shipLastPortY', g_shipLastPortY)
g_shipLastPortDir = ini_read_real('Location', 'g_shipLastPortDir', g_shipLastPortDir)
g_townId = ini_read_string('Location', 'g_townId', g_townId)

g_gold = ini_read_real('Stats', 'g_gold', g_gold)
g_landHealth = ini_read_real('Stats', 'g_landHealth', g_landHealth)
g_shipHealth = ini_read_real('Stats', 'g_shipHealth', g_shipHealth)
g_weaponLevel = ini_read_real('Stats', 'g_weaponLevel', g_weaponLevel)
g_armorLevel = ini_read_real('Stats', 'g_armorLevel', g_armorLevel)
g_shipMaxSpeed = ini_read_real('Stats', 'g_shipMaxSpeed', g_shipMaxSpeed)
g_cbFireDelay = ini_read_real('Stats', 'g_cbFireDelay', g_cbFireDelay)
g_shipArmor = ini_read_real('Stats', 'g_shipArmor', g_shipArmor)

g_msgTextCached = ini_read_string('Misc', 'g_msgTextCached', g_msgTextCached)

g_shipwreckUnlocked = ini_read_real('Events', 'g_shipwreckUnlocked', g_shipwreckUnlocked)
g_shipwreckExamined = ini_read_real('Events', 'g_shipwreckExamined', g_shipwreckExamined)
g_openingCinematic = ini_read_real('Events', 'g_openingCinematic', g_openingCinematic)
g_finalCinematic = ini_read_real('Events', 'g_finalCinematic', g_finalCinematic)
g_bossShipBeaten = ini_read_real('Events', 'g_bossShipBeaten', g_bossShipBeaten)
g_firstShipDeath = ini_read_real('Events', 'g_firstShipDeath', g_firstShipDeath)
g_showFirstShipDeathMsg = ini_read_real('Events', 'g_showFirstShipDeathMsg', g_showFirstShipDeathMsg)
g_firstTimeInOcean = ini_read_real('Events', 'g_firstTimeInOcean', g_firstTimeInOcean)
g_firstTimeWarped = ini_read_real('Events', 'g_firstTimeWarped', g_firstTimeWarped)
g_bCrashedReefs = ini_read_real('Events', 'g_bCrashedReefs', g_bCrashedReefs)
g_firstTimeLoseSpecialShip1 = ini_read_real('Events', 'g_firstTimeLoseSpecialShip1', g_firstTimeLoseSpecialShip1)
g_recruitedHenry = ini_read_real('Events', 'g_recruitedHenry', g_recruitedHenry)
g_moreWarships = ini_read_real('Events', 'g_moreWarships', g_moreWarships)
g_firstTimeNearBright = ini_read_real('Events', 'g_firstTimeNearBright', g_firstTimeNearBright)
g_beatFinalBoss = ini_read_real('Events', 'g_beatFinalBoss', g_beatFinalBoss)

g_music = ini_read_real('Misc', 'g_music', g_music)
g_shipwrightBasePrice = ini_read_real('Misc', 'g_shipwrightBasePrice', g_shipwrightBasePrice)

g_paused = ini_read_real('Paused', 'g_paused', g_paused)
g_pausedMusic = ini_read_real('Paused', 'g_pausedMusic', g_pausedMusic)

ini_close()

//show_message("Save file loaded.")

room_goto(rm_ocean)
