#import "@local/reed-thesis-template:1.0.0": thesis
#import "@preview/muchpdf:0.1.0": muchpdf

#show: thesis.with(
  title: [
    Thesis Template
  ],
  author: "Lily Larsen",
  advisor: "Marcus Robinson",
  department: "(Mathematics)",
  division: "Mathematics and Natural Sciences",
  cited: read("cited.bib"),
  dedication: [To Ronald Reagan, and the death of fascism in America.],
  introduction: [
    
  ]
)

= The First
<the-first>
This is the first page of the first chapter. You may delete the contents
of this chapter so you can add your own text; it's just here to show you
some examples.

== References, Labels, Custom Commands and Footnotes
<references-labels-custom-commands-and-footnotes>
It is easy to refer to anything within your document using the `label`
and `ref` tags. Labels must be unique and shouldn't use any odd
characters; generally sticking to letters and numbers (no spaces) should
be fine. Put the label on whatever you want to refer to, and put the
reference where you want the reference. LaTeX~will keep track of the
chapter, section, and figure or table numbers for you.

=== References and Labels
<references-and-labels>
Sometimes you'd like to refer to a table or figure, e.g. you can see in
Figure @subd2 that you can rotate figures . Start by labeling your
figure or table with the label command (`\label{labelvariable}`) below
the caption (see the chapter on graphics and tables for examples). Then
when you would like to refer to the table or figure, use the ref command
(`\ref{labelvariable}`). Make sure your label variables are unique; you
can't have two elements named “default.\" Also, since the reference
command only puts the figure or table number, you will have to put
“Table\" or “Figure\" as appropriate, as seen in the following examples:

As I showed in Table @inheritance many factors can be assumed to follow
from inheritance. Also see the Figure @subd for an illustration.

=== Custom Commands
<commands>
Are you sick of writing the same complex equation or phrase over and
over?

The custom commands should be placed in the preamble, or at least prior
to the first usage of the command. The structure of the `\newcommand`
consists of the name of the new command in curly braces, the number of
arguments to be made in square brackets and then, inside a new set of
curly braces, the command(s) that make up the new command. The whole
thing is sandwiched inside a larger set of curly braces.

