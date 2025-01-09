## Test environments
* local  "Windows" "10 x64" "build 17763",  R 4.4.1
* win-builder
* macOS builder
* ubuntu-latest on GitHub
* macos-13 on GitHub
* macos-latest on GitHub
* windows-latest on GitHub

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.

## Notes

* Set the tests to omit fitting vine copulas on CRAN, as one of the tests caused an error on CRAN servers, but not in the other test environments.
* In function dr_maxnet, renamed parameter "f" to "formula" and replace "T" with "TRUE" in the function, per CRAN comments.
* In function get_response_curves, changed print() to message(), per CRAN comments.
* Added references to the description, per CRAN comments.
* Fixed missing documentation of the objects/values returned by some of the functions, per CRAN comments.
