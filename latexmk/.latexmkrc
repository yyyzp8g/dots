# Make PDF when compile
$pdf_mode = 1;

# Using xelatex
$pdflatex = "xelatex -file-line-error --shell-escape -src-specials -synctex=1 -interaction=nonstopmode %O %S;cp %D %R.pdf";

# Improve its detection of source files and generated files after a run of latex or pdflatex
$recorder = 1;

# Toggle PDF preview
$pdf_previewer = "open -a %S";

# Continuous mode
$preview_continuous_mode = 0;

# Update automatically
$pdf_update_method = 0;

# Cleanup Files
$clean_ext = "synctex.gz acn acr alg aux bbl bcf blg brf fdb_latexmk glg glo gls idx ilg ind ist lof log lot out run.xml toc dvi";

# Run BibTeX or biber whenever it appears necessary  to update the bbl files, without testing for the existence of the bib files
$bibtex_use = 2;

# Compile out to temp then copy to current dir(as second command does)
$out_dir = "temp";
