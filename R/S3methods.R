
#loadResult = UseMethod("loadResult")
#loadResult.default = BatchJobs::loadResult
#
#loadResult.g2reg = function (reg, id, 
#     part = NA_character_, missing.ok = FALSE) {
#  tmp = loadResult.default(reg, id, part, missing.ok)
#  new("g2GRanges", tmp)
#}

