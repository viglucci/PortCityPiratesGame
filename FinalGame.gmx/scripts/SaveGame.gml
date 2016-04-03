/*
Note: global variables not saved:

g_removePersistenceFrom
g_gameRestart
g_hitNewGameButton
g_pausedRoom
g_avatarAttacking
g_lastChangedRoomTime
g_weaponDamageBase
g_msgText
g_msgAlpha
g_bMsgDisplayed
g_resuming
g_removingMusic
g_removingMusicVolume
*/

ini_open('save.ini')

/*
var str = ds_list_write(g_removePersistenceFrom)
ini_write_string('Lists', 'g_removePersistenceFrom', str)
*/

str = ds_list_write(g_townMarkers)
ini_write_string('Lists', 'g_townMarkers', str)

//Note: Shouldn't be necessary, since we only save when there's no dialogue, but anyway.
str = ds_list_write(g_dlg)
ini_write_string('Lists', 'g_dlg', str)

str = ds_list_write(g_usedChests)
ini_write_string('Lists', 'g_usedChests', str)


ini_write_real('Unlocked', 'g_town2Unlocked', g_town2Unlocked)
ini_write_real('Unlocked', 'g_town3Unlocked', g_town3Unlocked)
ini_write_real('Unlocked', 'g_town5Unlocked', g_town5Unlocked)
ini_write_real('Unlocked', 'g_finalIslandUnlocked', g_finalIslandUnlocked)

ini_write_real('Location', 'g_shipX', g_shipX)
ini_write_real('Location', 'g_shipY', g_shipY)
ini_write_real('Location', 'g_shipDir', g_shipDir)
ini_write_real('Location', 'g_shipLastPortX', g_shipLastPortX)
ini_write_real('Location', 'g_shipLastPortY', g_shipLastPortY)
ini_write_real('Location', 'g_shipLastPortDir', g_shipLastPortDir)
ini_write_string('Location', 'g_townId', g_townId)

ini_write_real('Stats', 'g_gold', g_gold)
ini_write_real('Stats', 'g_landHealth', g_landHealth)
ini_write_real('Stats', 'g_shipHealth', g_shipHealth)
ini_write_real('Stats', 'g_weaponLevel', g_weaponLevel)
ini_write_real('Stats', 'g_armorLevel', g_armorLevel)
ini_write_real('Stats', 'g_shipMaxSpeed', g_shipMaxSpeed)
ini_write_real('Stats', 'g_cbFireDelay', g_cbFireDelay)
ini_write_real('Stats', 'g_shipArmor', g_shipArmor)

ini_write_string('Misc', 'g_msgTextCached', g_msgTextCached)

ini_write_real('Events', 'g_shipwreckUnlocked', g_shipwreckUnlocked)
ini_write_real('Events', 'g_shipwreckExamined', g_shipwreckExamined)
ini_write_real('Events', 'g_openingCinematic', g_openingCinematic)
ini_write_real('Events', 'g_finalCinematic', g_finalCinematic)
ini_write_real('Events', 'g_bossShipBeaten', g_bossShipBeaten)
ini_write_real('Events', 'g_firstShipDeath', g_firstShipDeath)
ini_write_real('Events', 'g_showFirstShipDeathMsg', g_showFirstShipDeathMsg)
ini_write_real('Events', 'g_firstTimeInOcean', g_firstTimeInOcean)
ini_write_real('Events', 'g_firstTimeWarped', g_firstTimeWarped)
ini_write_real('Events', 'g_bCrashedReefs', g_bCrashedReefs)
ini_write_real('Events', 'g_firstTimeLoseSpecialShip1', g_firstTimeLoseSpecialShip1)
ini_write_real('Events', 'g_recruitedHenry', g_recruitedHenry)
ini_write_real('Events', 'g_moreWarships', g_moreWarships)
ini_write_real('Events', 'g_firstTimeNearBright', g_firstTimeNearBright)
ini_write_real('Events', 'g_beatFinalBoss', g_beatFinalBoss)

ini_write_real('Misc', 'g_music', g_music)
ini_write_real('Misc', 'g_shipwrightBasePrice', g_shipwrightBasePrice)

ini_write_real('Paused', 'g_paused', g_paused)
ini_write_real('Paused', 'g_pausedMusic', g_pausedMusic)

ini_close()

//show_message('Game saved.')
