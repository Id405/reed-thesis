r#import "@local/reed-thesis-template:1.0.1": thesis
#import "@preview/muchpdf:0.1.0": muchpdf
#import "@preview/ctheorems:1.1.3": *
#import "@preview/drafting:0.2.2": margin-note, set-margin-note-defaults
#import "@preview/colorful-boxes:1.1.0": stickybox
#import "@preview/cetz:0.4.2"
#import "@preview/quick-maths:0.2.1": shorthands

#let colors = (
  blue: rgb("#648fff"),
  yellow: rgb("#ffb000"),
  magenta: rgb("#dc267f"),
)

#let blue(body) = {
  text(fill: colors.blue)[#body]
}

#let yellow(body) = {
  text(fill: colors.yellow)[#body]
}

#let magenta(body) = {
  text(fill: colors.magenta)[#body]
}

#let default-rect(stroke: none, fill: none, width: 0pt, content) = {
  stickybox(rotation: 2deg, width: width / 1.2)[
    #set text(9pt)
    #content
  ]
}
#set-margin-note-defaults(rect: default-rect, stroke: (
  paint: gray,
  thickness: 0.75pt,
  dash: "loosely-dashed",
))

#let todo = [#stickybox(width: 4cm, rotation: 5deg)[#v(2em) *TODO* #v(2em)]]

#show: thmrules.with(qed-symbol: $square$)

