#import "@local/reed-thesis-template:1.0.1": thesis
#import "@preview/muchpdf:0.1.0": muchpdf
#import "@preview/ctheorems:1.1.3": *
#import "@preview/drafting:0.2.2": margin-note, set-margin-note-defaults
#import "@preview/colorful-boxes:1.1.0": stickybox
#import "@preview/cetz:0.4.2"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
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

#let conjecture = thmplain(
  "conjecture",
  "Conjecture",
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

#let remark = thmplain(
  "remark",
  "Remark",
  namefmt: name => emph([on #name]),
  inset: (top: 0em, left: 0em, right: 0em),
).with(numbering: none)

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
  acknowledgements: [Rain Tronoski, Miguel Esteve, June Duvivier, Hannibal Grubis, Jamie Pommersheim.],
  introduction: [
    What number of equal area triangles can the square be divided into? This problem, which was originally posed by Fred Richman in 1965, has spawned a series of generalizations following the publication of Monsky's proof in 1970 that there exists a division of the square into $n$ triangles of equal area if and only if $n$ is even. Over the course of two decades propositions generalizing this theorem were presented, and quickly proven. This equidissection rennaissance was broken with the conjecture, proposed by Sherman Stein, that all polygons which can be constructed from pairs of congruent parallel edges cannot be divided into an odd number of triangles of equal area. This 2004 conjecture remains an open problem.

    == A History of Equidissection

    In 1965 Fred Richman was preparing a masters degree exam at New Mexico State University. When preparing a question on geometry he began playing with divisions of the unit square into triangles which all have equal area. For an even number of triangles this process is quite easy. One could divide the square in half and then divide the two triangles which result from this division into $n$ triangles, resulting in $2n$ triangles of area $1/(2n)$. However, the construction of a division of the unit square into an odd number of triangles is much less clear. Despite the problem seeming to him like a fairly basic result in geometry which might predate modern mathematics, Richman found himself unable to find any reference to the problem in mathematical literature. Richman proved that such a division did not exist with 3 or 5 triangles, but was unable to prove the general case and left the problem off of the exam. @stein_algebra_2014[p.~107]

    #figure[
      #figure(
        stack(
          dir: ltr,
          spacing: 2em,
          diagram(
            node-stroke: .1em,
            edge-stroke: .1em,
            cell-size: 30mm,
            node((0, 0)),
            node((0, 1)),
            node((1, 0)),
            node((1, 1)),
            edge((0, 0), (0, 1)),
            edge((0, 0), (1, 0)),
            edge((1, 0), (0, 1)),
            edge((1, 1), (0, 1)),
            edge((1, 1), (1, 0)),
          ),
          diagram(
            node-stroke: .1em,
            edge-stroke: .1em,
            cell-size: 30mm,
            node((0, 0)),
            node((0, 1)),
            node((1, 0)),
            node((1, 1)),
            node((0.5, 1)),
            node((0.5, 0)),
            edge((0, 0), (0, 1)),
            edge((0, 0), (1, 0)),
            edge((1, 1), (0, 1)),
            edge((1, 1), (1, 0)),
            edge((0.5, 0), (0, 1)),
            edge((0.5, 0), (0.5, 1)),
            edge((0.5, 1), (1, 0)),
          ),
          diagram(
            node-stroke: .1em,
            edge-stroke: .1em,
            cell-size: 30mm,
            node((0, 0)),
            node((0, 1)),
            node((1, 0)),
            node((1, 1)),
            node((1 / 3, 1)),
            node((1 / 3, 0)),
            node((2 / 3, 0)),
            node((2 / 3, 1)),
            edge((0, 0), (0, 1)),
            edge((0, 0), (1, 0)),
            edge((1, 1), (0, 1)),
            edge((1, 1), (1, 0)),
            edge((1 / 3, 0), (0, 1)),
            edge((1 / 3, 0), (1 / 3, 1)),
            edge((1 / 3, 1), (2 / 3, 0)),
            edge((2 / 3, 0), (2 / 3, 1)),
            edge((2 / 3, 1), (1, 0)),
          ),
        ),
        caption: [a 2, 4, and 6-equidissection of the square],
      )
    ]

    Richman posed the question to John Thomas who proved there was no such division of the unit square if the vertices had rational coordinates with odd denominators. His submission of this proof to the Mathematics Magazine was placed on hold due to worries that the problem had already been solved. However, after a submission to the Mathematical Monthly which turned up no solution, the submission to the Mathematical Magazine was included in a 1968 edition @thomas_dissection_1968.

    Two years after Thomas's submission to the Mathematical Monthly, Paul Monsky published a surprising proof which made heavy use of the $p$-adic valuation to show such a division was impossible for any odd number of triangles @monsky_dividing_1970. This proof sparked significant excitement in the mathematical community as it was unclear why, or if the $p$-adic valuation was necessary for a proof of the problem.

    The $p$-adic methodology utilized by Monsky was quickly adapted to various generalizations of the problem. Some examples of such generalizations are into $n$-dimensions, explored in a paper by #cite(<thomas_dissection_1968>, form: "prose")#margin-note[fix prose citations], or the proof by #cite(<kasimatis_dissections_1989>, form: "prose") that divisions of the regular polygon into triangles of equal area have a multiple of $n$ triangles, with the exception of the triangle and the square.

    Immediately following the results presented by #cite(<kasimatis_dissections_1989>, form: "prose") Stein suggested the results for even $n$ suggest no centrally symmetric polygon has an division into an odd number of triangles of equal area#cite(<stein_equidissections_1989>). This was later proven by #cite(<monsky_conjecture_1990>, form: "prose"). Stein further conjectured that there is no odd division of triangles of equal area for polyominos and shows the conjecture holds true for polyominos with an odd number of triangles@stein_cutting_1999. #cite(<praton_cutting_2002>, form: "prose") proves this conjecture in the general case.#margin-note[This starts to get super dry] Stein then combines the two previous conjectures in #cite(<stein_cutting_2004>, form: "prose") to suggest that no polygon which can be divided into pairs of congruent parallel lines can be divided into an odd number of triangles of equal area. This conjecture has been shown for squares @monsky_dividing_1970, centrally symmetric polygons @kasimatis_dissections_1989, polyominos @praton_cutting_2002, and lattice polygons @rudenko_equidissection_2012, all of which are such polygons. The general case remains open.

    == Contents of this Thesis
    
    We will begin this text by providing a novel perspective on the proof of Monsky's Theorem in @monsky utilizing Aaron Abrams and Jamie Pommersheim's Non-Abelian Sperner's Lemma, and a more motivated construction of the $p$-adic coloring function typically used in such a proof. We will then present current research into Stein's Conjecture, showing that both polyominos and balanced lattice polygons with odd area have no division into an odd number of triangles of equal area in @generalize.#margin-note[fix chapter names formatting] Finally, we will present suggestions for further direction of research into Stein's Conjecture in @apply.
  ],
)

// Rain notes
// Tone within proofs good, really likes remarks on figures, first remark comes off as elementary school math book. Remark comes off as talking-down. First half went well - defining the word combinatorial. Colon before definitions/theorems? Not enough commas, especially when providing context. An example is page twelve about maintaining parity. Comma splices are happening all over. Page 14 "three colored from the square" is an example. Often happens on however, there are a lot of howevers. The math went as slow as it needed to for an english major to understand it. Lost clarity at the sentence level but not at the mathematical level. Spellchecking. Figures are very good. The story was very clear, very clear goal, very motivated, could tell where things were going overall. Good job of ordering things. However faked out on page 11 why no p-adic valuation. In introduction really liked the information about the exam. Would love a date for when Stein comes in in the second page. Understands generally what the paper is about. Wants more elaboration on the general case of the problem, didn't know that steins conjecture involved squares instead of polygons. Could calculate the p-adic valuation, but couldn't find boundary word on their own, but does know the steps to do so. Could summarize paper. After reading this paper is able to connect terminology and concepts to prior math education. Honors AP/IB math in highschool. Examples/visualization made math lingo accessible. Challenges conception that higher math is "difficult", and that vocabulary is the main difficulty. Rephrasings of sentences in non mathematical language is very helpful. Having fun, sense of proudness for understanding it, encourages reader to step up to challenge. Resolving sentence level edits will make it much more accessible. Could potentially be inspiring to someone that math could be for them. Staircase of difficulty, one or two steps towards the end that are bigger than the others. Make sure sentences are clear. Good amount of examples in first half. Summarize carried example in Monsky's Theorem chapter which serves as summary of entire chapter. Paragraph at the end talking about the attempts to solve steins conjecture. Add but the general case remains open?

= A Proof of Monsky's Theorem<monsky>

In the introduction, a brief history of Stein's Conjecture was presented. This history gave the origins of Stein's Conjecture in Monsky's Theorem. The proof of this theorem provides a convienient yet sufficiently complex problem for the introduction of many lemmas which are relevant to Stein's Conjecture.

#theorem([Monsky])[
  There exists a division of the square into $n$ triangles of equal area if and only if $n$ is odd.
]

While Monsky's Theorem has been extensively written about, it is often hard for the reader to piece together the story of the theorem. Monsky's Theorem makes heavy use of a function known $p$-adic valuation, which will be introduced in @p-adic. The $p$-adic valuation is most often employed in the fields of number theory and analysis, and it is difficult to understand the role which it plays in the proof of such a theorem. Even if the reader grasps, and is thoroughly convinced by the logic of the argument presented, they may still find themselves questioning why the $p$-adic valuation is necessary for the proof of Monsky's Theorem. We will introduce the $p$-adic valuation into the context of divisions of the square into triangles of equal area in a manner which is careful to not only provide mathematical rigor, but to provide motivation for the use of each piece of technology utilized in our proof of Monsky's Theorem. Aditionally, this chapter presents a new perspective on the proof of Monsky's Theorem utilizing Aaron Abram and Jamie Pommersheims Non-Abelian Sperner's Lemma will be presented. This perspective allows the reader to perform a step by step approach on abritrary divisions of the square into odd numbers of triangles which completes with the discovery of a triangle which cannot be a member of a division of the square into an odd number of triangles of equal area.

Since Monsky's Theorem is concerned with the division of the square into triangles, we will begin by studying such divisions of the square into triangles and present the condition for which a division of the square into triangles is a division of the square into triangles of equal area. This condition will motivate a perspective on the problem from the lens of graph theory. However, viewing this problem as one purely on graphs will not provide sufficient information to move forward with our proof. We will use the $p$-adic valuation to construct a coloring in which triangles which are colored in a certain manner cannot be a member of a dissection of the square into an odd number of triangles of equal area. We will then show that such a triangle exists in every dissection of the square into triangles, allowing use to prove our result.

== Dissections of the Square
 
To begin our proof of Monsky's Theorem, we must first define what it means to divide the square, or any polygon, into triangles.

#definition[
  A _dissection_ of a polygon $P$ is a set of triangles $T$ where $T$ covers $P$ without overlap, and $P$ covers $T$.
]

However, this is not the only mathematical structure which divides a polygon into triangles. We will later present another mathematical structure which represents such a division. Dissections consider the problem of the division of polygons into triangles in a geometric sense, as tilings of triangles which both cover and are contained by their respective polygon.

#example[
  Two examples of dissections are presented below.
  #figure(
    align(center)[
      #stack(
        dir: ltr,
        spacing: 2em,
        diagram(
          node-stroke: .1em,
          edge-stroke: .1em,
          cell-size: 30mm,
          node((0, 0)),
          node((0, 1)),
          node((1, 0)),
          node((1, 1)),
          node((0.5, 0.75)),
          node((0.5, 1)),
          node((0.5, 0.5)),
          edge((0, 0), (0, 1)),
          edge((0, 0), (1, 0)),
          edge((1, 0), (0.5, 0.75)),
          edge((0.5, 0.75), (0.5, 1.0)),
          edge((0.5, 0.75), (0, 1)),
          edge((0.5, 0.75), (1, 1)),
          edge((0, 0), (0.5, 0.5)),
          edge((0.5, 0.5), (0.5, 0.75)),
          edge((0.5, 0.5), (0, 1)),
          edge((0.5, 0.5), (1, 0)),
          edge((1, 1), (0, 1)),
          edge((1, 1), (1, 0)),
        ),
        diagram(
          node-stroke: .1em,
          edge-stroke: .1em,
          cell-size: 30mm,
          node((0, 0)),
          node((0, 1)),
          node((1, 0)),
          node((1, 1)),
          node((0.5, 1)),
          node((0.5, 0)),
          node((0.5, 0.5)),
          edge((0, 0), (0, 1)),
          edge((0, 0), (1, 0)),
          edge((1, 1), (0, 1)),
          edge((1, 1), (1, 0)),
          edge((0.5, 0), (0, 1)),
          edge((0.5, 0), (0.5, 1)),
          edge((0.5, 0.5), (1, 0)),
          edge((0.5, 0.5), (1, 1)),
        ),
      )
    ],
    caption: [Two dissections of the square.],
  )
]

#example[ In contrast, three non-dissections are presented below.
  #figure(
    stack(
      dir: ltr,
      spacing: 2em,
      diagram(
        node-stroke: .1em,
        edge-stroke: .1em,
        cell-size: 30mm,
        node((0, 0)),
        node((0, 1)),
        node((1, 0)),
        node((1, 1)),
        node((0.5, 0.75)),
        node((0.5, 0.5)),
        edge((0, 0), (0, 1)),
        edge((0, 0), (1, 0)),
        edge((1, 1), (0, 1)),
        edge((1, 1), (1, 0)),
        edge((0, 0), (0.5, 0.5)),
        edge((1, 0), (0.5, 0.5)),
        edge((0, 1), (0.5, 0.75)),
        edge((1, 1), (0.5, 0.75)),
      ),
      diagram(
        node-stroke: .1em,
        edge-stroke: .1em,
        cell-size: 30mm,
        node((0, 0)),
        node((0, 1)),
        node((1, 0)),
        node((1, 1)),
        node((0.5, 1)),
        node((0.5, 0)),
        node((0.4, 0.5)),
        edge((0, 0), (0, 1)),
        edge((0, 0), (1, 0)),
        edge((1, 1), (0, 1)),
        edge((1, 1), (1, 0)),
        edge((0.5, 0), (0, 1)),
        edge((0.5, 0), (0.5, 1)),
        edge((0.4, 0.5), (1, 0)),
        edge((0.4, 0.5), (1, 1)),
      ),
      diagram(
        node-stroke: .1em,
        edge-stroke: .1em,
        cell-size: 30mm,
        node((0, 0)),
        node((0, 1)),
        node((1, 0)),
        node((1, 1)),
        node((0.5, 1)),
        node((0.5, 0)),
        node((0.5, 0.5)),
        node((1, 1.2)),
        edge((0, 0), (0, 1)),
        edge((0, 0), (1, 0)),
        edge((1, 1), (0, 1)),
        edge((1, 1), (1, 0)),
        edge((0.5, 0), (0, 1)),
        edge((0.5, 0), (0.5, 1)),
        edge((0.5, 0.5), (1, 0)),
        edge((0.5, 0.5), (1, 1.2)),
        edge((1, 1.2), (1, 1)),
      ),
    ),
    caption: [Three non-dissections of the square.],
  )

  The first example is not a dissection since the square is not completely covered by triangles. The set of triangles also must not contain any overlapping triangles such as in the second example. Finally, in the third example, all of the triangles must be contained within our polygon.
]

Monsky's Theorem is interested in a particular subset of dissections of the square, one where triangles are all of equal area, we refer to such a dissection as an _equidissection_.

#definition[
  An _equidissection_ is a triangulation of a polygon $P$ where all triangles are of equal area. An equidissection containing $n$ triangles is called an $n$-equidissection.
]

#example[
  #figure(
    align(center)[
      #stack(
        dir: ltr,
        spacing: 2em,
        diagram(
          node-stroke: .1em,
          edge-stroke: .1em,
          cell-size: 30mm,
          node((0, 0)),
          node((0, 1)),
          node((1, 0)),
          node((1, 1)),
          edge((0, 0), (0, 1)),
          edge((0, 0), (1, 0)),
          edge((1, 0), (0, 1)),
          edge((1, 1), (0, 1)),
          edge((1, 1), (1, 0)),
        ),
        diagram(
          node-stroke: .1em,
          edge-stroke: .1em,
          cell-size: 30mm,
          node((0, 0)),
          node((0, 1)),
          node((1, 0)),
          node((1, 1)),
          node((0.5, 0.5)),
          edge((0, 0), (0, 1)),
          edge((0, 0), (1, 0)),
          edge((0, 0), (0.5, 0.5)),
          edge((0.5, 0.5), (0, 1)),
          edge((0.5, 0.5), (1, 0)),
          edge((0.5, 0.5), (1, 1)),
          edge((1, 1), (0, 1)),
          edge((1, 1), (1, 0)),
        ),
        diagram(
          node-stroke: .1em,
          edge-stroke: .1em,
          cell-size: 30mm,
          node((0, 0)),
          node((0, 1)),
          node((1, 0)),
          node((1, 1)),
          node((0.5, 1)),
          node((0.5, 0)),
          node((0.5, 0.5)),
          node((1, 0.5)),
          node((0.25, 0.5)),
          edge((0, 0), (0, 1)),
          edge((0, 0), (1, 0)),
          edge((1, 1), (0, 1)),
          edge((1, 1), (1, 0)),
          edge((0.5, 0), (0, 1)),
          edge((0.5, 0), (0.5, 1)),
          edge((0.5, 0.5), (1, 0)),
          edge((0.5, 0.5), (1, 1)),
          edge((0.5, 0.5), (1, 0.5)),
          edge((0.5, 1), (0.25, 0.5)),
          edge((0, 0), (0.25, 0.5)),
        ),
      )
    ],
    caption: [Three equidissections of the square.],
  )
]

Notice that all of these equidissections have an even number of triangles. As an illuminating excersize in futility, the reader is invited to attempt to draw such an odd equidissection. The rare reader which attempts such an excersize in futility after being instructed to by a mathematical text will note the following: It is seemingly impossible to construct a dissection of the square into an odd number of triangles of equal area. This property gives rise to the following proposition originally proposed by Fred Richman, which we will later prove as _Monsky's Theorem_.

#proposition([Richman])[
  Any equidissection of the square contains an even number of triangles.
]

To find a path towards the proof of such a proposition, we rely on the fact that equidissections are quite fragile. Finding one triangle in a dissection $T$ of a polygon $P$ which has an area which does not evenly divide $P$ proves $T$ is not an equidissection. We can provide an alternative condition for equidissection which takes advantage of this fact.

#proposition[
  Let $T$ be a dissection of a polygon $P$ with $n$ triangles. Then $T$ is an equidissection if and only if every triangle $t in T$ has area $("Area "P)/n$.
]

This allows us to in turn rephrase our statement of Monsky's Theorem to utilize our alternative definition of equidissecction.

#proposition([Richman, Area Version])[
  Any dissection of the square $T$ with an odd number of triangles contains at least one triangle $t$ with area not equal to $1/n$.
]

The rephrasing of the theorem provides a more forward suggestion for how we should go about our proof. We start with an abitrary dissection $T$ of the square with an odd number of triangles. We then find a triangle in $T$ such that its area is not one of $1/3, 1/5, 1/7, ...$. In the next section we will begin to explore a combinatorial view of this problem. This view will lead us on a path which eventually ends in finding such a triangle in any given dissection.

== A Combinatorial Perspective on Dissections

In the previous section we have presented a geometric definition of the division of polygons into triangles. We will contrast the geometric view presented in the previous section with a combinatorial view of the problem.

We will begin by presenting a combinatorial definition of a polygon.

#let polygon(vertices: 4) = {
  [
    #diagram(
      node-stroke: .1em,
      edge-stroke: .1em,
      cell-size: 30mm,
      {
        for i in range(vertices) {
          let θ = 90deg - i * 360deg / vertices
          let next = 90deg - (i + 1) * 360deg / vertices
          node((θ, 0.5in))
          edge((θ, 0.5in), (next, 0.5in))
        }
      },
    )
  ]
}

#example[
  Four polygons of an increasing number of vertices represented as a graph.
  #align(center)[
    #stack(
      dir: ltr,
      spacing: 2em,
      polygon(vertices: 4),
      polygon(vertices: 5),
    )
    #stack(
      dir: ltr,
      spacing: 2em,
      polygon(vertices: 8),
      polygon(vertices: 12),
    )
  ]
]

