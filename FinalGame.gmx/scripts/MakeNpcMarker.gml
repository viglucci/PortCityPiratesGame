//Create a NPC marker
//Arguments: marker id string

if argument0 == "t1n1d1"
    new = instance_create(500, 700, npcMarker)
else {
    show_error("Invalid town sprite.", 0)
    exit
}

new.idStr = argument0