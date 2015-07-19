Thesis Template
===============

This is the (unofficial) LaTeX template I used and customised for my Master’s Thesis at Politecnico di Milano.

The template is loosely based upon a previous template by Filippo Sironi, and the Ph.D. Thesis template by Federico Maggi
(github.com/phretor) released under http://creativecommons.org/licenses/by-nc-sa/3.0/.

This is not actually a real template, but just a skeleton (i.e., `preamble.tex` is supposed to be edited when using the template...).

The template is meant to be used with XeLaTex: the fonts used are provided in the `fonts/` directory.
To use the standard Latex, remove the font definition from the preamble and add the correct inputenc package (e.g., `\usepackage{utf8x}[inputenc]`).

PS: The Makefile requires GNU awk (`gawk`) to sort the abbreviations.
