//Note that if I do "var a = 1", it's a generic "do nothing" statement.

var questionId = argument0;

if questionId == 't1s'
    var a = 1;
else if questionId == 't2s'
    var a = 1;
else if questionId == 't3s'
    var a = 1;
else if questionId == 't5s'
    var a = 1;
else if questionId == 't4m1'
    ShowDialogue('t4m1_no')
else if questionId == 'v5m1'
    ShowDialogue('v5m1_no')
else if questionId == 'v3i1'
    ShowDialogue('v3i1_no')

else
    show_error("Invalid choice: " + questionId, 0)
