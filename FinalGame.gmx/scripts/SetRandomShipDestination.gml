//arguments: ship instance

var instance = argument0;

var bCityDestination = false;

if bCityDestination {
    var destinationNumber = choose(1, 2, 3, 4, 5);
    var destination;
    
    if destinationNumber == 1
        destination = town1Port
    else if destinationNumber == 2
        destination = town2Port
    else if destinationNumber == 3
        destination = town3Port
    else if destinationNumber == 4
        destination = town4Port
    else
        destination = town5Port
    
    instance.destinationX = destination.x
    instance.destinationY = destination.y
    instance.bCityDestination = true
}
else {
    //Search for random locations to go to; eventually give up
    var i, randX, randY;
    for(i = 0; i < GENERATE_RAND_LOCATIONS; i += 1) {
        randX = irandom(room_width)
        randY = irandom(room_height)
        
        if not place_meeting(x, y, navalBlock)
            break;
    }
    if i == GENERATE_RAND_LOCATIONS {
        instance.destinationX = town1Port.x
        instance.destinationY = town1Port.y
        instance.bCityDestination = true
    }
    else {
        instance.destinationX = randX
        instance.destinationY = randY
        instance.bCityDestination = false
    }
}
