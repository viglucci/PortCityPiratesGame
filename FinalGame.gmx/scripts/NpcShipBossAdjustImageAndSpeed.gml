//Called by NPC ships to adjust their image and speed, based on the ship's real direction
//arguments: realDir

var realDir = argument0;


//Adjust frame rate of image updates so it doesn't look like the ship is changing its image
//direction much when its changes aren't that notable.

var updateFrameFreq = 2;   //Update every this many frames normally.

if abs(realDir - oldImageDir) >= 30 {
    oldImageTime = current_time
    oldImageDir = direction
}
else {
    if current_time - oldImageTime > 300 {
        updateFrameFreq = 5   //Update frames infrequently under these circumstances
    }
}


//Adjust image dir to match real dir

var bAdjustDir = false;
var dirDifference = abs(image_angle - realDir);
if dirDifference > 180 {
    dirDifference = 360 - dirDifference
    bAdjustDir = true
}

if dirDifference > 2 {
    mySpeed = maxSpeed * (1 - (dirDifference / 360))
}
else if mySpeed < maxSpeed {
    mySpeed = min(mySpeed + .1, maxSpeed)
}

var tempAngle;
if frame mod updateFrameFreq == 0 {
    var diffMetric = 5
    if dirDifference > diffMetric {
        //show_message(string(image_angle) + " " + string(realDir))
        if image_angle < realDir {
            if not bAdjustDir
                tempAngle = image_angle + diffMetric
            else {
                tempAngle = image_angle - diffMetric
            }
        }
        else {
            if not bAdjustDir
                tempAngle = image_angle - diffMetric
            else
                tempAngle = image_angle + diffMetric
        }
        
        if tempAngle < 0
            tempAngle += 360
        if tempAngle >= 360
            tempAngle -= 360
        image_angle = tempAngle
    }
    else {
        diffMetric = dirDifference
        //show_message(string(image_angle) + " " + string(realDir))
        if image_angle < realDir {
            if not bAdjustDir
                tempAngle = image_angle + diffMetric
            else {
                tempAngle = image_angle - diffMetric
            }
        }
        else {
            if not bAdjustDir
                tempAngle = image_angle - diffMetric
            else
                tempAngle = image_angle + diffMetric
        }
        
        if tempAngle < 0
            tempAngle += 360
        if tempAngle >= 360
            tempAngle -= 360
        image_angle = tempAngle
    }
    /*else {
        if bAdjustDir {
            var smaller = min(image_angle, realDir) + 360;
            var larger = max(image_angle, realDir);
            image_angle = (smaller + larger) / 2 - 360;
        }
        else
            image_angle = (image_angle + realDir) / 2;
    }*/
}