Notice that each of these $n$-gons, when viewed as a graph, are just a cycle of length $n$. We will define a combinatorial polygon as such a cycle of length $n$.

#definition[
  A graph $G$ is a cycle graph with $n$ vertices if the vertex set is $n$ vertices which we will name $1, 2, ..., n$, and each edge is of the form $(i, i + 1)$ for an integer $1 <= i < n$ or $(1, n)$.
]

We will define combinatorial polygons as graphs which contain only a cycle of length $n$.

#definition[
  @abrams_integer_2024 A _combinatorial $n$-gon_ is an abstract cycle graph $G$ with $n$ vertices; a _combinatorial polygon_ is a combinatorial $n$-gon for some $n$.
]

We will consider triangulations of a combinatorial polygon to simply be any graph whos boundary is a combinatorial polygon, can be plotted on the real plane without intersection, and is made up of combinatorial triangles.

#definition[
  @abrams_integer_2024 A _triangulation_ of a combinatorial polygon $G$ consists of a collection $T$ of $3$-element sets called triangles, such that the underlying space $|T|$ built out of triangles is a topological disk with boundary equal to $G$. The boundary vertices are called corners.
]

The definition of a triangulation represents the mathematical structure which results when formalizing the division of a polygon into triangles in the combinatoric sense. However, it is important to keep in mind that this structure is mathematically distinct from dissections, which result from a geometric sense of the problem. When trying to come up with corresponding triangulations for a given dissection we find that not all dissections have a clean representation as graphs of triangles.

#example[
  A dissection and its corresponding triangulation.
  #figure(
    stack(
      dir: ltr,
      spacing: 2em,
      diagram(
        node-stroke: .1em,
        edge-stroke: .1em,
        cell-size: 30mm,
        node((0, 0)),
        node((0, 1)),
        node((1, 0)),
        node((1, 1)),
        node((0.5, 1)),
        node((0.5, 0)),
        node((0.5, 0.5)),
        edge((0, 0), (0, 1)),
        edge((0, 0), (1, 0)),
        edge((1, 1), (0.5, 1)),
        edge((0.5, 1), (0, 1), "--"),
        edge((1, 1), (1, 0)),
        edge((0.5, 0), (0, 1), "--"),
        edge((0.5, 0), (0.5, 1), "--"),
        edge((0.5, 0.5), (1, 0)),
        edge((0.5, 0.5), (1, 1)),
        //edge((0.5, 0), (0.5, 1), bend: -15deg, "--")
      ),
    ),
    caption: [A dissection of the square with a highlighted triangle which is not a triangle when viewed as a triangulation.],
  )<dirty>

  #figure(
    stack(
      dir: ltr,
      spacing: 2em,
      diagram(
        node-stroke: .1em,
        edge-stroke: .1em,
        cell-size: 30mm,
        node((0, 0)),
        node((0, 1)),
        node((1, 0)),
        node((1, 1)),
        node((0.5, 1)),
        node((0.5, 0)),
        node((0.5, 0.5)),
        edge((0, 0), (0, 1)),
        edge((0, 0), (1, 0)),
        edge((1, 1), (0.5, 1)),
        edge((0.5, 1), (0, 1), "--"),
        edge((1, 1), (1, 0)),
        edge((0.5, 0), (0, 1), "--"),
        edge((0.5, 0), (0.5, 1)),
        edge((0.5, 0.5), (1, 0)),
        edge((0.5, 0.5), (1, 1)),
        edge((0.5, 0), (0.5, 1), bend: -15deg, "--"),
      ),
    ),
    caption: [The corresponding triangulation to the dissection shown in @dirty with the same triangle highlighted.],
  )<clean>

  In @dirty, the dashed triangle does not represent a triangle when considered as a graph, as one of its edges is subdivided. We can solve this by introducing an extra triangle as shown in @clean.
]

Because of this subtlety we will view divisions of polygons into triangles as both a dissection and a corresponding triangulation. Each of these structures provide different interpretations of what it means to divide a polygon into triangles. The geometric representation provides the area of each triangle, but lacks information regarding its neighbouring triangles. The combinatoric representation provides no information regarding the area of each triangle, but provides a way to relate triangles to their neighbours.

However, we do not require full information regarding the area of each triangle as it relates to this problem. Remember, to provide a proof of Richman's proposition, we need only show that there exists a triangle $t$ such that $"Area" t != 1/3, 1/5, 1/7...$ in our division of the square. In the next section we will introduce a construction known as the $p$-adic valuation which will allow us to measure if the area of a given triangle achieves this condition. This construction will allow us to bridge the information which is provided by the combinatorial and geometric views of the division of a polygon into triangles.

== The $p$-adic valuation<p-adic>

In the previous section we introduced a combinatorial view of the division of the polygon into triangles. This division allows us to relate triangles to their neighbours in a given division of a polygon, but lacks area information. However, we don't require full information of the area of a triangle in a division. We only need to know if the area of such a triangle is the inverse of an odd integer. The $p$-adic valuation will allow us to measure if a given triangle achieves this condition.

Notice that we only care if the inverse of a triangles area is odd. While it seems this matter could be adressed via parity argument, notice that a triangles area can be any real number. The $p$-adic valuation is an extension of the idea of parity over the rational and real numbers.

We will begin by introducing the $p$-adic valuation over the integers and incrementally expanding it to the rational, and then real numbers. The $p$-adic valuation measures how many times a given number is divisible by a prime $p$ over the integers. In the following example we will perform this measurement.

#example[
  We want to test how many times the number $24$ is divisible by the prime $2$. We can write $24 = 2 dot 12$, so $24$ is divisible by $2$. Then, we divide the quotient, $12$ by $2$ again, yielding $12 = 2 dot 6$. Continuing yields $6 = 2 dot 3$. We cannot divide $3$ by $2$, so $24$ is divisible by $2$ exactly $3$ times. To commemorate this occasion, we can perform a series of substitutions to write $24 = 2 dot (2 dot [2 dot 3]) = 2^3 dot 3$.
]<p1>

Generalizing this process allows us to measure the divisibility of any integer by a prime $p$.

#proposition[
  A given integer $a$ can be written as $a = p^n q$ for a given prime $p$ and some integer $q$ where $q$ is not divisible by $p$ if and only if we can divide $a$ by $p$ $n$ times but not $n + 1$ times.
]

#proof[ // Missing theorem above proof.
  Fix a prime $p$ and an integer $a_0$. Suppose $p$ divides $a_0$ $n$ times but not $n + 1$ times. If $n = 0$, then we can write $a = 1 dot a_0 = p^0 dot a_0 = p^n dot a$. If $n$ is greater than $0$ we can write $a_0 = p dot a_1$. Then, $a_1$ is divisible by $p$ $n - 1$ times. We can continue this process $n$ times, allowing us to write $a_(n - 1) = p dot a_n$. Further, $p divides.not a_n$ since we can't divide $p$ by $a_0$ $n + 1$ times. Finally, we perform substitution to get $a_0 = p dot p dots.c p dot a_n = p^n dot a_n$.

  Now suppose we can write an integer of the form $a_0 = p^n a_n$ where $p$ does not divide $a_n$. Then $a_0 = p dot dots.c p dot a_n$. We can expand this out into $n$ quotients, $a_0, a_1, ..., a_n$ where $a_m = p a_(m + 1)$. So, we can divide $a_0$ by $p$ $n$ times. Since $p$ does not divide $a_n$, we cannot divide $a_0$ by $p$ more than $n$ times.
]

This theorem allows us to define the $p$-adic valuation, a function which measures the maximum number of times we can divide an integer by a given prime $p$.

#definition[
  Let $a, p in ZZ$ such that $p$ is prime. Write $a = p^n q$ where $p divides.not q$. The _p-adic valuation_ of $a$ is $n$ written as $p- (a) = n$, if $a = 0$, we define $p- (a) = infinity$, or the number greater than all real numbers (don't think about it too hard).
]

#example[
  For example,
  - $2-(24) = 3$ since $24 = 2^3 dot 3$ as shown in @p1,
  - and $2-(108) = 2$ since $108 = 2^2 dot 27$.
]<p2>

The definition of the $p$-adic valuation does not provide confidence that it is a well defined function. For an integer $a$, and a prime $p$, we might be able to find a $q$ and $q prime$, and an $n$ and $n prime$ such that $a = p^n q$ and $a = p^(m) q prime$ but $n != m$.

#proposition[
  Fix a prime $p in ZZ$, if $a = p^n q$ and $a = p^m r$ where $p divides.not q$ and $p divides.not r$ for $a in ZZ$, then $n = m$.
]

#proof[
  Consider the prime factorization of $a$, $a = a_0^i_0 dots.c a_j^i_j$. If $p$ is not present in this prime factorization, then $p divides.not q$, so, $p^n divides a$ if and only if $n = 0$, so $n = m = 0$. Otherwise, $p$ is present in the prime factorization. So we can write $a = a_0^i_0 dots.c p^n dots.c a_j^i_j$ and similarly for $m$. So, $n = m$ by the uniqueness of prime factorization.
]

The previous proposition shows that the $p$-adic vaulation is well defined over the integers. We can easily extend the $p$-adic valuation over the rational numbers as follows:

#definition[
  Fix some prime $p in N$ and let $q in QQ$ where $q$ is nonzero and we can write $q = r/s$ in lowest terms. Then we say the _$p$-adic valuation_ of $q$ is equal to $n$, written as $p-(q) = n$ if and only if there exists some $a, b in ZZ$ such that $q = p^n a/b$ and $p divides.not a, b$. If $q = 0$, we define $p-(0) = infinity$. #margin-note[Provide examples.].
]

#example[
  $2-(24/108) = 2-(24) - 2-(108) = 3 - 2 = 1$.
]

This extension is well defined since there is only one way to write $a = r/s$ in lowest terms. We can use this definition to find an equivalent definition of the $p$-adic valuation over the rational numbers which is similar to our definition over the integers.

#proposition[
  Let $a in QQ$, then $p- (r/s) = n$ if and only if you can write $a = p^n u/v$ such that $p divides.not u, v$.
]

#proof[
  Let $r/s in QQ$, then $p- (r) = n$, $p- (s) = m$ if and only if $r = p^n u$, $s = p^m v$ and $p divides.not u, v$. So $r/s = (p^n u)/(p^n v) = p^(n - m) u/v$ if and only if $m-(r) - p-(s) = n - m$.
]

So far, we are only able to measure the $p$-adic valuation of single value. The following theorem will give us information regarding the $p$-adic valuation of the sum or product of two values.

#theorem[
  // Fix formatting here? and abc instead of 123
  Fix some prime $p$ and let some $x, y in QQ$. \
  Then,
  + $p-(-x) = p-(x)$,
  + $p-(x y) = p-(x) + p-(y)$,
  + and $p-(x + y) >= min(p-(x), p-(y))$.#footnote[Satisfying these three properties qualifies the $p$-adic valuation as a type of function known as a valuation. While inconsequential to equidissection, the fascinating consequences of this classification are explored by #cite(<gouvea_p-adic_2020>, form: "prose").]
]<valuation>

#proof[
  Write $x = p^(n) u/v$ and $y = p^(m) r/s$ where $p divides.not u, v, r, s$.
  + $-x = p^(n) (-u/v)$ if and only if $x = p^(n) u/v$.
  + We can write $x y = p^(n) u/v p^(m) r/s$. Then $x y = p^(n + m) (u r)/(v s)$. Also $p divides.not u, r, v, s$ so $p divides.not (u r), (v s)$ by Euclid's lemma since $p$ is prime.
  + Suppose $n < m$. We can write $x + y = p^(n) u/v + p^(m) r/s$. Then we can factor out the smaller exponent of $p$ to get $x + y = p^(n)(u/v + p^(m - n) r/s) = p^n (u/v + ((p^m - n)r)/s) = p^n (u s + (p^m - n) r v)/(s v)$. We know $p divides p^(m - n) r v$ since it is a multiple of $p$. So $p divides.not u s + (p^m - n) r v$ since $p divides.not u s$ by similar application of Euclid's lemma. Also $p divides.not (s v)$ as shown in the previous part. Therefore $p- (x + y) = p- (x)$. Now, suppose $n = m$ then $x + y = p^(n) (u/v) + p^n (r/s) = p^n (u/v + r/s)$. Notice that it is not necessarily true that $p divides.not
    u/v + r/s$, so $p- (x + y) >= p(x)$.
]

Notice that in our proof of the third property in @valuation, we showed an even stronger statement.

#corollary[
  For some prime $p$ and some $x, y in QQ$ where $p-(x) < p-(y)$, then $p-(x + y) = p-(x)$. Another phrasing of this property is  $p-(x + y) = min(p-(x), p-(y))$ for $x, y in QQ$ where $p-(x) != p-(y)$.
]<corollary>

We will later use this theorem and its corollary to provide a bound on the $p$-adic valuations area based on the $p$-adic valuation of its vertices.

The vertices of an arbitrary division of the square into triangles are on the real plane. To make our proof broadly applicable we must extend the $p$-adic valuation over the real numbers.

#theorem[
  Fix some prime $p$. Then for any $a in RR without QQ$ there exists a well defined function $padic(star: "a"): QQ -> ZZ$ such that
  1. $padic(star: "a")(a) = 1$
  2. $padic(star: "a")(q) = p-(q)$ for all $q in QQ$
  3. $padic(star: "a")$ satisfies the properties of @valuation and @corollary over $RR$.
]<extension>

A proof of @extension is provided by #cite(<gouvea_p-adic_2020>, form: "prose")#margin-note[page number?] which provides the specifics of the construction of this extension. The pathway to this construction requires significant analysis of the $p$-adic valuation which will not be provided in this paper in the interest of brevity. In this paper, we will simply refer to an extended version of the $p$-adic valuation over the rationals without worrying about its specific construction. Further, many of the statements we are discussing hold true for all extensions of the $p$-adic valuation over the real numbers which result from @extension. When we do not care about the specific extension which we are utilizing we refer to the $p$-adic valuation over the reals in the general sense, utilizing the syntax produced by the following definition.

#definition[
  We define $p*$ as any extension of the $p$-adic valuation over the real numbers as resulting from @extension.
]

A triangles area is not consistent with an odd equidissection if its $2$-adic valuation is non-zero since the $p$-adic valuation of any integer $a in {1/3, 1/5, 1/7, ...}$ is zero.

#proposition[
  Let $a in RR$ if $2*(a) != 0$ then $a in.not {1/3, 1/5, 1/7, 1/9, ...}$.
]

In the next section we will utilize this property to provide a set of conditions on the vertices of a triangle which show that it cannot be a member of an odd equidissection.

== Coloring the plane

In the previous section we introduced the $p$-adic valuation and its properties. We finished by showing that a triangle with an area with non-zero $2$-adic valuation cannot be a member of an odd equidissection. In this section we will find a set of constraints for each vertice of a given triangle which will require the $p$-adic valuation of a triangle to be non-zero. We will divide the real plane into three sets which satisfy these conditions for a given vertex. We will use this division of the real plane into these sets to define a construct known as a coloring over a graph. This graph coloring will allow us to easily determine if a certain triangle in a division of the square into triangles cannot be a member of an odd equidissection.

We will begin with the area of a triangle.

#theorem[
  The area of a triangle $t$ with coordinates $(x_A, y_A), (x_B, y_B), (x_C, y_C)$ is as follows:
  $
    "Area" t = 1/2mat(
      delim: bar,
      1, 1, 1;
      x_A, x_B, x_C;
      y_A, y_B, y_C;
    )
  $
]

We can use this theorem to find the $p$-adic valuation of the area of a triangle $t$ given its coordinates.

#corollary[
  The $p$-adic valuation of the area of such a triangle $t$ is as follows:
  $
    p*("Area" t) &= p* (1/2 mat(
        delim: bar,
        1, 1, 1;
        x_A, x_B, x_C;
        y_A, y_B, y_C;
      )) \
    &= p*(1/2) + p*(x_A y_B - x_A y_C + x_B y_C - x_B y_A + x_C y_A - x_C y_B). \
  $
]

Our goal is to classify all of the points on the real plane into 3 sets, such that any triangle with a vertex in each of these sets must have an area with nonzero $p$-adic valuation. To do so we must find $3$ disjoint sets $A, B$, and $C$ which cover $RR$ such that any triangle with vertices $(x_A, y_A) in A, (x_B, y_B) in B,$ and $(x_C, y_C) in C$ has an area with nonzero $p$-adic valuation. Notice that for $a, b in R^2$ where $a > b$, $p*(a - b) = p*(b)$. We will take advantage of this property to simplify this problem. We can constrain $A$ such that $p*(x_A), p*(y_A) > l$ for some $l in RR$. Then, we are able to assume $(x_A, y_A) = (0, 0)$ without loss of generality due to the following proposition.

#proposition[
  Let $(x_A, y_A) in A$, $(x, y) in.not A$. Then $(p*(x - x_A), p*(y - y_A)) in.not A$. #margin-note[Why is this relevant? its not clear why this allows us to assume loss of generality.]
]

Then,

$
  p*("Area" t) &= p*(1/2) + p*(x_A y_B - x_A y_C + x_B y_C - x_B y_A + x_C y_A - x_C y_B) \
  &= p*(1/2) + p*(x_B y_C - x_C y_B).
$

We will work backwards starting with this formula. We will then break it apart to find the constraints on our three sets. One way to show that this quantity is non-zero is for $p*(x_B y_C - x_C y_B)$ to be less than or equal to zero. For this to be true we must require two conditions. First of all $p*(x_B y_C) != p*(x_C y_B)$. This condition then gives us $p*(x_B y_C - x_C y_B) = min(p*(x_B y_C), p*(x_C y_B))$ which we will require to be less than or equal to zero to satisfy the second condition. If $p*(x_B y_C) != p*(x_C y_B)$ then $p*(x_B y_C) > p*(x_C y_B)$ or $p*(x_B y_C) < p*(x_C y_B)$. We can assume that $p*(x_B y_C) < p*(x_C y_B)$ up to renaming of variables. This then requires that $p*(x_B) + p*(y_C) < p*(x_C) + (y_B)$. This can provided in many ways, but we will provide it by requiring $p*(x_B) < p*(y_B)$ and $p*(x_C) <= p*(y_C)$#margin-note[I would like a bit more motivation here]. We will provide the second condition by assuming $p*(x_B), p*(y_C) <= 0$. This motivates constraining our $(x_A, y_A)$ such that $p*(x_A), p*(y_A) > 0$. Our final list of constraints for each set is as follows.

#proposition[
  Define the three sets as follows. Let $(x, y) in RR^2$.
  + If $p*(x), p*(y) > 0$, $(x, y) in A$,
  + if $p*(x) < p*(y)$ and $p*(x) <= 0$ then $(x, y) in B$,
  + finally, if $p*(y) <= p*(x)$ and $p*(y) <= 0$, then $(x, y) in C$.
  Then, these three sets are disjoint, cover $RR^2$, and any triangle with vertices $(x_A, y_A) in A$, $(x_B, y_B) in B$, and $(x_C, y_C) in C$ has area with nonzero $p$-adic valuation.
]

#proof[
  Let first we will prove that the sets are disjoint.
  - Suppose $(x, y) in A$, then $p*(x) > 0$ and $p*(y) > 0$. Then $(x, y) in.not B$ since $p*(x) lt.eq.not 0$. Similarly $(x, y) in.not C$ since $p*(y) lt.eq.not 0$.
  - Suppose $(x, y) in B$, then $p*(x) <= p*(y)$ so $p*(y) gt.not p*(x)$ so $(x, y) in.not C$.
  Next, we will prove the sets cover $RR^2$. Suppose $(x, y) in.not A, B$. Then, $p*(x) <= 0$ and $p*(x) <= p*(y)$. Therefore $(x, y) in C$.

  Finally we will show that a triangle with vertices in all three of $A, B$ and $C$ has area with nonzero $p$-adic valuation. Let $T$ be a three colored triangle with vertices $(x_A, y_A), (x_B, y_B), (x_C, y_C)$ where $x_A$ is colored A, $x_B$ is colored B, and so on relative to our coloring. By our previous lemma we can translate $T$ by $(-x_A, -y_A)$ without changing the coloring of our vertices. So, we can assume $(x_A, y_A) = (0, 0)$ without loss of generality.

  The area of $T$ is $1/2 (x_B y_C - x_C y_B)$. So, the $p$-adic valuation of the area of $T$ is $p- (1/2(x_B y_C - x_C y_B)) = p- (1/2) + p- (x_B y_C - x_C y_B)$. By our coloring $p- (x_B) <= p- (y_B)$ and $p- (y_C) < p- (x_C)$. Then $p- (x_B y_C) = p-(x_B) + p-(y_C) < p-(x_C) + p-(y_B) = p- (x_C y_B)$, so $p- (x_B y_C - x_C y_B) = p- (x_B y_C)$.

  Therefore $p- ("Area of" T) = p- (1/2) + p- (x_B y_C) <= p- (1/2)$ since $p- (x_B) <= 0$ and $p- (x_C) <= 0$ by our coloring.
]

