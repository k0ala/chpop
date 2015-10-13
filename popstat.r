
library(ggplot2)
library(reshape2)

# http://www.bfs.admin.ch/bfs/portal/fr/index/themen/01/07/blank/key/03.html
# http://www.bfs.admin.ch/bfs/portal/fr/index/themen/01/07/blank/key/03.Document.88358.xls
nat = c(16060, 14299, 12723, 11831, 11850, 14393, 14416, 12370, 11356, 10342, 8658, 8757, 11133, 12898, 13739, 16790, 19159, 19169, 21279, 20363, 28700, 27583, 36515, 35424, 35685, 38437, 46711, 43889, 44365, 43440, 39314, 36012, 33500, 34061, 32836)
cnat = cumsum(nat)

# http://www.bfs.admin.ch/bfs/portal/fr/index/themen/01/02/blank/data/01.html
# http://www.bfs.admin.ch/bfs/portal/fr/index/themen/01/02/blank/data/01.Document.67176.xls
ch = c(5421746, 5442311, 5462782, 5481246, 5502490, 5524160, 5546455, 5567111, 5587259, 5607711, 5623584, 5649804, 5664377, 5676808, 5686526, 5698764, 5711852, 5721307, 5739892, 5757814, 5779685, 5808100, 5836887, 5863241, 5890439, 5917216, 5954212, 5991401, 6032141, 6071802, 6103857, 6138668, 6169091, 6202184, 6239207) 

# http://www.bfs.admin.ch/bfs/portal/fr/index/themen/01/02/blank/data/01.html
# http://www.bfs.admin.ch/bfs/portal/fr/index/themen/01/02/blank/data/01.Document.67176.xls
nch = c(913497, 930593, 946931, 946587, 953406, 960674, 976958, 999688, 1032714, 1066139, 1127109, 1192964, 1243582, 1291762, 1332493, 1363590, 1369494, 1375158, 1383645, 1406630, 1424370, 1447553, 1476966, 1500907, 1524663, 1541912, 1554527, 1602093, 1669715, 1714004, 1766277, 1815994, 1869969, 1937447, 1998459)

pop = data.frame(
  anno = c(1980:2014),
  chg = ch - cnat,
  che = cnat,
  nch = nch
)

mpop = melt(pop, id.vars="anno")

ggplot(mpop) + theme_grey(base_size = 20) +
    geom_area(aes(x=anno, y=value/1e6, fill=variable), stack=TRUE) +
    ggtitle("Bevölkerung der Schweiz") +
    xlab("Jahr") + ylab("Einwohner (Mio)") + 
    scale_fill_manual(
      values=c("red","yellow","darkgray"), 
      breaks=c("nch","che","chg"),
      name=c("Kategorie"),
      labels=c("Ausländer", "Eingebürgerte seit 1980", "'Gebürtige' Schweizer")
    )
    
ggplot(mpop) + theme_grey(base_size = 20) +
    geom_area(aes(x=anno, y=value/1e6, fill=variable), stack=TRUE) + 
    ggtitle("Population de la Suisse") +
    xlab("Année") + ylab("Habitants (Millions)") + 
    scale_fill_manual(
      values=c("red","yellow","darkgray"), 
      breaks=c("nch","che","chg"),
      name=c("Catégorie"),
      labels=c("Etrangers", "Naturalisés depuis 1980", "Suisses 'de naissance'")
    )
    
  
