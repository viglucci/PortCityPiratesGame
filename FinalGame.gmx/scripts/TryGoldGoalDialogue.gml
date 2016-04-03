//Create a piece of dialogue that runs automatically when some gold goal is reached.
//(This dialogue is only shown if a specified marker ID is in the town marker list.
//This marker is deleted if the dialogue is shown.)
//Arguments: check for marker id, resulting dialogue id, minimum gold quota

markerId = argument0
resultingDialogueId = argument1
goldMinimum = argument2

if ds_list_find_index(g_townMarkers, markerId) != -1 {
    if g_gold >= goldMinimum {
        ds_list_delete(g_townMarkers, ds_list_find_index(g_townMarkers, markerId))
        ShowDialogue(resultingDialogueId)
    }
}
