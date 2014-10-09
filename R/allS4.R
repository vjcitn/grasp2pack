
setOldClass("Registry")

setClass("g2reg", representation(regobj="Registry"))
setMethod("show", "g2reg", function(object) {
 print(object@regobj)
})

getRegistry = function(x) x@regobj

setGeneric("loadResult", function (reg, id, 
     part = NA_character_, missing.ok = FALSE) standardGeneric("loadResult"))
setMethod("loadResult", c("g2reg", "ANY", "character", "logical"),
   function (reg, id, 
     part = NA_character_, missing.ok = FALSE) {
  ans = BatchJobs::loadResult(reg, id, part, missing.ok)
  seqlevelsStyle(ans) = "UCSC"
  sn = seqlevels(ans)
  seqinfo(ans) = hg19si()[sn]
  new("g2GRanges", ans)
  })
setMethod("loadResult", c("g2reg", "ANY", "missing", "missing"),
   function (reg, id, 
     part = NA_character_, missing.ok = FALSE) {
  loadResult(reg, id, NA_character_, FALSE)
  })

setClass("g2GRanges", contains="GRanges")

setMethod("show", "g2GRanges", function(object) {
  cat(paste0("GRASP2 shard: find additional fields with names(mcol(...))\n"))
  cat(" \n")
  cols2show = c("SNPid.dbSNP134.", "PMID", "Pvalue")
  show(as(object[, cols2show], "GRanges"))
  })

setGeneric("loadResults", 
  function (reg, ids, part = NA_character_, simplify = FALSE, use.names = "ids", missing.ok = FALSE) 
    standardGeneric("loadResults"))

setMethod("loadResults", c("g2reg", "ANY", "character", "logical",
   "character", "logical"),
  function (reg, ids, part = NA_character_, simplify=FALSE, use.names="ids", missing.ok = FALSE) {
  ans = BatchJobs::loadResults(reg, ids, part, simplify, use.names, missing.ok)
  ans = GenomicRanges::unlist(GRangesList(ans))
  seqlevelsStyle(ans) = "UCSC"
  sn = seqlevels(ans)
  seqinfo(ans) = hg19si()[sn]
  new("g2GRanges", ans)
  })

setMethod("loadResults", c("g2reg", "ANY", "missing", "missing", "missing",
    "missing"),
   function (reg, ids, 
     part = NA_character_, simplify=FALSE, use.names="ids", missing.ok = FALSE) {
  loadResults(reg, ids, NA_character_, FALSE, "ids", FALSE)
  })