We will utilize these three sets to define a structure known as a graph coloring on any given triangulation of the square.

// We can use a trick to simplify this formula. Notice that for $a, b in R^2$ where $a > b$, $p*(a - b) = p*(b)$. We will utilize this property to constrain our vertex $(x_A, y_A)$ such that we can assume $(x_A, y_A) = (0, 0)$ without loss of generality.

// #proposition[
//   Let $p*(x_A) > max(p*(x_B), p*(x_C))$ and $p*(y_A) > max(p*(y_B), p*(y_C))$. Then $(p*(x_B - x_A), p*(y_B - y_A) = (p*(x_B), p*(y_B))$ and $(p*(x_C - x_A), p*(y_C - y_A)) = p*(x_C, y_C)$.
// ]

// So, we will constrain our vertex $(x_A, y_B)$ such that $(p*(x_A), p*(y_A)) > (max(p*(x_B), p*(x_C)), max(p*(y_B), p*(y_C))$. Then, we can assume without loss of generality that $(x_A, y_A) = (0, 0)$. The $p$-adic valuation of the area of a triangle $t$ whos vertices satisfy this constraint are as follows:

// $
// p*("Area" t) &= p*(1/2) + p*(x_A y_B - x_A y_C + x_B y_C - x_B y_A + x_C y_A - x_C y_B) \
// &= p*(1/2) + p*(x_B y_C - x_C y_B).
// $

// Notice that $2*(1/2) = -1$, so to show that $2*("Area" t) != 0$ we want to show that $2*(x_B y_C - x_C y_B) <= 0$. Notice that $2*(x_B y_C - x_C y_B) = min(2*(x_B y_C), 2*(x_C, y_B))$ if $2*(x_B y_C) != 2*(y_C y_B)$. So, to show $2*(x_B y_C - x_C y_B)$ we must require that $2*(x_B y_C) != 2*(x_C y_B)$ and $min(2*(x_B y_C), 2*(x_C y_B)) <= 0$.

// So, our final constraints on the vertices of $t$ is as follows:
// + $(p*(x_A), p*(y_A)) > (max(p*(x_B), p*(x_C)), max(p*(y_B), p*(y_C))$,
// + $p*(x_B y_C) != p*(x_C y_B)$,
// + and $min(p*(x_B y_C), p*(y_C x_B)) <= 0$.

// Our goal now is to find a division of the real plane into 3 sets, $A, B$ and $C$, which satisfy these constraints. We will work backwards by letting $(x_A, y_A) in A, (x_B, y_B in B),$ and $(x_C, y_C in C)$. We will start with the third constraint. We can assume that $p*(x_B y_C) < p*(y_C x_B)$ since this is always true up to renaming our sets. Then, we must require $p*(x_B y_C) <= 0$. This implies $p*(x_B) + p*(y_C) <= 0$. So, we must require that $p*(x_B), p*(y_C) <= 0$.

#definition[
  A coloring on a graph $G$ is a mapping $C: V -> X$ where $V$ is the vertex set of $G$ and $X$ is our set of colors. A coloring is an $n$-coloring if $X$ has $n$ elements.
]

Notice that the sets we defined earlier naturally induce a coloring function over the real plane since they are disjoint and cover the real plane.

#definition[
  We will define the $p$-adic coloring function $C_p: RR^2 -> {A, B, C}$ as follows. For an $(x, y) in RR^2$ color $(x, y)$, $A$ if $(x, y) in A$, $B$ in $(x, y) in B$, and $C$ if $(x, y) in C$.
]

#example[
  // improve these explanations
  Under $C_2$ the unit square is colored as follows:
  #figure(
    diagram(
      node-stroke: .1em,
      edge-stroke: .1em,
      cell-size: 30mm,
      node-inset: 0.25em,
      node-defocus: 0,
      node((0, 0))[B],
      node((0, 1))[A],
      node((1, 0))[C],
      node((1, 1))[C],
      edge((0, 0), (0, 1)),
      edge((0, 0), (1, 0)),
      edge((1, 1), (0, 1)),
      edge((1, 1), (1, 0)),
    ),
    caption: [The coloring of the unit square as shown in @squarecoloring],
  )<coloring>
  + $C_2 ((0, 0)) = A$ since $2*(x) = 2*(y) = 2*(0) = infinity > 0$.
  + $C_2 ((0, 1)) = C$ since $2*(x) = 2*(0) = infinity >= 0 = 2*(1) = 2*(y)$ and $2*(y) = 2*(1) = 0 <= 0$
  + $C_2 ((1, 1)) = C$ since $2*(x) = 2*(1) = 0 >= 0 = 2*(1) = 2*(y)$ and $2(y) = 2*(1) = 0 <= 0$.
  + $C_2 ((1, 0)) = B$ since $2*(x) = 2*(1) = 0 < infinity = 2*(0) = 2*(y)$ and $2*(x) = 2*(1) = 0 <= 0$.
]<squarecoloring>

#example[
  Under $C_2$ the following dissection of the square is colored as follows:
  #figure(
    diagram(
      node-stroke: .1em,
      edge-stroke: .1em,
      cell-size: 30mm,
      node-inset: 0.25em,
      node-defocus: 0,
      node((0, 0))[B],
      node((0, 1))[A],
      node((1, 0))[C],
      node((1, 1))[C],
      node((0.5, 0.75))[C],
      node((0.5, 1))[C],
      node((0.5, 0.5))[C],
      edge((0, 0), (0, 1)),
      edge((0, 0), (1, 0)),
      edge((1, 0), (0.5, 0.75)),
      edge((0.5, 0.75), (0.5, 1.0)),
      edge((0.5, 0.75), (0, 1)),
      edge((0.5, 0.75), (1, 1)),
      edge((0, 0), (0.5, 0.5)),
      edge((0.5, 0.5), (0.5, 0.75)),
      edge((0.5, 0.5), (0, 1)),
      edge((0.5, 0.5), (1, 0)),
      edge((1, 1), (0.5, 1)),
      edge((0, 1), (0.5, 1)),
      edge((1, 1), (1, 0)),
    ),
    caption: [The coloring of a dissection relative to $C_2$.],
  )
]<carriedexample>

The properties which we have proven on our three sets carry over into this coloring. For example, translating a point by a point colored $A$ still preserves that points coloring.

#lemma[
  Let $V_A = (x_A, y_A), V = (x, y) in RR^2$ such that $C_p (V_A) = A$. Then, $C_p (V - V_A) = C_p (V)$.
]<translate>

A corollary of this property which will be useful in the next section is as follows.

#corollary[
  Let $V_1, V_2 in RR^2$. $C_p (V) = C_p (V_1) "or" C_p (V_2)$ for any point $V$ along the line segment formed by $V_1$ and $V_2$.
]<line>

We can also carry over the most important property of our three sets, which constrains the $p$-adic valuation of a three colored triangles area to be non-zero.

#lemma[
  Let $T$ be a three colored triangle relative to $C_p$. Then $p* ("Area of" T) <= p* (1/2)$
]<triarea>

#example[
  The three colored triangle in @carriedexample has coordinates $(0, 0), (1/2, 1/2), (0, 1)$. The area of this triangle is equal to, $1/2 * 0 + 1/2 * 1 = 1/2$. Notice that $2*(1/2) = -1 <= -1 = p*(1/2)$.
]

// #lemma([Sperner's])[
//   Let $P$ be a complete polygon under our coloring. Then there exists at least one complete triangle in any triangulation of $P$.
// ]

// #proof[
//   Consider the graph $T'$ where each node is a triangle $t$ in $T$ or the "outside" node, which represents the area outside of $T$ and two nodes are connected if they share a complete edge. Then, the degree of each triangle $t$ in $T'$ is either $0, 1$ or $2$ with $1$ representing a complete triangle. There are an odd number of complete edges on the boundary of the triangle, so the "outside" node must have an odd degree. So, there must be a triangle $t in T'$ with odd degree by the handshake lemma. The only option of odd degree for this triangle is $1$ so the triangle must be complete.
// ]

Now, all we need to show is that any three colored triangle $t$ in a triangulation $G$ derived from a dissection $T$ is also a triangle in $T$. In other words we need to show the triangle is not one of the spurious triangles introduced via our mapping from dissections to triangulations.

#lemma[
  Let $T$ be a dissection with corresponding triangulation $G$. Suppose $t$ is a three colored triangle in $G$ relative to $C_p$, then $t$ corresponds to a triangle in $T$.
]

#proof[
  We will proceed by contradiction. If $t$ does not correspond to a triangle in $T$, then $"Area of" t = 0$ when $t$ is considered geometrically. Therefore $p* ("Area of" T) = infinity$. However by @triarea $p* ("Area of" T) <= p*(1/2) < infinity$ so the area of $t$ is non-zero. Therefore $t$ must correspond to a triangle in $T$ by contradiction.
]

We can now proceed to the finale of this section by showing that any 3-colored triangle in a triangulation of the square colored by the $2$-adic coloring function cannot be a member of an odd-equidissection.

#corollary[
  Let $T$ be a dissection of the square whos corresponding triangulation $G$ contains $n$ triangles where $n$ is odd and a three colored triangle $t$ relative to $C_2$. Then $T$ is not an equidissection.
]<complete1>

#proof[
  Our triangle $t$ is three colored relative to $C_2$ so $2* ("Area of" t) <= 1/2$. Also, $2* (1/n) = 0$ since $n$ is odd. Therefore $T$ is not an equidissection since $t$ corresponds to a triangle in $T$ whos area is inconsistant with an equidissection.
]

In the next section we will complete our introduction of lemmas necessary to prove Monsky's Theorem by finding a three colored triangle relative to the $2$-adic coloring function in every division of the square into triangles.

// #definition([Dissection])[
//   Let $P$ be some polygon. A _dissection_ of $P$ is a division of $P$ into non overlapping triangles. We call a dissection with $n$ triangles an $n$-dissection.
// ]

// #figure([#todo], caption: [A dissection of the square.])

// #definition([Equidissection])[
//   Let $P$ be some polygon. An equidissection of $P$ is a dissection of $P$ into triangles of equal area. If an equidissection of $P$ is an $n$-dissection, we call it an $n$-equidissection.#margin-note[This is super dry] .
// ]

// #figure(
//   [#todo],
//   caption: [A 2-equidissection, a 4-equidissection, and a 6 equidissection of the square.],
// )<monskyeven>

// #theorem([Monsky's])[
//   There exists an $n$-equdissection of the square if and only if $n$ is even.
// ]

== The Boundary Word

In the previous section, we constructed a coloring on triangulations of the square. Any three colored triangle under this triangulation must have area inconsistent with an odd equidissection of the square. To find a three colored triangle within an arbitrary triangulation of the square we will remove triangles which are not three colored from the square. We have found a three colored triangle if we cannot continue this process until all triangles are removed. We will create a combinatorial object which will simplify this proof into one on a type of object known as a cyclic word.

#definition[
  A cyclic word $w$ is a tuple of $n$ characters indexed $mod n$.
]

#example[
  Let $w$ be the word $(A, B, C, D)$. Then $w_1 = A$, $w_3 = C$ and $w_5 = A$.
]

We will convert a given triangulation into a cyclic word by reading off the coloring around its boundary.

#definition[
  Let $T$ be a triangulation of polygon with a coloring $C$ on its naturally induced graph $G$. Then, the _boundary word_ of $C$ is the cyclic word which is given by reading $C$ along the boundary of $G$ counterclockwise.
]

For example, we can find the boundary word of the square.

#example[
  The boundary word of the unit square is $A C C B$ as shown in @coloring.
]

Or, we can find the boundary word of a triangulation.

#example[
  The boundary word of @carriedexample is $A C C C B$.
]

We will proceed with our proof by removing triangles which are not three colored from our triangulation around the boundary, this corresponds to removing characters from the boundary word in a specific fashion. We will call such a removal of a triangle from a triangulation a _contracting step_.

#definition[
  Let $W$ be a boundary word represented as the cyclic tuple of colors $(w_1, w_2, dots, w_n)$, define a contracting step on $W$ as follows. If there exists an $i <= n$ such that $w_(i-1), w_(i), w_(i+1)$ are not all distinct, produce $W prime$ by removing $w_i$ from $W$.
]

#example[
  The following triangulation of the square has boundary word $A B C C C$. We can contract it to result in $A B C C$.
  #figure(
    diagram(
      node-stroke: .1em,
      edge-stroke: .1em,
      cell-size: 30mm,
      node-inset: 0.25em,
      node-defocus: 0,
      node((0, 0))[B],
      node((0, 1))[A],
      node((1, 0))[C],
      node((1, 1))[C],
      node((0.5, 0.75))[C],
      node((0.5, 1))[C],
      node((0.5, 0.5))[C],
      edge((0, 0), (0, 1)),
      edge((0, 0), (1, 0)),
      edge((1, 0), (0.5, 0.75)),
      edge((0.5, 0.75), (0.5, 1.0)),
      edge((0.5, 0.75), (0, 1)),
      edge((0.5, 0.75), (1, 1)),
      edge((0, 0), (0.5, 0.5)),
      edge((0.5, 0.5), (0.5, 0.75)),
      edge((0.5, 0.5), (0, 1)),
      edge((0.5, 0.5), (1, 0)),
      edge((1, 1), (0.5, 1)),
      edge((0, 1), (0.5, 1)),
      edge((1, 1), (1, 0)),
      node((2, 0))[B],
      node((2, 1))[A],
      node((3, 0))[C],
      node((2.5, 0.75))[C],
      node((2.5, 1))[C],
      node((2.5, 0.5))[C],
      edge((2, 0), (2, 1)),
      edge((2, 0), (3, 0)),
      edge((3, 0), (2.5, 0.75)),
      edge((2.5, 0.75), (2.5, 1.0)),
      edge((2.5, 0.75), (2, 1)),
      edge((2, 0), (2.5, 0.5)),
      edge((2.5, 0.5), (2.5, 0.75)),
      edge((2.5, 0.5), (2, 1)),
      edge((2.5, 0.5), (3, 0)),
      edge((2, 1), (2.5, 1)),
      edge((2.5, 1), (3, 0)),
      edge((1.25, 0.5), (1.75, 0.5), "->"),
    ),
    caption: [Removing a triangle corresponding to the above contracting step.],
  )
]

Notice that in some cases we cannot continue to the contract the boundary, then we call such a boundary word non-contractible.

#definition[
  Let $W$ be a boundary word. If any possible sequence of contracting steps performed on $W$ does not result in an empty word, $W$ is _non-contractible_.
]

#example[
  We can continue to contract our result from the previous example. The chain of contraction is as follows: $A B C C -> A B C$.
  #figure(
    diagram(
      node-stroke: .1em,
      edge-stroke: .1em,
      cell-size: 30mm,
      node-inset: 0.25em,
      node-defocus: 0,
      node((0, 0))[B],
      node((0, 1))[A],
      node((1, 0))[C],
      node((0.5, 0.75))[C],
      node((0.5, 1))[C],
      node((0.5, 0.5))[C],
      edge((0, 0), (0, 1)),
      edge((0, 0), (1, 0)),
      edge((1, 0), (0.5, 0.75)),
      edge((0.5, 0.75), (0.5, 1.0)),
      edge((0.5, 0.75), (0, 1)),
      edge((0, 0), (0.5, 0.5)),
      edge((0.5, 0.5), (0.5, 0.75)),
      edge((0.5, 0.5), (0, 1)),
      edge((0.5, 0.5), (1, 0)),
      edge((0, 1), (0.5, 1)),
      edge((0.5, 1), (1, 0)),
      node((2, 0))[B],
      node((2, 1))[A],
      node((3, 0))[C],
      node((2.5, 0.75))[C],
      node((2.5, 0.5))[C],
      edge((2, 0), (2, 1)),
      edge((2, 0), (3, 0)),
      edge((3, 0), (2.5, 0.75)),
      edge((2.5, 0.75), (2, 1)),
      edge((2, 0), (2.5, 0.5)),
      edge((2.5, 0.5), (2.5, 0.75)),
      edge((2.5, 0.5), (2, 1)),
      edge((2.5, 0.5), (3, 0)),
      edge((2, 1), (3, 0), bend: -45deg),
      edge((1.25, 0.5), (1.75, 0.5), "->"),
    ),
    caption: [Removing a triangle corresponding to the above contracting step.],
  )
  We cannot continue to contract any further, so our word is non-contractible.
]

Notice that if our boundary word is non contractible, we will always be left with a triangle on the boundary which is three-colored. This promises us the 3-colored triangle we have been searching for. We can formalize this statement into the following lemma.

// #lemma([Sperner's])[
//   Any triangulation $G$ of a 3 color triangle contains a 3 color triangle.
// ]

// #proof[
//   Consider the adjacency graph $G'$ of $G$ where the nodes are triangles or the exterior of the graph and two triangles are connected if they share an $A B$ edge. Since the boundary of $G$ is $A B C$, the exterior node has degree $1$, so by the handshake lemma some other node must have degree $1$, meaning it must have one $A B$ edge, making it a triangle colored $A B C$.
// ]

// #example[
//   #figure(
//     diagram(
//       node-stroke: .1em,
//       edge-stroke: .1em,
//       cell-size: 30mm,
//       node((2, 0), [B~~]),
//       node((2, 1), align(bottom)[A~~]),
//       node((3, 0), align(left)[~~C]),
//       node((2.5, 0.75), align(left)[C]),
//       node((2.5, 0.5), align(left)[C]),
//       node((2.16666, 0.5)),
//       node((1.666, 0.5)),
//       edge((2.16666, 0.5), (1.666, 0.5)),
//       edge((2, 0), (2, 1)),
//       edge((2, 0), (3, 0)),
//       edge((3, 0), (2.5, 0.75)),
//       edge((2.5, 0.75), (2, 1)),
//       edge((2, 0), (2.5, 0.5)),
//       edge((2.5, 0.5), (2.5, 0.75)),
//       edge((2.5, 0.5), (2, 1)),
//       edge((2.5, 0.5), (3, 0)),
//       edge((2, 1), (3, 0), bend: -45deg),
//     ),
//     caption: [The adjacency graph overlaid over a 3-colored graph corresponding to our carried example.],
//   )
// ]

#lemma([Non-Abelian Sperner's])[
  Let $T$ be a triangulation colored by $C_p$ such that the boundary word $omega$ of $T$ is non-contractible. Then, $T$ contains a complete triangle.
]

#proof[
  There exist a $u, v, x$ where $u$ and $v$ are two adjacent edges on the boundary of $T$ and $x$ is the vertex which forms a triangle with $u$ and $v$ such that $x$ is either adjacent to $u$ and $v$ on the boundary, or $x$ is in the interior since the case where every pair of adjacent edges forms a triangle with a non adjacent boundary vertex gives rise to intersections, contradicting our assumption that $T$ is a triangulation. Then there is a triangle $t$ formed by $u, v$ and a third vertex $x$. Our result follows if $t$ is complete. Otherwise $t$ isn't complete. In either of these cases, removing x corresponds to a contracting step on $omega$. Therefore, by induction, if we continue contracting $x$ we will continue until we find a complete triangle since $omega$ is non-contractible.
]<sperner>

For our purposes, non-contractibilty is a very valuable property. Luckily there is a very simple condition for non-contractibility which we can utilize. If there are an odd number of $A B$ or $B A$ edges in a cyclic word, then the $A B$ and $B A$ edges cannot cancel eachother out. This implies that our boundary word must be non-contractible.

#theorem[
  Let $W$ be the boundary word derived from the $3$-coloring of a triangulation $G$ with an odd number of complete pairs and atleast $3$ edges. Then, $W$ is non-contractible.
]<3contract>

