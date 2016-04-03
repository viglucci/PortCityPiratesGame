//Get the mask sprite currently associated with a town sprite
//Arguments: town id

townId = argument0

if townId == 'town1'
    return spr_town1Mask
if townId == 'town1Tavern'
    return spr_tavern1Mask

if townId == 'town2'
    return spr_townFullMask
//    return spr_town2Mask
//if townId == 'town2Tavern'
//    return spr_tavern1Mask

if townId == 'town3'
    return spr_town3Mask
if townId == 'town3Tavern'
    return spr_tavern1Mask

if townId == 'town4'
    return spr_townFullMask

if townId == 'town5'
    return spr_town5Mask
if townId == 'town5Tavern'
    return spr_tavern1Mask

return spr_empty
