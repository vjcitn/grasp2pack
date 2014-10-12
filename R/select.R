
selectByPapPheDescs = function(desc) {
  if (!exists("descIndex")) data(descIndex)
  descs = names(descIndex)
  inds = which(descs %in% desc)
  if (length(inds)==0) stop("description not in index")
  tmp = loadResults(GRASP2, unique(unlist(descIndex[inds])))  # is list
  tmp = bplapply(tmp, function(x) as(x[ which(x$PaperPhenotypeDescription %in% desc) ], "GRanges"))
  new("g2GRanges", GenomicRanges::unlist(GRangesList(tmp)))
}

selectByGRanges = function (gr)
{
    if (!exists("grasp2index")) 
        data(grasp2index)
    inds = which(grasp2index %over% gr)
    if (length(inds) == 0) 
        stop("gr not overlapped by any index element")
    inds = (grasp2index[inds])$jobid
    if (length(inds)==1) {
      tmp = loadResult(GRASP2, inds)
      tmp = tmp[ which(tmp %over% gr) ]
      return(tmp)
      }
    tmp = loadResults(GRASP2, inds)
    tmp = bplapply(tmp, function(x) x[ which(x %over% gr) ] )
    new("g2GRanges", GenomicRanges::unlist(GRangesList(tmp)))
}

