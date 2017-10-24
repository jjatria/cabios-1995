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
  axes = 3;

  # Correspondence analysis
  coa <- ade4::dudi.coa(
    df     = ProtComp,
    scannf = FALSE,
    nf     = axes
  );
  
  # Principal Component Analysis with coa's row weigth
  pca <- ade4::dudi.pca(
    df     = IndiceVals,
    row.w  = coa$lw,
    scannf = FALSE,
    nf     = axes
  );
  
  # Co-inertia Analysis
  cia <- ade4::coinertia(
    dudiX  = pca,
    dudiY  = coa,
    scannf = FALSE,
    nf     = axes
  );

  return(cia);
}