#proof[
  Let $W$ be a boundary word of length $n >= 3$ over a $3$-coloring represented by the cyclic tuple of colors $(w_1, w_2, dots, w_n)$. Suppose $W$ has an odd number of complete pairs. If $n = 3$ then, $W$ is either $A B C$, $B C A$, $A C B$, or $B C A$. So, $W$ is non-contractible. Now suppose $n > 3$. If there exists no $i <= n$ such that $w_(i-1), w_(i), w_(i + 1)$ are all distinct then $W$ is non contractible. Suppose there exists such an $i$, then the word $(w_(i-1), w_i, w_(i + 1))$ either contains no complete pairs, or is colored $A B A$, $A A B$, or $B A A$. In all of these cases, an even number of complete pairs are removed by contracting, so $W prime$ has an odd number of complete pairs and has length $n - 1$. Then, by induction, if we continue to contract $W$ we will run out of possible contracting steps with a word of length greater than or equal to $3$. Therefore $W$ is non-contractible.
]

We can use the @line regarding our coloring to expand this condition to any triangulation of a polygon which has an odd number of complete edges.

#corollary[
  Let $T$ be a triangulation with boundary word $omega$ of a polygon $P$ with boundary word $W$ where both boundary words are derived via the coloring $C_p$. If $W$ has an odd number of complete pairs, then $omega$ has an odd number of complete pairs.
]<pairs>

#proof[
  Notice that the boundary of $T$ is a subdivision of the boundary of $P$. Let $u, v$ be the two vertices of a complete edge on $P$. Notice that $u, v$ are also present in $T$. Lets consider the (non-cyclic) sub word $omega_0$ of $omega$ from $u$ to $v$. By @line all vertices between $u$ and $v$ on the boundary of $T$ are colored either $A$ or $B$. This word also must alternate from $A$ to $B$ an odd number of times since either starts with $A$ and ends with $B$ or starts with $B$ and ends with $A$. So $omega_0$ has an odd number of complete edges. $P$ has an odd number of complete edges, and complete edges on $omega$ can only happen along complete edges on $P$. Therefore $omega$ has an odd number of complete pairs.
]

This theorem gives way to the lemma which will provide the final step for our proof of Monsky's Theorem.

#corollary[
  Let $T$ be a triangulation of a polygon $P$ which has an odd number of complete edges when 3 colored. Then, $T$ contains a three colored triangle.
]<threecolor>

In the next section we will provide a proof of Monsky's Theorem.

== Monsky's Theorem

In summary of this chapter, @threecolor shows that the triangulation which is derived from any given dissection of the square must contain a three coloring. @complete1 shows that any odd dissection of the square with a complete triangle is not an equidissection. The combination of these two theorems gives us our result. We will first provide an odd dissection, and use these theorems to show the dissection cannot be an equidissection.

#example[
  Starting with the following dissection of the square, we produce a corresponding triangulation by introducing a spurious triangle.
  #figure(
    align(center)[
      #stack(
        dir: ltr,
        spacing: 2em,
        diagram(
          node-stroke: .1em,
          edge-stroke: .1em,
          cell-size: 30mm,
          edge((0, 0), (0, 1)),
          edge((0, 0), (1, 0)),
          edge((1, 1), (0, 1)),
          edge((1, 1), (1, 0)),
          edge((0.5, 0), (0, 1)),
          edge((0.5, 0), (0.5, 1)),
          edge((0.5, 0.5), (1, 0)),
          edge((0.5, 0.5), (1, 1)),
        ),
        diagram(
          node-stroke: .1em,
          edge-stroke: .1em,
          cell-size: 30mm,
          node-inset: 0.5em,
          edge((0, 0), (0, 1)),
          edge((0, 0), (1, 0)),
          edge((1, 1), (0.5, 1)),
          edge((0.5, 1), (0, 1)),
          edge((1, 1), (1, 0)),
          edge((0.5, 0), (0, 1)),
          edge((0.5, 0), (0.5, 1)),
          edge((0.5, 0.5), (1, 0)),
          edge((0.5, 0.5), (1, 1)),
          edge((0.5, 0), (0.5, 1), bend: -15deg),
        ),
      )
    ],
    caption: [A dissection of the square and its corresponding triangulation.],
  )

  We can then color the triangle based on the $p$-adic valuation of its coordinates.
  #figure(
    align(center)[
      #stack(
        dir: ltr,
        spacing: 4em,
        diagram(
          node-stroke: .1em,
          edge-stroke: .1em,
          cell-size: 30mm,
          node-inset: 0.5em,
          node-defocus: 0,
          node-fill: luma(255),
          node((0, 0))[$(infinity, 0)$],
          node((0, 1))[$(infinity, infinity)$],
          node((1, 0))[$(0, 0)$],
          node((1, 1))[$(0, infinity)$],
          node((0.5, 1))[$(-1, infinity)$],
          node((0.5, 0))[$(-1, 0)$],
          node((0.5, 0.5))[$(-1, -1)$],
          edge((0, 0), (0, 1)),
          edge((0, 0), (0.5, 0)),
          edge((0.5, 0), (0, 1)),
          edge((0.5, 0), (1, 0)),
          edge((1, 1), (0.5, 1)),
          edge((0.5, 1), (0, 1)),
          edge((1, 1), (1, 0)),
          edge((0.5, 0), (0.5, 0.5)),
          edge((0.5, 0.5), (0.5, 1)),
          edge((0.5, 0.5), (1, 0)),
          edge((0.5, 0.5), (1, 1)),
        ),
        diagram(
          node-stroke: .1em,
          edge-stroke: .1em,
          cell-size: 30mm,
          node-inset: 0.25em,
          node-defocus: 0,
          node((0, 0))[B],
          node((0, 1))[A],
          node((1, 0))[C],
          node((1, 1))[C],
          node((0.5, 1))[C],
          node((0.5, 0))[C],
          node((0.5, 0.5))[C],
          edge((0, 0), (0, 1)),
          edge((0, 0), (0.5, 0)),
          edge((0.5, 0), (0, 1)),
          edge((0.5, 0), (1, 0)),
          edge((1, 1), (0.5, 1)),
          edge((0.5, 1), (0, 1)),
          edge((1, 1), (1, 0)),
          edge((0.5, 0), (0.5, 0.5)),
          edge((0.5, 1), (0.5, 0.5)),
          edge((0.5, 0.5), (1, 0)),
          edge((0.5, 0.5), (1, 1)),
          edge((0.5, 0), (0.5, 1), bend: -15deg),
        ),
      )
    ],
    caption: [A dissection with vertices labelled by the $p$-adic valuation of its coordinates, and its corresponding colored triangulation.],
  )

  The boundary word of this dissection is $A C C C C B$. We can contract it as follows $A C C C C B -> A C C C B -> A C C B -> A C B$. The boundary word is non contractible, so the triangulation must have a three color triangle. The three color triangle is highlighted in the following figure.

  #figure(
    align(center)[
      #stack(
        dir: ltr,
        spacing: 4em,
        diagram(
          node-stroke: .1em,
          edge-stroke: .1em,
          node-inset: 0.25em,
          cell-size: 30mm,
          node-defocus: 0,
          node((0, 0))[B],
          node((0, 1))[A],
          node((1, 0))[C],
          node((1, 1))[C],
          node((0.5, 1))[C],
          node((0.5, 0))[C],
          node((0.5, 0.5))[C],
          edge((0, 0), (0, 1), "--"),
          edge((0, 0), (0.5, 0), "--"),
          edge((0.5, 0), (0, 1), "--"),
          edge((0.5, 0), (1, 0)),
          edge((1, 1), (0.5, 1)),
          edge((0.5, 1), (0, 1)),
          edge((1, 1), (1, 0)),
          edge((0.5, 0), (0.5, 0.5)),
          edge((0.5, 0.5), (0.5, 1)),
          edge((0.5, 0.5), (1, 0)),
          edge((0.5, 0.5), (1, 1)),
        ),
        diagram(
          node-stroke: .1em,
          edge-stroke: .1em,
          cell-size: 30mm,
          node-inset: 0.25em,
          node-defocus: 0,
          node((0, 0))[B],
          node((0, 1))[A],
          node((1, 0))[C],
          node((1, 1))[C],
          node((0.5, 1))[C],
          node((0.5, 0))[C],
          node((0.5, 0.5))[C],
          edge((0, 0), (0, 1), "--"),
          edge((0, 0), (0.5, 0), "--"),
          edge((0.5, 0), (0, 1), "--"),
          edge((0.5, 0), (1, 0)),
          edge((1, 1), (0.5, 1)),
          edge((0.5, 1), (0, 1)),
          edge((1, 1), (1, 0)),
          edge((0.5, 0), (0.5, 0.5)),
          edge((0.5, 1), (0.5, 0.5)),
          edge((0.5, 0.5), (1, 0)),
          edge((0.5, 0.5), (1, 1)),
          edge((0.5, 0), (0.5, 1), bend: -15deg),
        ),
      )
    ],
    caption: [Our dissection and its corresponding triangulation with their three colored triangles highlighted.],
  )

  We will refer to this highlighted three-color triangle as $t$. If $t$ were a part of an equidissection, it would have area $1/5$ since there are $5$ triangles in our dissection. However by @triarea $2*("Area" t) <= 2*(1/2) = -1 != 0 = p*(1/5)$ since $t$ is three colored. We can verify this by calculating the area of $t$. The coordinates of $t$ are $(0, 0), (0, 1), (1/2, 1)$. So, $"Area" t = 1/2 * 1 = 1/2 != 1/5$. Therefore, this triangulation is not an equidissection.
]

We can finally chain all of these lemmas together to provide a quick proof of Monsky's Theorem.

#proof("Monsky's Theorem")[
  Let $T$ be an $m$-dissection of the unit square with vertices $(0, 0)$, $(0, 1)$, $(1, 0)$ and $(1, 1)$ where $m$ is odd. Let $G$ be the triangulation corresponding to $T$. Notice that the boundary word of the unit square is $A C C B$ when colored by $C_2$. This boundary word has an odd number of $A B$ pairs, so by @pairs the boundary word $W$ of $G$ has an odd number of $A B$ pairs. Then by @3contract $W$ is non-contractible. So $T$ contains a complete triangle when colored by $C_2$. Therefore $T$ is not an equidissection by @complete1.
]

= Generalizing our Proof of Monsky's Theorem<generalize>

In this section we will introduce Stein's Conjecture, and then provide proofs of Stein's Conjecture for two subsets of this problem.

== Balanced Lattice Polygons

The astute reader will have noticed that by showing that the square has no odd equidissection, we have proven that there is no odd equidissection for any polygon which can be transformed into the square by way of any transformation which effects the area of every triangle equally. Such transformations are known as _affine transformations_.

#definition[
  An _affine transformation_ on the real plane is a function $A: X -> Y$ where both $X$ and $Y$ are sets of points, or single points, on the real plane $RR^2$ which satisfy the following properties:
  + Let $L$ be a set of points which make up a line. Then, $A(L)$ also make up a line.
  + Let $L_0, L_1$ be sets of points which make up two parallel lines, then $A(L_0)$ and $A(L_1)$ are both parallel.
]

#example[
  #figure(
    diagram(
      node-stroke: .1em,
      edge-stroke: .1em,
      cell-size: 30mm,
      node((0, 0)),
      node((0, 1)),
      node((1, 0)),
      node((1, 1)),
      edge((1.25, 0.5), (2, 0.5), "->")[$A(x, y) = (x - 1/2y, y)$],
      edge((0, 0), (0, 1)),
      edge((0, 1), (1, 1)),
      edge((1, 1), (1, 0)),
      edge((1, 0), (0, 0)),
      edge((2, 0), (2.5, 1)),
      edge((2.5, 1), (3.5, 1)),
      edge((3.5, 1), (3, 0)),
      edge((3, 0), (2, 0)),
    ),
    caption: [An example of an affine transformation.],
  )
]

In practice, affine transformations on the real plane can be represented by convolution by a matrix, alongside an addition by a fixed vector.

#proposition[
  Let $A$ be an affine transformation, then there exists a $2 times 2$ matrix $M$, and a $2$-dimensional vector $V$ such that $A(x, y) = mat(x; y) M + V.$ The matrix $M$ is referred to as the _linear component_ of $M$.
]

This representation reveals the underlying property of affine transformations which we are looking for. Affine transformations are made up of two steps, first we perform a linear transformation, represented by our matrix $M$, then we perform a translation by our vector $V$. This means all affine transformations inherit the property of equally affecting the area of polygons from linear transformations since translations do not affect area.

#corollary[
  Let $A$ be an affine transformation with linear component $M$. Let $P$ be a polygon with area $a$, then $"Area" A(P) = det(M) a$.
]

However, we run into one problem which requires us to slightly restrict the scope of transformations which we investigate. If the linear component of an affine transformation has a determinant which is zero, it maps all polygons to a line, which for the purposes of dissection is nonsensical. Moving forward we will consider only affine transformations with non-zero determinant.

The result of any affine transformation applied to the square with non-zero determinant is a parallelogram. Parallelograms are made distinct from other quadrilaterals by the fact that each edge of a parallelogram has a coresponding parallel edge which is equal in length. By extending this property to $n$-gons we derive our definition of the balanced polygon.

#definition[
  An polygon $P$ with a counterclockwise boundary is considered _balanced_ if it can be divided into pairs of edges $(u, v)$ such that $u$ and $v$ are parallel, equal in length, and have opposite orientation.@rudenko_equidissection_2012 #margin-note[Are the conditions other than parallel necessary?]
]

What do such balanced polygons look like?

#example[
  The first easy example of a balanced polygon is the square.
  #figure(
    diagram(
      node-stroke: .1em,
      edge-stroke: .1em,
      cell-size: 30mm,
      node((0, 0)),
      node((0, 1)),
      node((1, 0)),
      node((1, 1)),
      edge((0, 0), (0, 1)),
      edge((0, 1), (1, 1)),
      edge((1, 1), (1, 0)),
      edge((1, 0), (0, 0)),
    ),
    caption: [The square, the most basic balanced polygon.],
  )
]

A core property of area preserving affine transformations is that they preserve parallel lines. This suggests that area preserving affine transformations preserve the balanced property of polygons aswell.

#proposition[
  The result of any area preserving affine transformation applied to a balanced polygon is also a balanced polygon.
]

#example[
  #figure(
    diagram(
      node-stroke: .1em,
      edge-stroke: .1em,
      cell-size: 30mm,
      node((0, 0)),
      node((0, 1)),
      node((1, 0)),
      node((1.5, 1)),
      edge((0, 0), (0.5, 1)),
      edge((0.5, 1), (1.5, 1)),
      edge((1.5, 1), (1, 0)),
      edge((1, 0), (0, 0)),
    ),
    caption: [A paralellogram, the four sided balanced polygon.],
  )
  As stated earlier, all such transformed squares are parallelograms. Due to this, all four sided balanced polygons are parallelograms and all parallelograms are balanced polygons.
]

Another way to construct new balanced polygons is by tiling multiple balanced polygons together along congruent edges.

#proposition[
  Any tiling of any abritrary collection of balanced polygons in which two balanced polygons are joined only across congruent edges is a balanced polygon.
]

#example[
  #figure(
    diagram(
      node-stroke: .1em,
      edge-stroke: .1em,
      cell-size: 30mm / 8,
      node-shape: circle,
      node((0, 0)),
      edge((0, 0), (0, 1)),
      edge((0, 1), (0, 4)),
      edge((0, 4), (1, 4)),
      edge((0, 0), (1, 0)),
      edge((1, 0), (2, 0)),
      edge((2, 0), (3, 0)),
      edge((3, 0), (3, 2)),
      edge((3, 2), (2, 2)),
      edge((2, 2), (2, 1)),
      edge((2, 1), (1, 1)),
      edge((1, 1), (1, 4)),
    ),
    caption: [All polyominoes are balanced polygons.],
  )
  #figure(
    diagram(
      node-stroke: .1em,
      edge-stroke: .1em,
      cell-size: 30mm / 2,
      node-shape: circle,
      edge((0, 0), (0, 1)),
      edge((1, 1), (1, 0)),
      edge((1, 0), (0, 0)),
      edge((0, 1), (0.5, 2)),
      edge((0.5, 2), (1.5, 2)),
      edge((1.5, 2), (1, 1)),
    ),
    caption: [A square and a parallelogram tiled together to form a balanced polygon.],
  )
]

Tilings of the square across congruent edges are a special type of balanced polygon known as a _polyomino_.

#definition[
  Tilings of the square, are known as _polyominos_.
]

Such a property may lead the reader to believe that we could perform this process in reverse. That is, any balanced polygon could be decomposed into tilings of smaller balanced polygons until it is decomposed into a tiling of parallelograms, the balanced polygon with the least number of edges. However, this property does not hold true.

#proposition[
  Not all balanced polygons $P$ can be divided into a set of non-overlapping parallelograms $G$.
]

#example[
  @marie_decomposition_2020
  #figure(
    diagram(
      node-stroke: .1em,
      edge-stroke: .1em,
      cell-size: 30mm / 9,
      node-shape: circle,
      edge((0, 0), (3, 0)),
      edge((3, 0), (3, 1)),
      edge((3, 1), (4, 2)),
      edge((4, 2), (1, 2)),
      edge((1, 2), (1, 1)),
      edge((0, 0), (1, 1)),
    ),
    caption: [A balanced polygon which cannot be divided into paralellograms.],
  )
]

However, you may notice that the above counter-example is made up of the union of two parallelograms. This gives rise to the following property of balanced polygons.

#figure(
  diagram(
    node-stroke: .1em,
    edge-stroke: .1em,
    cell-size: 30mm / 9,
    node-shape: circle,
    edge((0, 0), (3, 0)),
    edge((3, 0), (3, 1)),
    edge((3, 1), (4, 2)),
    edge((4, 2), (1, 2)),
    edge((1, 2), (1, 1)),
    edge((0, 0), (1, 1)),
    edge((3.75, 1), (5.25, 1), "->"),
    edge((5, 0), (7, 0), "--"),
    edge((8, 0), (8, 2)),
    edge((8, 0), (6, 0)),
    edge((8, 2), (6, 2)),
    edge((7, 0), (9, 2), "--"),
    edge((9, 2), (7, 2), "--"),
    edge((6, 2), (6, 0)),
    edge((5, 0), (7, 2), "--"),
  ),
  caption: [A balanced polygon and its decomposition into parallelograms.],
)

We will define a _decomposition_ of a balanced polygon as a set of potentially intersecting parallelograms whos union is equal to our balanced parallelograms.

#definition[
  Let $P$ be an combinatorial polygon, and $cal(P)$ be a set of parallelograms where for all $p in P$. Then, a set of parallelograms $cal(P)$ is a _decomposition_ of $P$ into parallelograms if $P = union.big_(p in cal(P)) p$.
]

Then, we can move forward with our theorem that there exists a decomposition into paralellograms for any balanced polygon.

#proposition[
  Any balanced polygon $P$ can be decomposed into a set of potentially intersecting parallelograms which cover $P$ and are contained within $P$.
]

This property follows from the fact that any pair of parallel congruent edges form a parallelogram. Carefully choosing pairs of edges forming parallelograms which are contained in $P$ allows us to build a set of parallelograms which covers $P$.

It is natural to wonder if the set of balanced polygons only have even equidissections since we have constructed balanced polygons by extrapolating a property of a set of $4$-sided polygons which only have even equidissection. In the next section we will examine this question in more detail.

== Steins Conjecture

In the previous section we introduced balanced polygons provided motivation for the question which Stein's Conjecture poses.

#conjecture([Stein])[
  For any balanced polygon $P$, there exists an $n$-equidissection of $P$ if and only if $n$ is even.
]

While we provided some motivation in the previous section, it is also illuminating to trace the historical context which to this question being asked. So, what grounds did Sherman Stein make this conjecture upon? Following Monsky's Theorem, a number of conjectures were made which expand on a single primary question: What are the members of the set of all polygons which only have equidissections with an even number of triangles, and is there a single encapsulating property for all such polygons?

The first such generalization was presented by Elaine Kasimatis which expands the result to regular polygons.

#theorem[
  @kasimatis_dissections_1989 Let $n >= 5$ be an integer. A regular $n$-gon is dissectable into $m$ triangles of equal areas if and only if $m$ is a multiple of $n$.
]