#let theorem = thmplain(
  "theorem",
  "Theorem",
  titlefmt: title => strong([#title]),
  namefmt: name => emph([#name]),
  separator: [.],
  inset: (top: 0em, left: 0em, right: 0em),
)

#let lemma = thmplain(
  "theorem",
  "Lemma",
  titlefmt: title => strong([#title]),
  namefmt: name => emph([#name]),
  separator: [.],
  inset: (top: 0em, left: 0em, right: 0em),
)

#let corollary = thmplain(
  "theorem",
  "Corollary",
  titlefmt: title => strong([#title]),
  namefmt: name => emph([#name]),
  separator: [.],
  inset: (top: 0em, left: 0em, right: 0em),
)

#let definition = thmplain(
  // Don't use titles for definition
  "theorem",
  "Definition",
  titlefmt: title => strong([#title]),
  namefmt: name => emph([#name]),
  inset: (top: 0em, left: 0em, right: 0em),
)

#let proposition = thmplain(
  "theorem",
  "Proposition",
  titlefmt: title => strong([#title]),
  namefmt: name => emph([#name]),
  inset: (top: 0em, left: 0em, right: 0em),
)

#let example = thmplain(
  "theorem",
  "Example",
  titlefmt: title => strong([#title]),
  inset: (top: 0em, left: 0em, right: 0em),
)

#let proof = thmproof(
  "theorem",
  "Proof",
  namefmt: name => emph([of #name]),
  inset: (top: 0em, left: 0em, right: 0em),
)

#let padic(p: "p", star: none) = {
  if star != none {
    return [$phi.alt_(#p)^#star$]
  }

  [$phi.alt_#p$]
}

#show: shorthands.with(
  ($p*$, padic(star: "*")),
  ($p-$, padic()),
  ($2*$, padic(p: "2", star: "*")),
  ($2-$, padic(p: "2")),
)

#set cite(style: "alphanumeric")

#show: thesis.with(
  title: [
    Stein's Generalized Conjecture on Equidissection
  ],
  author: "Lily Larsen",
  advisor: "Marcus Robinson",
  department: "(Mathematics)",
  division: "Mathematics and Natural Sciences",
  cited: read("cited.bib"),
  dedication: [I would like to dedicate this to.],
  acknowledgements: [Leto Barnes, Rain Tronoski, Miguel Esteve, June Duvivier, Hannibal Grubis.],
  introduction: [
    In 1965 Fred Richman was preparing a masters degree exam at New Mexico State University. When preparing a question on geometry he began playing with divisions of the unit square into triangles which all have equal area. For even an even number of triangles this process is quite easy. One could divide the square in half and then divide the two triangles which result into $n$ triangles, resulting in $2n$ triangles of area $1/(2n)$. However, the construction of a division of the unit square into and odd number of triangles is much less clear. So, he asked does such a division exist? This question seems like one who's solution would predate modern mathematics.#margin-note[This doesn't quite convey how exciting this should be to the reader.] However Richman was unable to find any reference to the problem in mathematical literature. Richman proved that such a division did not exist with 3 or 5 triangles, but was unable to prove the general case and left the problem off of the exam. @stein_algebra_2014[p.~107]

    Richman posed the question to John Thomas who proved there was no such division of the unit square if the vertices had rational coordinates with odd denominators. His submission of this proof to the Mathematics Magazine was placed on hold due to worries that the problem was possibly well known, or had a simple solution. The problem was instead submitted to the Mathematical Monthly where it laid unsolved, prompting the submission to the Mathematical Monthly to be included in a 1968 edition @thomas_dissection_1968.

    Two years after the submission to the Mathematical Monthly, Paul Monsky published a surprising proof which made use of a coloring of the real plane based on the $2$-adic metric to show such a division was impossible for any odd number of triangles @monsky_dividing_1970.#margin-note[Some elaboration needs to be done here on why this is so strange.]

    The theorem was then generalized into $n$-dimensions in #cite(<thomas_dissection_1968>, form: "prose")#margin-note[fix prose citations]. In these generalizations, these divisions of the square into triangles began to be called _dissections_, and ones where the triangles are of equal area _equidissections_. The next generalization came in #cite(<kasimatis_dissections_1989>, form: "prose"), where the theorem was generalized to show that for regular polygons with $n >=$ 5 sides, any equidissection had a multiple of $n$ triangles. The story, told in #cite(<stein_algebra_2014>, form: "prose") is quite entertaining.
    #quote(block: true)[
      In 1985 Elaine Kasimatis, then a graduate student, was look-
      ing for some algebraic topic she could slip into G. D . Chakerian's
      geometry seminar at Davis. Stein suggested that she report on dis-
      sections of the square and cube, a topic that Chakerian grudgingly
      admitted was geometric. After the talk, Stein asked, " What about
      the regular pentagon ? " Kasimatis's answer was published in 1989
    ]

    Immediately following the results of #cite(<kasimatis_dissections_1989>, form: "prose"). Stein suggested the results for even $n$ suggest no centrally symmetric polygon has an odd equidissection in #cite(<stein_equidissections_1989>, form: "prose"). This was later proven in #cite(<monsky_conjecture_1990>, form: "prose"). In #cite(<stein_cutting_1999>, form: "prose") Stein conjectures there is no odd equidissection for polyominos and shows the conjecture holds true for polyominos with an odd number of triangles. #cite(<praton_cutting_2002>, form: "prose") proves this conjecture in the general case.#margin-note[This starts to get super dry] Stein then combines the two previous conjectures in #cite(<stein_cutting_2004>, form: "prose") where he claims no balanced polygon has odd equidissection, where a balanced polygon is any polygon in which every side has a matching parallel side. This conjecture has been shown for squares @monsky_dividing_1970, centrally symmetric polygons @kasimatis_dissections_1989, polyominos @praton_cutting_2002, and lattice polygons @rudenko_equidissection_2012. The general case remains open.
  ],
)

= Background

== The $p$-adic valuation

#margin-note[
  I think I would like to see in this section, instead of giving a definition of a function or coloring that happens to be useful, show the process of creating these functions with the goal of specific end properties in mind.
]

At its core, the $p$-adic valuation is an abstraction of the idea of divisibility by a given prime number. Instead of measuring if a given number is divisible by prime number, we measure how many times it is divisible by that prime.

#example[
  We want to test how many times the number $24$ is divisible by the prime $2$. We can write $24 = 2 dot 12$, so $24$ is divisible by $2$. Then, we divide the quotient, $12$ by $2$ again, yielding $12 = 2 dot 6$. Continuing yields $6 = 2 dot 3$. We cannot divide $3$ by $2$, so $24$ is divisible by $2$ exactly $3$ times. To commemorate this occasion, we can perform a series of substitutions to write $24 = 2 dot (2 dot [2 dot 3]) = 2^3 dot 3$.
]

Notice the above example suggests we are able to perform a substitution to write a given integer $a$ as $a = p^n q$ for a given prime $p$ and integer $q$ where $q$ is not divisible by $p$ if we can divide $a$ by $p$ $n$ times but not $n + 1$ times.

#proof[
  Fix a prime $p$ and an integer $a_0$. Suppose $p$ divides $a_0$ $n$ times but not $n + 1$ times. If $n = 0$, then we can write $a = 1 dot a_0 = p^0 dot a_0 = p^n dot a$. If $n$ is greater than $0$ we can write $a_0 = p dot a_1$. Then, $a_1$ is divisible by $p$ $n - 1$ times. We can continue this process $n$ times, allowing us to write $a_(n - 1) = p dot a_n$. Further, $p divides.not a_n$ since we can't divide $p$ by $a_0$ $n + 1$ times. Finally, we perform substitution to get $a_0 = p dot p dots.c p dot a_n = p^n dot a_n$.
]

If we can now show that writing an integer in the form $a = p^n q$ where $p$ does not divide $q$ implies we can divide $a$ by $p$ $n$ times but not $n + 1$ times, then we have shown that a certain integer being divisible by $p$  $n$ times and not any more is the same as being able to write it in the above form.

#proof[
  Suppose we can write an integer of the form $a_0 = p^n a_n$ where $p$ does not divide $a_n$. Then $a_0 = p dot dots.c p dot a_n$. We can expand this out into $n$ quotients, $a_0, a_1, ..., a_n$ where $a_m = p a_(m + 1)$. So, we can divide $a_0$ by $p$ $n$ times. Since $p$ does not divide $a_n$, we cannot divide $a_0$ by $p$ more than $n$ times.
]

The equivalence of these definitions allow us to easily define a function which measures the maximum number of times we can divide an integer by a given prime $p$.

#definition[
  Let $a, p in ZZ$ such that $p$ is prime. Write $a = p^n q$ where $p divides.not q$. The _p-adic valuation_ of $a$ is $n$ written as $p- (a) = n$, if $a = 0$, we define $p- (a) = infinity$, or the number greater than all real numbers (don't think about it too hard).
]

#example[ // carried example?
  
]

#definition[
  Fix some prime $p in N$ and let $q in QQ$ where $q$ is nonzero and we can write $q = r/s$ in lowest terms. Then we say the _$p$-adic valuation_ of $q$ is equal to $n$, written as $p-(q) = n$ if and only if there exists some $a, b in ZZ$ such that $q = p^n a/b$ and $p divides.not a, b$. If $q = 0$, we define $p-(0) = infinity$. #margin-note[Provide examples.].
]

#proposition[ 
  $p-$ is well defined over the integers. That is, fix a prime $p in ZZ$, if $a = p^n q$ and $a = p^m r$ where $p divides.not q$ and $p divides.not r$ for $a in ZZ$, then $n = m$.
]

#proof[
  Consider the prime factorization of $a$, $a = a_0^i_0 dots.c a_j^i_j$. If $p$ is not present in this prime factorization, then $p divides.not q$, so, $p^n divides a$ if and only if $n = 0$, so $n = m = 0$. Otherwise, $p$ is present in the prime factorization. So we can write $a = a_0^i_0 dots.c p^n dots.c a_j^i_j$ and similarly for $m$. So, $n = m$ by the uniqueness of prime factorization.
]

#proposition[
  Let $a in QQ$ such that $x = r/s$ where $r/s$ in lowest terms. Let $p-(a) = p-(r) - p-(s)$. This defines an extension of the p-adic valuation from $ZZ$ to $QQ$.
]

This extension is well defined since there is only one way to write $a = r/s$ in lowest terms. We can use this definition to find an equivalent definition of the $p$-adic valuation over the rational numbers which is similar to our definition over the integers.

#proposition[
  Let $a in QQ$, then $p- (r/s) = n$ if and only if you can write $a = p^n u/v$ such that $p divides.not u, v$.
]

#proof[
  Let $r/s in QQ$, then $p- (r) = n$, $p- (s) = m$ if and only if $r = p^n u$, $s = p^m v$ and $p divides.not u, v$. So $r/s = (p^n u)/(p^n v) = p^(n - m) u/v$ if and only if $m-(r) - p-(s) = n - m$.
]

#theorem[
  Fix some prime $p$ and let some $a, b in QQ$. Then,
  + p-(-a) = p-(a)
  + $p-(a b) = p-(a) + p-(b)$,
  + and $p-(a + b) >= min(p-(a), p-(b))$.
]<valuation>#footnote[Satisfying these three properties qualifies the $p$-adic valuation as a type of function known as a valuation. While inconsequential to equidissection, the fascinating consequences of this classification are explored by #cite(<gouvea_p-adic_2020>, form: "prose").]

#proof[
  Write $x = p^(n) u/v$ and $y = p^(m) r/s$ where $p divides.not u, v, r, s$. 
  + $-x = p^(n) (-u/v)$ if and only if $x = p^(n) u/v$.
  + We can write $x y = p^(n) u/v p^(m) r/s$. Then $x y = p^(n + m) (u r)/(v s)$. Also $p divides.not u, r, v, s$ so $p divides.not (u r), (v s)$ since $p$ prime.
  + Suppose $n <= m$. We can write $x + y = p^(n) u/v + p^(m) r/s$. Then we can factor out the smaller exponent of $p$ to get $x + y = p^(n)(u/v + p^(m - n) r/s) = p^n (u/v + ((p^m - n)r)/s) = p^n (u s + (p^m - n) r v)/(s v)$. We know $p divides p^(m - n) r v$ since it is a multiple of $p$. So $p divides.not u s + (p^m - n) r v$ since $p divides.not u s$. Also $p divides.not (s v)$ as shown in 2. Therefore $p- (x + y) >= p- (x)$.
]

#theorem[
  Fix some prime $p$. Then for any $a in RR without QQ$ there exists a well defined function $padic(star: "a"): QQ -> ZZ$ such that
  1. $padic(star: "a")(a) = 1$
  2. $padic(star: "a")(q) = p-(q)$ for all $q in QQ$
  3. $padic(star: "a")$ satisfies the properties of @valuation over $RR$.
]

A proof of this is provided by #cite(<gouvea_p-adic_2020>, form: "prose")#margin-note[page number?] provides the specifics of the construction of this function. However, this construction is quite fierce, so it is left as a side quest to any brave adventurers.

#definition[
  We say a given statement $P$ holds for $p*$ if and only if $P$ holds for $padic(star: "a")$ for all $a in RR without QQ$.#margin-note[This is such an awkward way to go about this. I just want to say, the specific value of $a$ doesn't matter in this statement because it only matters very rarely.]
]

