var questionId = argument0;

if questionId == 't1s'
    ShowDialogue('t1s_yes')
else if questionId == 't2s'
    ShowDialogue('t2s_yes')
else if questionId == 't3s'
    ShowDialogue('t3s_yes')
else if questionId == 't5s'
    ShowDialogue('t5s_yes')
else if questionId == 't4m1'
    ShowDialogue('t4m1_yes')
else if questionId == 'v5m1'
    ShowDialogue('v5m1_yes')
else if questionId == 'v3i1'
    ShowDialogue('v3i1_yes')

else
    show_error("Invalid choice: " + questionId, 0)