In other words, if you want to make a shorthand for H$""_2$SO$""_4$,
which doesn't include an argument, you would write:
`\newcommand{\hydro}{H$_2$SO$_4$}` and then when you needed to use the
command you would type `\hydro`. (sans verb and the equals sign
brackets, if you're looking at the .tex version). For example:
H$""_2$SO$""_4$

=== Footnotes and Endnotes
<footnotes-and-endnotes>
You might want to footnote something.#footnote[footnote text] Be sure to
leave no spaces between the word immediately preceding the footnote
command and the command itself. The footnote will be in a smaller font
and placed appropriately. Endnotes work in much the same way. More
information can be found about both on the CUS site.

== Bibliographies
<bibliographies>
Of course you will need to cite things, and you will probably accumulate
an armful of sources. This is why BibTeX was created. For more
information about BibTeX and bibliographies, see our CUS site
(#link("web.reed.edu/cis/help/latex/index.html"););.
There are three pages on this topic: #emph[bibtex] (which talks about
using BibTeX, at #link("/latex/bibtex.html");), #emph[bibtexstyles]
(about how to find and use the bibliography style that best suits your
needs, at #link("/latex/bibtexstyles.html");) and #emph[bibman] (which
covers how to make and maintain a bibliography by hand, without BibTeX,
at at #link("/latex/bibman.html");). The last page will not be useful
unless you have only a few sources. There used to be APA stuff here, but
we don't need it since I've fixed this with my apa-good natbib style
file.

=== Tips for Bibliographies
<tips-for-bibliographies>
+ Like with thesis formatting, the sooner you start compiling your
  bibliography for something as large as thesis, the better. Typing in
  source after source is mind-numbing enough; do you really want to do
  it for hours on end in late April? Think of it as procrastination.

+ The cite key (a citation's label) needs to be unique from the other
  entries.

+ When you have more than one author or editor, you need to separate
  each author's name by the word "and" e.g. \
  `Author = {Noble, Sam and Youngberg, Jessica},`.

+ Bibliographies made using BibTeX (whether manually or using a manager)
  accept LaTeX markup, so you can italicize and add symbols as
  necessary.

+ To force capitalization in an article title or where all lowercase is
  generally used, bracket the capital letter in curly braces.

+ You can add a Reed Thesis citation option. The
  best way to do this is to use the phdthesis type of citation, and use
  the optional "type" field to enter "Reed thesis" or "Undergraduate
  thesis". Here's a test of Chicago, showing the second cite in a
  row being different. Also the second time not in
  a row should be different. Of course in other
  styles they'll all look the same.

== Anything else?
<anything-else>
If you'd like to see examples of other things in this template, please
contact CUS (email cus\@reed.edu) with your suggestions. We love to see
people using LaTeX~for their theses, and are happy to help.

= Mathematics and Science
<mathematics-and-science>
== Math
<math>
TeX~is the best way to typeset mathematics. Donald Knuth designed
TeX~when he got frustrated at how long it was taking the typesetters to
finish his book, which contained a lot of mathematics.

If you are doing a thesis that will involve lots of math, you will want
to read the following section which has been commented out. If you're
not going to use math, skip over this next big red section. (It's red in
the .tex file but does not show up in the .pdf.)

== Chemistry 101: Symbols
<chemistry-101-symbols>
Chemical formulas will look best if they are not italicized. Get around
math mode's automatic italicizing by using the argument
`$\mathrm{formula here}$`, with your formula inside the curly brackets.

So, $upright(F e_2^(2 +) C r_2 O_4)$ is written
`$\mathrm{Fe_2^{2+}Cr_2O_4}$` \
Exponent or Superscript: O$""^(-)$ \
Subscript: CH$""_4$ \
To stack numbers or letters as in $upright(F e_2^(2 +))$, the subscript
is defined first, and then the superscript is defined. \
Angstrom: Å \
Bullet: CuCl $bullet$ 7H$""_2$O \
Double Dagger: \
Delta: $Delta$ \
Reaction Arrows: $arrow.r$ or $arrow.r^(s o l u t i o n)$ \
Resonance Arrows: $arrow.l.r$ \
Reversible Reaction Arrows: $harpoons.rtlb$ or
\$\\xrightleftharpoons\[ \]{solution}\$ (the latter requires the chemarr
package) \

=== Typesetting reactions
<typesetting-reactions>
You may wish to put your reaction in a figure environment, which means
that LaTeX will place the reaction where it fits and you can have a
figure legend if desired:

#figure([#block[
  $upright(C_6 H_12 O_6 + 6 O_2) arrow.r upright(6 C O_2 + 6 H_2 O)$

  ]],
  caption: [
    Combustion of glucose
  ]
)
#label("combustion of glucose")

=== Other examples of reactions
<other-examples-of-reactions>
$upright(N H_4 C l_(\( s \))) harpoons.rtlb upright(N H_(3 \( g \)) + H C l_(\( g \)))$
\
$upright(M e C H_2 B r + M g) arrow.r_(b e l o w)^(a b o v e) upright(M e C H_2 bullet M g bullet B r)$

== Physics
<physics>
Many of the symbols you will need can be found on the math page
(#link("http://web.reed.edu/cis/help/latex/math.html");) and the
Comprehensive LaTeX~Symbol Guide (enclosed in this template download).
You may wish to create custom commands for commonly used symbols,
phrases or equations, as described in Chapter @commands.

== Biology
<biology>
You will probably find the resources at
#link("http://www.lecb.ncifcrf.gov/~toms/latex.html") helpful,
particularly the links to bsts for various journals. You may also be
interested in TeXShade for nucleotide typesetting
(#link("http://homepages.uni-tuebingen.de/beitz/txe.html");). Be sure to
read the proceeding chapter on graphics and tables, and remember that
the thesis template has versions of Ecology and Science bsts which
support webpage citation formats.

= Tables and Graphics
<tables-and-graphics>
== Tables
<tables>
The following section contains examples of tables, most of which have
been commented out for brevity. (They will show up in the .tex document
in red, but not at all in the .pdf). For more help in constructing a
table (or anything else in this document), please see the LaTeX pages on
the CUS site.

#block[
#block[
#figure(
  align(center)[#table(
    columns: 4,
    align: (center,center,center,center,),
    table.header([Factors], [Correlation between Parents &
      Child], [Inherited], [],),
    table.hline(),
    [Education], [-0.49], [Yes], [],
    [Socio-Economic Status], [0.28], [Slight], [],
    [Income], [0.08], [No], [],
    [Family Size], [0.19], [Slight], [],
    [Occupational Prestige], [0.21], [Slight], [],
  )]
  , caption: [Correlation of Inheritance Factors between Parents and
  Child]
  , kind: table
  )<inheritance>

] 
]

