//Remove a marker from the marker list, while simultaneously removing that marker from the actual
//current town screen.
//Arguments: marker id

if ds_list_find_index(g_townMarkers, argument0) != -1 {
    ds_list_delete(g_townMarkers, ds_list_find_index(g_townMarkers, argument0))
    
    with townMarker {
        if dialogueId == argument0
            bDeleting = true
    }
}
