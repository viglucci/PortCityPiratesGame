//Show dialogue sequence
//(All dialogue is stored in this script.)
//(Note that a non-remove marker exception for 'v3i1' is made in townMarker's left-click event.)
//Arguments: dialogue id (aka marker id)

with dialogueMgr {
bUsable = true

//--------------------------
//------ Merchants etc -----
//--------------------------

if argument0 == 't1s' {
ds_list_add(g_dlg, "Shipwright I can repair your ship for " + string(g_shipwrightBasePrice) +  " gold.")
if g_gold < g_shipwrightBasePrice
    ds_list_add(g_dlg, "g Can't afford it, sorry.")
else
    ds_list_add(g_dlg, "yesno t1s")
}

else if argument0 == 't1s_yes' {
g_gold -= g_shipwrightBasePrice
g_shipHealth = SHIP_HEALTH_MAX
}

else if argument0 == 't2s' {
ds_list_add(g_dlg, "Shipwright Need your ship fixed? " + string(g_shipwrightBasePrice*2) +  " gold.")
if g_gold < g_shipwrightBasePrice*2
    ds_list_add(g_dlg, "l Now, if we just had any money...")
else
    ds_list_add(g_dlg, "yesno t2s")
}

else if argument0 == 't2s_yes' {
g_gold -= g_shipwrightBasePrice*2
g_shipHealth = SHIP_HEALTH_MAX
}

else if argument0 == 't3s' {
if g_gold < g_shipwrightBasePrice*3
    ds_list_add(g_dlg, "Shipwright If you had any money, I could offer to fix your ship.")
else {
    ds_list_add(g_dlg, "Shipwright For " + string(g_shipwrightBasePrice*3) +  " gold, I can repair your ship.")
    ds_list_add(g_dlg, "yesno t3s")
}
}

else if argument0 == 't3s_yes' {
g_gold -= g_shipwrightBasePrice*3
g_shipHealth = SHIP_HEALTH_MAX
}

else if argument0 == 't5s' {
ds_list_add(g_dlg, "Shipwright Want me to repair your ship? It'll be " + string(g_shipwrightBasePrice*2) +  " gold.")
if g_gold < g_shipwrightBasePrice*2
    ds_list_add(g_dlg, "l We're broke.")
else
    ds_list_add(g_dlg, "yesno t5s")
}

else if argument0 == 't5s_yes' {
g_gold -= g_shipwrightBasePrice*2
g_shipHealth = SHIP_HEALTH_MAX
}

else if argument0 == 't4m1' {
ds_list_add(g_dlg, "l What are you doing out here all by yourself?")
ds_list_add(g_dlg, "Merchant ...Want a sword?")
ds_list_add(g_dlg, "g A sword?")
ds_list_add(g_dlg, "Merchant Yeah, cheap! Only 5000 gold.")
ds_list_add(g_dlg, "g 5000 fucking gold?!")
ds_list_add(g_dlg, "Merchant Yeah! Real cheap! Save your life, man.")
ds_list_add(g_dlg, "l I don't think I can justify that kind of wasteful spending.")
ds_list_add(g_dlg, "g I'm kinda tempted.")
ds_list_add(g_dlg, "l Now, hold on. Just say we had more money than we knew what to do with. We would save it. We would put it away so we wouldn't have to keep risking our lives every day to get more gold.")
ds_list_add(g_dlg, "g But that's hardly the pirate way, is it? The pirate way is to get obscene amounts of gold and then throw them all away.")
ds_list_add(g_dlg, "l I won't be a party to this.")
if g_gold < 5000 {
    ds_list_add(g_dlg, "g Yes! We'll buy it.")
    ds_list_add(g_dlg, "Merchant Sigh... you can't afford it.")
}
else {
    ds_list_add(g_dlg, "yesno t4m1")
}
}

else if argument0 == 't4m1_yes' {
ds_list_add(g_dlg, "g Here you go. 5000 gold.")
ds_list_add(g_dlg, "Merchant You will NOT regret this.")
ds_list_add(g_dlg, "l I regret it already.")
g_gold -= 5000
g_weaponLevel += 1
RemoveActiveMarker('t4m1')
}

else if argument0 == 't4m1_no' {
ds_list_add(g_dlg, "l What if I just take that sword from your lifeless corpse?")
ds_list_add(g_dlg, "Merchant Aaagh! Run away!")
}

else if argument0 == 'v5m1' {
if g_gold < 2000 {
    ds_list_add(g_dlg, "Trader Hey, do you have any money?")
    ds_list_add(g_dlg, "l Not really, no.")
    ds_list_add(g_dlg, "Trader That's too bad. If you had 2000 gold, I'd have a sweet offer for you.")
}
else {
    ds_list_add(g_dlg, "Trader Interested in some heavyset clothing? It'll protect you in the heat of combat, or just when going for a swim. 2000 gold.")
    ds_list_add(g_dlg, "l 2000?! That's outrageous!")
    ds_list_add(g_dlg, "Trader I can't let it go for a farthing less. Are you interested?")
    ds_list_add(g_dlg, "yesno v5m1")
}
}

else if argument0 == 'v5m1_yes' {
ds_list_add(g_dlg, "l I guess I could use some better swimming clothes.")
ds_list_add(g_dlg, "Trader You can even wear them in battle!")
g_gold -= 2000
g_armorLevel -= .2
RemoveActiveMarker('v5m1')
}

else if argument0 == 'v5m1_no' {
ds_list_add(g_dlg, "g Sorry, I think I'd rather spend it on drink and women.")
ds_list_add(g_dlg, "Trader Your loss.")
}

//--------------------------
//------ Misc. events ------
//--------------------------

else if argument0 == 'msg_text_cached' {
ds_list_add(g_dlg, "showmsg " + g_msgTextCached)
}

else if argument0 == 'reef_crash' {
ds_list_add(g_dlg, "g How about we NOT crash into things?")
}

else if argument0 == 'first_ship_death' {
ds_list_add(g_dlg, "l We lost some gold in that battle.")
ds_list_add(g_dlg, "l It might be better to get a shipwright in some harbor to fix the ship up between fights.")
}

else if argument0 == 'first_time_warped' {
ds_list_add(g_dlg, "g What the hell just happened?")
ds_list_add(g_dlg, "l It looks like we just... warped, when we stepped on that tile.")
ds_list_add(g_dlg, "g This is black magic!")
ds_list_add(g_dlg, "l Let's look around for more of these tiles.")
}

//----------------------------
//------ Town NPCs etc. ------
//----------------------------

//------ Town 1 unlocked ------

else if argument0 == 'v1n1' {
ds_list_add(g_dlg, "Sailor You all right? You look like you're about to fall down there.")
ds_list_add(g_dlg, "l I'm fine.")
ds_list_add(g_dlg, "g Come on, let's get some air. This place smells like someone threw up and then died.")
ds_list_add(g_dlg, "l Someone did. See over there?")
ds_list_add(g_dlg, "g Jeez. What happened?")
ds_list_add(g_dlg, "l Um, that other guy suspected him of cheating at cards.")
ds_list_add(g_dlg, "g Was he?")
ds_list_add(g_dlg, "l Probably.")
}

else if argument0 == 'v1n2' {
ds_list_add(g_dlg, "l Watch out for the barman, I don't want to talk to him right now.")
ds_list_add(g_dlg, "g How much do you owe him?")
ds_list_add(g_dlg, "l A lot.")
ds_list_add(g_dlg, "g We need to get out of this town. We owe too many people money.")
ds_list_add(g_dlg, "l I'd hate to get Monsieur d'Ogeron after us. You know how he is with people who owe him debts.")
ds_list_add(g_dlg, "g Yeah, I know. There's the head of one sitting right there over the counter.")
ds_list_add(g_dlg, "l Is that real? I thought that was a mummy or something, all this time.")
ds_list_add(g_dlg, "g It's hard to tell, it's so tarred and feathered.")
ds_list_add(g_dlg, "l Come on, let's get back on the ocean.")
}

else if argument0 == 't1p1' {
ds_list_add(g_dlg, "g Hey, where are you going?")
ds_list_add(g_dlg, "l Nowhere.")

}
else if argument0 == 't1n1' {
ds_list_add(g_dlg, "Citizen Hi.")
ds_list_add(g_dlg, "g Not interested.")
//ds_list_add(g_townMarkers, 'v1a1')   //Note: Removed, kept for legacy purpose of illustrating how to add markers.
}

else if argument0 == 't1n2' {
ds_list_add(g_dlg, "Citizen This is Rubina, one of the smallest cities on the eastern seaboard. @But you knew that already, didn'tcha? Living here and all.")
ds_list_add(g_dlg, "g She lives in the Stonehead Tavern. But me, I already knew that.")
}

//------ Town 2 unlocked ------

else if argument0 == 't2n1' {
ds_list_add(g_dlg, "Citizen The Lycian Navy is seriously underfunded. That's why all these pirates ships keep getting away with attacking everyone.")
ds_list_add(g_dlg, "Citizen The truth is, the silver mines are so profitable that there's little point diverting funds to hire soldiers or purchase extra ships to defend the trade vessels.")
ds_list_add(g_dlg, "Citizen It's more productive to channel the money into making more money. I guess there's a strange kind of logic there.")
ds_list_add(g_dlg, "Citizen That's what I heard from old Admiral Moran, anyway, after he retired. He's been sitting in our local saloon ever since.")
}

else if argument0 == 't2q1' {
ds_list_add(g_dlg, "l Do you run Sophie's Flowers?")
ds_list_add(g_dlg, "Sophie %3Yes?")
ds_list_add(g_dlg, "g We have a package for you.")
ds_list_add(g_dlg, "Sophie All right! The guns I ordered.")
ds_list_add(g_dlg, "l I thought that package was heavy for flowers.")
ds_list_add(g_dlg, "Sophie Here's some cash for delivering it safely. Thanks!")

g_gold += 500
}

//TODO: This has been removed for now, but it might be put in later.
else if argument0 == 'v2n1' {
ds_list_add(g_dlg, "l This looks familiar.")
ds_list_add(g_dlg, "g Let's go, I think you're starting to see things.")
}

//------ Town 3 unlocked ------

else if argument0 == 't3n1' {
ds_list_add(g_dlg, "g Have you seen a ship called the Mirella?")
ds_list_add(g_dlg, "Citizen Nope.")
ds_list_add(g_dlg, "Citizen Is that your ship out by the docks? You ought to be more careful. A piece of crap like that could be blasted out of the water by any marauding pirate.")
ds_list_add(g_dlg, "g Ah, she's not so bad.")
ds_list_add(g_dlg, "Citizen That lug? It's a bathtub with sails. Mark my words: Be careful out there.")
}

else if argument0 == 't3n2' {
ds_list_add(g_dlg, "l Do you know a man named Frederick Priest?")
ds_list_add(g_dlg, "Sailor A priest? Hahaha! Not in this town! Don't you know holy men are bad luck on ocean voyages?")
ds_list_add(g_dlg, "Sailor The god of the sea sends tempests to sink them.")
ds_list_add(g_dlg, "g How do you know that?")
ds_list_add(g_dlg, "Sailor Everybody knows that.")
}

else if argument0 == 't3q1' {
ds_list_add(g_dlg, "Girl Are you... sailors?")
ds_list_add(g_dlg, "g You could say that, yes.")
ds_list_add(g_dlg, "Girl Could you deliver this package to Brax for me?")
ds_list_add(g_dlg, "g What's in it?")
ds_list_add(g_dlg, "Girl Just flowers. They'll wilt if they don't arrive soon.")
ds_list_add(g_dlg, "l You want us to travel halfway across the ocean to deliver flowers?")
ds_list_add(g_dlg, "Girl Please! Deliver them Sophie's Flowers in Brax. She'll pay you.")
ds_list_add(g_dlg, "g She'll pay us? Okay.")

ds_list_add(g_townMarkers, 't2q1')
}

else if argument0 == 't3q2' {
ds_list_add(g_dlg, "Henry I'm a shipwright.")
ds_list_add(g_dlg, "g Really? Our ship could use some repairs --")
ds_list_add(g_dlg, "Henry Don't care. I'm going out of business!")
ds_list_add(g_dlg, "Henry See, this bastard Dufont is stealing all my customers. His prices are just criminal.")
ds_list_add(g_dlg, "Henry You're pirates, right?")
ds_list_add(g_dlg, "l %3Well, um...")
ds_list_add(g_dlg, "Henry Look, go and kill him for me, will you? Sink his ship.")
ds_list_add(g_dlg, "g Do we have to?")
ds_list_add(g_dlg, "Henry He sails this stupid-looking ship near here with yellow sails. You can't miss it.")
ds_list_add(g_dlg, "Henry Take him out, and I'll sail with you for a bit. I need to drum up some overseas trade anyway, this place is dead.")

ds_list_add(g_townMarkers, 'ship_spawn5')
}

else if argument0 == 'ship_spawn5_defeated' {
ds_list_add(g_dlg, "Henry All right! Nice work, guys.")
ds_list_add(g_dlg, "l Where did you come from?")
ds_list_add(g_dlg, "Henry I was on that ship as a stowaway! I always like to keep my enemies close.")
ds_list_add(g_dlg, "Henry Truth be told, I was trying to sink it myself, but then you came along. Thanks for the help. I'm terrible with explosives.")
ds_list_add(g_dlg, "Henry With Dufont gone, I can corner the market on secondhand repairs on the eastern seaboard!")
ds_list_add(g_dlg, "Henry Like I promised though, I'll help you out for a little bit first.")

ds_list_add(g_dlg, "blankperson (Henry has joined you. He can perform accelerated ship repairs at sea, and bulk up your ship's defenses to reduce cannonball damage.)")

g_shipArmor = .8
g_recruitedHenry = true
}

else if argument0 == 'v3n1' {
ds_list_add(g_dlg, "g Hey, have you seen a man named Frederick Priest?")
ds_list_add(g_dlg, "Drunkard (Urp.)")
ds_list_add(g_dlg, "l I think he's dead.")
}

//------ Town 4 unlocked ------

else if argument0 == 't4a1' {
ds_list_add(g_dlg, "l ... I hate this place. Let's get out of here and never come back.")
ds_list_add(g_dlg, "goto ocean")
}

//------ Town 5 unlocked ------

else if argument0 == 't5n1' {
ds_list_add(g_dlg, "Woman Hey there, looking for a good time?")
ds_list_add(g_dlg, "l No.")
ds_list_add(g_dlg, "Woman I was talking to the handsome young man there.")
ds_list_add(g_dlg, "l He's not interested either.")
ds_list_add(g_dlg, "g But --")
ds_list_add(g_dlg, "l No thanks!")
}

else if argument0 == 't5n2' {
ds_list_add(g_dlg, "Citizen Can you believe how useless the Navy is? Every other week some poor merchant ship gets tackled by one of these bastard pirates. Then they sail back to shore, and sell the merchant's own goods back to them!")
ds_list_add(g_dlg, "Citizen Watch out, there are pirates out there. Pirates everywhere.")
}

//TODO maybe make this add an actual quest? As is, it's more of a hint.
//TODO only have him say this if we didn't loot the dungeon already?
else if argument0 == 't5q1' {
ds_list_add(g_dlg, "Citizen You see that rotting castle a couple miles east of here? That's Mildred's Keep. Stay away from there.")
ds_list_add(g_dlg, "Citizen There was this mad sorceress who owned the castle.")
ds_list_add(g_dlg, "Citizen Years ago, it was a lively place. Always flickering at night with parties. Fireworks going off. And the night air alive with the sounds of drunken revelry.")
ds_list_add(g_dlg, "Citizen Then, one night, everything went horribly wrong.")
ds_list_add(g_dlg, "Citizen Mildred was attempting a channeling spell for the amusement of the partygoers.")
ds_list_add(g_dlg, "Citizen Tales say that she took on the mind and spirit of the northwestern wind -- the fiercest spirit of the sea, who whips up all the seasonal hurricanes and tempests, to tempt sailors to their doom.")
ds_list_add(g_dlg, "Citizen At this point, skeletons rose from their graves and came to join the fun.")
ds_list_add(g_dlg, "Citizen None left the party alive.")
ds_list_add(g_dlg, "Citizen And from that day onward, the atmosphere of the place diminished considerably. No one goes there these days except pidgeons, poets, and madmen.")
ds_list_add(g_dlg, "g Is there any treasure there?")
ds_list_add(g_dlg, "Citizen Probably. Why not? If so, no one's ever going to find it.")
}

else if argument0 == 'v5n1' {
ds_list_add(g_dlg, "Drunkard I hear there's a skilled shipwright in Phrain who's looking to sell his services.")
}


//----------------------------
//------ Mildred's Keep ------
//----------------------------

else if argument0 == 'd1a1' {
ds_list_add(g_dlg, "l This looks like fun.")
ds_list_add(g_dlg, "g You go first.")
ds_list_add(g_dlg, "g If you see anything that looks dangerous, hit it and run!")
}


//--------------------------------------
//------ Main storyline cutscenes ------
//--------------------------------------

else if argument0 == 'v1a1' {
ds_list_add(g_dlg, "l %4Ugh.")
ds_list_add(g_dlg, "g Lise!")
ds_list_add(g_dlg, "l %3What is it?")
ds_list_add(g_dlg, "g There's someone here to meet you. Are you still capable of standing up?")
ds_list_add(g_dlg, "l %4Ugh...")
ds_list_add(g_dlg, "Alan Hello, Lise.")
ds_list_add(g_dlg, "l %3Oh. Hey, Alan.")
ds_list_add(g_dlg, "g You two know each other?")
ds_list_add(g_dlg, "l %3We were shipmates once... @%2On some freighter. I think.")
ds_list_add(g_dlg, "g You never mentioned you served on a freighter. What happened to it?")
ds_list_add(g_dlg, "l It sank. Too many collisions with cannonballs.")
ds_list_add(g_dlg, "Alan Captain England had a habit of sneaking up next to other ships and unloading a broadside at 40 meters.")
ds_list_add(g_dlg, "Alan Sometimes they fought back.")
ds_list_add(g_dlg, "l England... he was the first captain I ever sailed under. Terrible, terrible guy in combat. About the only thing he knew how to do was find the nearest bottle of rum.")
ds_list_add(g_dlg, "l I'm not surprised he sank. It's just, he was so fat, I'm surprised he didn't float.")
ds_list_add(g_dlg, "Alan He stiffed us when it came to dividing the plunder, too.")
ds_list_add(g_dlg, "l They never did find a body. In fact, they only ever found splinters of that ship.")
ds_list_add(g_dlg, "l Anyway, Alan. You're here to see us for.. some reason? I assume you're not here just to talk about assholes on ships. I assume you want a drink!")
ds_list_add(g_dlg, "Alan I'd love one.")
ds_list_add(g_dlg, "g Me too.")
ds_list_add(g_dlg, "l You are... how old are you again? @You are not touching a drop of rum. No navigator of mine is going to end up a drunk sot by the time he's 20.")
ds_list_add(g_dlg, "g We don't have a ship right now. I'm not a navigator of anything. And you're not the captain of anything. Ergo, I can do what I want.")
ds_list_add(g_dlg, "l Like hell you can!")
ds_list_add(g_dlg, "l You don't know what it's like. The wish for another sip takes over your every thought. It's an impossible habit to break. Ask anyone in this town. Ask Alan.")
ds_list_add(g_dlg, "Alan Some habits, you don't want to break.")
ds_list_add(g_dlg, "l Enough. Alan, sit down, have a god damn drink. Grant, here's a mineral water.")
ds_list_add(g_dlg, "l What is it you want to talk to us about?")
ds_list_add(g_dlg, "Alan It's like this. I know you two have been stranded here for the last few months, ever since the Incarnation got blown to bits.")
ds_list_add(g_dlg, "g It's not that bad. She still floats.")
ds_list_add(g_dlg, "l That's about all she does.")
ds_list_add(g_dlg, "Alan Everyone would like to see you back on the sea again. Having stranded sailors without any cash flow is bad for business.")
ds_list_add(g_dlg, "Alan I used to be a sailor. @These days, I look into acquiring assets and trading favors. @Lise, I look at you and your young brother here, and I see potential.")
ds_list_add(g_dlg, "Alan Say I were to advance you money so you could rent a new ship, get back out on the water, and pluck pretty prizes from the ocean.")
ds_list_add(g_dlg, "Alan You could keep doing that -- as quickly and as often as possible -- until you could pay me back. Double.")
ds_list_add(g_dlg, "l Double?")
//ds_list_add(g_dlg, "Alan Gotta have some return on investment, you know? With your quality at commanding a ship in battle, and your brother's hopefully competent abilities at navigation, it can't take too long.")
//ds_list_add(g_dlg, "g Are you saying we're also under a time limit?")
ds_list_add(g_dlg, "g Are we under a time limit?")
ds_list_add(g_dlg, "Alan Just a friendly one. Consider it a loan to be repaid at your EARLIEST convenience.")
//ds_list_add(g_dlg, "l All this would involve quite a bit of danger. Knocking over one poor merchantman after another... Someone's bound to take notice. Maybe even the Lycian Navy.")
ds_list_add(g_dlg, "l Give us a moment to consider it.")
ds_list_add(g_dlg, "Alan Sure. I'll be right over there.")
ds_list_add(g_dlg, "l What do you think, Grant?")
ds_list_add(g_dlg, "g Sounds good to me.")
ds_list_add(g_dlg, "l Yeah, me too.")
//ds_list_add(g_dlg, "l All right then. No time like the present.")
//ds_list_add(g_dlg, "l All right, Alan, I think we'll accept your little offer, on one condition. We want a good boat. We want to pick it out ourselves.")
ds_list_add(g_dlg, "l Alan, you've got a deal, on one condition. We want a good boat. We want to pick it out ourselves.")
//ds_list_add(g_dlg, "Alan Deal. But there's only one ship to choose from. It's sitting right outside in the bay.")
ds_list_add(g_dlg, "Alan Deal. You can have any ship you want, as long as it's the one sitting out on the dock right now.")
ds_list_add(g_dlg, "Alan Come on, let's go take a look.")
ds_list_add(g_dlg, "script ScriptEndOpeningCinematic")
}

else if argument0 == 't1a1' {
ds_list_add(g_dlg, "g Hey, how do you feel? Starting to sober up?")
ds_list_add(g_dlg, "l Yeah, I'm... I'm all right. Better. Ugh... little headachey. I need some fresh sea air.")
ds_list_add(g_dlg, "g Hey, is that our new boat?")
ds_list_add(g_dlg, "l Yeah. Alan! Not bad. You've outdone yourself.")
ds_list_add(g_dlg, "Alan You like? It's a first-class sloop. It's called the Incarceration.")
//ds_list_add(g_dlg, "Alan Isn't she pretty? First-class sloop. You'll find a few willing cannoneers already belowdecks, waiting for your command.")
ds_list_add(g_dlg, "Alan You'll find a few willing cannoneers already belowdecks, waiting for your command.")
ds_list_add(g_dlg, "g You mean, we should get started immediately?")
ds_list_add(g_dlg, "Alan Why not? As soon as you're ready to leave.")
}

else if argument0 == 'oa1' {
ds_list_add(g_dlg, "g You know, I have a sneaking suspicion that this ship is wanted. Did you see the look that dock officer was giving us as we left?")
ds_list_add(g_dlg, "l You mean that bastard Alan gave us a ship with a price on its head?")
ds_list_add(g_dlg, "g I think so. ... For now, if we see a ship that looks like it might be from the Lycian Navy, let's try to avoid them. Odds are they might be looking for this ship.")
ds_list_add(g_dlg, "l %3Son of a... %all right. Check the map, try to find out where we're going.")
ds_list_add(g_dlg, "g I figure we should just sail around and look for random merchant ships to loot.")
ds_list_add(g_dlg, "l Suits me.")
ds_list_add(g_dlg, "showmsg New goal: Collect 500 gold.")

ds_list_add(g_townMarkers, 'gold_goal1')
}

//The first ocean goal event.
else if argument0 == 'gold_goal1_reached' {
g_msgTextCached = ''

ds_list_add(g_dlg, "l Grant, how are we doing?")
ds_list_add(g_dlg, "g Well, we've taken a few hits, there's no denying it. We're listing a little in the water.")
ds_list_add(g_dlg, "l It'll take forever to pay Alan back like this, and half our funds will go towards ship repairs. We need a better plan.")
ds_list_add(g_dlg, "g What do you have in mind?")
ds_list_add(g_dlg, "l Let's go back to Rubina, and see if we can find some more ambitious task than tackling random merchantmen.")

ds_list_add(g_townMarkers, 't1a2')
ds_list_add(g_townMarkers, 'v1i1')
}

else if argument0 == 't1a2' {
ds_list_add(g_dlg, "g So, where to?")
ds_list_add(g_dlg, "l I think the center of all information in the city is a good bet, don't you?")
ds_list_add(g_dlg, "g Of course.")
}

else if argument0 == 'v1i1' {
ds_list_add(g_dlg, "Alan Lise, Grant? How are you guys making out?")
ds_list_add(g_dlg, "l You didn't tell us we were sailing a floating deathtrap.")
ds_list_add(g_dlg, "Alan Sorry?")
ds_list_add(g_dlg, "g That ship is wanted by the Navy. They're out for blood!")
ds_list_add(g_dlg, "Alan Oh, I was afraid of that. I'll deduct a suitable sum from the amount you owe me as compensation, of course.")
ds_list_add(g_dlg, "l How about you reduce the amount we owe you by half. We could have died out there.")
ds_list_add(g_dlg, "Alan You drive a hard bargain. Fine. Instead of owing me double the cost of the boat, you only owe me one-and-a-half times that figure.")
ds_list_add(g_dlg, "l How much do we owe you again?")
ds_list_add(g_dlg, "Alan It's still a lot more than you have, I can tell you that.")
ds_list_add(g_dlg, "l Do you have any intelligence on how we could earn the money a little faster?")
ds_list_add(g_dlg, "Alan You mean, a job?")
//ds_list_add(g_dlg, "l Something that could help us pay you back a little more efficiently.")
ds_list_add(g_dlg, "l A job, yeah!")
ds_list_add(g_dlg, "Alan Well, I didn't tell you this, but: Rumors are, there's a brig, the Arabella, out of Brax, sailing for Saint Jace with two thousand pounds in gold bullion.")
ds_list_add(g_dlg, "Alan It should be easy to spot. The masthead is painted in an exquisite crimson red.")
ds_list_add(g_dlg, "l And you would just give us this information for free?")
ds_list_add(g_dlg, "Alan Well, no. It'll cost you a finder's fee, of course.")
ds_list_add(g_dlg, "l But we already know the information.")
ds_list_add(g_dlg, "Alan Don't worry, I'll add the finder's fee to the amount you already owe me.")

ds_list_add(g_townMarkers, 't1a3')
}

else if argument0 == 't1a3' {
ds_list_add(g_dlg, "l The Arabella should be heading from Brax to Saint Jace. Let's get her before she docks at Saint Jace. I don't want to go anywhere near that hellhole.")
ds_list_add(g_dlg, "l Check the map, and let's go catch that ship!")
ds_list_add(g_dlg, "l Alan said it had a noticeable blue masthead.")
ds_list_add(g_dlg, "g You mean red.")
ds_list_add(g_dlg, "l That's what I said. Red.")
ds_list_add(g_dlg, "showmsg Brax has now been unlocked. Hunt down the Arabella!")

g_town2Unlocked = true
ds_list_add(g_townMarkers, 'ship_spawn1')
}

else if argument0 == 't2a1' {
if not g_town2Unlocked {
ds_list_add(g_dlg, "l Why are we here?")
ds_list_add(g_dlg, "g Nevermind. Maybe we'll come back later.")
ds_list_add(g_dlg, "goto ocean")
}
else {
ds_list_add(g_dlg, "g There's not much to do here, is there?")
ds_list_add(g_dlg, "l At least no one is trying to kill us.")
RemoveMarker('t2a1')
}
}

else if argument0 == 'ship_spawn1_lost' {
ds_list_add(g_dlg, "g That ship got away.")
ds_list_add(g_dlg, "l He's traveling between Brax and Saint Jace, right?")
ds_list_add(g_dlg, "l Let's go to Brax and see if he repeats the voyage.")
}

else if argument0 == 'ship_spawn1_defeated' {
g_msgTextCached = ''

ds_list_add(g_dlg, "l Anyone aboard? We're coming over.")
ds_list_add(g_dlg, "Betsy Go away!")
ds_list_add(g_dlg, "l Who are you?")
ds_list_add(g_dlg, "Betsy I'm the cook. Captain Saintalmain is already gone. See that lifeboat off in the distance?")
ds_list_add(g_dlg, "l What a coward!")
ds_list_add(g_dlg, "g Hello, Betsy.")
ds_list_add(g_dlg, "Betsy Grant? What are you doing here? I finally get gainful employment, and then you pirates come along and ruin everything!")
ds_list_add(g_dlg, "Betsy Do you have any idea how long it took me to get this job?!")
ds_list_add(g_dlg, "g Sorry. Where's everyone else?")
ds_list_add(g_dlg, "Betsy Hiding belowdecks.")
ds_list_add(g_dlg, "l Do you know where the gold on this ship is located?")
ds_list_add(g_dlg, "Betsy Sure, I have a couple ideas.")
ds_list_add(g_dlg, "Betsy %4...")
ds_list_add(g_dlg, "Betsy This is the galley. I often saw the captain come in here after trading goods with other merchants.")
ds_list_add(g_dlg, "l Take a look. That sack's not potatoes.")
ds_list_add(g_dlg, "l Potatoes don't jingle. Yes!")
ds_list_add(g_dlg, "g All right! With this, we could buy enough rum to drown a whale.")
ds_list_add(g_dlg, "l Look at this.")
ds_list_add(g_dlg, "g What is it?")
ds_list_add(g_dlg, "l A logbook. It's pretty thick. Goes back almost 20 years.")
ds_list_add(g_dlg, "g So what?")
ds_list_add(g_dlg, "l Listen to this.")
ds_list_add(g_dlg, "l " + '"' + "A record by one John H. Saintalmain, Private, 1st Class, Lycian Army, 1612." + '"')
ds_list_add(g_dlg, "l " + '"' + "An account of 4 years in Ironworth Prison." + '"')
ds_list_add(g_dlg, "g So he was in prison. We don't need to feel too guilty about relieving him of all his stuff.")
ds_list_add(g_dlg, "l I think we should take this.")
ds_list_add(g_dlg, "g When did you learn how to read, anyway?")
ds_list_add(g_dlg, "l Let's go back to Rubina. Don't say anything about this to Alan.")
ds_list_add(g_dlg, "Betsy Hey, I'm coming with you!")
ds_list_add(g_dlg, "blankperson (Betsy has joined you. With her skills as a cook, the crewmen will work twice as hard, helping improve your ship's speed.)")

g_shipMaxSpeed += CREW_SPEED_BOOST
ds_list_add(g_townMarkers, 't1a4')
}

else if argument0 == 't1a4' {
ds_list_add(g_dlg, "g That was the most refreshing voyage I've had in a long time.")
ds_list_add(g_dlg, "Betsy Amazing what a good cook can do for you, right?")
ds_list_add(g_dlg, "Alan A pleasant voyage, I trust?")
ds_list_add(g_dlg, "l We managed to salvage this useful cook, but there was no treasure on board that ship. Just some excellent ingredients.")
//ds_list_add(g_dlg, "Alan That's unfortunate.")
ds_list_add(g_dlg, "Alan That's too bad. It's not like my informants to be so inaccurate.")
ds_list_add(g_dlg, "l Grant, let's head back to the tavern. I want to show you something.")

ds_list_add(g_townMarkers, 'v1a2')
}

else if argument0 == 'v1a2' {
ds_list_add(g_dlg, "Tavern-master Oh, you look happy.")
ds_list_add(g_dlg, "g We should be. We just got away with the haul of a lifetime. And then she lied about it.")
ds_list_add(g_dlg, "g Two pints of rum, please!")
ds_list_add(g_dlg, "l A half-sized one for him.")
ds_list_add(g_dlg, "Tavern-master Here you go. Privateers, huh?")
ds_list_add(g_dlg, "g No, we're not.")
ds_list_add(g_dlg, "l Yes, that's right.")
ds_list_add(g_dlg, "Tavern-master It's all right. Privateers are respectable. Although some folks will say that privateers are basically pirates in the service of some nation.")
ds_list_add(g_dlg, "Tavern-master Since Lycia and Englia are constantly at war, there's a lot of call for privateers from both nations, to take out the other nation's ships. Which side are you fighting for?")
ds_list_add(g_dlg, "l I think we're a little bit freelance at the moment.")
ds_list_add(g_dlg, "Tavern-master Whoever pays the highest, eh? Wise, wise.")
ds_list_add(g_dlg, "l Grant, let's sit down over there.")
ds_list_add(g_dlg, "l ...")
ds_list_add(g_dlg, "l Truth is, we couldn't get a privateer commission, even if we wanted it. They know my face, Grant. And they know yours by now too, probably.")
ds_list_add(g_dlg, "g ... I was wondering why you took that logbook.")
ds_list_add(g_dlg, "g Ever wish you had written one of your own?")
ds_list_add(g_dlg, "l It's not like I was there that long. Six months. It's a pittance compared to what Saintalmain or a thousand other pirates have endured.")
ds_list_add(g_dlg, "g You never talked about what it was like in there for you.")
ds_list_add(g_dlg, "l It wasn't too bad, to be honest. There was none of the torture or, well, mutilation that was everywhere in the men's prisons. There aren't a lot of female pirates, so... I was in pretty pathetic company.")
ds_list_add(g_dlg, "l Nursemaids accused of abducting babies, servants who had stolen off with one of their master's coins or something...")
ds_list_add(g_dlg, "l We can never let ourselves be caught again. We don't want to be out here forever. If we didn't eventually have to pay Alan back, I'd say we should skip town already.")
ds_list_add(g_dlg, "l But we have to pay Alan back. He's connected now, we can't risk cheating him.")
ds_list_add(g_dlg, "l There's something else. That diary I found. Read this.")
ds_list_add(g_dlg, "g " + '"' + "July 14th: Maury was a thousand times worse today." + '"')
ds_list_add(g_dlg, "g " + '"' + "His mind is fleeing, but the few snatches of sanity he has left, he devotes to mordant thoughts. The two years we've spent together are nothing to the seven he spent in prison before being transferred here." + '"')
ds_list_add(g_dlg, "g " + '"' + "He's hinted in past at some great and illusory treasure that he would have access to upon leaving here. But today, in his vacant state, he began to talk rapidly about piles of gold doublooons, caches of emerald necklaces thrown carelessly in a heap." + '"')
ds_list_add(g_dlg, "g " + '"' + "And all within easy reach, he seemed to think, as his eyes stared beyond the bars, and his hand reached out as if to grasp." + '"')
ds_list_add(g_dlg, "g " + '"' + "July 23rd: Maury couldn't get up to eat today. The jailors made me feed him. They can't allow us to die in peace." + '"')
ds_list_add(g_dlg, "g " + '"' + "Yesterday, he kept fervently muttering the names of old comrades of his, who he seemed alternately to revere and despise. Jean Lafitte, Robin Bright, Cesar de la Sain." + '"')
ds_list_add(g_dlg, "g " + '"' + "The first and last of these are already dead, apparently. This seemed to increase their estimation in his mind. He wishes to join them." + '"')
ds_list_add(g_dlg, "g " + '"' + "July 25th: Maury died this morning. A few hours before, he rose from his stupor and said: '104.8',  with a horizontal cut of his finger through the air. And then a name. And his words after that were only mumbles." + '"')
ds_list_add(g_dlg, "g " + '"' + "It's a latitude. And the name, Frederick Priest, belongs to the man who knows the longitude." + '"')
ds_list_add(g_dlg, "g " + '"' + "Somehow, in the distant past, Maury's crew came into treasure. They buried it for later recollection. So that all of them could only go together, they split the coordinates up between them." + '"')
ds_list_add(g_dlg, "g " + '"' + "I don't know the full story. But it's clear that this treasure is still out there, waiting. If I ever get out of this place, maybe I can go and find it." + '"')
ds_list_add(g_dlg, "g Wow. And did he?")
ds_list_add(g_dlg, "l Saintalmain got out of prison two years later, went searching for this Frederick Priest, never found him, gave up, and went back to life as an ordinary merchant trader.")
ds_list_add(g_dlg, "l But what if that treasure was never found? In later notes, Saintalmain mentions that Maury told him that, of Maury Baxter's pirate crew, the captain, alone, had taken the reckoning of the island where they'd buried the treasure.")
ds_list_add(g_dlg, "l And the captain, alone, knew both coordinates. He died soon afterwards. He gave the latitude to Baxter. Or, actually, I think Baxter just overheard it as the captain told it to someone else. The longitude went to Priest, the first mate.")
ds_list_add(g_dlg, "l The plan was to regroup in a year, after the heat had died down, sell the gold and jewels, and retire wealthy men.")
ds_list_add(g_dlg, "l Somehow that never happened. But if Priest never told the coordinates to anyone else, that means that this treasure is still out there waiting. We just need to find Priest.")
ds_list_add(g_dlg, "g It's been almost... what, twenty years since they stole the treasure.")
ds_list_add(g_dlg, "l True, but look at this: In one of his latest entries, Saintalmain mentions that while trading in the city of Lys, he fell back to old habits and began inquiring about Frederick Priest.")
ds_list_add(g_dlg, "l And he actually got a response to that name.")
ds_list_add(g_dlg, "l Some drunken prostitute in a tavern told him that she had actually met this man, in Tabriel, of all places.")
ds_list_add(g_dlg, "g That's less than 100 miles from here!")
ds_list_add(g_dlg, "l Saintamain never had a chance to visit Tabriel.")
ds_list_add(g_dlg, "g Then let's go there.")
ds_list_add(g_dlg, "g Time for another drink first?")
ds_list_add(g_dlg, "l You know, maybe it is time to celebrate. Fine, just one. But it's on me.")
ds_list_add(g_dlg, "showmsg Tabriel has now been unlocked.")

g_town5Unlocked = true
g_shipwrightBasePrice = 20   //Increase the base price of shipwrights
}

else if argument0 == 't5a1' {
if not g_town5Unlocked {
ds_list_add(g_dlg, "l There's no reason to be here. Let's try not to draw attention.")
ds_list_add(g_dlg, "goto ocean")
}
else {
g_msgTextCached = ''
ds_list_add(g_dlg, "l Let's ask at the tavern if anyone has seen Priest.")
RemoveMarker('t5a1')
}
}

else if argument0 == 'v5i1' {
ds_list_add(g_dlg, "l A pint of grog, please, and some information.")
ds_list_add(g_dlg, "Barmaid Sure. The information's free. The pint will cost you.")
ds_list_add(g_dlg, "g Two pints.")
ds_list_add(g_dlg, "Betsy Nothing for me, thanks.")
ds_list_add(g_dlg, "l We're looking for a man named Frederick Priest. He's an old sailor, mid-fifties or so.")
ds_list_add(g_dlg, "Barmaid Priest? You just missed him! He was in here not a week ago.")
ds_list_add(g_dlg, "Barmaid He's been here most nights for the last three years.")
ds_list_add(g_dlg, "Barmaid You know, it's funny, you asking about him. Just the other day, there was another couple in here, looking for him. Looked a mite bit fiercer than you two.")
ds_list_add(g_dlg, "l Another couple?")
ds_list_add(g_dlg, "Barmaid Yeah. Seafarers, of course. A man and woman. Yes, they were asking some very pertinent questions about Priest. Where he was, how long he'd been here... And they only missed him by a day or two.")
ds_list_add(g_dlg, "g Well, the bad luck just keeps piling up.")
ds_list_add(g_dlg, "l Where did this man Priest sail to?")
ds_list_add(g_dlg, "Barmaid Depends. Why are you asking?")
ds_list_add(g_dlg, "l He's our grandfather. An old shipmate of his, Maury Baxter, told us he was here.")
ds_list_add(g_dlg, "Barmaid Priest used to mention a man named Baxter sometimes. They were shipmates together back in the day. But Priest has reformed and all that. He keeps telling people. I'm sure he'll be delighted to see you guys.")
ds_list_add(g_dlg, "l So where did Priest -- our grandfather -- go off to?")
ds_list_add(g_dlg, "Barmaid He took off a week ago for Phrain, a small spit of a city on the edge of the Lycian sea. The ship's name is the Mirella. It's traveling with a fleet of rug traders or some crap.")
ds_list_add(g_dlg, "l Thanks for your help. Here's a little something for your time.")
ds_list_add(g_dlg, "Barmaid Good luck finding your grandfather!")
ds_list_add(g_dlg, "Barmaid And be careful out there. There have been a lot of Navy vessels on the rampage lately, attacking merchant ships with only the slighest provocation.")
ds_list_add(g_dlg, "Betsy That sounds great. As if we didn't have enough to worry about already.")
ds_list_add(g_dlg, "l Should we head off immediately?")
ds_list_add(g_dlg, "g Maybe. I've been talking with the locals, and there's this haunted old castle a few miles east of here that's rumored to have some treasure.")
ds_list_add(g_dlg, "l Might be worth a look.")

//TODO maybe only say that if we haven't looted that castle yet.

ds_list_add(g_dlg, "showmsg Phrain has now been unlocked.")

g_town3Unlocked = true
g_moreWarships = true
}

else if argument0 == 't3a1' {
if not g_town3Unlocked {
ds_list_add(g_dlg, "l We should stop here and pick up supplies.")
ds_list_add(g_dlg, "g Actually, I docked here by accident.")
ds_list_add(g_dlg, "l Oh. Well, let's leave.")
ds_list_add(g_dlg, "goto ocean")
}
else {
g_msgTextCached = ''
ds_list_add(g_dlg, "l I'll check with the harbor-master and see if anyone's heard from the Mirella.")
ds_list_add(g_dlg, "l ...")
ds_list_add(g_dlg, "l That's weird. No ship by that name has come into harbor.")
ds_list_add(g_dlg, "g She should have been here days ago.")
ds_list_add(g_dlg, "l I know. Let's ask around, anyway.")
ds_list_add(g_dlg, "showmsg Find clues about Priest's missing ship.")
RemoveMarker('t3a1')
}
}

else if argument0 == 'v3i1' {
ds_list_add(g_dlg, "g Hello, we're looking for someone.")
ds_list_add(g_dlg, "Tavern-master Oh, yeah? Who?")
ds_list_add(g_dlg, "g A man named Frederick Priest. He's a sailor, late 50's, maybe? Would have arrived here just a couple days ago.")
ds_list_add(g_dlg, "Tavern-master Information, huh? That's gonna cost you.")
ds_list_add(g_dlg, "g How much?")
ds_list_add(g_dlg, "Tavern-master Ehh, what say 2000 gold.")
ds_list_add(g_dlg, "g 2000 gold?! For this?")
ds_list_add(g_dlg, "Tavern-master Could be nobody else will help ya. You want to find this man, right?")
ds_list_add(g_dlg, "g Yes.")
ds_list_add(g_dlg, "Tavern-master And there's a bit of%3 time pressure %involved, yes?")
ds_list_add(g_dlg, "g Maybe.")
ds_list_add(g_dlg, "Tavern-master Well, 2000 gold.")

if g_gold < 2000 {
    ds_list_add(g_dlg, "g We... don't actually have 2000 gold.")
    ds_list_add(g_dlg, "Tavern-master Come back when you do.")
    ds_list_add(g_dlg, "showmsg Collect 2000 gold for the tavern-master.")
}
else {
    //ds_list_add(g_dlg, "l Out of the question.")
    //ds_list_add(g_dlg, "Tavern-master Heh, your loss.")
    //ds_list_add(g_dlg, "g Let's keep asking people.")
    ds_list_add(g_dlg, "yesno v3i1")
}
}

else if argument0 == 'v3i1_yes' {
ds_list_add(g_dlg, "l All right, here's your 2000 gold. Where's Priest?")
ds_list_add(g_dlg, "Tavern-master I haven't seen him.")
ds_list_add(g_dlg, "g You what?!")
ds_list_add(g_dlg, "Tavern-master Haven't seen him, sorry.")
ds_list_add(g_dlg, "g And you made us give you all that -- give us our money back!")
ds_list_add(g_dlg, "Tavern-master Hold on. I can tell you something. There was a couple in here the other day, asking for Frederick Priest. Just like you are.")
ds_list_add(g_dlg, "g We already know about that. It was the same situation in Brax.")
ds_list_add(g_dlg, "Tavern-master You've got yourself quite a wild goose chase here, eh?")
ds_list_add(g_dlg, "l Give us our gold, now.")
ds_list_add(g_dlg, "Tavern-master A deal's a deal.")
ds_list_add(g_dlg, "l Here's a deal. Give us our gold back, or I'll drag you back to my ship and turn you into spaghetti. We've got quite a good cook on board these days.")
ds_list_add(g_dlg, "Tavern-master Okay, sure, no problem! Here you go.")
ds_list_add(g_dlg, "l Thanks. Grant, we're leaving.")
ds_list_add(g_dlg, "g ...")
//ds_list_add(g_dlg, "g That kind of worked, I guess.")
//ds_list_add(g_dlg, "l What was that, our new routine? You go in there and play the optimistic, one-eyed, " + + '"' + "give all our gold away" + '"' + " person, and I get it back?")
//ds_list_add(g_dlg, "g That wasn't exactly my intention, but yeah, I guess so.")
ds_list_add(g_dlg, "l Let's keep asking people. Hopefully they won't all be assholes like that guy.")
ds_list_add(g_dlg, "g Hey, who's that girl who just walked in?")

RemoveActiveMarker('v3i1')
ds_list_add(g_townMarkers, 'v3i2')
//Note that this is an exact duplicate of the normal thing in MakeTownDetails.
TryImportantMarker('v3i2', 547, 300)
}

else if argument0 == 'v3i1_no' {
ds_list_add(g_dlg, "l I would rather eat this money than let you have it.")
ds_list_add(g_dlg, "Tavern-master Suit yourself.")
}

else if argument0 == 'v3i2' {
g_msgTextCached = ''
ds_list_add(g_dlg, "g Excuse me.")
ds_list_add(g_dlg, "lu Well, aren't you cute.")
ds_list_add(g_dlg, "l We're looking for information on a man named Frederick Priest. He would have been sailing here on a ship called the Mirella.")
ds_list_add(g_dlg, "lu The Mirella... Yeah, I think I know something about that.")
ds_list_add(g_dlg, "lu She took off from Tabriel with a bunch of merchant ships, right? Yeah, I know where she is.")
ds_list_add(g_dlg, "g Where?")
ds_list_add(g_dlg, "lu 2000 gold.")
ds_list_add(g_dlg, "g %3What?!")
ds_list_add(g_dlg, "lu I overheard your conversation with the barman.")
ds_list_add(g_dlg, "g %3What?!")
ds_list_add(g_dlg, "l Look, we just got done playing that game.")
ds_list_add(g_dlg, "lu I know, I overheard. But the difference is, I actually know where this ship is.")
ds_list_add(g_dlg, "lu I'm a sporting sort, though. Tell you what. I'll flip this coin. Call it. If you're right, I'll tell you for free. If not -- 2000 gold.")
ds_list_add(g_dlg, "g All right. Heads.")
ds_list_add(g_dlg, "lu ...")
ds_list_add(g_dlg, "l Sorry.")
ds_list_add(g_dlg, "lu Dammit! Okay, fine.")
ds_list_add(g_dlg, "lu A couple days ago, I heard a report from a couple fishermen who had been trying their luck out by Saint Jace.")
ds_list_add(g_dlg, "lu They spent the entire week hauling in the waters around the prison, looking for catch.")
ds_list_add(g_dlg, "lu For two days straight, they saw this ship, just sitting there in open water, buffeted around by the waves. Not doing anything, not going anywhere.")
ds_list_add(g_dlg, "lu Her name was the Marilla. Mirella.")
ds_list_add(g_dlg, "g Why would the Mirella be out by Saint Jace? That's completely off the actual route.")
ds_list_add(g_dlg, "lu I couldn't tell ya. Anyway, that's where you'll find her. In the waters a little southwest of Saint Jace. Well, it's been nice meeting you.")
ds_list_add(g_dlg, "l Hey, what's your name?")
ds_list_add(g_dlg, "lu Lucy. And you are?")
ds_list_add(g_dlg, "l Lise Mallory. This is my brother Grant.")
ds_list_add(g_dlg, "lu The Mallorys, huh? Safe travels. But if I were you, I wouldn't bother. Seek pleasure in the simple things.")
ds_list_add(g_dlg, "g The what?")
ds_list_add(g_dlg, "l Let's go to the sea near Saint Jace. It'll take a while to get there. Let's avoid the island itself... I have too many memories of that place.")
ds_list_add(g_dlg, "showmsg Locate the wreckage southwest of Saint Jace.")

g_shipwreckUnlocked = true
g_shipwrightBasePrice = 30   //Increase the base price of shipwrights
}

else if argument0 == 'ship_examine_wreck' {
g_msgTextCached = ''
ds_list_add(g_dlg, "playmusic music_nightCreeper")
ds_list_add(g_dlg, "l Look there. Do you see what I see?")
ds_list_add(g_dlg, "g It's a ship.")
ds_list_add(g_dlg, "l Not just any ship. Look at the masthead. That's the Mirella. Of all things! It was sitting here this entire time.")
ds_list_add(g_dlg, "g This is creepy. Why is she just sitting here, motionless?")
ds_list_add(g_dlg, "l Hello there! Anyone aboard? ... Is anyone aboard your ship?!")
ds_list_add(g_dlg, "l Nothing...")
ds_list_add(g_dlg, "l This is bad. No one's manning the deck. I don't see any crewmen. No one's in the crow's nest. No lookouts.")
ds_list_add(g_dlg, "l I don't see anyone on the upper deck either.")
ds_list_add(g_dlg, "g Do you want to go aboard?")
ds_list_add(g_dlg, "l Have Betsy take the tiller. @We're both going.")
ds_list_add(g_dlg, "Betsy Be careful.")
ds_list_add(g_dlg, "l %4...")
ds_list_add(g_dlg, "l Grant, stay back.")
ds_list_add(g_dlg, "g What is it?")
ds_list_add(g_dlg, "l I found the crew.")
ds_list_add(g_dlg, "g What do you mean?")
ds_list_add(g_dlg, "g %3Oh my god.")
ds_list_add(g_dlg, "l I said stay back.")
ds_list_add(g_dlg, "g Oh my god!")
ds_list_add(g_dlg, "l Get back to the ship, now!")
ds_list_add(g_dlg, "g No, this... This is horrible. What the HELL happened here?")
ds_list_add(g_dlg, "l Their throats have been slit. This man... this man was stabbed. About a hundred times.")
ds_list_add(g_dlg, "l And this maid, throat slit... and stabbed.")
ds_list_add(g_dlg, "g What is that smell?")
ds_list_add(g_dlg, "l Blood.")
ds_list_add(g_dlg, "g What the hell are we going to do now?")
ds_list_add(g_dlg, "l ... Let's go back to Phrain.")
ds_list_add(g_dlg, "g Why?")
ds_list_add(g_dlg, "l That woman, Lucy. She knew more than she was letting on.")
ds_list_add(g_dlg, "g You think?")
ds_list_add(g_dlg, "l Yeah, I could tell that there was something about her. She knew what we would find, and she sent us to find it deliberately.")
ds_list_add(g_dlg, "g Do you think she'll still be there? It'll be a week before we can get back to Phrain.")
ds_list_add(g_dlg, "l It's worth a try. Anyway, we have no other leads to go on. Everyone's dead, and Priest is gone.")
ds_list_add(g_dlg, "l By the looks of this place, the other ships traveling with Priest were blown to bits.")
ds_list_add(g_dlg, "script PlayRelevantMusic")

ds_list_add(g_townMarkers, 't3a2')
}

else if argument0 == 't3a2' {
ds_list_add(g_dlg, "lu Oh, hey. You guys look familiar.")
ds_list_add(g_dlg, "g Lucy!")
ds_list_add(g_dlg, "lu Just got into port, huh? I was about to take off, myself.")
ds_list_add(g_dlg, "l We found the Mirella.")
ds_list_add(g_dlg, "lu Oh? @And what state was she in?")
ds_list_add(g_dlg, "l Everyone was dead.")
ds_list_add(g_dlg, "lu I know. I assure you, that wasn't my idea.")
ds_list_add(g_dlg, "g %3What?")
ds_list_add(g_dlg, "lu It was Robin's idea. Oh, but you don't know who Robin is, do you? Come on, let's go back to the pub, I'll explain. You're gonna need a stiff drink.")

ds_list_add(g_dlg, "goto town3Tavern")

ds_list_add(g_dlg, "l Wait, so who are you really?")

ds_list_add(g_dlg, "lu Me? I'm just a poor sailor trying to make ends meet, through piracy. Just like you two.")
ds_list_add(g_dlg, "playmusic music_callOfPolarStar")   //TODO maybe fiddle around with this and make it work before the room transition
ds_list_add(g_dlg, "g What? But we don't --")
ds_list_add(g_dlg, "lu I recognize the look. And I've heard enough for me to make an educated guess.")
//ds_list_add(g_dlg, "lu Last week, a young pair of pirates -- probably brother and sister, or maybe a dysfunctional relationship -- raided a ship outside of Brax belonging to one Captain John Saintalmain.")
//ds_list_add(g_dlg, "lu Saintalmain was in prison some years back with Maury Baxter. Baxter, Priest, and Robin -- Robin Bright -- all used to be shipmates together, about twenty years ago.")
//ds_list_add(g_dlg, "lu Last week, a young pair of pirates -- probably brother and sister, or maybe a dysfunctional couple -- raided a ship outside of Brax and picked up some information on a treasure buried by a pirate called Maury Baxter.")
ds_list_add(g_dlg, "lu Last week, a young pair of pirates -- probably brother and sister, or maybe a dysfunctional couple -- raided a ship outside of Brax and picked up some information on a buried treasure.")
ds_list_add(g_dlg, "lu Robin -- Robin Bright -- used to be shipmates with Maury Baxter and Frederick Priest, a long time ago.")
ds_list_add(g_dlg, "lu They struck it lucky, hid the goods until they could find a reliable buyer, and went off on their own ways, planning to meet again a few months later.")
//ds_list_add(g_dlg, "lu Then everything went wrong. Priest got arrested for being an idiot. The captain, the only one who knew the full coordinates, died of a sudden illness.")
ds_list_add(g_dlg, "lu Then everything went wrong. Priest got arrested for being an idiot.")
ds_list_add(g_dlg, "lu The crew had buried the treasure on an island, out in the middle of nowhere. Brilliant, eh?")
ds_list_add(g_dlg, "lu The only man who knew the exact location of the island, except by sight, was the captain.")
//ds_list_add(g_dlg, "lu For safety's sake, he gave the latitude to Bright (probably while Baxter was eavesdropping), and the longitude to Priest. Then the captain died of dysentery or something. So no one really knows where the treasure is buried.")
ds_list_add(g_dlg, "lu For safety's sake, he gave the latitude to Robin, and the longitude to Priest. Then the captain died of dysentery or something. So no one really knows where the treasure is buried.")
ds_list_add(g_dlg, "lu The idea was that only as a team would the crew be able to retrieve the treasure. They didn't really trust each other too much, you know?")
ds_list_add(g_dlg, "lu You have to be able to trust the people you work with.")
ds_list_add(g_dlg, "lu That's why I'd like to work with you two.")
ds_list_add(g_dlg, "l Work with us?")
ds_list_add(g_dlg, "lu Yes. I've already proven that I can be trusted. Remember that coin toss?")
ds_list_add(g_dlg, "lu A person who looks out for themselves is a person who can be relied on. Robin can't be trusted.")
ds_list_add(g_dlg, "lu I joined up with Robin about five years back. He's been on the lookout for Priest too. Always has been, all these years.")
//ds_list_add(g_dlg, "lu And lo and behold, just a couple weeks back, we hear a rumor that he's been hiding out in Brax all this time -- under an assumed name, 'cause he figured no one cared anymore. He carelessly started using his real identity.")
//ds_list_add(g_dlg, "lu But Robin has a long memory. I'm guessing your merchant ship captain did as well. It's an interesting twist of fate, us both ending up with the same information at about the same time like this.")
//ds_list_add(g_dlg, "l So, you want to work together?")
//ds_list_add(g_dlg, "lu Yes. I think that could work out very well. I know a little bit about the two of you. You're not regarded as ruthless or particularly untrustworthy pirates. If anything, you seem to have conducted yourselves rather well.")
//ds_list_add(g_dlg, "lu You did a stint, of course, and your younger brother escaped. I think I can rely on you to look out for his welfare, and I can rely on myself to look out for mine.")
//ds_list_add(g_dlg, "lu I think we could have quite a useful partnership. I know Robin's number. I know the latitude of the treasure. He didn't want me to know, but I found it out a long time ago.")
//ds_list_add(g_dlg, "lu And, now that we have the information from Priest -- who did not live through questioning, unfortunately, while you guys were off checking out that wreck by Saint Jace -- we have the full location of the treasure.")
//ds_list_add(g_dlg, "lu He spent years looking for Priest. Just a couple weeks back, he picked up a tip -- about the same time you did, I'm guessing -- and he went into full frenzy mode.")
ds_list_add(g_dlg, "lu Just a couple weeks back, Robin picked up a tip that Priest was in Brax, and he went into full frenzy mode.")
ds_list_add(g_dlg, "lu And, now that we have the information from Priest -- who did not live through questioning, unfortunately, while you guys were wasting time out by Saint Jace -- we have the full location of the treasure.")
ds_list_add(g_dlg, "g Wait, you know where it is?")
ds_list_add(g_dlg, "lu Oh, yes. And Robin does too. He took off in his ship this morning to sail for it. I'm about to leave myself.")
ds_list_add(g_dlg, "l Wait, so... what do you want with us?")
//ds_list_add(g_dlg, "lu Oh, that's quite simple, really. You see, as I've said, Robin can't be trusted. He's a selfish man, and a violent one, as you've seen. I'm a full captain now. I control the second vessel in his little pirate fleet of two ships.")
//ds_list_add(g_dlg, "lu As I've said, Robin can't be trusted. He's a selfish, violent lunatic. I doubt he'll want to share that gigantic treasure with his co-captain.")
ds_list_add(g_dlg, "lu As I've said, Robin can't be trusted. He's a selfish, violent lunatic.")
//ds_list_add(g_dlg, "lu Something tells me he won't want to split a million pounds in gold and jewels piecewise. He'll want it all. And as captain of a single ship, he gets a sizeable percentage.")
//ds_list_add(g_dlg, "lu Sure, he has to share a little bit with his crew, at least the ones he doesn't kill, but having another captain taking part of the spoils is probably not part of his plan. So I'm thinking he doesn't intend for me to get any of that treasure.")
ds_list_add(g_dlg, "lu I don't like to brag, but I kind of have all the trump cards here. I know where the treasure is, and you don't. But I'm willing to propose a deal.")
ds_list_add(g_dlg, "lu I get half, you guys get half. In exchange for helping me defeat Robin. I have some access to his ship. I can sabotage his cannons, at least most of them.")
//ds_list_add(g_dlg, "lu But I need you guys, in your fast little vessel, to help disable the ship's rigging. For that, I'll need a special kind of chain shot. They actually sell it in Rubina.")
ds_list_add(g_dlg, "lu And two ships stand a much better chance against his flagship than one does.")
ds_list_add(g_dlg, "lu What do you say? Interested?")
ds_list_add(g_dlg, "l Yes. Yes, we're very interested.")
ds_list_add(g_dlg, "lu All right. There's an island where I'd like you to meet me.")
ds_list_add(g_dlg, "lu It's called The Cape of Lost Hope. To get there from here... you pretty much sail as far northwest as you can go.")
ds_list_add(g_dlg, "lu That's where Robin is. That's where this will all end.")
ds_list_add(g_dlg, "lu I'll meet you there. Make sure you're ready for battle.")
/*
ds_list_add(g_dlg, "lu All right. Rubina's a little out of the way. I can't afford to waste a second. Go there, and talk to Jean Martell, the weapons master. Tell him you're looking for a very special brand of chain shot. He'll know what you mean.")
ds_list_add(g_dlg, "lu Afterwards, open this packet. You'll find the coordinates written in there. Don't bother coming without the chain shot. We'll lose without it.")
*/
ds_list_add(g_dlg, "script PlayRelevantMusic")

//TODO enable
//ds_list_add(g_townMarkers, 't1m1')

//TODO remove I guess
ds_list_add(g_dlg, "showmsg Sail northwest to The Cape of Lost Hope.")

g_finalIslandUnlocked = true
ds_list_add(g_townMarkers, 'boss_ship_intro')
}

//TODO: Reenable. This is disabled for now.
else if argument0 == 't1m1' {
ds_list_add(g_dlg, "l You're Jean Martell?")
ds_list_add(g_dlg, "Jean Who are you?")
ds_list_add(g_dlg, "l Friends of Lucy's.")
ds_list_add(g_dlg, "Jean Lucy Wales? Yike. How can I help you?")
ds_list_add(g_dlg, "g We need some chain shot.")
ds_list_add(g_dlg, "l Yeah, a lot of it. We need to take down some rigging.")
ds_list_add(g_dlg, "Jean That's expensive stuff. How much do you need?")
ds_list_add(g_dlg, "l Enough to destroy a huge galleon.")

if g_recruitedHenry {
    ds_list_add(g_dlg, "Henry Basically, enough to knock it beyond all hope of repair.")
    ds_list_add(g_dlg, "g Henry! You're not back on the ship?")
    ds_list_add(g_dlg, "Henry This is a question of seaworthiness. This is my domain.")
}

ds_list_add(g_dlg, "Jean That'll be 10000 gold.")
ds_list_add(g_dlg, "g (Sigh...)")
ds_list_add(g_dlg, "Jean Okay, special price! I don't want Lucy coming after me. 5000 gold!")

//TODO merchant stuff

ds_list_add(g_dlg, "l It's time to open the packet Lucy gave us.")
ds_list_add(g_dlg, "l ...")
ds_list_add(g_dlg, "l The treasure is buried in a place called The Cape of Lost Hope.")
ds_list_add(g_dlg, "g How do we get there?")
ds_list_add(g_dlg, "l It's surprisingly simple. Sail northwest for about as far as we can go before exiting Lycia.")
ds_list_add(g_dlg, "showmsg Sail northwest to The Cape of Lost Hope.")

g_finalIslandUnlocked = true
ds_list_add(g_townMarkers, 'boss_ship_intro')
}

else if argument0 == 'boss_ship_intro' {
g_msgTextCached = ''

ds_list_add(g_dlg, "Bright Lucy! What are you doing on board my ship?")
ds_list_add(g_dlg, "lu Oh well. I guess you would have noticed eventually.")
ds_list_add(g_dlg, "Bright What the hell are you doing?!")
ds_list_add(g_dlg, "lu Oh, I was just taking care of your cannons.")
ds_list_add(g_dlg, "Bright You were what?!")
ds_list_add(g_dlg, "lu Disabling them.")
ds_list_add(g_dlg, "Bright I see. I guess you've grown sick of sharing treasure then.")
ds_list_add(g_dlg, "lu Yeah. I was going to sneak some dynamite into your coffee, but your cook keeps one tight kitchen.")
ds_list_add(g_dlg, "Bright ... It's not like I wasn't planning on killing you eventually.")
ds_list_add(g_dlg, "Bright Now die!")
ds_list_add(g_dlg, "g What's going on over there?")
ds_list_add(g_dlg, "l I heard an explosion... it must have been Lucy disabling Bright's cannons. But where's her ship?")
ds_list_add(g_dlg, "g Beats me. She didn't finish, either. Only about half of those cannons are out of commission.")
if g_recruitedHenry
    ds_list_add(g_dlg, "Henry Yeah, that thing looks pretty sturdy. My opinion, guys, you're screwed.")
ds_list_add(g_dlg, "Betsy I'll go help man the cannons. I'll bake something special afterwards if we're still alive.")
ds_list_add(g_dlg, "l This is going to be dangerous. Stay low. We're going in!")
//ds_list_add(g_dlg, "l It looks like Lucy's disabling Bright's cannons. But she must have been disrupted.")
//ds_list_add(g_dlg, "l Only about half of those cannons are out of commission, and that ship is gigantic. It's still going to be a dangerous battle. Stay low. We're going in!")
}

else if argument0 == 'boss_ship_defeated' {
ds_list_add(g_dlg, "lu Well, that worked out pretty well.")
ds_list_add(g_dlg, "g Lucy! What happened to you?")
ds_list_add(g_dlg, "lu I jumped overboard. So did Robin. He already has a residual force inside these caves, so we've still got a bit of fighting left to do.")
ds_list_add(g_dlg, "l Where's the entrance? And where's your ship?")
ds_list_add(g_dlg, "lu My ship? That's a damn good question.")
ds_list_add(g_dlg, "lu The cave entrance is right over there. Hidden in those rocks, you see?")
ds_list_add(g_dlg, "l No.")
ds_list_add(g_dlg, "lu I'll show you. Follow me.")
ds_list_add(g_dlg, "goto cave")

g_bossShipBeaten = true
}

else if argument0 == 'd2a1' {
ds_list_add(g_dlg, "lu This is bad. They've already been here for hours.")
ds_list_add(g_dlg, "l Come on. Let's fight our way through.")

//TODO remove this block
//ds_list_add(g_townMarkers, 'final_cinematic')
//TryAutoDialogue('final_cinematic', true)
}

else if argument0 == 'final_boss' {
ds_list_add(g_dlg, "Bright Lucy! Found some new suckers to help you already?")
ds_list_add(g_dlg, "l So you're Robin Bright.")
ds_list_add(g_dlg, "Bright Unfortunately, this treasure belongs to me.")
ds_list_add(g_dlg, "Bright And I'll have the lives of you bilge rats and that traitorous bitch as payment for destroying my ship!")
//ds_list_add(g_dlg, "Bright What can I say? Priest bribed everyone on that ship to keep him hidden when he saw me coming. It's amazing what people will do with a little promise of gold. They'll hold back secrets, put their lives on the line for just a few nuggets of gold.")
//ds_list_add(g_dlg, "Bright And of course, once we had Priest, we couldn't leave any witnesses. We should have sunk the whole damn ship, but a Navy ship came up and we had to scuttle. I guess you found the aftereffects.")
//ds_list_add(g_dlg, "Bright Unfortunately, this treasure belongs to me. I'm the one who stole it. And I'll have your lives as payment for destroying my ship.")
//ds_list_add(g_dlg, "l This is it. Be careful, everyone!")
}

else if argument0 == 'final_boss_death' {
ds_list_add(g_dlg, "Bright My... treasure...")
}

else if argument0 == 'final_cinematic' {
ds_list_add(g_dlg, "l Everybody all right?")
ds_list_add(g_dlg, "g Yes.")
ds_list_add(g_dlg, "lu Yeah. I've got a couple cuts, that's all.")
ds_list_add(g_dlg, "g What should we do with him?")
ds_list_add(g_dlg, "lu Leave him here to rot. He doesn't deserve a proper sea burial.")
ds_list_add(g_dlg, "g Take a look up there. That's the treasure cache that Priest's crew must have buried.")
ds_list_add(g_dlg, "l They've already been digging away at it. It's...")
ds_list_add(g_dlg, "l It's smaller than I expected.")
ds_list_add(g_dlg, "g This is the hidden treasure?")
//ds_list_add(g_dlg, "g Saintalmain's diary seemed to indicate that there would be... practically rooms of this stuff!")
ds_list_add(g_dlg, "g Saintalmain's diary was talking like there would be... practically rooms of this stuff!")
ds_list_add(g_dlg, "lu That's what Robin said too. I can't believe it.")
ds_list_add(g_dlg, "l What the hell...")
ds_list_add(g_dlg, "g It's still not bad. I mean, it's not enough to retire on, but it's a fair haul...")
ds_list_add(g_dlg, "lu It's not enough. Remember, I have to split my share with my crew, partly at least. You guys have to split yours with your crew. None of us can retire from this.")
ds_list_add(g_dlg, "l Well, let's start hauling this stuff back onto the ships.")
g_finalCinematic = true
ds_list_add(g_dlg, "goto final_ship_boss")
ds_list_add(g_dlg, "lu And here comes my ship! I'll kill them. Or at least, you can bet they're not getting a share of this treasure.")
ds_list_add(g_dlg, "Second-in-command Sorry, Captain. We sprung a leak and had to make emergency repairs.")
ds_list_add(g_dlg, "lu Sure you did.")
ds_list_add(g_dlg, "lu Well, it looks like our brief partnership has been profitable, although not quite as much as it could have been.")
ds_list_add(g_dlg, "lu What do you say to continuing that partnership?")
ds_list_add(g_dlg, "l You mean, keep raiding a few ships together?")
//ds_list_add(g_dlg, "lu Sure. I don't have a partner anymore, and Robin and I always were more successful tackling merchant convoys as a group.")
ds_list_add(g_dlg, "lu Sure. I don't have a partner anymore, and Robin and I always were more successful raiding the seas as a group.")
//ds_list_add(g_dlg, "lu A few lucky strikes, and maybe one day we'll hit the same jackpot Robin's crew once did.")
ds_list_add(g_dlg, "lu A few lucky strikes, and maybe we'll hit the same jackpot Robin's crew once did.")
ds_list_add(g_dlg, "g All right, I'm game.")
ds_list_add(g_dlg, "l Why not.")

ds_list_add(g_dlg, "Betsy Someone has to keep you lot from dying of scurvy.")
if g_recruitedHenry {
    ds_list_add(g_dlg, "Henry Suit yourselves, guys. I have a shipwright empire to establish. Drop by whenever your ship falls apart.")
    ds_list_add(g_dlg, "Betsy Don't be silly, Henry. You're coming with us, like it or not!")
}

ds_list_add(g_dlg, "l Shall we meet back in Rubina in two days to reconnoiter? We have to pay Alan back, I guess. At least then we'll be free of that debt.")
ds_list_add(g_dlg, "g And maybe we can afford to buy a bigger ship.")
ds_list_add(g_dlg, "l I wouldn't mind being captain of a real ship of the line.")
ds_list_add(g_dlg, "g And I'll be the navigator.")
ds_list_add(g_dlg, "lu ...")
ds_list_add(g_dlg, "lu Well, off they go.")
ds_list_add(g_dlg, "lu Yeah, I think we'll be good partners.")
ds_list_add(g_dlg, "Second-in-command Where to, Captain? Rubina?")
ds_list_add(g_dlg, "lu Not yet. We've got some digging to do first, remember? At the island where Robin's old crew buried the other half of the treasure.")
ds_list_add(g_dlg, "Second-in-command Do you think Lise and Grant will ever become suspicious?")
ds_list_add(g_dlg, "lu You mean, that this treasure was only half the size it should have been? No, I think they'll buy the exaggeration story. Pirates do love to exaggerate their exploits.")
ds_list_add(g_dlg, "lu And it looks like no one else knows that the original crew split the treasure up between two islands.")
ds_list_add(g_dlg, "lu Or that there was an additional pair of coordinates -- that Robin and Priest each got the latitude of one island and the longitude of the other.")
ds_list_add(g_dlg, "lu Besides, it's not like I plan to make a habit of this.")
ds_list_add(g_dlg, "lu Lise and Grant seem like they'll be good partners. I'll probably play fair with them from now on.")
ds_list_add(g_dlg, "lu %2But as for this?")
ds_list_add(g_dlg, "lu %2Heh. I'll never tell.")
ds_list_add(g_dlg, "goto title")
}


else
    show_error("Invalid dialogue: " + argument0, 0)

if room == rm_town {
    if townMgr.bMoveReady {
        //Note: If the town manager is not ready, it'll do this itself in a bit.
        bVisible = true
        alarm[0] = alarmTime
    }
}
else {
    //Enable the dialogue manager
    //TODO I could probably make this statement a little simpler.
    if dialogueMgr.bUsable {
        dialogueMgr.bVisible = true
        dialogueMgr.alarm[0] = dialogueMgr.alarmTime
    }
}

}