If you want to make a table that is longer than a page, you will want to
use the longtable environment. Uncomment the table below to see an
example, or see our online documentation.

#figure(
  align(center)[#table(
    columns: 4,
    align: (center,center,center,center,),
    table.header(table.cell(align: center, colspan: 4)[Chromium
      Hexacarbonyl],),
    table.hline(),
    [State], [Laser wavelength], [Buffer gas], [Ratio of
    $upright("Intensity
    at vapor pressure") / upright("Intensity at 240 Torr")$],
    [State], [Laser wavelength], [Buffer gas], [Ratio of
    $upright("Intensity at vapor pressure") / upright("Intensity at 240 Torr")$],
    [$z^7 P_4^circle.stroked.tiny$], [266 nm], [Argon], [1.5],
    [$z^7 P_2^circle.stroked.tiny$], [355 nm], [Argon], [0.57],
    [$y^7 P_3^circle.stroked.tiny$], [266 nm], [Argon], [1],
    [$y^7 P_3^circle.stroked.tiny$], [355 nm], [Argon], [0.14],
    [$y^7 P_2^circle.stroked.tiny$], [355 nm], [Argon], [0.14],
    [$z^5 P_3^circle.stroked.tiny$], [266 nm], [Argon], [1.2],
    [$z^5 P_3^circle.stroked.tiny$], [355 nm], [Argon], [0.04],
    [$z^5 P_3^circle.stroked.tiny$], [355 nm], [Helium], [0.02],
    [$z^5 P_2^circle.stroked.tiny$], [355 nm], [Argon], [0.07],
    [$z^5 P_1^circle.stroked.tiny$], [355 nm], [Argon], [0.05],
    [$y^5 P_3^circle.stroked.tiny$], [355 nm], [Argon], [0.05, 0.4],
    [$y^5 P_3^circle.stroked.tiny$], [355 nm], [Helium], [0.25],
    [$z^5 F_4^circle.stroked.tiny$], [266 nm], [Argon], [1.4],
    [$z^5 F_4^circle.stroked.tiny$], [355 nm], [Argon], [0.29],
    [$z^5 F_4^circle.stroked.tiny$], [355 nm], [Helium], [1.02],
    [$z^5 D_4^circle.stroked.tiny$], [355 nm], [Argon], [0.3],
    [$z^5 D_4^circle.stroked.tiny$], [355 nm], [Helium], [0.65],
    [$y^5 H_7^circle.stroked.tiny$], [266 nm], [Argon], [0.17],
    [$y^5 H_7^circle.stroked.tiny$], [355 nm], [Argon], [0.13],
    [$y^5 H_7^circle.stroked.tiny$], [355 nm], [Helium], [0.11],
    [$a^5 D_3$], [266 nm], [Argon], [0.71],
    [$a^5 D_2$], [266 nm], [Argon], [0.77],
    [$a^5 D_2$], [355 nm], [Argon], [0.63],
    [$a^3 D_3$], [355 nm], [Argon], [0.05],
    [$a^5 S_2$], [266 nm], [Argon], [2],
    [$a^5 S_2$], [355 nm], [Argon], [1.5],
    [$a^5 G_6$], [355 nm], [Argon], [0.91],
    [$a^3 G_4$], [355 nm], [Argon], [0.08],
    [$e^7 D_5$], [355 nm], [Helium], [3.5],
    [$e^7 D_3$], [355 nm], [Helium], [3],
    [$f^7 D_5$], [355 nm], [Helium], [0.25],
    [$f^7 D_5$], [355 nm], [Argon], [0.25],
    [$f^7 D_4$], [355 nm], [Argon], [0.2],
    [$f^7 D_4$], [355 nm], [Helium], [0.3],
    table.cell(align: center, colspan: 4)[Propyl-ACT],
    [$z^7 P_4^circle.stroked.tiny$], [355 nm], [Argon], [1.5],
    [$z^7 P_3^circle.stroked.tiny$], [355 nm], [Argon], [1.5],
    [$z^7 P_2^circle.stroked.tiny$], [355 nm], [Argon], [1.25],
    [$z^7 F_5^circle.stroked.tiny$], [355 nm], [Argon], [2.85],
    [$y^7 P_4^circle.stroked.tiny$], [355 nm], [Argon], [0.07],
    [$y^7 P_3^circle.stroked.tiny$], [355 nm], [Argon], [0.06],
    [$z^5 P_3^circle.stroked.tiny$], [355 nm], [Argon], [0.12],
    [$z^5 P_2^circle.stroked.tiny$], [355 nm], [Argon], [0.13],
    [$z^5 P_1^circle.stroked.tiny$], [355 nm], [Argon], [0.14],
    table.cell(align: center, colspan: 4)[Methyl-ACT],
    [$z^7 P_4^circle.stroked.tiny$], [355 nm], [Argon], [1.6, 2.5],
    [$z^7 P_4^circle.stroked.tiny$], [355 nm], [Helium], [3],
    [$z^7 P_4^circle.stroked.tiny$], [266 nm], [Argon], [1.33],
    [$z^7 P_3^circle.stroked.tiny$], [355 nm], [Argon], [1.5],
    [$z^7 P_2^circle.stroked.tiny$], [355 nm], [Argon], [1.25, 1.3],
    [$z^7 F_5^circle.stroked.tiny$], [355 nm], [Argon], [3],
    [$y^7 P_4^circle.stroked.tiny$], [355 nm], [Argon], [0.07, 0.08],
    [$y^7 P_4^circle.stroked.tiny$], [355 nm], [Helium], [0.2],
    [$y^7 P_3^circle.stroked.tiny$], [266 nm], [Argon], [1.22],
    [$y^7 P_3^circle.stroked.tiny$], [355 nm], [Argon], [0.08],
    [$y^7 P_2^circle.stroked.tiny$], [355 nm], [Argon], [0.1],
    [$z^5 P_3^circle.stroked.tiny$], [266 nm], [Argon], [0.67],
    [$z^5 P_3^circle.stroked.tiny$], [355 nm], [Argon], [0.08, 0.17],
    [$z^5 P_3^circle.stroked.tiny$], [355 nm], [Helium], [0.12],
    [$z^5 P_2^circle.stroked.tiny$], [355 nm], [Argon], [0.13],
    [$z^5 P_1^circle.stroked.tiny$], [355 nm], [Argon], [0.09],
    [$y^5 H_7^circle.stroked.tiny$], [355 nm], [Argon], [0.06, 0.05],
    [$a^5 D_3$], [266 nm], [Argon], [2.5],
    [$a^5 D_2$], [266 nm], [Argon], [1.9],
    [$a^5 D_2$], [355 nm], [Argon], [1.17],
    [$a^5 S_2$], [266 nm], [Argon], [2.3],
    [$a^5 S_2$], [355 nm], [Argon], [1.11],
    [$a^5 G_6$], [355 nm], [Argon], [1.6],
    [$e^7 D_5$], [355 nm], [Argon], [1],
  )]
  , caption: [Chromium Hexacarbonyl Data Collected in 1998--1999]
  , kind: table
  )