#corollary[
  Let $x, y in QQ$, then $p*(x + y) = p*(x)$ if $x < y$. Another phrasing of this same property is $p*(x + y) = min(p*(x), p*(y))$ if $p*(x) != p*(y)$.
]<ultrametric>

A couple other easy properties of the $p$-adic valuation we can show are as follows.

== Coloring the plane

#margin-note[Instead of using coloring function potentially use sets like algebra and tiling?]

#definition[
  Fix some prime $p in N$ and let $V = (x, y) in RR^2$#margin-note[Don't use V, just use x, y]. Define the _$p$-adic coloring function_#footnote[#cite(<rudenko_equidissection_2012>, form: "prose") refers to this coloring as the "tropical coloring" since the $p$-adic valuation forms a min-plus algebra.] $C_p: RR^2 -> {A, B, C}$ where
  1. $C_p (V) = A$ if $p*(x) > 0$ and $p*(y) > 0$.
  2. $C_p (V) = B$ if $p*(x) <= 0$ and $p*(y) >=#margin-note[Is this supposed to be $>=$? Verify with #cite(<stein_algebra_2014>, form: "prose")] phi.alt_p(x)$.
  3. $C_p (V) = C$ if $p*(x) > p*(y)$ and $p*(y) <= 0$.
]

#example[ // improve these explanations
 + $C_2 ((0, 0)) = A$ since $2-(x) = 2-(y) = 2-(0) = infinity > 0$.
 + $C_2 ((0, 1)) = C$ since $2-(x) = 2-(0) = infinity >= 0 = 2-(1) = 2-(y)$ and $2-(y) = 2-(1) = 0 <= 0$
 + $C_2 ((1, 1)) = C$ since $2-(x) = 2-(1) = 0 >= 0 = 2-(1) = 2-(y)$ and $2(y) = 2-(1) = 0 <= 0$.
 + $C_2 ((1, 0)) = B$ since $2-(x) = 2-(1) = 0 < infinity = 2-(0) = 2-(y)$ and $2-(x) = 2-(1) = 0 <= 0$.
]