This generalization was the result of a presentation given by Elaine Kasimatis, a graduate student, at a U.C. Davis geometry seminar. Stein suggested she present on equidissection as she was "was looking for some algebraic topic she could slip into" the seminar. After the seminar Stein asked Kasimatis about regular polygons.

All regular polygons which can be divided into an even number of triangles of equal area have an even number of sides. Such polygons are a subset of a class of polygons known as _convex centrally symmetric polygons_, any polygon which is unaffected by $180$ degree rotations about some point.

#definition[
  Let $P$ be a polygon, $P$ is _convex_ and _centrally symmetric_ if and only if $P$ is convex and there exists some point $p$ such that a $180$ degree rotation $P$ about $p$ results in a shape which is the exact same as $P$.
]

It is natural to ask the question: what about equidissections of convex centrally symmetric polygons? The same year as the publication of Kasimatis' paper on equidissections of regular polygons, Stein presented the conjecture that no centrally symmetric polygon has odd equidissection @stein_equidissections_1989. This result was proven to be true by Paul Monsky one year later.

#theorem[
  @monsky_conjecture_1990 No centrally symmetric polygon has odd equidissection.
]

Stein then retraced his steps back to Monsky's theorem, exploring an alternative pathway for expanding Monsky's theorem. He conjectured that Polyominos, or tilings of the square, do not have odd equidissection @stein_cutting_1999, and proved the result for polygons of odd area. This conjecture was proven in full by Iwan Praton.

Daniil Rudenko has proven this conjecture for a subset of balanced polygons which have vertices laying on the integer lattice.

#theorem[
  @praton_cutting_2002 Any tiling of the unit square cannot be divided into an odd number of triangles of equal area.
]

We will provide a proof of this theorem in the next chapter, as this proof is the basis for most all modern exploration of Stein's Conjecture.

The study of polyominos was seperated from previous explorations of polygons which only have even equidissections by the fact that they are potentially concave. Stein utilized this to present his present, open conjecture on the equidissection of balanced polygons by relaxing the requirements present in the class of centrally symmetric polygons which are not present in polyominos. These special properties of polyominos is that they are potentially concave, and that they are not necessarily symmetric about a central point. Instead of a symmetric property, that can be divided into pairs of edges which are parallel and of equal length.

The category of all balanced polygons is broad, so all attempts to prove Stein's conjecture have instead focused on subsets of this conjecture. The most comprehensive result proven so far is a result by Daniil Rudenko on balanced polygons whos vertices lay upon the integer lattice.

#definition[
  A polygon $P$ is considered a _lattice polygon_ if for every vertex $(x, y) in P$, both $x, y in ZZ$. The vertices of such a polygon all lay on the integer lattice $ZZ^2$.
]

#theorem[
  @rudenko_equidissection_2012 If $P$ is a balanced lattice polygon with odd integer area, then it cannot be divided into any odd number of triangles of equal area.
]

Notice that while Rudenko's is the most comprehensive, it does not cover all possible cases of two previous theorems presented in this chapter as it only considers balanced lattice polygons with odd area. As a result of this, Iwan Pratons theorem on polyominos, and Kasimatis's theorem on centrally symmetric polygons still stand as non-subsumed theorems.

== Polyominos

In the previous section we introduced Stein's conjecture on balanced polygons and a number of sub-theorems which prove this conjecture for a specific subset of balanced polygons. One such sub-theorem introduced was on polyominos, polygons made up of tilings of squares. In this section we will prove that theorem as promised. The theorem, originally shown by Iwan Praton, is that all polyominos contain no odd equidissections.

To begin, we will study the structure of a given polyomino. Recall that polyominos are tilings of squares, we will refer to each square in a polyomino as a _cell_.

#definition[
  Every polyomino $P$ is constructed of a tiling of squares, each square which $P$ is constructed from is a _cell_ of $P$.
]

#example[
  #figure(
    diagram(
      node-stroke: .1em,
      edge-stroke: .1em,
      cell-size: 0.1mm,
      node-shape: circle,
      edge((0, 5), (0, 0)),
      edge((4, 5), (0, 5)),
      edge((4, 4), (4, 5)),
      edge((4, 4), (1, 4)),
      edge((1, 4), (1, 0)),
      edge((1, 0), (0, 0)),

      edge((5, 5), (5, 0)),
      edge((9, 5), (5, 5)),
      edge((9, 4), (9, 5)),
      edge((9, 4), (6, 4)),
      edge((6, 4), (6, 0)),
      edge((6, 0), (5, 0)),
      edge((5, 4), (6, 4)),
      edge((5, 3), (6, 3)),
      edge((5, 2), (6, 2)),
      edge((5, 1), (6, 1)),
      edge((6, 5), (6, 4)),
      edge((7, 5), (7, 4)),
      edge((8, 5), (8, 4)),
    ),
    caption: [A polyomino and its component cells.],
  )
]

We will normalize the set of polyominos which we are studying, by only investigating polygons whos component cells are the unit square.

#proposition[
  Let $P$ be a polyomino, then there exists an area preserving affine transformation $A$ such that any cell of the polyomino $A(P)$ is a square of side length one whos vertices lie upon the integer lattice $ZZ^2$.
]

For convienience, we will assume our polyominos to lie upon the integer lattice and be constructed of unit squares. We will call such polyominos _lattice polyominos_.

#definition[
  A lattice polyomino is any polyomino who's vertices all lay on the integer lattice $ZZ^2$.
]

Notice then, that we can describe any such lattice polyomino by describing which squares on the integer lattice are included in such a polyomino. To facilitate this we will index cells on the _integer lattice_.

#definition[
  The $(i, j)$-th cell on the integer lattice is the square of length one with bottom left corner located at $(i, j)$.#margin-note[double check the coordinate system here]
]

Now, recall that if a polygon $P$ has a non-contractible boundary word relative to the $2$-adic coloring, then any dissection of $P$ contains a three-colored triangle relative to the $2$-adic coloring. This three-colored triangle must have an area which is inconsistent with an equidissection into an odd number of triangles. We will define a coloring on _cells_ of a polyomino based on a cells boundary word. Viewing the sum of the value of these boundary words allows us to show that a given polyomino has non-contractible $2$-adic boundary word, allowing us to prove our result.

We will first define the direction of an $A B$ edge on the boundary word. Recall from our earlier proof that a boundary word is contractible if and only if the number of $A B$ edges it contains is equal to the number of $B A$ edges it contains#margin-note[you need to revise your previous lemma.].

#definition[
  An $A B$ edge has a _counterclockwise_ orientation if it is colored $A$, then $B$ in a counterclockwise direction. If it is colored $A$, then $B$ in a clockwise direction it is oriented _clockwise_.
]

This will allow us to define the cell coloring function, which counts if a cell has an counter-clockwise $A B$ edge, a clockwise $A B$ edge, or no $A B$ edges.

#definition[
  We then define the cell valueing function $cal(C)$ from the set of cells on the integer lattice to the integers as follows: Assign the value $+1$ to a counterclockwise $A B$ edge and the value $-1$ to a clockwise $A B$ edge. Assing a value of $+1$ to a cell if the sum of the values of its $A B$ edges is $+1$, and $-1$ if it is $-1$ and $0$ if the sum is $0$.
]

Since the value of a cell counts the number of $A B$ edges with clockwise or counterclockwise orientation present in a given cell, we can utilize this to show that the value of the boundary word of a polyomino is equivalent to the sum of the values of its cells. Notice further that a boundary word is contractible if and only if its value is equal to $0$. This allows us to show that any polygon containing an inequal number of $+1$ and $-1$ cells has non-contractible boundary word.

#corollary[
  Suppose a given polyomino $P$ has a number of $+1$ valued cells which isn't equal to its number of $-1$ valued cells. Then, its $2$-adic boundary boundary word is non-contractible.
]<complete>

#proof[
  Recall that a boundary word is contractible if and only if the number of its clockwise oriented $A B$ edges is equal to its counterclockwise oriented $A B$ edges. Also notice that if there is an $A B$ edge on a cell which resides on the interior of the polyomino, then the adjoining cell contains a $B A$ edge. Then, if we take the sum of the values of each cell which makes up a polyomino, any edge lying on the interior of the polyomino does not contribute to this sum. So, the sum of the values of cells in a polyomino is equal to the number of counter-clockwise $A B$ edges minus the count of clockwise $A B$ edges, which is zero if and only if these two numbers are equal. Therefore $P$ has a non-contractible boundary word since boundary words are only contractible if the number of $A B$ and $B A$ edges are equal.
]

So, our goal is to show that $P$ has an unequal number of $+1$ valued and $-1$ valued cells. If $P$ has odd area, this is trivial. For polyominos of even area, we will have to apply an affine transformation onto $P$ to create an uneven number of $+1$ valued and $-1$ valued cells.

#definition[
  We will define the transformation function $f_(r, s): ZZ^2 -> QQ^2$ as $f_(r, s)(x, y) = ((x)/(2^r), (y)/(2^s))$. The transformed $p$-adic coloring of a polyomino $P$ for a given $r, s$ is the coloring $C_p (f_(r, s) (P))$.
]

#proposition[
  For any $r, s in ZZ$, $f_(r, s)$ is an affine transformation.
]

We will leave it up to the reader to verify that $f_(r, s)$ is an affine transformation by showing that $f_(r, s)$ for any $r, s in ZZ$ can be represented as an affine transformation.

Recall that under the $2$-adic coloring function $C_2$, a point on the integer lattice $ZZ^2$ is colored $A$ if and only if its $x$ and $y$ coordinates are divisible by $2$. This gives rise to the following lemma.

#lemma[
  Let $x, y in ZZ^2$, then $C_p(f_(r, s)(x, y)) = A$ if and only if $x equiv 0 mod 2^(r + 1)$ and $y equiv 2^(s + 1) mod 2$.
]

Since the pattern of $A$ colored points on the integer lattice $ZZ^2$ is dependent on the value of their points modulus a given value, this pattern is repetitive! This allows us to define the pattern which the $+1$ and $-1$ valued cells form under the transformed $p$-adic coloring for a given value of $r$ and $s$.

#proposition[
  A cell is colored $+1$ if and only if its bottom left or top right corner is colored $A$, a cell is colored $-1$ if and only if its bottom right or top left corner is colored $A$.
]

#lemma[
  The $+1$ valued cells in a given transformed polyomino $f_(r s ) (T)$ are at $(i, j)$ and $(i + 1, j + 1)$ where $i equiv 0 mod 2^(r + 1)$ and $j equiv 0 mod 2^(s + 1)$. The $-1$ valued cells are $(i + 1, j)$ and $(i, j + 1)$.
]<valuedcells>

#proof[
  Let $x, y in ZZ^2$ such that $x equiv 0 mod 2^(r + 1)$ and $y equiv 2^(s + 1) mod 2$ then the bottom left corner of the cell $(x, y)$ is colored $A$, and so it is assigned the value $+1$. Similarly, the cell $(x + 1, y + 1)$ is assigned the value $+1$, and the cells $(x + 1, y)$ and $(y + 1, x)$ are assigned the value $-1$.
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

    draw-cell((0, 0), "+1")
    draw-cell((1, 1), "+1")
    draw-cell((1, 0), "-1")
    draw-cell((0, 1), "-1")
    for cell in ((2, 0), (2, 1), (2, 2), (0, 2), (1, 2)) {
      draw-cell(cell, [$0$])
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
      draw-cell(cell, [$0$])
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


#example[
  For $r, s = 0$ the coloring of cells form a checkerboard pattern.
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

      draw-cell((0, 0), "+1")
      draw-cell((1, 1), "+1")
      draw-cell((1, 0), "-1")
      draw-cell((0, 1), "-1")

      draw-cell((2, 0), "+1")
      draw-cell((3, 1), "+1")
      draw-cell((3, 0), "-1")
      draw-cell((2, 1), "-1")

      draw-cell((2, 2), "+1")
      draw-cell((3, 3), "+1")
      draw-cell((3, 2), "-1")
      draw-cell((2, 3), "-1")

      draw-cell((0, 2), "+1")
      draw-cell((1, 3), "+1")
      draw-cell((1, 2), "-1")
      draw-cell((0, 3), "1")

      for x in range(0, 4) {
        draw-cell((x, -1), [#x], stroke: none)
        draw-cell((-1, x), [#x], stroke: none)
      }

      draw-cell((4, -1), [$dots.c$], stroke: none)
      draw-cell((-1, 4), [$dots.v$], stroke: none)
    }),
    caption: [The pattern of coloring for cells of $T$ for a given $r, s = 0$.],
  )
]


// We can utilize this pattern to show exactly when a cell is valued $+1$ or $-1$.

// #theorem[
//   A cell is valued $+1$ if and only if its lower right or upper left corner is colored $A$. Similarly a cell is valued $-1$ if and only if its upper right or lower left corner is colored $A$. All other cells are uncolored.
// ]

// #proof[
//   Let $C$ be a cell whos lower right corner is colored $A$, then $C$ is one of the following squares:

//   #align(center)[
//     #stack(
//       dir: ltr,
//       spacing: 1.5em,
//       diagram(
//         node-stroke: .1em,
//         edge-stroke: .1em,
//         cell-size: 15mm,
//         node-inset: 0.25em,
//         node-defocus: 0,
//         node((0, 0))[B],
//         node((0, 1))[A],
//         node((1, 0))[C],
//         node((1, 1))[C],
//         edge((0, 0), (0, 1)),
//         edge((0, 1), (1, 1)),
//         edge((1, 1), (1, 0)),
//         edge((1, 0), (0, 0)),
//       ),
//       diagram(
//         node-stroke: .1em,
//         edge-stroke: .1em,
//         cell-size: 15mm,
//         node-inset: 0.25em,
//         node-defocus: 0,
//         node((0, 0))[B],
//         node((0, 1))[A],
//         node((1, 0))[C],
//         node((1, 1))[C],
//         edge((0, 0), (0, 1)),
//         edge((0, 1), (1, 1)),
//         edge((1, 1), (1, 0)),
//         edge((1, 0), (0, 0)),
//       ),
//     )
//   ]
// ]

We will define an indicator function, which measures if a cell at a certain position is present in a given polyomino, this will allow us to represent the total value sum of a polyomino as a mathematic expression.

#definition[
  For a given polyomino $T$ we define the function $chi_(i, j)(T) = 1$ if cell $(i, j)$ is $T$, and $0$ if the cell is not present.
]

Then, we can measure directly the number of $+1$ valued cells in a polyomino, the number of $-1$ valued cells, and the total value of a polyomino.

#theorem[
  The sum of the values of each of a polyominos cells is equivalent to
  $
    sum_((i, j) in ZZ^2) chi_(i, j + 1) cal(C)(i, j).
  $
  Then, the number of $+1$ valued cells in the polyomino $T$ for any given $r$ and $s$ is
  $
    sum_(i equiv a(2^(r + 1))) sum_(j equiv b(2^(s + 1))) chi_(i, j) + chi_(i + 1, j + 1)(T).
  $
  Similarly, the number of $-1$ valued cells is
  $ sum_(i equiv a(2^(r + 1))) sum_.(j equiv b(2^(s + 1))) chi_(i, j + 1) + chi_(i + 1, j)(T). $.
  Which means, the sum of the values of each cell in a polyomino can also be expressed as
  $
    sum_(i equiv a(2^(r + 1))) sum_(j equiv b(2^(s + 1)))[chi_(i, j) + chi_(i + 1, j + 1)(T)] - sum_(i equiv a(2^(r + 1))) sum_(j equiv b(2^(s + 1))) [chi_(i, j) + chi_(i + 1, j + 1)(T)].
  $
]

#proof[
  Recall that in @valuedcells, we have shown that for a given $r, s in ZZ$,$cal(C) (C_2 (f_(r, s) (x, y))) = +1$ if and only if $(x, y) equiv (0, 0) mod (2^(r + 1), 2^(s + 1))$ or $(x, y) equiv (1, 1) mod (2^(R + 1), 2^(s + 1))$ and $cal(C) (C_2 (f_(r, s) (x, y))) = -1$ if and only if $(x, y) equiv (1, 0) mod (2^(r + 1), 2^(s + 1))$ or $(x, y) equiv (0, 1) mod (2^(R + 1), 2^(s + 1))$. Therefore, the number of $+1$ or $-1$ cells is simply the sum of $chi_(i, j)$ in all such possible locations of a $+1$ or $-1$ cell.
]

Now, we are looking for polyominos in which there exists some affine transformation of the form $f_(r, s)$ where the total value sum of a polyomino is unequal. We will do so by studying polyominos for which there are no $f_(r, s)$ transformations for a specific set of values of $r$ and $s$.

#definition[
  A polyomino $T$ is $m$-balanced if for every value of the positive integers $r$ and $s$ such that $r + s = m$ the count of $+1$ valued cells is equal to the count of $-1$ valued cells.
]

Notice that for a given value of $m$, and any $r, s in ZZ^+$ such that $r + s = m$, the pattern of valuing on cells repeats every $2^(m + 1)$. We will utilize this fact to represent polyominos as matricies, where a zero in a given cell of the matrix represents there is no cell present at this location in the polyomino, and a one represents there is a cell present at this location in the polyomino. Since the pattern of coloring repeats every $2^(m+1)$ cells, we can represent our polyomino in a matrix which is $2^(m+1)$ cells wide and tall. This represents instead how many cells there are in a polyomino whos coordinates fall upon a certain location in our value pattern.

#definition[
  The matrix C associated with a polyomino $T$ and an $m in ZZ$ is defined as $c_(i j) = sum_(i' equiv i mod 2^(m + 1)) sum_(j' equiv j mod 2^(m+1))#margin-note[you gotta come back and fix these summations] chi_(i' j')(T).$
]

#example[
  Suppose $T$ is the polyomino shown in @examplepolyomino
  #figure(
    diagram(
      cell-size: 15mm / 5,
      edge-stroke: .1em,
      edge((0, 0), (0, 5)),
      edge((0, 5), (1, 5)),
      edge((1, 5), (1, 4)),
      edge((1, 4), (2, 4)),
      edge((2, 4), (2, 2)),
      edge((2, 2), (1, 2)),
      edge((1, 2), (1, 1)),
      edge((1, 1), (3, 1)),
      edge((3, 1), (3, 3)),
      edge((3, 3), (4, 3)),
      edge((4, 3), (4, 0)),
      edge((4, 0), (0, 0)),
    ),
    caption: [The polyomino $T$ for the sake of our example],
  )<examplepolyomino>.
  Then, the corresponding matrix $C$ for $T$ with $m = 4$ is
  $
    mat(
      2, 1, 1, 1;
      1, 0, 0, 1;
      1, 1, 0, 1;
      1, 1, 0, 0;
    ).
  $
  For $m = 2$, the coresponding matrix to $T$ is:
  $ mat(
    4, 4;
    2, 2;
  ) $.
]

In other words, $c_(i j)$ counts how many times the $(i, j)$-th cell of a $m times m$ torus is covered when a polyomino $T$ is placed on its surface.

We will then define a function based on this matrix which counts the number of cells a given polyomino $P$ has which are present in a given position of the repetetive coloring pattern defined by a certain $r$ and $s$.

#definition[
  We define the function
  $
    Gamma^(r, s, a, b) (C) = sum_(i equiv a mod 2^(r + 1)\ 0 <= i < 2^(m + 1)) sum_(j equiv b mod b^(s + 1)\ 0 <= j < 2^(m + 1)) c_(i j).
  $
]

This allows us to easily count the number of $+1$ and $-1$ valued cells in a given polyomino.

#lemma[
  The number of $+1$ valued cells in a polyomino $T$ for a given $r, s$ is equal to $Gamma^(r, s)_(0, 0)(C) + Gamma^(r, s)_(1, 1)$. The number of $-1$ valued cells is equal to $Gamma^(r, s)_(1, 0)(C) + Gamma^(r, s)_(0, 1)$.
]

