//Create whatever markers and portals, etc. that are supposed to exist in the given town
//using whatever that current town's mask sprite is. (The mask sprite helps indicate whether
//certain areas are currently inaccessible, or at least it will do that if we ever make it
//do that.)
//Arguments: town id, town mask sprite

townId = argument0
mask = argument1

backButtonXPos = 0
backButtonYPos = 678


if townId == 'town1' {
    //Portals
    if mask == spr_town1Mask {
        new = instance_create(108, 393, townPortal)
        new.mask_index = spr_mask130x65
        new.portal = 'town1Tavern'
        
        new = instance_create(915, 364, townPortal)
        new.mask_index = spr_mask55x35
        new.dialogueId = 't1p1'   //TODO maybe make this area an accessible portal based on certain conditions
    }
    
    //Markers
    TryNpcMarker('t1n1', 370, 390)
    TryNpcMarker('t1n2', 720, 350)
    TryShipwrightMarker('t1s', 590, 410)
    
    //Auto-dialogue
    TryAutoDialogue('t1a1', true)
    TryAutoDialogue('t1a2', true)
    TryAutoDialogue('t1a3', true)
    TryAutoDialogue('t1a4', true)
    
    //Back button
    new = instance_create(backButtonXPos, backButtonYPos, townBackButton)
    new.portal = 'ocean'
    new.oceanX = g_town1X
    new.oceanY = g_town1Y
    new.oceanDir = g_town1Dir
}

else if townId == 'town1Tavern' {
    //Portals
    if mask == spr_tavern1Mask {
        new = instance_create(411, 188, townPortal)
        new.mask_index = spr_mask45x110
        new.portal = 'town1'
    }
    
    //Markers
    TryNpcMarker('v1n1', 624, 280)
    TryNpcMarker('v1n2', 717, 440)
    TryImportantMarker('v1i1', 590, 368)
    
    //Auto-dialogue
    TryAutoDialogue('v1a1', true)
    TryAutoDialogue('v1a2', true)
}

else if townId == 'town2' {
    //Portals
    //TODO: This has been removed for now, but it might be put in later.
    /*
    new = instance_create(269, 303, townPortal)
    new.mask_index = spr_mask400x200
    new.portal = 'town2Tavern'
    */
    
    //Markers
    TryNpcMarker('t2n1', 166, 342)
    TryImportantMarker('t2q1', 700, 315)
    TryShipwrightMarker('t2s', 488, 137)
    
    //Back button
    new = instance_create(backButtonXPos, backButtonYPos, townBackButton)
    new.portal = 'ocean'
    new.oceanX = g_town2X
    new.oceanY = g_town2Y
    new.oceanDir = g_town2Dir
    
    //Auto-dialogue
    TryAutoDialogue('t2a1', false)
}

//TODO: This has been removed for now, but it might be put in later.
else if townId == 'town2Tavern' {
    //Portals
    if mask == spr_tavern1Mask {
        new = instance_create(411, 188, townPortal)
        new.mask_index = spr_mask45x110
        new.portal = 'town2'
    }
    
    //Markers
    TryNpcMarker('v2n1', 649, 370)
}

else if townId == 'town3' {
    //Portals
    new = instance_create(238, 434, townPortal)
    new.mask_index = spr_mask135x45
    new.portal = 'town3Tavern'
    
    //Markers
    TryNpcMarker('t3n1', 470, 460)
    TryNpcMarker('t3n2', 98, 414)
    TryImportantMarker('t3q1', 870, 475)
    TryImportantMarker('t3q2', 175, 355)
    TryShipwrightMarker('t3s', 69, 577)
    
    //Back button
    new = instance_create(backButtonXPos, backButtonYPos, townBackButton)
    new.portal = 'ocean'
    new.oceanX = g_town3X
    new.oceanY = g_town3Y
    new.oceanDir = g_town3Dir
    
    //Auto-dialogue
    TryAutoDialogue('t3a1', false)
    TryAutoDialogue('t3a2', true)
}

else if townId == 'town3Tavern' {
    //Portals
    if mask == spr_tavern1Mask {
        new = instance_create(411, 188, townPortal)
        new.mask_index = spr_mask45x110
        new.portal = 'town3'
    }
    
    //Markers
    TryNpcMarker('v3n1', 920, 345)
    TryImportantMarker('v3i1', 588, 409)
    TryImportantMarker('v3i2', 547, 300)
}

else if townId == 'town4' {
    //Portals
    
    //Markers
    TryMerchantMarker('t4m1', 844, 579)
    
    //Auto-dialogue
    TryAutoDialogue('t4a1', true)
    
    //Back button
    new = instance_create(backButtonXPos, backButtonYPos, townBackButton)
    new.portal = 'ocean'
    new.oceanX = g_town4X
    new.oceanY = g_town4Y
    new.oceanDir = g_town4Dir
}

else if townId == 'town5' {
    //Portals
    new = instance_create(239, 542, townPortal)
    new.mask_index = spr_mask180x135
    new.portal = 'town5Tavern'
    
    //Markers
    TryNpcMarker('t5n1', 269, 489)
    TryNpcMarker('t5n2', 335, 258)
    TryImportantMarker('t5q1', 506, 499)
    TryShipwrightMarker('t5s', 893, 324)
    
    //Back button
    new = instance_create(backButtonXPos, backButtonYPos, townBackButton)
    new.portal = 'ocean'
    new.oceanX = g_town5X
    new.oceanY = g_town5Y
    new.oceanDir = g_town5Dir
    
    //Auto-dialogue
    TryAutoDialogue('t5a1', false)
}

else if townId == 'town5Tavern' {
    //Portals
    if mask == spr_tavern1Mask {
        new = instance_create(411, 188, townPortal)
        new.mask_index = spr_mask45x110
        new.portal = 'town5'
    }
    
    //Markers
    TryNpcMarker('v5n1', 900, 333)
    TryImportantMarker('v5i1', 516, 469)
    TryMerchantMarker('v5m1', 640, 264)
}

else
    show_error("Invalid town: " + townId, 0)