#proposition[$C_p$ is well defined.]

#proof[
  - Suppose $V$ is a point labelled $A$, then $p*(x) > 0$ and $p*(y) > 0$. Then $V$ is not labelled $B$ since $p*(x) lt.eq.not 0$. Similarly $V$ is not labelled $C$ since $p*(y) lt.eq.not 0$.
  - Suppose $V$ is a point labelled $B$, then $p*(x) <= p*(y)$ so $p*(y) gt.not p*(x)$ so $V$ is not labelled $C$.
]

#lemma[
  Let $V_A, V in RR^2$ such that $C_p (V_A) = A$. Then, $C_p (V - V_A) = C_p (V)$.
]<translate>

#proof[
  #todo
]

#corollary[
  Let $V_1, V_2 in RR^2$. $C_p (V) = C_p (V_1) "or" C_p (V_2)$ for any point $V$ along the line segment formed by $V_1$ and $V_2$. #margin-note[Starts sentence with symbol, uses symbol before its introduced.]
]

#definition([Complete])[
  A line or edge is considered _complete_ if its endpoints are colored blue or yellow. A polygon is considered _complete_ if it has an odd number of complete edges.
]

#lemma([Sperner's])[
  Let $P$ be a complete polygon under our coloring. Then there exists at least one complete triangle in any triangulation of $P$.
]