#proof[
  If the function $Gamma_(r, s,x, y) (C) = n$ then there exists a set of $n$ cells $X$ in our polyomino such that for any cell indexed $(i, j)$ is in $X$ if and only if it satisfies the condition $i equiv x mod 2^(r + 1)$ and $j equiv x mod 2^(s + 1)$. Then, recall that any $+1$ valued cell is indexed $(i, j)$ such that $i equiv 0 mod 2^(r + 1)$ and $j equiv 0 mod 2^(s + 1)$ or $i equiv 1 mod 2^(r + 1)$ and $1 equiv 0 mod 2^(s + 1)$. Therefore the number of $+1$ valued cells in a polyomino $T$ is provided by $Gamma^(r, s)_(0, 0)(C) + Gamma^(r, s)_(1, 1)$. By similar application of @valuedcells it follows that the number of $-1$ valued cells is equal to $Gamma^(r, s)_(1, 0)(C) + Gamma^(r, s)_(0, 1)$.
]

#proposition[
  $T$ is $m$-balanced if and only if $Gamma^(r, s)_(a, b)(C) + Gamma^(r, s)_(a + 1, b + 1) (C) = Gamma^(r, s)_(a + 1, b)(C) + Gamma^(r, s)_(a, b + 1)$ for all $r, s in ZZ^+$ such that $r + s = m$ and $a, b <= m$.
]<gammambalance>

Now, we will get to the meat of our proof technique. Given an $m$-balanced polyomino $P$, we can construct a smaller $m$-balanced polyomino by contracting the matrix associated with $P$.

#definition[
  Let $C$ be a $2^(m + 1) times 2^(m + 1)$ matrix. Then, we construct a $2^m times 2^m$ matrix $C'$ where
  $
    c'_(i, j) = cases(
      c_(2 i, j) + c_(2i, j + 2^m) "if" i "is even,",
      c_(2i - 1, j) + c_(2i - 1, j + 2^m) "otherwise."
    )
  $
]

#lemma[If $C$ is $m$-balanced, then $C'$ is $(m - 1)$-balanced. @praton_cutting_2002]
#proof[
  We proceed with our proof by showing that $C'$ provides the condition of @gammambalance. Let $r$ and $s$ such that $r + s = m - 1$. If $a$ is even then, $Gamma^(r, s)_(a, b)(C') = sum_(i equiv a mod 2^(r + 1)\ 0 <= i < 2^(m)) sum_(j equiv b mod b^(s)\ 0 <= j < 2^(m)) c'_(i, j) = c_(2a, b) + c_(2a, b + 2^m) = sum_(i equiv a mod 2^(r + 2)\ 0 <= i < 2^(m + 1)) sum_(j equiv b mod b^(s + 1)\ 0 <= j < 2^(m + 1)) c_(i, j) = Gamma^(r + 1, s)_(a, b) (C)$. A similar calculation shows this equivalency for the odd case. Then $Gamma^(r, s)_(a, b)(C') + Gamma^(r, s)_(a + 1, b + 1) (C') = Gamma^(r, s)_(a + 1, b)(C') + Gamma^(r, s)_(a, b + 1) (C')$ since $Gamma^(r + 1, s)_(a, b)(C) + Gamma^(r + 1, s)_(a + 1, b + 1) (C) = Gamma^(r + 1, s)_(a + 1, b)(C) + Gamma^(r + 1, s)_(a, b + 1) (C)$. Therefore $C'$ is $(m - 1)$-balanced.
]

As we continue with these contraction steps, we are eventually presented with a $2 times 2$ matrix. We will define a function $beta(C)$ for a matrix $C$ which takes in a matrix, and provides the corresponding contracted matrix.

#definition[
  Let $beta(C)$ be the $2 times 2$ matrix where
  $
    beta_(i j) = sum_(i' equiv i mod 2) sum_(j' equiv j mod 2) c_(i'j').
  $
]

#theorem[
  Let $C$ be an $m$-balanced matrix of size $2^(m + 1) times 2^(m + 1)$, then the sum of the entries of $beta_(C)$ is divisible by $2^(m+1)$.
]

#proof[
  #margin-note[This would do well with being rewritten using a $p$-adic argument instead of induction.]
  @praton_cutting_2002
  We will proceed via induction on the following three statements:
  + Every element of $beta(C)$ is divisible by $2^(m - 2)$,
  + Every row and column sum of $beta(C)$ is divisible by $2^(m-1)$,
  + and the sum of the entries in $beta(C)$ is divisible by $2^(m)$.

  First suppose $m = 0$, then every element of $beta(C)$ is divisible by $2^(-1)$, and each of its row sums and column sums are divisible by $2^0 = 1$. Now, $C$ is vacously $0$-balanced so $beta_(00) + beta_(11) = beta_(01) + beta_(10)$, which implies the sum of the entries in $beta(C)$ is divisible by $2$.

  Now, suppose for some $m - 1$ the three statements which we are performing induction upon hold true. Consider the matrix $alpha(C)$ defined by $alpha_(i j)(C) = sum_(i' equiv i mod 4) sum_(j' equiv j mod 2) c_(i j)$. Notice that the matrix $tilde(alpha) = mat(
    alpha_(0 1), alpha_(1 1);
    alpha_(0 0), alpha_(1 0);
  ) = beta(C')$. Since $C'$ is $(m - 1)$-balanced, by our previous assumption $beta(C') = tilde(alpha)$ satisfies the condition that the sum of its entries are divisible by $2^(m)$ and that both the sums $alpha_(0 0) + alpha_(1 1)$ and $alpha_(0 1) + alpha_(1 0)$ are divisible by $2^(m - 1)$. This implies that $alpha_(00) equiv alpha_(20) mod 2^(m - 1)$. Then $alpha_(00) + alpha_(20) = beta_(00)$ is divisible by $2^(m - 1)$ since each of these are divisible by $2^(m-2)$. We can use a similar argument to show that the rest of the elements of $beta(C)$ are divisible by $2^(m-1)$. Thus, we have shown that the first statement holds true for $m$. Now, notice that by our supposition, the sum of each column of $alpha(C)$ is divisible by $2^(m - 1)$ and that the sum of any two adjacent columns is divisible by $2^m$. Notice that $beta_(00) + beta_(01) = alpha_(00) + alpha_(20) + alpha_(01) + alpha_(21)$. Then the sum of the first column of $beta(C)$ is divisible by $2^m$. Via a similar argument we can establish divisibility by $2^m$ for the rest of the rows and colums of $beta(C)$. This implies $beta_(00) + beta_(01) equiv 0$ or $2^m$ $mod 2^(m + 1)$, and similarly for the sum $beta_(10) + beta_(11)$. Recall that $C$ is balanced, so $beta_(00) + beta_(11) = beta_(01) + beta_(10)$. So, $beta_(00) + beta_(01) = beta_(10) + beta_(11)$. Suppose $beta_(00) + beta_(01) + beta_(10) + beta_(11)$ is not divisible by $2^(m + 1)$. Then $beta_(00) + beta_(01) equiv.not beta_(10) + beta_(11) mod 2^(m + 1)$. WLOG assume $beta_(00) + beta_(01) equiv 0 mod 2^(m + 1)$. Then $beta_(00) + beta_(11) equiv 2^(m - 1) mod 2^m$. Then $beta_(11) equiv 2^(m - 1) - beta_(00)$. Also, $beta_(01) equiv - beta_(00) mod 2^m$. Then $beta_(01) + beta_(11) equiv 2^(m - 1) mod 2^m$ which is a contradiction of the fact that all of the row and colum sums of $beta(C)$ are divisible by $2^m$. Then $beta_(00) + beta_(01) + beta_(10) + beta_(11)$ is divisible by $2^(m + 1)$ and our result follows via induction.
]

We can now prove the final theorem, by tracing these contraction steps in reverse to show that any matrix representing a polyomino cannot be $m$-balanced, showing that there must exist some $r$ and $s$ such that the number of $+1$ squares is inequal to the number of $-1$ squares, providing non-contractibility of the boundary word, allowing us to prove our theorem.

#theorem[
  There is no equidissection of any polyomino with an odd number of triangles.
]

#proof[
  Let $T$ be a polyomino with area $A$ where $2*(A) = m$. Then, if $T$ is $m$-balanced, so would $C(T)$. This would imply the sum of all entries in $C(T)$, equal to A, is divisible by $2^(m + 1)$. However, this would contradict the $2$-adic valuation of $A$ being equal to $m$. So, $T$ is not $m$-balanced. Then there exists some $r, s$ with $r + s = m$ such that there are an uneven number of black and white squares allowing us to apply @complete to show there exists an complete triangle $t$ in any odd dissection of $T$.#margin-note[why does a complete triangle preclude an odd equidissection?] Therefore, any odd dissection of $T$ is not an equidissection.
]

== Equidissections of Odd Area Balanced Lattice Polygons

So far in this chapter we have introduced Stein's conjecture on the equidissection of balanced polygons and explored theorems which provide subsets of this conjecture. In the previous section we provided a proof of the subset of this conjecture concerning polyominos. The rest of this chapter is concerned with Daniil Rudenko's proof that there exists no even equidissection of any odd area balanced lattice polygon.

In @even-odd we will introduce a $4$-coloring on lattice polygons which we will call the "even-odd" coloring. We will then introduce a different way of viewing the boundary word as a formal sum in @boundarysumsum. This perspective on the boundary word will introduce many insights into the even-odd coloring and its relation to our standard $p$-adic $3$-coloring. We will utilize these insights to draw an equivalence between the area of a balanced lattice polygon, and the boundary sum it contains, allowing us to prove the final theorem of this chapter in @area.

== The Even-Odd Coloring<even-odd>

In this section we will construct a 4-coloring on lattice polygons known as the _even-odd_ coloring which we will relate to the $p$-adic three coloring on polygons.

If a set of vertices lay on the integer lattice we can directly measure their parity instead of measuring an abstraction of their parity via the $p$-adic metric. We will define the _even-odd mapping_ as a mapping which measures the parity of a integer plane vertex.

#definition[
  We will define the even-odd mapping $overline(star): ZZ^2 -> {(0, 0), (0, 1), (1, 0), (1, 1)}$ for every $(x, y) in ZZ^2$ as $overline(star)(x, y) = (0, 0)$ if $x equiv 0 mod 2$ and $y equiv 0 mod 2$, $overline(star) (x, y) = (1, 0)$ if $x equiv 1 mod 2$ and $y equiv 0 mod 2$, and so on.
]

Notice that such a mapping naturally defines a $4$-coloring on integer vertices.

#definition[
  The even-odd coloring function $C^4: ZZ^2 -> {alpha, beta, gamma, delta}$ is defined as follows: For $(x, y) in ZZ^2$, the vertex $(x, y)$ is colored $alpha$ if $overline(star)(x, y) = (0, 0)$, $beta$ if $overline(star)(x, y) = (1, 0)$, $gamma$ if $overline(star)(x, y) = (1, 1)$, and $delta$ if $overline(star)(x, y) = (0, 1)$.
]

To disambiguate this coloring from the $p$-adic coloring we have been working with, moving forward we will call the boundary word resulting from the even-odd coloring function the _even-odd boundary word_ and the boundary word resulting from the $p$-adic valuation the _$p$-adic boundary word_.  As we will find, these two colorings are intimately related. If a vertex has a certain even-odd coloring, then it has a certain $p$-adic coloring.

#proposition[
  Let $(x, y) in ZZ^2$. Then,
  + $C_2(x, y) = A$ if $C^4(x, y) = gamma$,
  + $C_2(x, y) = B$ if $C^4(x, y) = delta$,
  + and $C_2(x, y) = C$ if $C^4(x, y) = alpha, beta$.
]

This property gives an equivalence to the $2$-adic coloring of the even-odd mapping of a integer valued vertex, and the $2$-adic coloring of that vertex. This property allows us to compare the even-odd coloring of a vertex and the $p$-adic coloring of a vertex to produce contradiction, we will utilize this to produce our proof of Stein's Conjecture.

#theorem[
  For $(x, y) in ZZ^2$, $C_2 (overline(star)(x, y)) = C_2 (x, y)$.
]

#proof[
  Let $(x, y) in ZZ^2$, then if $overline(star)(x, y) = (0, 0)$, $C_2 (x, y) = A = C_2 (0, 0)$ since $2* (x), 2* (y) >= 0$. The other three cases follow in similar fashion, and will be left up to the reader to verify.
]

== The Boundary Sum<boundarysumsum>

//edits to make: make Omega(P) Omega_C(P) A B C D -> alpha beta gamma delta, sigma_1 sigma_2 sigma_3

In the previous section we defined a $4$-coloring over the set of points on an integer lattice. This $4$-coloring allows us to find a different boundary word of lattice polygons which contains $4$-colors known as the even-odd boundary word. We have previously shown that the condition for contractibility on a $3$-colored boundary word follows from the equality of the number of $A B$ edges and $B A$ edges. However, we have not yet provided a condition for contractibility of $4$ character cyclic words. To provide such a condition we must first define an algebraic view of the boundary word. To define an algebraic view of the boundary word, we must first introduce some more exact vocabulary regarding the boundary word.

The first definition relates to when a cyclic word cannot be contracted any further.

#definition[
  Let $W$ be a cyclic word. A _contracting sequence_ on $W$ is a sequence of contracting steps on $W$ resulting in a cyclic word $W'$. A _complete contracting sequence_ is a sequence of contracting steps on $W$ resulting in a cyclic word $W'$ which cannot have any further contracting steps performed on it. A _contracted cyclic word_ is any cyclic word which cannot have any further contracted steps performed on it.
]

This allows us to define a theorem which shows that the contractibility game contains no strategy whatsoever. That is, a cyclic word is non-contractible if any contracting sequence on a cyclic word finds a dead end.

#theorem[
  Let $W$ be a cyclic word. $W$ is non-contractible if and only if any complete contracting sequence on $W$ results in a non-empty cyclic word.
]

We can now proceed to our algebraic view of the boundary word. Such a view of the boundary word will be provided as a structure called a formal sum.

#definition[
  A formal sum is a sum over a set of elements of a set $X$.
]

#example[
  For a set $X = {A, B, C, D}$, a formal sum over $X$ could be $A + B + B + C + D$. As a convention, if we have multiple of the same element in a formal sum we can add a coefficient to that element to represent the number of that element, for example $A + B + B + C + D = A + 2B + C + D$.
]

#definition[
  The boundary sum of a polygon $P$ relative to a coloring function $C$ with colors $Q$ is the sum $Omega(P) = sum_(X in Q) sum_(Y in Q) mu_(X, Y) X Y$ where $mu_(X, Y)$ is the count of edges on the boundary of $P$ colored $X, Y$.
]

We can define a group over the set of all such boundary sums.

#definition[
  The contraction group is the group over all boundary sums of any polygon $P$ relative to a coloring function $C$ with colors $Q$. Notice that since these sets represent a cyclic word they must represent a cycle. That is, for $X, Y in Q$ if a formal sum $S$ contains an $X Y$ edge, then it must contain an edge starting with $Y$. First, we will name the identity element $0$. For a given $X, Y$ in $Q$ we define $X Y = -Y X$ and $X X = 0$. Notice that since formal sums are sums, we can take two formal sums belonging to the contraction group $W and W'$ and we achieve the sum $W + W'$ by substituting in the corresponding formal sums for both $W$ and $W'$.
]

#example[
  Consider two polygons, $P$ and $P'$ with edge words $W = A B C D$ and $W' = C B D C$. Then, $Omega(P) = A B + B C + C D + D A$ and $Omega(P') = C B + B D + D C + C C$. Then, $Omega(P) + Omega(P') = A B + B C + C D + D A + C B + B D + D C + C C = A B + B C + C D - A D - B C + B D - C D + 0 = A B - A D + B D$.
]

// #theorem[
//   Let $P$ be a polygon with a dissection $T$ such that for all $t in T$, $t$ is not three-colored relative to the $p$-adic coloring function. Then the $p$-adic boundary word of $T$ is contractible.
// ]

Each four colored boundary sum can be factored into the sum of multiples of three triangles, or, in algebraic terms, the contracting group is generated by three triangles.

#theorem[
  Let $W$ be a cyclic word over the set ${A, B, C, D}$. Then, there exists a $mu_1, mu_2, mu_3 in ZZ$ such that $omega(W) = mu_1 (A B + B C + C A) + mu_2 (A C + C D + C A) + mu_3 (B D + D C + C B)$.
]

The proof of this theorem follows from the fact that our group is representative of the set of cycles over the connected graph with four vertices $K_4$.
#figure(
  diagram(
    node-stroke: .1em,
    edge-stroke: .1em,
    cell-size: 30mm,
    node-shape: circle,
    edge((0, 0), (0, 1)),
    edge((0, 1), (1, 1)),
    edge((1, 1), (1, 0)),
    edge((1, 0), (0, 0)),
    edge((0, 0), (1, 1)),
    edge((1, 0), (0, 1)),
  ),
  caption: [The connected graph with 4 vertices, known as $K_4$.],
)
The minimum number of $3$ cycles which cover a given graph $G$ is equivalent to the number of edges in $G$ minus the number of edges in a spanning tree of $G$.#margin-note[Citation needed.]
#figure(
  diagram(
    node-stroke: .1em,
    edge-stroke: .1em,
    cell-size: 30mm,
    node-shape: circle,
    edge((0, 0), (0, 1)),
    edge((0, 1), (1, 1)),
    edge((1, 0), (0, 1)),
  ),
  caption: [A spanning tree of $K_4$.],
)
Any spanning tree of $K_4$ has $3$ edges, $K_4$ has $6$ edges, so the minimum number of triangles which cover $K_4$ is $3$.
#figure(
  diagram(
    node-stroke: .1em,
    edge-stroke: .1em,
    cell-size: 30mm,
    node-shape: circle,
    edge((0, 0), (0, 1)),
    edge((0, 1), (1, 1)),
    edge((1, 1), (1, 0), "--"),
    edge((1, 0), (0, 0), "--"),
    edge((0, 0), (1, 1), "--"),
    edge((1, 0), (0, 1)),
  ),
  caption: [A spanning tree of $K_4$, with its removed edges highlighted. Notice how each removed edge defines a unique triangle, and the set of each triangle contains every edge on $K_4$.],
)

Since each of these triangles contain a unique edge which neither of the other triangles contain, the only way for a boundary sum to be equal to the identity of the contracting group is for it to contain none of these three triangles. This gives rise to the following theorem.

#theorem[
  Let $P$ be a polygon with a coloring function $C$ over the set ${A, B, C, D}$ such that $Omega_C(W) = mu_1 (A B + B C + C A) + mu_2 (A C + C D + C A) + mu_3 (B D + D C + C B)$ for $mu_1, mu_2, mu_3 in ZZ$. Then, $Omega(W) = 0$ if and only if $mu_1 = mu_2 = mu_3 = 0$.
]

The proof of this theorem can be provided by verifying that there is no way to represent any of these three cycles $sigma_1, sigma_2, sigma_3$ as a multiple of the other two.

So far we have considered $4$-colored boundary sums, however we can also consider $3$-colored boundary sums.

#theorem[
  Let $P$ be a polygon such that $Omega_C_p (P) != 0$. Then there exists an affine transformation with nonzero determinant $A$ such that the boundary word $W$ of $A(P)$ is non-contractible.
]<lemma2>

#proof[
  Suppose for the sake of contradiction there exists a polygon $P$ with boundary word such that $Omega_C_p (P) != 0$ and the boundary word $W$ of $A(P)$ for every affine transformation with nonzero determinant is contractible. Let $A$ be an affine transformation with non-zero determinant, then any dissection of $A(P)$ contains no three colored triangle. Notice $Omega C_p (A(P)) = sum_(t in T) Omega_C_p (t)$ for a given dissection $T$ of $A(P)$. Also notice that any triangle which is not three colored is either colored $A B A$, $A B B$, $A C C$, $A C A$ $C B B$ or $B C B$. For each of these triangles $omega_C_p(A(P)) = 0$. Then $Omega_C_p (A(P)) = sum_(t in T) Omega_C_p (t) = 0$. Our result follows by contradiction in the case that $A$ is the identity transformation. #margin-note[verify]
]

#example[
  #todo
]

#definition[
  We will define the function $pi^A: {0, 1}^2 -> Omega_C_2$ as $pi^A (x, y) = C_2 (A(x, y))$ for a given affine transformation with non-zero determinant where $Omega_C^4$ is the set of all boundary sums generated by the even-odd coloring function and $Omega_C_2$ is the set of all boundary sums generated by the $2$-adic coloring function.
]

#theorem[
  Let $(x, y) in ZZ^2$ and $A$ be an affine transformation with nonzero determinant, then $pi^A(overline((x, y))) = pi^A(x, y)$.
]

