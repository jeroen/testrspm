unlink(list.files(tempdir(), pattern = '^repos'))
testrepo <- Sys.getenv('TESTREPO')
pkgs <- available.packages(repos = testrepo)
message("Found ", nrow(pkgs), " packages for ", testrepo)
tryCatch({
  as.numeric_version(pkgs[,'Version'])
}, error = function(e){
  print(tail(pkgs))
  stop(e)
})