#proof[
  Consider the graph $T'$ where each node is a triangle $t$ in $T$ or the "outside" node, which represents the area outside of $T$ and two nodes are connected if they share a complete edge. Then, the degree of each triangle $t$ in $T'$ is either $0, 1$ or $2$ with $1$ representing a complete triangle. There are an odd number of complete edges on the boundary of the triangle, so the "outside" node must have an odd degree. So, there must be a triangle $t in T'$ with odd degree by the handshake lemma. The only option of odd degree for this triangle is $1$ so the triangle must be complete.
]

== Monsky's Theorem

#lemma[
  Let $T$ be a complete triangle. Then $p* ("Area of" T) <= p* (1/2)$
]

#proof[
    Let $T$ be a complete triangle with vertices $(x_A, y_A), (x_B, y_B), (x_C, y_C)$ where $x_A$ is colored A, $x_B$ is colored B, and so on relative to our coloring. By our previous lemma we can translate $T$ by $(-x_A, -y_A)$ without changing the coloring of our vertices. So, we can assume $(x_A, y_A) = (0, 0)$ without loss of generality.
    
    The area of $T$ is $1/2 (x_B y_C - x_C y_B)$. So, the $p$-adic valuation of the area of $T$ is $p- (1/2(x_B y_C - x_C y_B)) = p- (1/2) + p- (x_B y_C - x_C y_B)$. By our coloring $p- (x_B) <= p- (y_B)$ and $p- (y_C) < p- (x_C)$. Then $p- (x_B y_C) = p-(x_B) + p-(y_C) <= p-(x_C) + p-(y_B) = p- (x_C y_B)$, so $p- (x_B y_C - x_C y_B) = p- (x_B y_C)$.
    
    Therefore $p- ("Area of" T) = p- (1/2) + p- (x_B y_C) <= p- (1/2)$ since $p- (x_B) <= 0$ and $p- (x_C) <= 0$ by our coloring.
]

