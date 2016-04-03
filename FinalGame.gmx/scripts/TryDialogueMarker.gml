//Create a dialogue marker at a specified position, if that marker is in the town marker list
//Arguments: dialogue id, marker x, marker y, marker object

dialogueId = argument0
xPos = argument1
yPos = argument2
markerObj = argument3

if ds_list_find_index(g_townMarkers, dialogueId) != -1 {
    ds_list_delete(g_townMarkers, ds_list_find_index(g_townMarkers, dialogueId))
    new = instance_create(xPos, yPos, markerObj)
    new.dialogueId = dialogueId
}
