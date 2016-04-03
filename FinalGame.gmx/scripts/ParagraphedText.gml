//Insert newline characters (#) into the text to make it fit within a given draw width.
//The advantage of using this over draw_text_ext() is that, when dealing with a string which
//gets progressively larger, draw_text_ext() will draw the early parts of a word on the right
//margin before finally moving it to the next line. This script won't do that.
//
//Arguments: text, the remainder of the current word that will follow this text

var text = argument0;   //Use a var since we're going to change it
remainderText = argument1
currentPos = 1
lastSpacePos = 1
lineStartPos = 1

text += remainderText

//Go through the string, replacing spaces with newlines as needed to get the desired draw width.
while string_width(text) > DIALOGUE_DRAW_WIDTH and currentPos <= string_length(text) {
    if string_char_at(text, currentPos) == ' ' or currentPos == string_length(text) {
        if currentPos == string_length(text)   //Account for the extra non-space character
            line = string_copy(text, lineStartPos, currentPos - lineStartPos + 1)
        else
            line = string_copy(text, lineStartPos, currentPos - lineStartPos)
        
        //TODO remove.
        //show_message('>' + line + '< ' + string(currentPos == string_length(text)) + '#' + text)
        
        if string_width(line) > DIALOGUE_DRAW_WIDTH {
            //Replace most recent space with a newline
            text = string_delete(text, lastSpacePos, 1)
            text = string_insert('#', text, lastSpacePos)
            
            lineStartPos = lastSpacePos + 1
        }
        else
            lastSpacePos = currentPos
    }
    currentPos += 1
}

//return text
return string_copy(text, 1, string_length(text) - string_length(remainderText))