#definition([Dissection])[
  Let $P$ be some polygon. A _dissection_ of $P$ is a division of $P$ into non overlapping triangles. We call a dissection with $n$ triangles an $n$-dissection.
]

#figure([#todo], caption: [A dissection of the square.])

#definition([Equidissection])[
  Let $P$ be some polygon. An equidissection of $P$ is a dissection of $P$ into triangles of equal area. If an equidissection of $P$ is an $n$-dissection, we call it an $n$-equidissection.#margin-note[This is super dry] .
]

#figure(
  [#todo],
  caption: [A 2-equidissection, a 4-equidissection, and a 6 equidissection of the square.],
)<monskyeven>

#theorem([Monsky's])[
  There exists an $n$-equdissection of the square if and only if $n$ is even.
]

#proof[#margin-note[This proof is mainly placeholder and I will add much more elaboration in future revisions.]
  Let $T$ be an $m$-triangulation of the unit square with vertices $(0, 0)$, $(0, 1)$, $(1, 0)$ and $(1, 1)$ where $m$ is odd. Notice that the square is complete relative to the $2$-adic valuation#margin-note[We will show this in an earlier example] so there exists a $t in T$ where $t$ is complete. Then $2- ("Area of" t) <= phi.alt_2 (1/2) = -1 != 0 = phi.alt_2 (1/m)$, so $T$ cannot be an equidissection since it has a triangle with area not equal to $1/m$.
]

= Previous Research

== #cite(<praton_cutting_2002>, form: "prose")
#margin-note[This section pretty uncritically uses the notation, and perspective of the paper, it needs a pass over to decide if we want to revise the notation.]
To show the results of Monsky for polyominos#margin-note[Define polyomino], completeness must be shown for an arbritrary polyomino. #cite(<praton_cutting_2002>, form: "prose") accomplishes this by coloring the cells of a polyomino based on the count of complete edges in a certain orientation on the boundary.

#definition[
  A complete edge has a _counterclockwise_ orientation if it is colored blue, then yellow in a counterclockwise direction. If it is colored blue, then yellow in a clockwise direction it is oriented _clockwise_.
]

#definition[
  Assign the value $+1$ to a counterclockwise complete edge and the value $-1$ to a clockwise complete edge. Color each cell of a given polyomino black if the sum of the values of its complete edges is $+1$, white if it is $-1$ and leave it uncolored if it is $0$.
]

#theorem[
  A cell is black if and only if its lower right or upper left corner is colored blue. Similarly a cell is white if and only if its upper right or lower left corner is colored blue. All other cells are uncolored.
]

#proof[
  #todo
]

#theorem[
  Suppose a given polyomino $P$ has a number of black cells which isn't equal to its number of white cells. Then, there exists a complete triangle $t$ in any dissection $T$ of $P$ relative to the coloring provided by the $2$-adic valuation.
]<complete>

#proof[
  #todo
]

So, our goal is to show that $P$ has an unequal number of black and white cells. If $P$ has odd area, this is trivial. For polyominos#margin-note[this should be a definition environment.] of even area, we will have to apply a transformation onto $P$ which effects all areas equally to create an uneven number of black and white cells. For the purposes of this paper we will use transformations of the form $f_(r, s, a, b)(x, y) -> ((x + a)/(2^r), (y + b)/(2^s))$#margin-note[you need to go back and make later definitions and writing compatible with this].#margin-note[often we don't actually write out $f_(r, s, a, b)$ and instead just state their specific values.]. Notice that the values $r$ and $s$ indicate scale in the $x$ and $y$ axis, and the values $a$ and $b$ indicate translation in the $x$ and $y$ axis. We will also suppose the $2$-adic valuation of the area of our polynomial is equal to $m$. Notice if $r + s <= m$ then the area of our polynomial transformed by $f_(r, s, a, b)$ is an integer.