#proof[
  First, let $(x, y) in ZZ^2$. If $E$ is the identity transformation, $pi^E (x, y) = A$ if and only if $(x, y) equiv (0, 0) mod 2$, and similarly $pi^E (x, y) = B$ if and only if $(x, y) equiv (0, 0) mod 2$, $pi^(E) (x, y) = C$ if $(x, y) equiv (1, 0)$ or $(1, 1) mod 2$. Then $pi^E (x, y) = pi^E overline((x, y))$ if $E$ is the identity matrix. Now notice that for any affine transformation $Alpha$ on the integer lattice $Alpha(x, y) equiv Alpha overline((x, y)) mod 2$. Therefore, $pi^Alpha overline((x, y)) = pi^E (Alpha overline((x, y))) = pi^E (Alpha (x, y)) = pi^(Alpha) (x, y)$.
]

#theorem[
  Let $P$ be a lattice polygon with $Omega_C_2 (P) = 0$, then $Omega_C^4 (P) = 0$.
]

#proof[
  Consider the following area preserving affine transformations:
  $
    E &= (x, y) -> (x, y) \
    U &= (x, y) -> (x + y, y) \
    V &= (x, y) -> (y + 1, x)
  $

  Now, suppose there does not exist an affine transformation with nonzero determinant $A$ such that the $2$-adic boundary word $W$ of $A(P)$ is non-contractible. Recall we can write $Omega_C^4 (W) = mu_1 (alpha beta + beta gamma + gamma alpha) + mu_2 (alpha gamma + gamma delta + gamma alpha) + mu_3 (beta delta + delta gamma + delta beta)$ for $mu_1, mu_2, mu_3 in ZZ$. Now $0 = Omega_C_2 (W) = pi^E(Omega_C_2 (W)) = pi^E (mu_1 (alpha beta + beta gamma + gamma alpha) + mu_2 (alpha gamma + gamma delta + gamma alpha) + mu_3 (beta delta + delta gamma + delta beta)) = pi^E (mu_1 (alpha beta + beta gamma + gamma alpha)) + pi^E (mu_2 (alpha gamma + gamma delta + gamma alpha)) + pi^E (mu_3 (beta delta + delta gamma + delta beta)) = mu_1 pi^E(alpha beta + beta gamma + gamma alpha) + mu_2 pi^E(alpha gamma + gamma delta + gamma alpha) + mu_3 pi^E(beta delta + delta gamma + delta beta) = mu_1 (A B + B C + C A) + mu_2 (A C C C + C A) + mu_3 (C B + C C + B C) = mu_1 (A B + B C + C A) + mu_2 (0) + mu_3 (0) = mu_1 (A B + B C + C A)$. Then $mu_1 = 0$. Repeating this process for $U$ and $V$ shows that $mu_2$ and $mu_3$ are similarly zero, allowing us to show $Omega_C^4 = 0$.
]

#corollary[
  Let $P$ be a lattice polygon such that $Omega_C^4(P) != 0$. Then, there exists an area preserving affine transformation $A$ such that the $p$-adic boundary word $W$ of $A(P)$ is non contractible.
]

#proof[
  If $Omega_C^4 (P) != 0$, then $Omega_C_2 (P) != 0$ by reverse application of our previous theorem. Our result follows by @lemma2.
]

== The Area of a Balanced Polygon<area>
In the previous section we introduced the concept of the boundary sum, and used it to show that a lattice polygon with non-contractible even-odd boundary word has a non-contractible $p$-adic boundary word. In this section we will utilize this theorem to show that a balanced lattice polygon with odd area has a non-contrcatible $p$-adic boundary word, thus proving our result.

Recall that in the first section we showed that any balanced polygon $P$ is made up of a set of possibly overlapping parallelograms whos union is equal to $P$. Taking the sum of these parallelograms would give us an upper bound on the area of $P$, we will use this upper bound to show that the

#lemma[
  Let $P$ be a lattice parallelogram. The even-odd boundary word of $P$ is contractible if and only if the area of $P$ is even.
]

#proof[
  Every parallelogram is made up of two identical triangles. So, we can let $P$ be any parallelogram generated by the integer valued vertices $(x_1, y_1), (x_2, y_2)$ and $(x_3, y_3)$ without losing generality. Then,
  $
    "Area" P = mat(
      delim: bar,
      1, 1, 1;
      x_1, x_2, x_3;
      y_1, y_2, y_3;
    ).
  $
  Our boundary word is contractible if any of our two vertices are equivalent modulus two. Notice also, that if any of our vertices are equivalent modulus two, then the the set of vectors $(1, x_1, y_1), (1, x_2, y_2),$ and $(1, x_3, y_3)$ are linearly dependent modulus two. Then,
  $ "Area" P = mat(
    delim: bar,
    1, 1, 1;
    x_1, x_2, x_3;
    y_1, y_2, y_3;
  ) equiv 0 mod 2. $ This is due to the fact that the determinant of a linearly dependent matrix is always zero. Therefore the area of $P$ is even if and only if the even-odd boundary word of $P$ is contractible.
]<parallelogram>

Notice that we have shown a stronger statement in our proof of this theorem, that the vertices of a parallelogram must be linearly independent modulus $2$. This gives rise to the following corollary.

#corollary[
  Let $P$ be a lattice parallelogram which has odd area, then $P$ is four-colored relative to the even-odd coloring function.
]
#proof[
  If $P$ is a lattice parallelogram with odd area then its boundary word is non-contractible, so for any three vertices $(x_1, y_1), (x_2, y_2),$ and $(x_3, y_3)$,
  $
    "Area" P = mat(
      delim: bar,
      1, 1, 1;
      x_1, x_2, x_3;
      y_1, y_2, y_3;
    ) equiv.not 0.
  $
  As shown in the previous proof, this matrix must not be linearly dependent mod two, so each of these three vertices must not be equivalent mod two. Therefore $P$ is four under the even-odd coloring function since no pair of its vertices can be equivalent mod two.
]

#lemma[
  Let $P$ be a balanced lattice polygon with boundary word $W$ and $cal(P)$, a decomposition of $P$ into parallelograms. Then, $Omega(W) = sum_(((p) in cal(P))) Omega(bar(p p')) = mu_1 (A B C D) + mu_2 (A C B D) + mu_3 (A D C B)$ for some $mu_1, mu_2, mu_3 in ZZ$.
]

We are now able to prove our final theorem.

#lemma[
  Let $P$ be a balanced lattice polygon with even-odd boundary word $omega$. Then, there exist a $mu_1, mu_2, mu_3$ such that $omega = mu_1(sigma_2 + sigma_3) + mu_2(sigma_4 + sigma_1) + mu_3(sigma_1 + sigma_2)$, and $"Area" P equiv mu_1 + mu_2 + mu_3 mod 2$.
]<lemma5>

#proof[
  Let $P$ be a balanced lattice polygon with boundary word $W$. To prove this statement we will consider our balanced polygon to be defined by a series of points $P = P_1 + P_2 + dots + P_n$. Without loss of generality we can consider the point $P_0$ to be $(0, 0)$. We can represent each point of our balanced polygon as a sum of side vectors $P_i = overline(P_1 P_2) + overline(P_2 P_3) + ... + overline(P_(i -1) P_i)$ where $overline(P_i P_(i + 1)) = (P_(i + 1) - P_i)$. We can define an action of the group $S_n$ on $P$ by defining each $P_i = overline(P_sigma^-1(1) P_(sigma^-1(1) + 1)) + overline(P_sigma^-1(2) P_(sigma-1(2) + 1)) + ... + overline(P_sigma^-1(i - 1) P_(sigma^-1(i - 1) + 1))$. Notice that the group $S_n$, which is the set of all permutations, acts by permuting the side vectors of our balanced polygon $P$. Now, we can represent the group $S_n$ as a product of tranpositions. Let $tau_i$ be a transition $(i, i + 1)$, and $p_i$ be the parallelogram formed by $overline(P_(i + 1) P_(i + 2))$ and $overline(P_i P_(i + 1))$. Then $
  "Area" tau_j(P) = "Area" P  - mat(
    delim: bar,
    overline(P_(i + 1) P_(i + 2))_x, overline(P_(i) P_(i + 1))_x;
    overline(P_(i + 1) P_(i + 2))_y, overline(P_(i) P_(i + 1))_y;
  )
  $
  since the tranposition $tau_i$ either adds the parallelogram $p_i$ to $tau_i(P)$ or removes the parellelogram $p_i$ from $tau_i(P)$ depending on the orientation of the boundary p_i. Also, let the boundary sum of $tau_j(P)$ be $Omega$. Then, $Omega = W - phi_i$ where $phi_i$ is the boundary word of $p_i$. If $phi_i != 0$, then $phi_i = sigma_2 + sigma_3, sigma_4 + sigma_1,$ or $sigma_1 + sigma_2$ and the area of $p$ is odd. Otherwise, the area of $p$ is even and $phi_i = 0$.

  Now, consider the permutation $sigma in S_n$ of the side vectors of $P$ in which after every odd indexed side vector, the side vector following it is the side vector which is parallel, congruent, and of opposite orientation to it. It is clear that $sigma (S_n)$ has zero area and boundary sum. Then, $omega = mu_1(sigma_2 + sigma_3) + mu_2(sigma_4 + sigma_1) + mu_3(sigma_1 + sigma_2)$ where $mu_1 + mu_2 + mu_3$ is  equal to the number of transpositions $tau_i$ which make up $sigma$ where $p_i$ has odd area. Notice also that the area of $P$ is made up of all such triangles $p_i$ so $"Area" P equiv mu_1 + mu_2 + mu_3 mod 2$.
]

#example[
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

      let edgep(pos0, pos1, stroke: 2pt) = {
        line(pos0, pos1, stroke: (thickness: stroke, dash: "dashed"))
      }

      let edge(pos0, vec, stroke: 1pt) = {
        line(
          pos0,
          (pos0.at(0) + vec.at(0), pos0.at(1) + vec.at(1)),
          stroke: stroke,
        )
      }

      for x in range(0, 10) { for y in range(0, 10) { draw-cell((x, y), "") } }

      edgep((6, 2), (7, 4))
      edgep((7, 4), (6, 6))
      edgep((6, 6), (3, 8))
      edgep((3, 8), (2, 6))
      edgep((2, 6), (3, 4))
      edgep((3, 4), (6, 2))

      edge((6, 2), (1, 2))
      edge((6, 2), (-3, 2))
      edge((7, 4), (-3, 2))
      edge((4, 6), (-1, 2))
      edge((3, 4), (-1, 2))
      edge((2, 6), (1, 2))
    }),
    caption: [$L$ with the action of $sigma = (23)$ on $L$ overlaid ontop of it.],
  )
]

#example[
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

      let edge(pos0, vec, stroke: 1pt) = {
        line(
          pos0,
          (pos0.at(0) + vec.at(0), pos0.at(1) + vec.at(1)),
          stroke: stroke,
        )
      }

      for x in range(0, 10) {
        for y in range(0, 10) {
          draw-cell((x, y), "")
        }
      }

      edge((6, 2), (1, 2))
      edge((6, 2), (-3, 2))
      edge((7, 4), (-3, 2))
      edge((4, 6), (-1, 2))
      edge((3, 4), (-1, 2))
      edge((2, 6), (1, 2))
    }),
    caption: [Our balanced lattice polygon],
  )

  Our broken line is $L = (6, 2) (7, 4) (4, 6) (3, 8) (2, 6) (3, 4)$

  Let $sigma = (12)(456)$

  Then
  $
    M_1 & = (6, 2) \
    M_2 & = (6, 2) + v_(sigma^(-1)(1)) \
        & = (6, 2) + v_(2) \
        & = (6, 2) + overline(L_2 L_3) \
        & = (6, 2) + (L_3 - L_2) \
        & = (6, 2) + ((4, 6) - (7, 4)) \
        & = (6, 2) + (-3, 2) \
        & = (3, 4) \
  $$
    M_3 & = M_2 + v_(sigma^(-1)(2)) \
        & = M_2 + v_1 \
        & = (3, 4) + overline(L_1 L_2) \
        & = (3, 4) + (L_2 - L_1) \
        & = (3, 4) + ((7, 4) - (6, 2)) \
        & = (3, 4) + (1, 2) \
        & = (4, 6) \
  $$
    M_4 & = M_3 + v_(sigma^(-1)(3)) \
        & = M_3 + v_3 \
        & = M_3 + overline(L_3 L_4) \
        & = M_3 + (L_4 - L_3) \
        & = (4, 6) + ((3, 8) - (4, 6)) \
        & = (4, 6) + (-1, 2) \
        & = (3, 8) \
  $$
    M_5 & = M_4 + v_(sigma^(-1)(4))) \
        & = M_4 + v_6 \
        & = M_4 + overline(L_6 L_1) \
        & = M_4 + (L_1 - L_6) \
        & = (3, 8) + ((6, 2) - (3, 4)) \
        & = (3, 8) + ((3, -2)) \
        & = (6, 6) \
  $$
    M_6 & = M_5 + v_(sigma^(-1)(5)) \
        & = M_5 + v_4 \
        & = M_5 + overline(L_4 L_5) \
        & = M_5 + (L_5 - L_4) \
        & = M_5 + ((2, 6) - (3, 8)) \
        & = (6, 6) + (-1, -2) \
        & = (5, 4) \
  $
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

      let edge(pos0, pos1, stroke: 1pt) = { line(pos0, pos1, stroke: stroke) }

      for x in range(0, 10) { for y in range(0, 10) { draw-cell((x, y), "") } }

      edge((6, 2), (3, 4))
      edge((3, 4), (4, 6))
      edge((4, 6), (3, 8))
      edge((3, 8), (6, 6))
      edge((6, 6), (5, 4))
      edge((5, 4), (6, 2))
    }),
    caption: [The action of $sigma$ on $L$.],
  )

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

      let edgep(pos0, pos1, stroke: 2pt) = {
        line(pos0, pos1, stroke: (thickness: stroke, dash: "dashed"))
      }

      let edge(pos0, vec, stroke: 1pt) = {
        line(
          pos0,
          (pos0.at(0) + vec.at(0), pos0.at(1) + vec.at(1)),
          stroke: stroke,
        )
      }

      for x in range(0, 10) { for y in range(0, 10) { draw-cell((x, y), "") } }

      edgep((6, 2), (3, 4))
      edgep((3, 4), (4, 6))
      edgep((4, 6), (3, 8))
      edgep((3, 8), (6, 6))
      edgep((6, 6), (5, 4))
      edgep((5, 4), (6, 2))

      edge((6, 2), (1, 2))
      edge((6, 2), (-3, 2))
      edge((7, 4), (-3, 2))
      edge((4, 6), (-1, 2))
      edge((3, 4), (-1, 2))
      edge((2, 6), (1, 2))
    }),
    caption: [$L$ with the action of $sigma$ on $L$ overlaid ontop of it.],
  )
]

#theorem[
  There exists no odd equidissection of a balanced lattice polygon $P$ with odd area.
]

#proof[
  Suppose $P$ is a balanced polygon with odd area, then $W = mu_1(sigma_2 + sigma_3) + mu_2(sigma_4 + sigma_1) + mu_3(sigma_1 + sigma_2)$ where $mu_1 + mu_2 + mu_3$ are odd due to @lemma5. Then there exists an affine transformation with non-zero determinant $A$ such that the boundary word $W$ relative to $C_2$ of $A(P)$ is non-contractible.  Let $T$ be a dissection of $A(P)$ with $n$ triangles such that $n$ is odd. Then there exists a triangle $t$ in $T$ such that $2*("Area" P) <= -1$. Therefore $T$ is not a equidissection since $2*("Area" P) <= -1 < 0 = 0 - 0 = 2*("Area" A) - 2*(n) = 2*(("Area" A(P))/n)$.
]

= Future Research Pathways<apply>

== Limitations of Rudenko's Approach

Rudenko's Approach, while greatly powerful is limited in two ways, we will dedicate a section of this chapter to each of these limitations, and their potential solutions.

The first limitation of Rudenko's approach to Stein's Conjecture is that it only applies to balanced lattice polygons with odd area, if we are able to remove the odd area restriction, we can extend a proof of Stein's Conjecture to all polygons with rational vertices, or polygons which otherwise lay on a lattice which can be carried to the integer lattice while scaling the area of all polygons equally.

The second limitation is that Rudenko's Approach only applies to polygons which lay on the integer lattice or can be carried to the integer lattice. If we found a technique which removed this limitation we are able to prove Stein's Conjecture in the general case.

== "Lifting" the even-odd mapping

Rudenko's Approach hinges on a modulus $2$ equivalency between the area of a integer area balanced lattice polygon and the number of cycles present in that polygons even-odd boundary word to show that odd area balanced lattice polygons cannot be divided into any odd number of triangles of equal area. If we can draw a modulus $2^n$ equivalency, we can show that any balanced lattice polygon whos area is not a multiple of $2^n$ cannot be divided into any odd number of triangles of equal area. If we showed this for every $n$ we would prove the result for all balanced polygons which lay on the rational lattice.

One avenue to show such a result is instead of considering a mod $2$ even odd mapping over lattice polygons, we can consider a mod $2^n$ mapping over lattice polygons. We will refer to such a mod $2^n$ map as the $star_n$ map.

#definition[
  The map $star_n$ maps lattice polygons to cyclic words over $2^n$ characters.
]

The set of all cyclic words over $2^n$ characters can be visualized as a graph over $2^n$ vertices

#example[
  #todo
]

However, we run into the issue that the generators of the group of cyclic graphs over $2^n$ vertices grows quite quickly. As earlier shown, for the case of $n = 1$ there are $3$ generators for such a graph.

#proposition[
  The contraction group for $star_n$ is generated by a set of $k(k - 1)/2 - (k - 1)$ where $k = 2 dot 2^n$ #margin-note[verify] sequences of 3 edges.
]

This means the number of generators for each set grows incredibly quickly, providing a headache for any actual attempts of this approach.

== 4 Colorings of the Plane

Rudenko's approach predates the introduction of Jamie Pommersheim and Aaron Abrams Non-Abelian Sperner's Lemma. This version of Sperner's Lemma allows us to find complete triangles in $n$-colored divisions of polygons into triangles with non contractible boundary words, rather than just $3$-colorings. In the previous section we modernized Rudenko's approach such as to utilize the language of Jamie Pommersheim and Aaron Abrams. This modernization makes it more clear that Rudenko is constructing a $4$-coloring over balanced lattice polygons, and then using such a $4$-coloring to make statements regarding our standard $3$-coloring, ultimately using Sperner's Lemma on that $3$-coloring to prove the theorem. This begs the question, what if we cut out the $3$-coloring and directly apply our fancy new version of Sperner's Lemma to a $4$-coloring of the plane? However, this technique runs into a problem quickly, it is not evidently clear if there is a $4$-coloring of the plane $C^4_p$ which satisfy the following two properties necessary for a general proof of Stein's Conjecture:

1. Under $C^4_p$ all dissections of balanced polygons into an odd number of triangles have non-contractible boundary word, or can by carried by area preserving affine transformation to a polygon which has a non-contractible boundary word.
2. Also, under $C^4_p$ all $3$ colored triangles have area which precludes an odd equidissection.

It is not immediately clear how to satisfy the first property, however, the second property is one which we can easily write down as a series of inequalities which must be satisifed

#proposition[
  Let $C^4: RR^2 -> {A, B, C, D}$ be a $4$-coloring of the plane. $C^4$ satisfies the property that all $3$-colored triangles have an area which precludes an odd equidissection if and only if the following condition is satisfied:

  // For any $alpha, beta, gamma in {A, B, C, D}$ and all triangles $T$ with vertices $(x_alpha, y_alpha), (x_beta, y_beta), (x_gamma, y_gamma) in RR^2$ such that $C^4(x_alpha, y_alpha) = alpha, C^4(x_beta, y_beta) = beta$, and $C^4(x_gamma, y_gamma) = gamma$ if there exists an $r in ZZ union RR without QQ, s in ZZ$ such that
  // $
  // "Area" T = mat(
  //   delim: bar,
  //   1, 1, 1;
  //   x_alpha, x_beta, x_gamma;
  //   y_alpha, x_beta, x_gamma;
  // ) = r/s,
  // $ then $s$ is odd.

  // This is provided by the following condition:#margin-note[verify in the irrational case?]

  For any $alpha, beta, gamma in {A, B, C, D}$ and all triangles $T$ with vertices $(x_alpha, y_alpha), (x_beta, y_beta), (x_gamma, y_gamma) in RR^2$ such that $C^4(x_alpha, y_alpha) = alpha,$  $C^4(x_beta, y_beta) = beta$, and $C^4(x_gamma, y_gamma) = gamma$,
  $
    2*( 1/2 mat(
        delim: bar,
        1, 1, 1;
        x_alpha, x_beta, x_gamma;
        y_alpha, y_beta, y_gamma;
      )) < 0.
  $
]

