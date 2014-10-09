.onAttach = function(libname, pkgname) {
  message("grasp2pack: see http://apps.nhlbi.nih.gov/Grasp/Overview.aspx for details")
  message(" ")
  message("Users please cite: Leslie R, O’Donnell CJ, Johnson AD (2014) GRASP: analysis")
  message(" of genotype-phenotype results from 1,390 genome-wide association")
  message(" studies and corresponding open access database. ")
  message(" Bioinformatics 30(12), i185-94. GRASP Build 2.0.0.0")
  message(" ")
  message("assigning registry as GRASP2...")
  data(grasp2reg)
  grasp2reg$work.dir = system.file("g2shards", package="grasp2pack")
  grasp2reg$file.dir = system.file("g2shards", package="grasp2pack")
  class(grasp2reg) = c("g2reg", "Registry")  # for overloading
  assign("GRASP2", grasp2reg, .GlobalEnv)
  message("done.")
}

