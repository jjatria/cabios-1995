#
# Read the files:
#
AANames <- readLines("http://pbil.univ-lyon1.fr/members/lobry/repro/cabios95/AANames")
ProtNames <- readLines("http://pbil.univ-lyon1.fr/members/lobry/repro/cabios95/ProtNames")
IndiceNames <- readLines("http://pbil.univ-lyon1.fr/members/lobry/repro/cabios95/IndiceNames")
IndiceVals <- read.table("http://pbil.univ-lyon1.fr/members/lobry/repro/cabios95/IndiceVals",
  sep = "\t", header = FALSE)
ProtComp <- read.table("http://pbil.univ-lyon1.fr/members/lobry/repro/cabios95/ProtComp",
  sep = "\t", header = FALSE)
#
# Set column and row names:
#
names(IndiceVals) <- AANames
rownames(IndiceVals) <- IndiceNames
names(ProtComp) <- AANames
rownames(ProtComp) <- ProtNames
#
# Transpose dataframes so as to have the 20 amino-acids in row:
#
IndiceVals <- as.data.frame(t(IndiceVals))
ProtComp <- as.data.frame(t(ProtComp))