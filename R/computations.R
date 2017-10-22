#' Title Computations for CABIOS 1995 data 
#'
#' @param Protcomp 
#' @param IndiceVals 
#'
#' @return Results of Correspondence analysis, Principal Components Analysis, and Co-inertia Analysis
#' @export
#'
#' @examples
#' computations(Protcomp,IndiceVals)

computations <- function(Protcomp,IndiceVals){
  # load required package
  library(ade4)
  
  # Correspondence analysis:
  coa <- dudi.coa(df = ProtComp, scannf = FALSE, nf = 3)
  
  # Principal Component Analysis with coa's row weigth:
  pca <- dudi.pca(df = IndiceVals, row.w = coa$lw, scannf = FALSE, nf = 3)
  
  # Co-inertia Analysis:
  cia <- coinertia(dudiX = pca, dudiY = coa, scannf = FALSE, nf = 3)
}
