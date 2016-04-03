//Create a NPC marker at a specified position, if a dialogue ID is in the town marker list
//Arguments: dialogue id (aka marker id), marker x, marker y

dialogueId = argument0
xPos = argument1
yPos = argument2

if ds_list_find_index(g_townMarkers, dialogueId) != -1 {
    new = instance_create(xPos, yPos, townNpcMarker)
    new.dialogueId = dialogueId
}