We can simplify this statement by providing the following third property, similar to our construction of the 3-coloring $C_p$.

3. Let $(x, y)$, and $(x_A, y_A)$ where $C^4_p (x_A, y_A) = A$. Then $C^4_p (x, y) = C^4_p (x - x_A, y - y_A)$.

We can apply this property to our previous property to provide the following proposition:

#proposition[
  Let $C^4: RR^2 -> {A, B, C, D}$ be a $4$-coloring of the plane. $C^4$ satisfies the property that all $3$-colored triangles have an area which precludes an odd equidissection if the following condition is satisfied:

  // For any $alpha, beta, gamma in {A, B, C, D}$ and all triangles $T$ with vertices $(x_alpha, y_alpha), (x_beta, y_beta), (x_gamma, y_gamma) in RR^2$ such that $C^4(x_alpha, y_alpha) = alpha, C^4(x_beta, y_beta) = beta$, and $C^4(x_gamma, y_gamma) = gamma$ if there exists an $r in ZZ union RR without QQ, s in ZZ$ such that
  // $
  // "Area" T = mat(
  //   delim: bar,
  //   1, 1, 1;
  //   x_alpha, x_beta, x_gamma;
  //   y_alpha, x_beta, x_gamma;
  // ) = r/s,
  // $ then $s$ is odd.

  // This is provided by the following condition:#margin-note[verify in the irrational case?]

  Let $(x_A, y_A) in RR^2$ such that $C^4_p (x_A, y_A) = A$ and so on.
  Then,
  $
    2*( 1/2 mat(
        delim: bar,
        1, 1, 1;
        0, x_B, x_C;
        0, y_B, y_C;
      )) < 0,
  $
  $
    2*( 1/2 mat(
        delim: bar,
        1, 1, 1;
        0, x_B, x_D;
        0, y_B, y_D;
      )) < 0,
  $
  $
    2*( 1/2 mat(
        delim: bar,
        1, 1, 1;
        0, x_C, x_D;
        0, y_C, y_D;
      )) < 0,
  $
  and, $ 2*( 1/2 mat(
      delim: bar,
      1, 1, 1;
      x_B, x_C, x_D;
      y_B, y_C, y_D;
    )) < 0. $

  This is condition is provided if we define our coloring such that for all $(x_A, y_A) in RR^2$ such that $C^4_p (x_A, y_A) = A$ and so on:

  $
    2*(x_B) + 2*(y_C) != 2*(y_B) + 2*(x_C),
  $
  $
    2*(x_B) + 2*(y_D) != 2*(y_B) + 2*(x_D),
  $
  $
    2*(x_C) + 2*(y_D) != 2*(y_C) + 2*(x_D),
  $
  and, $ 2*(mat(
      delim: bar,
      1, 1, 1;
      x_B, x_C, x_D;
      y_B, y_C, y_D;
    )) < -1. $.
]

As of the time of writing this, such a coloring has not been found, or shown to exist.

It is important to note that while the prospects of providing the second condition for such a $4$-coloring to be useful are hopeful, yet still unproven, things are much less hopeful for a $4$ coloring which provides the first condition.

In our proof of Monsky's theorem an instrumental theorem is that any point of a line is colored by either of the endpoints of this line relative to $C_p$ the $p$-adic $3$-coloring function. However, it has been shown that it is impossible to retain this property for a four coloring@hales_projective_1982. However, not all hope is lost, as we do not care about the particular property relating to colors of points along lines, we only care that any dissection of a polygon which does not have contractible boundary word relative to $C_4$ also does not have contractible boundary word. This is something which is possible, yet difficult to provide without this property.

// = Generalizing our Proof of Monsky's Theorem<generalize>

// Jamie Pommersheim and Aaron Abram's Non-Abelian Sperner's Lemma does not strictly apply to three colorings. If the boundary word of a triangulation $G$ is non-contractible for some $n$-coloring, then $G$ contains a three colored triangle. We can create an expanded condition for when an equidissection is not possible if we can create some $4$-coloring with the property that, for any three colored triangle $t$, $p*("Area" t) != 0$. This would provide a path to generalizing Monsky's Theorem.

// However, we run into a few problems with this approach which we will address in each subsection of this chapter. The first issue is that we do not have a clear notion of what non-contractibility looks like for a $4$-coloring. For a $3$-coloring non-contractibility is achieved if there are an odd number of $A B$ pairs in the boundary word. This is not true for $4$-colorings. The second issue is that it is not possible to maintain our lemma that points along any line segment are colored by their endpoints in a four colouring. There must always exist a line which has at least three colors on it under any $4$-coloring. This creates an issue as we rely on this lemma to show that any triangulation of a polygon with a non-contractible boundary word has a non-contractible boundary word. The final issue we run into is that it is not immediately clear what such a coloring would look like.

// == Boundary Word Contractibility and Algebraic Topology

// In the previous chapter, we have shown for $3$ colors the non-contractibility of a cyclic word $W$ is equivalent to $W$ containing an odd number of complete pairs. This is not necessarily true for a $4$ coloring.

// #example[
//   The cyclic word $A B A D C$ is non contractible despite having an even number of complete pairs.
// ]<contractexample>

// To further study the contractibility of cyclic words we must state the following lemma.

// #lemma[
//   Let $W$ be a cyclic word, and let $W prime$ be the result of performing a contracting step on $W$. Then $W$ is contractible if and only if $W'$ is contractible.
// ] <contractibleiff>

// As such, if we contract $W$ until we can no longer perform contracting steps, and our result $W'$ is a non-empty word, then $W$ is non-contractible.

// We can use this to prove the statement in @contractexample

// #example[
//   We start with $A B A D C$. We begin contracting, resulting in $A A D C$. Finally we perform our last contraction step resulting in $A D C$. We can no longer contract the word, so it is non-contractible by @contractibleiff.
// ]

// However, it is still unclear what a condition for non-contractibility of 4-colored cyclic words might be. The astute reader might, by now have noticed that the problem of boundary word contractibility is similar to the word problem on free groups#margin-note[elaborate on this]. We can create an alternative view of the boundary word which represents the boundary as a series of edges instead of vertices to make this connection more clear.

// #definition[
//   The _edge word_ of a boundary word is the sequence of edges represented by the boundary word.
// ]

// #example[
//   The edge word corresponding to the cyclic word $A B A D C$ is $A B star B A star A D star D C star C A$.
// ]

// If we define $star$ to be an operator, we can view edge words as members of a group.

// #definition[
//   Define $star$ as a binary operator on the set of edges and an identity element $1$ with $A A = B B = C C = D D = 1$, $A B = (B A)^(-1), C D = (D C)^(-1)$ and so on.
// ]

// Notice that contracting a cyclic word is equivalent to collapsing an $A B star B A$ pair on the edge word. We can formalize this as follows:

// #theorem[
//   Let $W$ be a cyclic word. Let $E$ be the corresponding edge word to $W$ and $E', W'$ be the result of performing a contracting step on $W$. Then $E = E'$.
// ]

// #corollary[
//    Let $W$ be a cyclic word with corresponding edge word $E$. Then $E = 1$ if and only if $W$ is contractible.
// ]

// #theorem[
//   Let $W$ be a cyclic word, with corresponding edge word $E$. Let $n$ be the number of $X Y$ pairs in $E$ where $X, Y in {A, B, C, D}$ and $n'$ be the number of $Y X$ pairs in $E$. If $n != n'$ then $E != 1$ and therefore $W$ is non-contractible.
// ]

// #proposition[
//   Let $W$ be a cyclic word such that $W$ contains an odd number of $X Y$ pairs where $X, Y in {A, B, C, D}$ #margin-note[you need to be more careful with ordered vs unordered pairs here.]. Then $W$ is non-contractible.
// ]

// == Four Coloring the Plane<4color>

// Our goal is to construct a 4-coloring over the plane where any given 3 colored triangle $t$ satisfies the property that $p*("Area" t) != p*(0)$.

// #proposition[
//   For any $4$-coloring function $C_p^4$ over the real plane $RR^2$ to satisfy the property $p*("Area" t) != p*(0)$ for all 3 colored triangles $t$, the function $C_p^4$ must satisfy the following property for all triangles colored $U V W in {A B C, A C D, A B D, B C D}$. Let $(x_U, y_U)$ be colored $U$, $(x_V, y_V)$ be colored $V$ and so on. Then it must be true that $p*(1/2) + p*(x_U y_V + x_V y_W + x_W y_U - x_V y_U x_W y_V x_U y_W) != 0$ which is true if and only if $p*(x_U y_V + x_V y_W + x_W y_U - x_V y_U - x_W y_V - x_U y_W) != -p*(1/2)$.
// ]

// This looks daunting, but there is a much easier way to express colorings under the $p$-adic valuation. Let $p*(x) = x_p$ and $p*(y) = y_p$. We can now define the required properties of our coloring over the space of all $(x_p, y_p) in ZZ^2$.

// There are $binom(4, 3) = 4$ three colored triangles under any potential four coloring. For us to show that $p*("Area" t) != 0$ for any given three colored triangle $t$ vertices $(x_A, y_A), (x_B, y_B), (x_C, y_C)$ we must satisfy the following conditions.

// + For a given vertex colored $v_X$ and a given vertice colored $v_A$ we want $C_p (v_X - v_A) = X$. This allows us to greatly simplify the area formula for the three of our three colored triangles which contain the color $A$.
// + For a given vertex colored $v_X$ where $X in {B, C}$ and a given vertice colored $v_D$ we want $C_p (v_X - v_D) = X$ and $C_p (u_D - v_D) = A$.
// + All three colored triangles which contain $A$ and two other colors $U, V$ must satisfy the following condition:
//   $
//   p*(x_U y_V - x_V y_U) != 0
//   $
//   In total that means we want
//   $
//   p*(x_B y_C - x_C y_B) != 0,\
//   p*(x_B y_D - x_D y_B) != 0,\
//   "and" p*(x_C y_A - x_A y_C) != 0\
//   $

// #proposition[
//   The following coloring satisfies these properties:
//   Let $x, y in RR$, $x_p = p*(x), y_p = p*(y)$.
//   Define $C_p^4$ as follows:
//   + $C_p^4(x, y) = A$ if $x_p >= 0, y_p >= 0$ and $x_p = 0 => x_p != y_p$,
//   + $C_p^4(x, y) = B$ if $x_p > y_p$ and $y_p < 0$,
//   + $C_p^4(x, y) = C$ if $x_p <= y_p$ and $x_p < 0$,
//   + $C_p^4(x, y) = D$ if $x_p = y_p = 0$.
// ]

// #proposition[
//   $
//     2*(x) = 0 "and" 2*(y) = 0 => 2*(x - y) > 0.
//   $
// ]
// #proof[
//     $2*(x) = 0 => exists r/s in QQ$ s.t. $2 divides.not r, s$ and $x = r/s$, and there exists a $y = u/v$ with the same properties. Then, $r/s - u/v = (r v - u s)/(s v)$. $2 divides.not r, s$ so $2 divides.not s, v$. $r v equiv.not 0 mod 2$ and $u s equiv.not 0 mod 2$ so $2 divides.not r v, u s$. Therefore $r v equiv u s equiv 1 mod p$, so $r v - u s equiv 0 mod p$. Therefore $p*(x - y) = p*(r/s - u/v) = p*((r v - u s)/(s v)) = p*(r v - u s) - p*(s v) = p*(r v - u s) > 0$. #margin-note[You have to check the specifics of the construction over the reals to make sure this holds for transcendental/irrational numbers... it might not].
// ]

// #proof[
//   + $A - A = A$: $p*(x_A - u_A) >= min(p*(x_A), p*(u_A)) >= 0$. The same holds for $p*(y_A - v_A)$.
//     $B - A = B$: $p*(y_B - y_A) = p*(y_B) < min(p*(x_B), p*(x_A)) <= p*(x_B - x_A)$.
//     $C - A = C$: $p*(x_C - x_A) = p*(x_C) <= min(p*(y_C), p*(y_A)) <= p*(y_C - y_A)$.
//     $D - A = D$: $p*(x_D - x_A) = p*(x_D) = 0$. The same holds for $p*(y_D - y_A)$.
//   + $B - D = B$: $p*(y_B - y_D) = p*(y_B) < min(p*(x_B), p*(x_D)) <= p*(x_B - x_D)$.
//     $C - D = C$: $p*(x_C - x_D) = p*(x_C) <= min(p*(y_C), p*(y_D)) <= p*(y_C - y_D)$.
//     $D - D = A:$ $p*(u_D - x_D) > 0$, and same for $p*(v_D - y_D)$.
//   +
//     $
//       p*(x_B y_C) = p*(x_B) + p*(y_C) > p*(y_B) + p*(x_C) = p*(x_C y_B).
//     $
//     $
//       p*(x_B y_D) = p*(x_B) + p*(y_D) > p*(y_B) + p*(x_D) = p*(x_D y_B).
//     $
//     $
//       p*(x_C y_A) = p*(x_C) + p*(y_A)
//     $
// ]



// #definition[
//   We define our $4$-colouring function of the plane $C_p^4(x, y)$ as follows. Let $x_p = p*(x)$ and $y_p = p*(y)$. Then,
//   + $C_p^4(x, y) = A$ if $x_p > 0$ and $y_p > 0$,
//   + $C_p^4(x, y) = B_1$ if $x_p <= 0$ and $y_p > x_p$,
//   + $C_p^4(x, y) = B_2$ if $y_p <= 0$ and $x_p = y_p$,
//   + and $C_p^n(x, y) = C$ if $y_p <= 0$ and $x_p > y_p$.
// ]

// #theorem[
//   For $x, y in RR$:
//   + $C_p^4(x, y) = A => C_p^3(x, y) = A$,
//   + $C_p^4(x, y) = B_1$ or $C_p^4(x, y) = B_2 => C_p^3(x, y) = A$,
//   + and $C_p^4(x, y) = C => C_p^3(x, y) = 3$.
// ]

// #proof[
//   #todo
// ]

// #theorem[
//   For $x, y, u, v in RR$ where $C_p^4(x, y) = A$ and $C_p^4(u, v) = X$:
//   + $X = A$ or $X = C => C_p^4(u - x, v - y) = C_p^4(x, y)$,
//   + $X = B_1 => C_p^4(u - x, v - y) = B_1$,
//   + and $X = B_2 => C_p^4(u - x, v - y) = B_2$.
// ]<translate4>

// #proof[
//   #todo
// ]

// #corollary[
//   If $t$ is a triangled colored $A B_1 C$, or $A B_2 C$ relative to $C_p^4$, then $T$ is colored $A B C$ relative to $C_p^3$ and as a result $p*("Area of" t) <= 1/2$.
// ]<complete4>

// #theorem[
//   If $t$ is colored $A B_1 B_2$ then $p*("Area of" t) < 1/2$.
// ]<AB1B2>

// #proof[
//   If $t$ is colored $A B_1 B_2$ we can translate our triangle by $-A$ to give us a triangle with $0, 0$ coordinates which is colored $A B_1 B_2$ by @translate4. Since this maintains genarality, we can assume $t$ the $A$ colored vertex of $t$ is $(0, 0)$. Then our triangle has vertices $(0, 0), (x_B_1, y_B_1)$, and $(x_B_2, y_B_2)$. Therefore the area of our triangle is $1/2(x_B_1 y_B_2 - x_B_2 y_B_1)$. So $p*("Area of" t) = p*(1/2 [x_B_1 y_B_2 - x_B_2 y_B_1]) = p*(1/2) + p*(x_B_1 y_B_2 - x_B_2 y_B_1) = p*(1/2) + min{p*(x_B_1 y_B_2), p*(x_B_2 y_B_1))} = p*(x_B_1 y_B_2) + p*(1/2)$ since $p*(x_B_1 y_B_2) = p*(x_B_1) + p*(y_B_2) < p*(y_B_1) + p*(x_B_2)$ by the properties of our coloring. Therefore $p*("Area of" t) = p*(1/2) + p*(x_B_1 y_B_2) = p*(1/2) + p*(x_B_1) + p*(y_B_2) <= p*(1/2)$ since $p*(x_B_1), p*(y_B_2) <= 0$.
// ]

// #conjecture[
//   If $t$ is colored $C B_1 B_2$ then $p*("Area of" t) <= p*(1/2)$.
// ]<CB1B2>

// #proof[

// ]

// #proposition[
//   If $t$ is a three colored triangle relative to $C_p^4$, then $p*("Area of" t) <= p*(1/2)$.
// ]

// #proof[
//   Suppose $t$ is a three colored triangle relative to $C_p^4$. If $t$ is colored $A B_1 C$ or $A B_2 C$, then $p*("Area of" t) <= p*(1/2)$ by @complete4. Otherwise, $t$ is colored $A B_1 B_2$ or $C B_1 B_2$ relative to $C_p^4$. Therefore $p*("Area of" t) <= p*(1/2)$ by @AB1B2 or @CB1B2.
// ]

// = In Search of Steins Conjecture.<apply>

// == Lattice Polygons

// In @rudenko_equidissection_2012, Rudenko studies a subset of Stein's Conjecture for polygons whos vertices lay on an integer grid.

// #definition[
//   A _lattice polygon_ is a polygon whos vertices are integer-valued.
// ]

// Rudenko proves the result of Stein's Conjecture for balanced lattice polygons with odd area, if we can prove it for balanced lattice polygons with any integer area, we can prove it for all balanced polygons with rational valued vertices. So, how to remove this odd area restriction?

// Rudenko's proof strategy relies on mapping these lattice polygons onto the square via a basic modulus $2$ mapping, and then studying the $C_2$ colorings of these mappings. However, what if instead of studying the $C_2$ colorings of these mappings, we directly color our polygons via a $4$-coloring which is equivalent to a mod $2$ mapping over the integers, and then study this coloring in the context of lattice polygons?

// It is no coincidence that the coloring we defined in @4color satisfies this requirement.

// = Previous Research

// == Research

// + #cite(<rudenko_equidissection_2012>, form:"prose") proves Stein's conjecture for lattice polygons with odd integer area where every polygon can be divided into pairs of congruent parallel edges. Such a polygon is called an odd balanced lattice polygon. The proof hinges around viewing odd balanced lattice polygons as one dimensional simlicial complexes. Rudenko shows that the area of such a polygon $P$ is equivalent $mod 2$ to the sum of the coefficients of a linear combination of a basis of the $h_1$ group over $K_4$ representing the boundary of $p$ after a $mod 2$ mapping. They then utilize the $p$-adic valuation with the standard coloring to find a contradiction when $p$ is dissected into an odd number of triangles of equal area. I attempt to investigate mappings which are of $mod p^n$ to $K_(2^(n + 1))$. More specifically: \

//   Define the map $overline(star)_n$ from $cal(L)$, a two dimensional lattice in $RR^2$ to $K_(2^(n + 1))$ a simplicial complex with vertices labelled by $ZZ_(2^n) times ZZ_(2^n)$ and edges connecting each of its vertices as follows
//   $
//   overline(star)_n: (x_A, x_B) -> bar((x_A, x_B)) = (x_A mod 2^n, x_B mod 2^n).
//   $

//   Let $L$ be a broken line with integer vertices. Then,
//   $
//   H_1(L, ZZ) arrow H_1(K_2^(n + 1), ZZ) tilde.equiv ZZ^(n(n - 1)/2 - n + 1)
//   $
// + #cite(<abrams_integer_2024>, form:"prose") applies a four colouring approach to show that lattice polygons which have contractible boundary word have a dissection into triangles of integer area. Notably balanced polygons have contractible boundary word. This colouring utilizes parity instead of the $p$-adic valuation, but adapting this colouring to use the $p$-adic valuation would create a pathway to proving steins conjecture for all rational valued balanced polygons, since they can be carried to balanced lattice polygons, and potentially further to prove the full result of steins conjecture.