== Figures
<figures>
If your thesis has a lot of figures, LaTeX~might behave better for you
than that other word processor. One thing that may be annoying is the
way it handles "floats" like tables and figures. LaTeX~will try to find
the best place to put your object based on the text around it and until
you're really, truly done writing you should just leave it where it
lies. There are some optional arguments to the figure and table
environments to specify where you want it to appear; see the comments in
the first figure.

If you need a graphic or tabular material to be part of the text, you
can just put it inline. If you need it to appear in the list of figures
or tables, it should be placed in the floating environment.

To get a figure from StatView, JMP, SPSS or other statistics program
into a figure, you can print to pdf or save the image as a jpg or png.
Precisely how you will do this depends on the program: you may need to
copy-paste figures into Photoshop or other graphic program, then save in
the appropriate format.

Below we have put a few examples of figures. For more help using
graphics and the float environment, see our online documentation.

And this is how you add a figure with a graphic:

#figure(muchpdf(read("subdivision.pdf", encoding: none)),
  caption: [
    A Figure
  ]
)
<subd>

== More Figure Stuff
<more-figure-stuff>
You can also scale and rotate figures.

#figure(muchpdf(read("subdivision.pdf", encoding: none)),
  caption: [
    A Smaller Figure, Flipped Upside Down
  ]
)
<subd2>

