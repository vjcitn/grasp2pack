
# we know there are 2000 chunks
gr2apply = function(f, jobinds=1:2000) 
     bplapply(jobinds, function(x) f(loadResult(GRASP2,x)))
