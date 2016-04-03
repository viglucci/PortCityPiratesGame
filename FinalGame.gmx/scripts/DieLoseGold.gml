if room == rm_ocean {
    if g_gold <= 300
        g_gold = 0
    else if g_gold <= 1000
        g_gold = floor(g_gold * 0.5)
    else if g_gold <= 3000
        g_gold = floor(g_gold * 0.6)
    else
        g_gold = floor(g_gold * 0.8)
}
else {
    if g_gold <= 150
        g_gold = 0
    else if g_gold <= 1000
        g_gold = floor(g_gold * 0.8)
    else if g_gold <= 3000
        g_gold = floor(g_gold * 0.8)
    else
        g_gold = floor(g_gold * 0.9)
}