#theorem[
  The coloring of the cells form a pattern which is always periodic under any transformation of the form $f_(r s)$.
]

#proof[
  #todo
]

#example[
  For $r, s = 0$ the coloring of cells form a checkerboard pattern.#margin-note[Add more examples here with figures.]
]

#definition[
  The $(i, j)$-th cell of a polyomino is the cell whos upper right corner has coordinates $(i/2^r, j/2^s)$. #margin-note[Horrible coordinate system.]
]

#lemma[
  The black cells in a given transformed polyomino $f_(r s ) (T)$ are at coordinates $(i, j)$ and $(i + 1, j + 1)$ where $i equiv 0 mod 2^(r + 1)$ and $j equiv 0 mod 2^(s + 1)$. The white cells are $(i + 1, j)$ and $(i, j + 1)$.
]

#proof[
  #todo
]

#figure(
  cetz.canvas({
    import cetz.draw: *
    let cell-size = 1

    let draw-cell(pos, value, fill: none, name: none, stroke: 0.5pt) = {
      rect(
        pos,
        (pos.at(0) + cell-size, pos.at(1) + cell-size),
        fill: fill,
        name: name,
        stroke: stroke,
      )
      if value != none {
        content(
          (pos.at(0) + cell-size / 2, pos.at(1) + cell-size / 2),
          $#value$,
        )
      }
    }

    draw-cell((0, 0), "B")
    draw-cell((1, 1), "B")
    draw-cell((1, 0), "W")
    draw-cell((0, 1), "W")
    for cell in ((2, 0), (2, 1), (2, 2), (0, 2), (1, 2)) {
      draw-cell(cell, [U])
    }

    for cell in ((3, 0), (3, 1), (3, 2), (3, 3), (0, 3), (1, 3), (2, 3)) {
      draw-cell(cell, [$dots.c$], stroke: none)
    }

    for cell in (
      (4, 0),
      (4, 1),
      (4, 2),
      (4, 3),
      (0, 4),
      (1, 4),
      (2, 4),
      (3, 4),
      (4, 4),
    ) {
      draw-cell(cell, [$U$])
    }

    for x in range(0, 3) {
      draw-cell((x, -1), [#x], stroke: none)
      draw-cell((-1, x), [#x], stroke: none)
    }

    draw-cell((4, -1), [$2^(r + 1) - 1$], stroke: none)
    draw-cell((-1.5, 4), [$2^(s + 1) - 1$], stroke: none)
  }),
  caption: [The pattern of coloring for cells of $T$ for a given $r$ and $s$.],
)

A corollary of the following lemma is as follows.

#definition[
  For a given polyomino $T$ we define the function $chi_(i, j)(T) = 1$ if cell $(i, j)$ is $T$, and $0$ if the cell is not present.
]

#corollary[
  The number of black cells in the polyomino $T$ for any given $r$ and $s$#margin-note[for $r + s <= m$? or for any $r, s$] is
  $ sum_(i equiv a(2^(r + 1))) sum_(j equiv b(2^(s + 1))) chi_(i, j) + chi_(i + 1, j + 1)(T) $.
  Similarly, the number of white cells is
  $
    sum_(i equiv a(2^(r + 1))) sum_(j equiv b(2^(s + 1))) chi_(i, j + 1) + chi_(i + 1, j)(T)
  $
]

#proof[
  #todo
]

#definition[
  A polyomino $T$ is $m$-balanced if for every value of $r$ and $s$ such that $r + s = m$ the count of black cells is equal to the count of white cells.
]

#definition[
  The matrix C associated with a polyomino $T$ is defined by $ c_(i j) = sum_(i' equiv i mod 2^(m + 1)) sum_(j' equiv j mod 2^(m+1))#margin-note[you gotta come back and fix these summations] chi_(i' j')(T). $
]

