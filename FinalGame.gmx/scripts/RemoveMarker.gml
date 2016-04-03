//Remove marker from marker list
//Arguments: marker id

if ds_list_find_index(g_townMarkers, argument0) != -1
    ds_list_delete(g_townMarkers, ds_list_find_index(g_townMarkers, argument0))