== Even More Figure Stuff
<even-more-figure-stuff>
With some clever work you can crop a figure, which is handy if (for
instance) your EPS or PDF is a little graphic on a whole sheet of paper.
The viewport arguments are the lower-left and upper-right coordinates
for the area you want to crop.

#figure(muchpdf(read("subdivision.pdf", encoding: none)),
  caption: [
    A Cropped Figure
  ]
)
<subd3>

=== Common Modifications
<common-modifications>
The following figure features the more popular changes thesis students
want to their figures. This information is also on the web at
#link("web.reed.edu/cis/help/latex/graphics.html");.

#figure([#block[
  #box(muchpdf(read("subdivision.pdf", encoding: none)))
  ]],
  caption: [
    Subdivision of arc segments. You can see that $p_3 = p_6'$.
  ]
)
<barplot>

#heading(level: 1, numbering: none)[Conclusion]
<conclusion>
Here's a conclusion, demonstrating the use of all that manual
incrementing and table of contents adding that has to happen if you use
the starred form of the chapter command. The deal is, the chapter
command in LaTeX~does a lot of things: it increments the chapter
counter, it resets the section counter to zero, it puts the name of the
chapter into the table of contents and the running headers, and probably
some other stuff.

So, if you remove all that stuff because you don't like it to say
"Chapter 4: Conclusion", then you have to manually add all the things
LaTeX~would normally do for you. Maybe someday we'll write a new chapter
macro that doesn't add "Chapter X" to the beginning of every chapter
title.

== More info
<more-info>
And here's some other random info: the first paragraph after a chapter
title or section head #emph[shouldn't be] indented, because indents are
to tell the reader that you're starting a new paragraph. Since that's
obvious after a chapter or section title, proper typesetting doesn't add
an indent there.

#heading(level: 1, numbering: none)[The First Appendix]
<the-first-appendix>
#heading(level: 1, numbering: none)[The Second Appendix For Fun]
<the-second-appendix-for-fun>
