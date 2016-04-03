//Create a piece of dialogue that runs automatically when you enter an area for the first time,
//or just when you want to run some piece of dialogue automatically. (This dialogue is only shown
//if a specified dialogue ID is in the town marker list.)
//Arguments: dialogue id (aka marker id)

dialogueId = argument0
bDelete = argument1

if ds_list_find_index(g_townMarkers, dialogueId) != -1 {
    if bDelete
        ds_list_delete(g_townMarkers, ds_list_find_index(g_townMarkers, dialogueId))
    ShowDialogue(dialogueId)
}
