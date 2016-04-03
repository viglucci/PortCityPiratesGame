//Create the town markers (NPC markers, quest markers, portals, and back buttons) that exist when
//the game starts. Also, make whatever ocean markers exist when the game starts.
//Arguments: none

//Events
ds_list_add(g_townMarkers, 'first_time_warped')

ds_list_add(g_townMarkers, 'final_boss')
ds_list_add(g_townMarkers, 'final_boss_death')

//Ocean
ds_list_add(g_townMarkers, 'oa1')

//Town 1 tavern
ds_list_add(g_townMarkers, 'v1a1')
ds_list_add(g_townMarkers, 'v1n1')
ds_list_add(g_townMarkers, 'v1n2')
//Town
ds_list_add(g_townMarkers, 't1a1')
ds_list_add(g_townMarkers, 't1p1')
ds_list_add(g_townMarkers, 't1n1')
ds_list_add(g_townMarkers, 't1n2')
ds_list_add(g_townMarkers, 't1s')

//Town 2
ds_list_add(g_townMarkers, 't2a1')
ds_list_add(g_townMarkers, 't2n1')
ds_list_add(g_townMarkers, 't2s')
//Tavern
ds_list_add(g_townMarkers, 'v2n1')

//Town 3
ds_list_add(g_townMarkers, 't3a1')
ds_list_add(g_townMarkers, 't3n1')
ds_list_add(g_townMarkers, 't3n2')
ds_list_add(g_townMarkers, 't3q1')
ds_list_add(g_townMarkers, 't3q2')
ds_list_add(g_townMarkers, 't3s')
//Tavern
ds_list_add(g_townMarkers, 'v3n1')
ds_list_add(g_townMarkers, 'v3i1')

//Town 4
ds_list_add(g_townMarkers, 't4a1')
ds_list_add(g_townMarkers, 't4m1')

//Town 5
ds_list_add(g_townMarkers, 't5a1')
ds_list_add(g_townMarkers, 't5n1')
ds_list_add(g_townMarkers, 't5n2')
ds_list_add(g_townMarkers, 't5q1')
ds_list_add(g_townMarkers, 't5s')
//Tavern
ds_list_add(g_townMarkers, 'v5n1')
ds_list_add(g_townMarkers, 'v5i1')
ds_list_add(g_townMarkers, 'v5m1')

//Dungeons
ds_list_add(g_townMarkers, 'd1a1')
ds_list_add(g_townMarkers, 'd2a1')
