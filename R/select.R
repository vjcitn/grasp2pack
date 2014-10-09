
selectByPapPheDescs = function(desc) {
  if (!exists("descIndex")) data(descIndex)
  descs = names(descIndex)
  inds = which(descs %in% desc)
  if (length(inds)==0) stop("description not in index")
  tmp = loadResults(GRASP2, unique(unlist(descIndex[inds])))  # is list
  tmp = bplapply(tmp, function(x) as(x[ which(x$PaperPhenotypeDescription %in% desc) ], "GRanges"))
  new("g2GRanges", GenomicRanges::unlist(GRangesList(tmp)))
}
