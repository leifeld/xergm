# display version number and date when the package is loaded
.onAttach <- function(libname, pkgname) {
  desc  <- packageDescription(pkgname, libname)
  packageStartupMessage(
    'Package:  xergm\n', 
    'Version:  ', desc$Version, '\n', 
    'Date:     ', desc$Date, '\n', 
    'Authors:  Philip Leifeld (University of Glasgow)\n',
    '          Skyler J. Cranmer (The Ohio State University)\n',
    '          Bruce A. Desmarais (Pennsylvania State University)', 
    '\n\nPlease cite the xergm package in your publications ', 
    '-- see citation("xergm").\n'
  )
}
