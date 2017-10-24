#' Computations on IndiceVals & ProtComp data
#'
#' @param ProtComp 
#' @param IndiceVals 
#'
#' @return Returns the co-inertia analysis results
#' @export
#'
#' @examples
#' cia <-computations(ProtComp, IndiceVals)
#' 
computations <- function(ProtComp, IndiceVals) {
  
  # load required package
  library(ade4)
  axes = 3
  
  # Correspondence analysis:
  coa <- dudi.coa(
    df     = ProtComp,
    scannf = FALSE,
    nf     = axes
  )
  
  # Principal Component Analysis with coa's row weigth:
  pca <- dudi.pca(
    df     = IndiceVals,
    row.w  = coa$lw,
    scannf = FALSE,
    nf     = axes
  )
  
  # Co-inertia Analysis:
  cia <- coinertia(
    dudiX  = pca,
    dudiY  = coa,
    scannf = FALSE,
    nf     = axes
  )
}