#example[
  Suppose $T$ is the polyomino shown in @examplepolyomino
  #figure(todo, caption: [The polyomino $T$ for the sake of our example])<examplepolyomino>.
  Then, the corresponding matrix $C$ for $T$ is
  $
    #todo.
  $
]

More intuitively, $c_(i j)$ counts how many times the $(i, j)$-th cell of a $m times m$ torus is covered when a polyomino $T$ is placed on its surface.

#definition[
  We define the function
  $
    Gamma^(r, s)_(a, b) (C) = sum_(i equiv a(a^(r + 1))\ 0 <= i < 2^(m + 1)) sum_(j equiv a(b^(s + 1))\ 0 <= j < 2^(m + 1)) c_(i j).
  $
]

#lemma[
  The number of black cells in a polyomino $T$ for a given $a, b, r, s$ is equal to $Gamma^(r, s)_(a, b)(C) + Gamma^(r, s)_(a + 1, b + 1)$. The number of white cells is equal to $Gamma^(r, s)_(a + 1, b)(C) + Gamma^(r, s)_(a, b + 1)$.
]

#proof[
  #todo
]

#lemma[
  If $T$ is $m$-balanced then. $Gamma^(r, s)_(a, b)(C) + Gamma^(r, s)_(a + 1, b + 1) = Gamma^(r, s)_(a + 1, b)(C) + Gamma^(r, s)_(a, b + 1)$.#margin-note[I think it would make sense for all of these $m$-balanced lemmas to be given in a the following are equivalent block in the final thesis.]
]

#proof[
  #todo
]

#definition[
  Let $C$ be a $2^(m + 1) times 2^(m + 1)$ matrix. Then, we construct a $2^m times 2^m$ matrix $C'$ where
  $
  c'_(i j) = cases(
    c_(2 i, j) + c_(2i, j + 2^m) "if" i "is even,",
    c_(2i - 1, j) + c_(2i - 1, j + 2^m) "otherwise."
  )
  $
]

#lemma[If $C$ is $m$-balanced, then $C'$ is $(m - 1)$-balanced. @praton_cutting_2002]
#proof[
  #todo
]

#definition[
  Let $beta(C)$ be the $2 x 2$ matrix where 
  $
  beta_(i j) = sum_(i' equiv i) sum_(j' equiv j) c_(i'j').
  $
  where the equivalences are $mod 2$.#margin-note[I gotta find a better way to notate this]
]

#theorem[
  Let $C$ be an $m$-balanced matrix of size $2^(m + 1) times 2^(m + 1)$, then every element $beta_(i j)$ is divisible by $2^(m - 1)$. So, the sum of the entries of $beta_(C)$ is divisible by $2^(m+1)$.
]

#proof[
  #todo
]

Then, we can prove the final theorem

#theorem[
  There is no equidissection of any polyomino with an odd number of triangles.
]

#proof[
  Let $T$ be a polyomino with area $A$ where $2*(A) = m$. Then, if $T$ is $m$-balanced, so would $C(T)$. This would imply the sum of all entries in $C(T)$, equal to A, is divisible by $2^(m + 1)$. However, this would contradict the $2$-adic valuation of $A$ being equal to $m$. So, $T$ is not $m$-balanced. Then there exists some $r, s$ with $r + s = m$ such that there are an uneven number of black and white squares allowing us to apply @complete to show there exists an complete triangle $t$ in any odd dissection of $T$. Therefore, any odd dissection of $T$ is not an equidissection.
]

== Research

Define the map $overline(star)_n$ from $cal(L)$, a two dimensional lattice in $RR^2$ to $K_(2^(n + 1))$ a simplicial complex with vertices labelled by $ZZ_(2^n) times ZZ_(2^n)$ and edges connecting each of its vertices as follows
$
overline(star)_n: (x_1, x_2) -> bar((x_1, x_2)) = (x_1 mod 2^n, x_2 mod 2^n).
$

Let $L$ be a broken line with integer vertices. Then,
$
H_1(L, ZZ) arrow H_1(K_2^(n + 1), ZZ) tilde.equiv ZZ^(n(n - 1)/2 - n + 1)
$