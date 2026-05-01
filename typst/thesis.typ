#import "@local/reed-thesis-template:1.0.2": thesis
#import "@preview/muchpdf:0.1.0": muchpdf
#import "@preview/ctheorems:1.1.3": *
#import "@preview/cetz:0.4.2"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "@preview/quick-maths:0.2.1": shorthands
#import "@preview/meander:0.4.2"

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

#let proofsketch = thmproof(
  "theorem",
  "Proof Idea",
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
    Equidissected and Equidissect-didn't: The Oddities of Dividing Polygons into Triangles of Equal Area.
  ],
  author: "Lily Larsen",
  advisor: "Marcus Robinson",
  department: "(Mathematics)",
  division: "Mathematics and Natural Sciences",
  cited: read("cited.bib"),
  acknowledgements: [
    Marcus Robinson -- Thank you for sharing your passion for combinatorics, geometry and algebra. Your combinatorics class showed me a side of mathematics which I had never seen before, sending me on a one and a half year long spiral leading to (but certainly not ending with) this document. I would often find myself in utter awe at the mathematics presented in that class. Rare was a dull moment and often was a humorous one in your class. Your criticism and encouragement as my advisor for this thesis helped me to coax out the stories present in this document, and helped to guide me from feeling utterly lost with a blank page infront of me to somehow having the document I have today.

    Jamie Pommersheim -- Without your knowledge of when to show patience and when to show belief that I can do better I would have very likely dropped out. The grace and understanding during a difficult time in which nobody else was willing to provide such recognition of my human nature made all of the difference for me. Thank you for showing me that somebody who is loudly and unapolagetically eccentric has a place in academic mathematics. You are a gift to academic culture.

    Hannibal Grubis -- I hope you get a chance to read the copy of this thesis which I am sending to you. My love for mathematics grew in your high school class, and I can see now that you were preparing me in many ways for the deep education which you encouraged me to seek out by attending Reed.

    June Duvivier -- Thank you for all of the tutoring, encouragement, advice, and friendship. I would not have passed vector calculus without your weekly tutoring. You are a brilliant mathematician and I have no doubt that in 20 years I will be bragging that I knew you before you were a big deal.

    Miguel Esteve -- Thank you for all of the comradery and deep conversation. I will never forget laughing my ass off with you in Naito, then Scholz, then the RCAs at various stages of the middle of the night. From taking 112, then 113 with you. I have always felt the solidarity of being alongside you in challenge, and continuing to work through it. You are never afraid to challenge my views of the world, and then help me to find them again.

    Rain Tronoski -- Thank you for all of your love and support this year. I have never felt like I needed to earn the love which you have given me, and I am amazed every day at the thoughtfulness which you extend to me. I am so thankful to have you by my side through this major transition of my life. PS: thank you for making the pun of my title infinitely better.

    All those from Reed College's fire spinning club Weapons of Mass Distraction -- Thank you for welcoming me in, and making me feel at home when I felt so far from home. Of special note are those graduating alongside me: Lav, Apollo, Ryn, Noah, Rives, Nat, Patrick, and Ella.
  ],
  dedication: [
    As I write this people are being starved, shot and tortured in Palestine and torture prisons in Israel. Children, mothers and fathers are subject to unspeakable violence on our dime! We are providing Israel with the missiles they need to create utter destruction in Lebanon. A bit over two weeks ago, from the time of writing this, we were bombing school buildings and hospitals in Iran for no discernable reason. Before that, we were bombing Venezuela. Under our blockades and embargos the people of Cuba have little electricity. Surgeons often have to operate under cell phone flashlight while nurses manually operate ventilators. Americans (yes, they are American) sleep in cages on metal or concrete beds often with no toilets under 24/7 light in what are ostensibly concentration camps. Americans are being shot in the street while the whole world watches! It is staggering, the human rights reports I have read describe unspeakable things which haunt me at night.

    What are we doing? Why am I doing math right now? Why are we still engaging in this? Why are we accepting an institution which profits off of unspeakable misery? Go outside your office and you will see people starving, overdosing, with no roofs over their head. We have no money for them, only money for torturing and killing. We cause utter devastation and blame them for it. I can't believe I'm writing a thesis right now. What are we going to do about this?

    This thesis is dedicated to the strangest dream I have ever had. A faraway dream which I could not fully reach in my waking state in which the people of the world gathered in one resounding cry: Let the fighting end so we can rebuild! This thesis is dedicated to the dream of a world in which I feel I have a future putting things back together brick by brick, a world which I believe is best served by my pursuit of mathematics.
  ],
  introduction: [
    Take out a piece of paper and draw many squares. Play around with divisions of these squares into triangles. Now, attempt to divide a square into an odd number of triangles which all share the same area. You will find that such a task is very difficult, and wonder if it is impossible. At the same time, you will find that it is very easy to divide the square into any even number of triangles of equal area. We will show that it is indeed impossible to divide the square into an odd number of triangles of equal area, and proceed to apply this question to other polygons. What about parallelograms, or polyominoes, gluings of the square across congruent edges? What about polygons which hold symmetry across any line passing through a center point? As we ask these questions we begin to desire a unification of these questions into one ultimate question: What is the set of shapes which cannot be divided into an odd number of triangles of equal area? This thesis is primarly concerned with this question, which is one of the prime questions of the mathematical niche known as _equidissection_, the study of divisions of shapes into triangles of equal area.

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

    The $p$-adic methodology utilized by Monsky was quickly adapted to various generalizations of the problem. Some examples of such generalizations are into $n$-dimensions, explored in a paper by #cite(<thomas_dissection_1968>, form: "prose"), or the proof by #cite(<kasimatis_dissections_1989>, form: "prose") that divisions of the regular polygon into triangles of equal area have a multiple of $n$ triangles, with the exception of the triangle and the square.

    Immediately following the results presented by #cite(<kasimatis_dissections_1989>, form: "prose") Stein suggested the results for even $n$ suggest no centrally symmetric polygon has an division into an odd number of triangles of equal area #cite(<stein_equidissections_1989>). This was later proven by #cite(<monsky_conjecture_1990>, form: "prose"). Stein further conjectured that there is no odd division of triangles of equal area for polyominos and shows the conjecture holds true for polyominos with an odd number of triangles@stein_cutting_1999. #cite(<praton_cutting_2002>, form: "prose") proves this conjecture in the general case. Stein then combines the two previous conjectures in #cite(<stein_cutting_2004>, form: "prose") to suggest that no polygon which can be divided into pairs of congruent parallel lines can be divided into an odd number of triangles of equal area. This conjecture has been shown for squares @monsky_dividing_1970, centrally symmetric polygons @kasimatis_dissections_1989, polyominos @praton_cutting_2002, and lattice polygons @rudenko_equidissection_2012, all of which are such polygons. The general case remains open.

    == Contents of the Thesis

    We will begin this text by providing a novel perspective on the proof of Monsky's Theorem in @monsky utilizing Aaron Abrams and Jamie Pommersheim's Non-Abelian Sperner's Lemma, and a more motivated construction of the $p$-adic coloring function typically used in such a proof. We will then present current research into Stein's Conjecture, showing that both polyominos and balanced lattice polygons with odd area have no division into an odd number of triangles of equal area in @generalize. Finally, we will present suggestions for further direction of research into Stein's Conjecture in @apply.
  ],
  abstract: [
    In this text we will provide a novel exposition of the proof of Monsky's Theorem in @monsky which provides a constraint based construction of the $p$-adic coloring function used in such a proof, as well as utilizing Jamie Pommersheim and Aaron Abram's Non Abelian Sperner's Lemma to provide a more storied exposition of the theorem. In @generalize we will explore Stein's Conjecture that no balanced polygon has odd equidissection. We will prove two subsets of this conjecture, that no polyomino has odd equidissection, and that no balanced lattice polygon of odd area has odd equidissection. We will finish in @apply with reccomendations for potential future research into the topic.
  ],
)

// Rain notes
// Tone within proofs good, really likes remarks on figures, first remark comes off as elementary school math book. Remark comes off as talking-down. First half went well - defining the word combinatorial. Colon before definitions/theorems? Not enough commas, especially when providing context. An example is page twelve about maintaining parity. Comma splices are happening all over. Page 14 "three colored from the square" is an example. Often happens on however, there are a lot of howevers. The math went as slow as it needed to for an english major to understand it. Lost clarity at the sentence level but not at the mathematical level. Spellchecking. Figures are very good. The story was very clear, very clear goal, very motivated, could tell where things were going overall. Good job of ordering things. However faked out on page 11 why no p-adic valuation. In introduction really liked the information about the exam. Would love a date for when Stein comes in in the second page. Understands generally what the paper is about. Wants more elaboration on the general case of the problem, didn't know that steins conjecture involved squares instead of polygons. Could calculate the p-adic valuation, but couldn't find boundary word on their own, but does know the steps to do so. Could summarize paper. After reading this paper is able to connect terminology and concepts to prior math education. Honors AP/IB math in highschool. Examples/visualization made math lingo accessible. Challenges conception that higher math is "difficult", and that vocabulary is the main difficulty. Rephrasings of sentences in non mathematical language is very helpful. Having fun, sense of proudness for understanding it, encourages reader to step up to challenge. Resolving sentence level edits will make it much more accessible. Could potentially be inspiring to someone that math could be for them. Staircase of difficulty, one or two steps towards the end that are bigger than the others. Make sure sentences are clear. Good amount of examples in first half. Summarize carried example in Monsky's Theorem chapter which serves as summary of entire chapter. Paragraph at the end talking about the attempts to solve steins conjecture. Add but the general case remains open?

= A Proof of Monsky's Theorem<monsky>

In the introduction, a brief history of Stein's Conjecture was presented. This history gave the origins of Stein's Conjecture in Monsky's Theorem. The proof of this theorem provides a convenient yet sufficiently complex problem for the introduction of many lemmas which are relevant to Stein's Conjecture.

#theorem([Monsky])[@monsky_dividing_1970
  There exists a division of the square into $n$ triangles of equal area if and only if $n$ is odd.
]

Monsky's Theorem has been extensively written about. What value can another exposition of Monsky's Theorem bring? Despite the large amount of very well written literature on Monsky's Theorem, it is often difficult for the reader to piece together the story of the theorem. This is due to the fact that Monsky's Theorem makes heavy use of a function known as the $p$-adic valuation, which will be introduced in @p-adic. The $p$-adic valuation is most often employed in the fields of number theory and analysis, and it is difficult to understand the role which it plays in the proof of such a theorem, which is seemingly geometric. Even if the reader is thoroughly convinced by the logic of the argument presented, they may still find themselves asking the question: why is the $p$-adic valuation necessary for the proof of Monsky's Theorem? This question has plagued the study of Monsky's Theorem, with a proof of Monsky's Theorem which does not utilize the $p$-adic valuation thought to be a lesser holy grail to some mathematicians. We do not claim to put such a search for a proof of Monsky's Theorem without the involvement of the $p$-adic valuation to rest, although, it seems nearly 50 years of asking this question with no results to show for it has done that for us. However, we do hope to provide a exposition of Monsky's Theorem which leaves the reader convinced that the inclusion of the $p$-adic valuation in such a proof is the result of a process of asking and answering well motivated questions.

Another unclear piece in many presentations of the proof of Monsky's Theorem is the application of Sperner's Lemma. There are many wonderful visual proofs of Sperner's Lemma. However, in each of these visual proofs, the connection between the interior and the boundary of a polygon is not properly explored. This chapter presents a new perspective on the proof of Monsky's Theorem utilizing Aaron Abram and Jamie Pommersheim's Non-Abelian Sperner's Lemma. This perspective turns the proof of Sperner's Lemma into a game on arbitrary divisions of the square into an odd number of triangles which always ends in the reader discovering a triangle which precludes a division into triangles of equal area. As the reader plays this game, the boundary of the square is "unravelled" exposing more and more of the interior of the square to its boundary.

As we will come to find, Monsky's Theorem is deeply engaged with the idea of parity. The theorem itsself is a statement of the parity of divisions of the square into triangles of equal area. This view of Monsky's Theorem in a number-theoretic lense will be the core motivation for our proof of our theorem. In @dissctsq we will show that the inverse of the area of any given triangle in a division of the square into $n$-triangles has the same parity as $n$. Then, in @graphsq, we will utilize this fact to motivate a view of divisions of the square into triangles as graphs. We will then study the $p$-adic metric in @p-adic which we will utilize to provide a measurement of the parity of a triangles area in the view of divisions of the square as graphs in @coloringsection. We will then utilize the measurement of parity which we have presented to measure the parity of the square itself, which we will relate to the parity of a triangle which we can find in any division of the square into triangles in @boundary. Finally we will piece all of these parts together to provide a proof of Monsky's Theorem in @monskythm. @monskythm concludes with a worked example of the process of finding a triangle which cannot be a member of a division of the square into triangles of equal area in any division of the square into triangles of equal area. The reader may find referencing this example throughout their stay within this chapter as a helpful map with which to guide their journey.

== Dissections of the Square<dissctsq>

To begin our proof of Monsky's Theorem, we must first define what it means to divide the square, or any polygon, into triangles.

#definition[
  A _dissection_ of a polygon $P$ is a set of triangles $T$ where $T$ covers $P$, no two triangles in $T$ overlap, and $P$ covers $T$.
]

#meander.reflow({
  import meander: *

  placed(center, box(width: 100%)[
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
    )<dissct>
  ])

  container()
  pagebreak()

  placed(top, box(width: 100%)[
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
    )<nondissect>
  ])

  placed(bottom, box(width: 100%)[#figure(
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
  )<equidissct>])

  container()
  content[
    However, this is not the only mathematical structure which divides a polygon into triangles. We will later present another mathematical structure which represents such a division. Dissections consider the problem of the division of polygons into triangles in a geometric sense, as tilings of triangles which both cover and are contained by their respective polygon.

    #example[
      Two examples of dissections are presented in @dissct.
    ]

    #example[
      In contrast, three non-dissections are presented in @nondissect which each violate one of the three conditions we provided for a dissection. The first example is not a dissection since the square is not completely covered by triangles. The set of triangles also must not contain any overlapping triangles such as in the second example. Finally, in the third example, all of the triangles must be contained within our polygon.
    ]

    Monsky's Theorem is interested in a particular manner of dissecting the square, one where all triangles are of equal area. We refer to such a dissection as an _equidissection_.

    #definition[
      An _equidissection_ is a triangulation of a polygon $P$ where all triangles are of equal area. An equidissection containing $n$ triangles is called an $n$-equidissection.
    ]

    #example[
      Three equidissections of the square are presented in @equidissct. Notice that all of these equidissections have an even number of triangles.
    ]

    As an illuminating exercise in futility, the reader is invited to attempt to draw such an odd equidissection. The rare reader which attempts such an exercise in futility after being instructed to by a mathematical text will note the following: It is seemingly impossible to construct a dissection of the square into an odd number of triangles of equal area. This property gives rise to the following conjecture originally proposed by Fred Richman, which we will later prove as _Monsky's Theorem_.

    #proposition[
      Any equidissection of the square contains an even number of triangles.
    ]

    To find a path towards the proof of such a proposition, we rely on the fact that equidissections are quite fragile. We have shown a dissection $T$ is not an equidissection if we find any triangle in $T$ which has area which is not equal to any other triangle in $T$. Since we are evenly dividing a polygon $P$ into $n$ triangles of equal area we can restrict this condition further: Finding one triangle in a dissection $T$ of a polygon $P$ which has an area which does not evenly divide $P$ proves $T$ is not an equidissection. We can provide an alternative condition for equidissection which takes advantage of this fact.

    #proposition[
      $T$ is an equidissection of a polygon $P$ with $n$ triangles if and only if every triangle $t in T$ has area equal to $("Area "P)/n$.
    ]
    #proof[
      This follows from the fact that any equidissection $T$ of $P$ with $n$ triangles must evenly divide the area of $P$ into $n$ parts.
    ]

    This allows us to in turn rephrase Richman's conjecture to utilize our alternative definition of equidissecction.

    #proposition[
      Any dissection of the square $T$ with an odd number of triangles contains at least one triangle $t$ with area not equal to $1/n$.
    ]

    This rephrasing of the theorem provides a more forward suggestion for how we should go about our proof. We start with an arbitrary dissection $T$ of the square with an odd number of triangles. We then find a triangle in $T$ such that its area is not one of $1/3, 1/5, 1/7, ...$. In the next section we will begin to explore a combinatorial view of this problem. This view will lead us on a path which eventually ends in finding a triangle which odd equidissection in any given dissection.
  ]
})

== A Combinatorial Perspective on Dissections<graphsq>

In the previous section we have presented a geometric definition of the division of polygons into triangles. We will contrast the geometric view presented in the previous section with a combinatorial view of the problem.

Dissections are of polygons, so to present a combinatorial definition of dissection, we must first provide a combinatorial definition of a polygon. First we must ask: what are polygons when represented as a graph?

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
  Four polygons of an increasing number of vertices represented as a graph are presented in @plygn.
]

#figure(
  align(center)[
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
    )],
  caption: [Four polygons of an increasing number of vertices.],
)<plygn>

Notice that each of these $n$-gons, when viewed as a graph, are just a cycle of length $n$. We will define a combinatorial polygon as such a cycle of length $n$.

#definition[
  A graph $G$ is a cycle graph with $n$ vertices if the vertex set is $n$ vertices which we will name $1, 2, ..., n$, and each edge is of the form $(i, i + 1)$ for an integer $1 <= i < n$ or $(1, n)$.
]

We will define combinatorial polygons as graphs which contain only a cycle of length $n$.

#definition[
  @abrams_integer_2024 A _combinatorial $n$-gon_ is an abstract cycle graph $G$ with $n$ vertices; a _combinatorial polygon_ is a combinatorial $n$-gon for some $n$.
]

We will consider triangulations, the combinatorial equivalent of a dissection, of a combinatorial polygon to be any graph whose boundary is a combinatorial polygon, can be plotted on the real plane without intersection, and is made up of combinatorial triangles.

#definition[ // replace this definition
  A _triangulation_ of a combinatorial polygon $G$ is a graph which can be plotted on the plane in a non-intersecting manner, is made up of combinatorial triangles, and whos boundary is a combinatorial polygon.
]

The definition of a triangulation represents the mathematical structure which results when formalizing the division of a polygon into triangles in the combinatoric sense. However, it is important to keep in mind that this structure is mathematically distinct from dissections, which result from a geometric sense of the problem. When trying to come up with corresponding triangulations for a given dissection we find that not all dissections have a clean representation as graphs of triangles.

#example[
  A dissection and its corresponding triangulation are shown in @dirty and @clean. In @dirty, the dashed triangle does not represent a triangle when considered as a graph. One of the triangles edges is subdivided, making it a square. We can solve this by introducing an extra triangle as shown in @clean.
]

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
  caption: [A dissection of the square with a highlighted triangle which is a square when viewed as a triangulation in the trivial sense.],
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
  caption: [The corrected corresponding triangulation to the dissection shown in @dirty with the same triangle highlighted.],
)<clean>

Because of this subtlety we will view divisions of polygons into triangles as both a dissection and a corresponding triangulation. Each of these structures provide different interpretations of what it means to divide a polygon into triangles. The geometric representation of dissections provide the area of each triangle, but lack information regarding its neighbouring triangles. The combinatoric representation of triangulations provide no information regarding the area of each triangle, but provides a way to relate triangles to their neighbours.

However, we do not need perfect information regarding the area of each triangle in our division of the square. Remember, to provide a proof of Richman's proposition, we need only show that there exists a triangle $t$ in our division of the square such that $"Area" t != 1/3, 1/5, 1/7...$. In the next section we will introduce a construction known as the $p$-adic valuation which will allow us to measure if the area of a given triangle achieves this condition. This construction will allow us to bridge the information which is provided by the combinatorial and geometric views of the division of a polygon into triangles.

== The $p$-adic valuation<p-adic>

In the previous section we introduced a combinatorial view of the division of the polygon into triangles. This division allows us to relate triangles to their neighbours in a given division of a polygon, but lacks crucial information regarding the area of its triangles. However, we don't require full information of the area of a triangle in a division. We only need to know if the area of such a triangle is the inverse of an odd integer. The $p$-adic valuation will allow us to measure if a given triangle achieves this condition.

Notice that we only care if the inverse of a triangles area is odd. While it seems this matter could be addressed via parity argument, notice that a triangles area can be any real number. The $p$-adic valuation is an extension of the idea of parity over the rational and real numbers.

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
  Let $a, p in ZZ$ such that $p$ is prime. Write $a = p^n q$ where $p divides.not q$. The _p-adic valuation_ of $a$ is $n$ written as $p- (a) = n$, if $a = 0$, we define $p- (a) = infinity$, or the number greater than all real numbers.
]

#example[
  For example,
  - $2-(24) = 3$ since $24 = 2^3 dot 3$ as shown in @p1,
  - and $2-(108) = 2$ since $108 = 2^2 dot 27$.
]<p2>

The definition of the $p$-adic valuation does not provide confidence that it is a well defined function. For an integer $a$, and a prime $p$, we might be able to find a $q$ and $q prime$, and an $n$ and $n prime$ such that $a = p^n q$ and $a = p^(n prime) q prime$ but $n != n prime$.

#proposition[
  Fix a prime $p in ZZ$, if $a = p^n q$ and $a = p^m r$ where $p divides.not q$ and $p divides.not r$ for $a in ZZ$, then $n = m$.
]

#proof[
  Consider the prime factorization of $a$, $a = a_0^i_0 dots.c a_j^i_j$. If $p$ is not present in this prime factorization, then $p divides.not q$, so, $p^n divides a$ if and only if $n = 0$, so $n = m = 0$. Otherwise, $p$ is present in the prime factorization. So we can write $a = a_0^i_0 dots.c p^n dots.c a_j^i_j$ and similarly for $m$. So, $n = m$ by the uniqueness of prime factorization.
]

The previous proposition shows that the $p$-adic vaulation is well defined over the integers. We can easily extend the $p$-adic valuation over the rational numbers as follows:

#definition[
  Fix some prime $p in NN$ and let $q in QQ$ where $q$ is nonzero and we can write $q = r/s$ in lowest terms. Then we say the _$p$-adic valuation_ of $q$ is equal to $n$, written as $p-(q) = n$ if and only if there exists some $a, b in ZZ$ such that $q = p^n a/b$ and $p divides.not a, b$. If $q = 0$, we define $p-(0) = infinity$. ]


#example[
  We can utilize this definition to compute the $2$-adic valuation of $24/108$ as follows,
  $
    2-(24/108) = 2-(24) - 2-(108) = 3 - 2 = 1.
  $
]

This extension is well defined since there is only one way to write $a = r/s$ in lowest terms. We can use this definition to find an equivalent definition of the $p$-adic valuation over the rational numbers which is similar to our definition over the integers.

#proposition[
  Let $a in QQ$, then $p- (r/s) = n$ if and only if you can write $a = p^n u/v$ such that $p divides.not u, v$.
]

#proof[
  Let $r/s in QQ$, then $p- (r) = n$, $p- (s) = m$ if and only if $r = p^n u$, $s = p^m v$ and $p divides.not u, v$. So
  $ r/s = (p^n u)/(p^n v) = p^(n - m) u/v, $ if and only if $p-(r) - p-(s) = n - m$.
]

So far, we are only able to measure the $p$-adic valuation of a single value. The following theorem will give us information regarding the $p$-adic valuation of the sum or product of two values.

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
  + We can write
    $ x y = p^(n) u/v p^(m) r/s. $ Then $ x y = p^(n + m) (u r)/(v s). $ Also $p divides.not u, r, v, s$ so $p divides.not (u r), (v s)$ by Euclid's lemma since $p$ is prime.
  + Suppose $n < m$. We can write
    $ x + y = p^(n) u/v + p^(m) r/s. $ Then we can factor out the smaller exponent of $p$ to get $ x + y = p^(n)(u/v + p^(m - n) r/s) = p^n (u/v + ((p^m - n)r)/s) = p^n (u s + (p^m - n) r v)/(s v). $ We know $p divides p^(m - n) r v$ since it is a multiple of $p$. So $p divides.not u s + (p^m - n) r v$ since $p divides.not u s$ by similar application of Euclid's lemma. Also $p divides.not (s v)$ as shown in the previous part. Therefore $p- (x + y) = p- (x)$. Now, suppose $n = m$ then $ x + y = p^(n) (u/v) + p^n (r/s) = p^n (u/v + r/s). $ Notice that it is not necessarily true that $p divides.not
    u/v + r/s$, so $p- (x + y) >= p(x).$
]

Notice that in our proof of the third property in @valuation, we showed an even stronger statement.

#corollary[
  For some prime $p$ and some $x, y in QQ$ where $p-(x) < p-(y)$, then $p-(x + y) = p-(x)$. Another phrasing of this property is  $p-(x + y) = min(p-(x), p-(y))$ for $x, y in QQ$ where $p-(x) != p-(y)$.
]<corollary>

We will later use this theorem and its corollary to provide a bound on the $p$-adic valuations area based on the $p$-adic valuation of its vertices.

The vertices of an arbitrary division of the square into triangles are on the real plane. To make our proof broadly applicable we must extend the $p$-adic valuation over the real numbers.

#theorem[
  @gouvea_p-adic_2020 Fix some prime $p$. Then for any $a in RR without QQ$ there exists a well defined function $padic(star: "a"): QQ -> ZZ$ such that
  1. $padic(star: "a")(a) = 1$
  2. $padic(star: "a")(q) = p-(q)$ for all $q in QQ$
  3. $padic(star: "a")$ satisfies the properties of @valuation and @corollary over $RR$.
]<extension>

A proof of @extension is provided by #cite(<gouvea_p-adic_2020>, form: "prose") which provides the specifics of the construction of this extension. The pathway to this construction requires significant analysis of the $p$-adic valuation which will not be provided in this paper in the interest of brevity. In this paper, we will simply refer to an extended version of the $p$-adic valuation over the rationals without worrying about its specific construction. Further, many of the statements we are discussing hold true for all extensions of the $p$-adic valuation over the real numbers which result from @extension. When we do not care about the specific extension which we are utilizing we refer to the $p$-adic valuation over the reals in the general sense, utilizing the syntax produced by the following definition.

#definition[
  We define $p*$ as any extension of the $p$-adic valuation over the real numbers as resulting from @extension.
]

A triangles area is not consistent with an odd equidissection if its $2$-adic valuation is non-zero since the $p$-adic valuation of any integer $a in {1/3, 1/5, 1/7, ...}$ is zero.

#proposition[
  Let $a in RR$ if $2*(a) != 0$ then $a in.not {1/3, 1/5, 1/7, 1/9, ...}$.
]

#proof[
  Let $a in {1/3, 1/5, 1/7, ...}$ then $2*(a) = 2*(1/r)$ where $r$ is an odd integer. so $2*(a) = 2*(1) - 2*(r) = 0 - 0 = 0$.
]

In the next section we will utilize this property to provide a set of conditions on the vertices of a triangle which show that it cannot be a member of an odd equidissection.

== Coloring the plane<coloringsection>

In the previous section we introduced the $p$-adic valuation and its properties. We finished by showing that a triangle with an area with non-zero $2$-adic valuation cannot be a member of an odd equidissection. In this section we will find a set of constraints for each vertice of a given triangle which will require the $p$-adic valuation of a triangle to be non-zero. We will divide the real plane into three sets which satisfy these conditions for a given vertex. We will use this division of the real plane into these sets to define a construct known as a coloring over a graph. This graph coloring will allow us to easily determine if a certain triangle in a division of the square into triangles cannot be a member of an odd equidissection.

We will begin with the area of a triangle.

#theorem[@meister_generalia_1769
  The area of a triangle $t$ with coordinates $(x_A, y_A), (x_B, y_B), (x_C, y_C)$ is as follows:
  $
    "Area" t = 1/2mat(
      delim: bar,
      1, 1, 1;
      x_A, x_B, x_C;
      y_A, y_B, y_C;
    ).
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
  Let $(x_A, y_A) in A$, $(x, y) in.not A$. Then $(p*(x - x_A), p*(y - y_A)) in.not A$.
]<trans>
#proof[
  Let $(x, y) in RR$ such that $p*(x), p*(y) <= l$ for some $l in R$ and $(x_A, y_A) in RR$ such that $p*(x_A), p*(y_A) > l$, then $ p*(x - x_A) = min(p*(x), p*(x_A)) = p*(x), $ and similarly $ p*(y - y_A) = min(p*(y), p*(y_A)) = p*(y). $ Therefore $(x - x_A, y - y_A) in.not A$.
]

We can utilize this property to assume that the point $(x_A, y_A)$ is zero without loss of generality. Then,

$
  p*("Area" t) &= p*(1/2) + p*(x_A y_B - x_A y_C + x_B y_C - x_B y_A + x_C y_A - x_C y_B) \
  &= p*(1/2) + p*(x_B y_C - x_C y_B).
$

We will work backwards starting with this formula. We will then break it apart to find the constraints on our three sets. One way to show that this quantity is non-zero is for $p*(x_B y_C - x_C y_B)$ to be less than or equal to zero. For this to be true we must require two conditions. First of all $p*(x_B y_C) != p*(x_C y_B)$. This condition then gives us $ p*(x_B y_C - x_C y_B) = min(p*(x_B y_C), p*(x_C y_B)), $ which we will require to be less than or equal to zero to satisfy the second condition. If $ p*(x_B y_C) != p*(x_C y_B), $ then $ p*(x_B y_C) > p*(x_C y_B) "or" p*(x_B y_C) < p*(x_C y_B). $ We can assume that $p*(x_B y_C) < p*(x_C y_B)$ up to renaming of variables. This then requires that $ p*(x_B) + p*(y_C) < p*(x_C) + (y_B). $ This can provided in many ways, but we will provide it by requiring $ p*(x_B) < p*(y_B) "and" p*(x_C) <= p*(y_C). $ We will provide the second condition by assuming  $p*(x_B), p*(y_C) <= 0$. This motivates constraining our $(x_A, y_A)$ such that $p*(x_A), p*(y_A) > 0$. Our final list of constraints for each set is as follows.

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

  Finally we will show that a triangle with vertices in all three of $A, B$ and $C$ has area with nonzero $p$-adic valuation. Let $T$ be a three colored triangle with vertices $(x_A, y_A), (x_B, y_B), (x_C, y_C)$ where $(x_A, y_A)$ is colored A, $(x_B, y_B)$ is colored B, and so on relative to our coloring. By our previous lemma we can translate $T$ by $(-x_A, -y_A)$ without changing the coloring of our vertices. So, we can assume $(x_A, y_A) = (0, 0)$ without loss of generality.

  The area of $T$ is $ 1/2 (x_B y_C - x_C y_B). $ So, the $p$-adic valuation of the area of $T$ is $ p- (1/2(x_B y_C - x_C y_B)) = p- (1/2) + p- (x_B y_C - x_C y_B). $ By our coloring $ p- (x_B) <= p- (y_B) "and" p- (y_C) < p- (x_C). $ Then $ p- (x_B y_C) = p-(x_B) + p-(y_C) < p-(x_C) + p-(y_B) = p- (x_C y_B). $ So $ p- (x_B y_C - x_C y_B) = p- (x_B y_C). $

  Therefore $ p- ("Area of" T) = p- (1/2) + p- (x_B y_C) <= p- (1/2), $ since $p- (x_B) <= 0$ and $p- (x_C) <= 0$ by our coloring.
]

We will utilize these three sets to define a structure known as a graph coloring on any given triangulation of the square.

// We can use a trick to simplify this formula. Notice that for $a, b in R^2$ where $a > b$, $p*(a - b) = p*(b)$. We will utilize this property to constrain our vertex $(x_A, y_A)$ such that we can assume $(x_A, y_A) = (0, 0)$ without loss of generality.

// #proposition[
//   Let $p*(x_A) > max(p*(x_B), p*(x_C))$ and $p*(y_A) > max(p*(y_B), p*(y_C))$. Then $(p*(x_B - x_A), p*(y_B - y_A) = (p*(x_B), p*(y_B))$ and $(p*(x_C - x_A), p*(y_C - y_A)) = p*(x_C, y_C)$.
// ]

// So, we will constrain our vertex $(x_A, y_B)$ such that $(p*(x_A), p*(y_A)) > (max(p*(x_B), p*(x_C)), max(p*(y_B), p*(y_C))$. Then, we can assume without loss of generality that $(x_A, y_A) = (0, 0)$. The $p$-adic valuation of the area of a triangle $t$ whose vertices satisfy this constraint are as follows:

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
  - $C_2 ((0, 0)) = A$ since $2*(x) = 2*(y) = 2*(0) = infinity > 0$,
  - $C_2 ((0, 1)) = C$ since $2*(x) = 2*(0) = infinity >= 0 = 2*(1) = 2*(y)$ and $2*(y) = 2*(1) = 0 <= 0$,
  - $C_2 ((1, 1)) = C$ since $2*(x) = 2*(1) = 0 >= 0 = 2*(1) = 2*(y)$ and $2(y) = 2*(1) = 0 <= 0$.,
  - and $C_2 ((1, 0)) = B$ since $2*(x) = 2*(1) = 0 < infinity = 2*(0) = 2*(y)$ and $2*(x) = 2*(1) = 0 <= 0$.
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
#proof[
  This lemma is a direct consequence of @trans.
]

A corollary of this property which will be useful in the next section is as follows.

#corollary[
  Let $V_1, V_2 in RR^2$. $C_p (V) = C_p (V_1) "or" C_p (V_2)$ for any point $V$ along the line segment formed by $V_1$ and $V_2$.#footnote[A proof of this fact is included in @hales_projective_1982 alongside a detailed exploration of colorings which satisfy this property.]
]<line>

#proofsketch[
  Let $V_1 = (x_1, y_1)$ and $V_2 = (x_2, y_2)$, this theorem can be provided by exploring the values of $p*(t x_1 + (1 - t) x_2)$ and $p* (t y_1 + (1 - t) x_2)$ in the context of @translate.
]

We can also carry over the most important property of our three sets, which constrains the $p$-adic valuation of a three colored triangles area to be non-zero.

#lemma[
  Let $T$ be a three colored triangle relative to $C_p$. Then $p* ("Area of" T) <= p* (1/2).$
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
  We will proceed by contradiction. If $t$ does not correspond to a triangle in $T$, then $"Area of" t = 0$ when $t$ is considered geometrically. Therefore $p* ("Area of" T) = infinity$. However by @triarea $ p* ("Area of" T) <= p*(1/2) < infinity. $ So the area of $t$ is non-zero. Therefore $t$ must correspond to a triangle in $T$ by contradiction.
]

We can now proceed to the finale of this section by showing that any 3-colored triangle in a triangulation of the square colored by the $2$-adic coloring function cannot be a member of an odd-equidissection.

#corollary[
  Let $T$ be a dissection of the square whose corresponding triangulation $G$ contains $n$ triangles where $n$ is odd and a three colored triangle $t$ relative to $C_2$. Then $T$ is not an equidissection.
]<complete1>

#proof[
  Our triangle $t$ is three colored relative to $C_2$ so $2* ("Area of" t) <= 1/2$. Also, $2* (1/n) = 0$ since $n$ is odd. Therefore $T$ is not an equidissection since $t$ corresponds to a triangle in $T$ whose area is inconsistent with an equidissection.
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

== The Boundary Word<boundary>

In the previous section, we constructed a coloring on triangulations of the square. Any three colored triangle under this triangulation must have area inconsistent with an odd equidissection of the square. To find a three colored triangle within an arbitrary triangulation of the square we will remove triangles which are not three colored from the square. We have found a three colored triangle if we cannot continue this process until all triangles are removed. We will create a combinatorial object which will simplify this proof into one on a type of object known as a cyclic word.

#definition[
  A cyclic word $w$ is a string of characters from a character set $X$ which can indexed $mod n$. This means that any cyclic word $W$ is equivalent to the cyclic word $W'$ which takes the last character of $W$ and moves it to the front of $W'$.
]

#example[
  Let $W$ be the cyclic word $A B C D$. Then $W_1 = A$, $W_3 = C$ and $W_5 = A$. Also, $ A B C D equiv D A B C equiv C D A B equiv B C D A. $
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

#lemma([Non-Abelian Sperner's])[ @abrams_integer_2024
  Let $T$ be a triangulation colored by $C_p$ such that the boundary word $omega$ of $T$ is non-contractible. Then, $T$ contains a complete triangle.
]<sperner>

#proof[
  There exist a $u, v, x$ where $u$ and $v$ are two adjacent edges on the boundary of $T$ and $x$ is the vertex which forms a triangle with $u$ and $v$ such that $x$ is either adjacent to $u$ and $v$ on the boundary, or $x$ is in the interior since the case where every pair of adjacent edges forms a triangle with a non adjacent boundary vertex gives rise to intersections, contradicting our assumption that $T$ is a triangulation. Then there is a triangle $t$ formed by $u, v$ and a third vertex $x$. Our result follows if $t$ is three colored. Otherwise $t$ isn't three colored. In either of these cases, removing x corresponds to a contracting step on $omega$. Therefore, by induction, if we continue contracting $x$ we will continue until we find a three colored triangle since $omega$ is non-contractible.#footnote[This proof follows closely the methodology employed by #cite(<abrams_generalized_2022>, form: "prose").]
]

For our purposes, non-contractibilty is a very valuable property. Luckily there is a very simple condition for non-contractibility which we can utilize. If there are an odd number of $A B$ or $B A$ edges in a cyclic word, then the $A B$ and $B A$ edges cannot cancel eachother out. This implies that our boundary word must be non-contractible.

#theorem[
  Let $W$ be the boundary word derived from the $3$-coloring of a triangulation $G$ with an odd number of $A B$ pairs and atleast $3$ edges. Then, $W$ is non-contractible.
]<3contract>

#proof[
  Let $W$ be a boundary word of length $n >= 3$ over a $3$-coloring represented by the cyclic word of colors $w_1 w_2 dots w_n$. Suppose $W$ has an odd number of $A B$ pairs. If $n = 3$ then, $W$ is either $A B C$, $B C A$, $A C B$, or $B C A$. So, $W$ is non-contractible. Now suppose $n > 3$. If there exists no $i <= n$ such that $w_(i-1), w_(i), w_(i + 1)$ are all distinct then $W$ is non contractible. Suppose there exists such an $i$, then the word $(w_(i-1), w_i, w_(i + 1))$ either contains no complete pairs, or is colored $A B A$, $A A B$, or $B A A$. In all of these cases, an even number of complete pairs are removed by contracting, so $W prime$ has an odd number of complete pairs and has length $n - 1$. Then, by induction, if we continue to contract $W$ we will run out of possible contracting steps with a word of length greater than or equal to $3$. Therefore $W$ is non-contractible.
]

We can use the @line regarding our coloring to expand this condition to any triangulation of a polygon which has an odd number of complete edges. This gives us the final theorem which will allow us to prove Monsky's Theorem.

#corollary[
  Let $T$ be a triangulation with boundary word $omega$ of a polygon $P$ with boundary word $W$ where both boundary words are derived via the coloring $C_p$. If $W$ has an odd number of $A B$ pairs, then $omega$ has an odd number of complete pairs.
]<pairs>

#proof[
  Notice that the boundary of $T$ is a subdivision of the boundary of $P$. Let $u, v$ be the two vertices of a complete edge on $P$. Notice that $u, v$ are also present in $T$. Lets consider the (non-cyclic) sub word $omega_0$ of $omega$ from $u$ to $v$. By @line all vertices between $u$ and $v$ on the boundary of $T$ are colored either $A$ or $B$. This word also must alternate from $A$ to $B$ an odd number of times since either starts with $A$ and ends with $B$ or starts with $B$ and ends with $A$. So $omega_0$ has an odd number of complete edges. $P$ has an odd number of complete edges, and complete edges on $omega$ can only happen along complete edges on $P$. Therefore $omega$ has an odd number of complete pairs.
]

== Monsky's Theorem<monskythm>

In summary of this chapter, @pairs shows that the triangulation which is derived from any given dissection of the square must contain a three colored triangle. @complete1 shows that any odd dissection of the square with a three colored triangle is not an equidissection. The combination of these two theorems gives us our result. We will first provide an odd dissection, and use these theorems to show the dissection cannot be an equidissection.

We can finally chain all of these lemmas together to provide a quick proof of Monsky's Theorem.

#proof("Monsky's Theorem")[
  Let $T$ be an $m$-dissection of the unit square with vertices $(0, 0)$, $(0, 1)$, $(1, 0)$ and $(1, 1)$ where $m$ is odd. Let $G$ be the triangulation corresponding to $T$. Notice that the boundary word of the unit square is $A C C B$ when colored by $C_2$. This boundary word has an odd number of $A B$ pairs, so by @pairs the boundary word $W$ of $G$ has an odd number of $A B$ pairs. Then by @3contract $W$ is non-contractible. So $T$ contains a complete triangle when colored by $C_2$. Therefore $T$ is not an equidissection by @complete1.
]

The story of this proof is as follows: We begin with an abritrary $n$-dissection of the unit square $T$ where $n$ is odd. Now, we can represent this $n$-dissection of the unit square $T$ as a graph $G$ which is made up of triangles and can be plotted on a $2$-dimensional piece of paper without any intersections. We color this graph using the special $2$-adic coloring function which we crafted in @coloring such that any triangle $t$ in $G$ which is three colored cannot have area $1/n$. Recall that if $t$ is a member of an $n$-equidissection it must have area $1/n$. Now, we begin to play the contraction game around the boundary of $G$, removing any triangles which are not three-colored. As we continue to play this game we unravel the boundary, exposing new triangles of the interior to the boundary. Eventually this process ends in a three-color triangle, because the square, and any dissections of the square have non-contractible boundary word. Such a three-colored triangle cannot have area equal to $1/n$ since $n$ is odd. The following example shows this process performed on a dissection of the square with an odd number of triangles.

#pagebreak()

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

  In @p-adic we introduced the $p$-adic valuation, we can utilize this function to calculate the $2$-adic valuation of the vertices of our dissection.
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
      )
    ],
    caption: [A dissection with vertices labelled by the $p$-adic valuation of its coordinates.],
  )

  In @coloringsection we introduced the $p$-adic coloring function, which we will utilize to color our triangulation utilizing the $2$-adic valuation of the vertices which we calculated above. We also introduced an important lemma, @complete1, that a three color triangle relative to the $2$-adic coloring function cannot be a member of an $n$-equidissection where $n$ is odd.
  #figure(
    align(center)[
      #stack(dir: ltr, spacing: 4em, diagram(
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
      ))
    ],
    caption: [The corresponding colored triangulation to our dissection.],
  )

  In @boundary we introduced the boundary word, alongside a helpful result, @sperner, that any dissection with a non-contractible boundary word must contain a three colored triangle. The boundary word of this dissection is $A C C C C B$. We can contract it as follows $ A C C C C B -> A C C C B -> A C C B -> A C B. $ Notice that the boundary word is non contractible, so the triangulation must have a three color triangle.

  #figure(
    align(center)[
      #stack(
        dir: ltr,
        spacing: 4em,
        diagram(
          node-stroke: .1em,
          edge-stroke: .1em,
          cell-size: 30mm,
          node-inset: 0.25em,
          node-defocus: 0,
          node((0, 0))[B],
          node((0, 1))[A],
          node((1, 0))[C],
          //node((1, 1))[C],
          node((0.5, 1))[C],
          node((0.5, 0))[C],
          node((0.5, 0.5))[C],
          edge((0, 0), (0, 1)),
          edge((0, 0), (0.5, 0)),
          edge((0.5, 0), (0, 1)),
          edge((0.5, 0), (1, 0)),
          //edge((1, 1), (0.5, 1)),
          edge((0.5, 1), (0, 1)),
          //edge((1, 1), (1, 0)),
          edge((0.5, 0), (0.5, 0.5)),
          edge((0.5, 1), (0.5, 0.5)),
          edge((0.5, 0.5), (1, 0)),
          //edge((0.5, 0.5), (1, 1)),
          edge((0.5, 1), (1, 0)),
          edge((0.5, 0), (0.5, 1), bend: -15deg),
        ),
        diagram(
          node-stroke: .1em,
          edge-stroke: .1em,
          cell-size: 30mm,
          node-inset: 0.25em,
          node-defocus: 0,
          node((0, 0))[B],
          node((0, 1))[A],
          //node((1, 0))[C],
          node((0.5, 1))[C],
          node((0.5, 0))[C],
          node((0.5, 0.5))[C],
          edge((0, 0), (0, 1)),
          edge((0, 0), (0.5, 0)),
          edge((0.5, 0), (0, 1)),
          //edge((0.5, 0), (1, 0)),
          edge((0.5, 1), (0, 1)),
          edge((0.5, 0), (0.5, 0.5)),
          edge((0.5, 1), (0.5, 0.5)),
          //edge((0.5, 0.5), (1, 0)),
          //edge((0.5, 1), (1, 0)),
          edge((0.5, 0), (0.5, 1), bend: -15deg),
          edge((0.5, 0), (0.5, 1), bend: 30deg),
        ),
      )
      #stack(
        dir: ltr,
        spacing: 4em,
        diagram(
          node-stroke: .1em,
          edge-stroke: .1em,
          cell-size: 30mm,
          node-inset: 0.25em,
          node-defocus: 0,
          node((0, 0))[B],
          node((0, 1))[A],
          //node((1, 0))[C],
          node((0.5, 1))[C],
          node((0.5, 0))[C],
          //node((0.5, 0.5))[C],
          edge((0, 0), (0, 1)),
          edge((0, 0), (0.5, 0)),
          edge((0.5, 0), (0, 1)),
          //edge((0.5, 0), (1, 0)),
          edge((0.5, 1), (0, 1)),
          edge((0.5, 0), (0.5, 0.5)),
          edge((0.5, 1), (0.5, 0.5)),
          //edge((0.5, 0.5), (1, 0)),
          //edge((0.5, 1), (1, 0)),
          //edge((0.5, 0), (0.5, 1), bend: -15deg),
          //edge((0.5, 0), (0.5, 1), bend: 30deg),
        ),
        diagram(
          node-stroke: .1em,
          edge-stroke: .1em,
          cell-size: 30mm,
          node-inset: 0.25em,
          node-defocus: 0,
          node((0, 0))[B],
          node((0, 1))[A],
          //node((1, 0))[C],
          //node((0.5, 1))[C],
          node((0.5, 0))[C],
          //node((0.5, 0.5))[C],
          edge((0, 0), (0, 1)),
          edge((0, 0), (0.5, 0)),
          edge((0.5, 0), (0, 1)),
          //edge((0.5, 0), (1, 0)),
          //edge((0.5, 1), (0, 1)),
          //edge((0.5, 0), (0.5, 0.5)),
          //edge((0.5, 1), (0.5, 0.5)),
          //edge((0.5, 0.5), (1, 0)),
          //edge((0.5, 1), (1, 0)),
          //edge((0.5, 0), (0.5, 1), bend: -15deg),
          //edge((0.5, 0), (0.5, 1), bend: 30deg),
        ),
      )
    ],
    caption: [The process of contracting $T$.],
  )

  Further, notice that this $3$-colored triangle is not one the spurious triangles introduced by our conversion between dissection and triangulation.

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

  We will refer to this highlighted three-color triangle as $t$. If $t$ were a part of an equidissection, it would have area $1/5$ since there are $5$ triangles in our dissection. However by @triarea $ 2*("Area" t) <= 2*(1/2) = -1 != 0 = p*(1/5) $ since $t$ is three colored. We can verify this by calculating the area of $t$. The coordinates of $t$ are $(0, 0), (0, 1), (1/2, 1)$. So, $ "Area" t = 1/2 * 1 = 1/2 != 1/5. $ Therefore, $T$ is not an equidissection.
]

= Generalizing our Proof of Monsky's Theorem<generalize>

There are many generalizations of Monsky's Theorem as shown in the introduction. However, in this chapter we will primarily concern ourselves with the following question which guided a specific subset of generalizations of Monsky's Theorem: What is the set of polygons which only have even equidissections?

The current conjecture by Sherman Stein is that the set of such polygons is the set of _balanced polygons_. In the next section we will introduce balanced polygons, as well as a couple different types of balanced polygons. Then, in the following section, @conjecture, we will utilize these definitions of balanced polygons to introduce and study Stein's Conjecture. Then, in @poly we will provide a proof that polygons have no odd equidissection. We will then shift to a proof of showing that odd area balanced lattice polygons have no odd equidissection. We will begin by introducing a coloring function on lattice polygons known as the _even-odd_ coloring in @even-odd. We will then study the boundary of lattice polygons utilizing a new representation of the boundary of a lattice polygon which we will introduce in @boundarysumsum. Finally we will show that the area of a balanced polygon is related to its boundary sum in @area, allowing us to prove our theorem.

== Balanced Lattice Polygons

The astute reader will have noticed that by showing that the square has no odd equidissection, we have proven that there is no odd equidissection for any polygon which can be transformed into the square by way of any transformation which effects the area of every triangle equally. Such transformations are known as _affine transformations_.

#definition[
  An _affine transformation_ on the real plane is a function $A: X -> Y$ where both $X$ and $Y$ are sets of points, or single points, on the real plane $RR^2$ which satisfy the following properties:
  + Let $L$ be a set of points which make up a line. Then, $A(L)$ also make up a line.
  + Let $L_0, L_1$ be sets of points which make up two parallel lines, then $A(L_0)$ and $A(L_1)$ are both parallel.
]

#pagebreak()

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

In practice, affine transformations on the real plane can be represented by convolution by a matrix alongside an addition by a fixed vector.

#proposition[
  Let $A$ be an affine transformation, then there exists a $2 times 2$ matrix $M$, and a $2$-dimensional vector $V$ such that $ A(x, y) = mat(x; y) M + V. $ The matrix $M$ is referred to as the _linear component_ of $M$.
]

A proof of this is provided by #cite(<snapper_metric_1989>, form: "prose").

This representation reveals the underlying property of affine transformations which we are looking for. Affine transformations are made up of two steps, first we perform a linear transformation, represented by our matrix $M$, then we perform a translation by our vector $V$. This means all affine transformations inherit the property of equally affecting the area of polygons from linear transformations since translations do not affect area.

#corollary[
  Let $A$ be an affine transformation with linear component $M$. Let $P$ be a polygon with area $a$, then $"Area" A(P) = det(M) a$.
]
#proofsketch[
  This is the result of the fact that the only portion of $A$ which affects the area of a polygon is the linear component $M$, and the determinant of $M$ is the measure of how much $M$ effects the area of a polygon.
]

However, we run into one problem which requires us to slightly restrict the scope of transformations which we investigate. If the linear component of an affine transformation has a determinant which is zero, it maps all polygons to a line. For the purposes of dissection this is nonsensical. Moving forward we will consider only affine transformations with non-zero determinant.

The result of any affine transformation applied to the square with non-zero determinant is a parallelogram. Parallelograms are made distinct from other quadrilaterals by the fact that each edge of a parallelogram has a corresponding parallel edge which is equal in length. By extending this property to $n$-gons we derive our definition of the balanced polygon.

#definition[
  An polygon $P$ with a counterclockwise boundary is considered _balanced_ if it can be divided into pairs of edges $(u, v)$ such that $u$ and $v$ are parallel, equal in length, and have opposite orientation @rudenko_equidissection_2012.
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
  The result of any affine transformation with nonzero determinant applied to a balanced polygon is also a balanced polygon.
]

#proof[
  This is a direct result of the property that affine transformations preserve parallel lines.
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
  As stated earlier, all such transformed squares are parallelograms. Due to this fact, all four sided balanced polygons are parallelograms and all parallelograms are balanced polygons.
]

Another way to construct new balanced polygons is by tiling multiple balanced polygons together along congruent edges.

#proposition[
  Any gluing of any arbitrary collection of balanced polygons in which two balanced polygons are glued only across congruent edges is a balanced polygon.
]
#proofsketch[
  This proof can be provided by noticing the fact that gluing two balanced polygons across congruent edges creates an equivalency where $u$ and $v$ are congruent. Then there exists $u'$ and $v'$ which are congruent and parallel to $u$ and $v$ by core property of balanced polygon. So $u'$ and $v'$ become congruent and parallel edges. No other edges are effected by this glueing, so we have preserved the pairwise divisive nature of such a relation.
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
    caption: [All polyominoes are gluings of the square, so they are balanced polygons.],
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
    caption: [A square and a parallelogram glued together to form a balanced polygon.],
  )
]

Gluings of the square across congruent edges are a special type of balanced polygon known as a _polyomino_.

#definition[
  Gluings of the square are known as _polyominos_.
]

Such a property may lead the reader to believe that we could perform this process in reverse. That is, any balanced polygon could be decomposed into gluings of smaller balanced polygons until it is divided into a gluings of parallelograms, the balanced polygon with the least number of edges. However, this property does not hold true.

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

// However, you may notice that the above counter-example is made up of the union of two parallelograms. This gives rise to the following property of balanced polygons.

// #figure(
//   diagram(
//     node-stroke: .1em,
//     edge-stroke: .1em,
//     cell-size: 30mm / 9,
//     node-shape: circle,
//     edge((0, 0), (3, 0)),
//     edge((3, 0), (3, 1)),
//     edge((3, 1), (4, 2)),
//     edge((4, 2), (1, 2)),
//     edge((1, 2), (1, 1)),
//     edge((0, 0), (1, 1)),
//     edge((3.75, 1), (5.25, 1), "->"),
//     edge((5, 0), (7, 0), "--"),
//     edge((8, 0), (8, 2)),
//     edge((8, 0), (6, 0)),
//     edge((8, 2), (6, 2)),
//     edge((7, 0), (9, 2), "--"),
//     edge((9, 2), (7, 2), "--"),
//     edge((6, 2), (6, 0)),
//     edge((5, 0), (7, 2), "--"),
//   ),
//   caption: [A balanced polygon and its decomposition into parallelograms.],
// )

// We will define a _decomposition_ of a balanced polygon as a set of potentially intersecting parallelograms whose union is equal to the balanced parallelogram we begin with.

// #definition[
//   Let $P$ be an combinatorial polygon, and $cal(P)$ be a set of parallelograms where for all $p in P$. Then, a set of parallelograms $cal(P)$ is a _decomposition_ of $P$ into parallelograms if $P = union.big_(p in cal(P)) p$.
// ]

// Then, we can move forward with our theorem that there exists a decomposition into paralellograms for any balanced polygon.

// #proposition[
//   Any balanced polygon $P$ can be decomposed into a set of potentially intersecting parallelograms which cover $P$ and are contained within $P$.
// ]

// This property follows from the fact that any pair of parallel congruent edges form a parallelogram. Carefully choosing pairs of edges forming parallelograms which are contained in $P$ allows us to build a set of parallelograms which covers $P$.

It is natural to wonder if the set of balanced polygons only have even equidissections since we have constructed balanced polygons by extrapolating a property of a set of $4$-sided polygons which only have even equidissections. In the next section we will examine this question in more detail.

== Steins Conjecture<conjecture>

In the previous section we introduced balanced polygons. In our introduction of balanced polygons we provided motivation for the question which Stein's Conjecture poses.

#conjecture([Stein])[
  For any balanced polygon $P$, there exists an $n$-equidissection of $P$ if and only if $n$ is even.
]

While we provided some motivation for this conjecture in the previous section, it is also illuminating to trace the historical context which lead to this conjecture. So, what grounds did Sherman Stein make this conjecture upon? Following Monsky's Theorem, a number of conjectures were made which expand on a single primary question: What are the members of the set of all polygons which only have equidissections with an even number of triangles, and is there a single encapsulating property for all such polygons?

The first such generalization was presented by Elaine Kasimatis which expands the result of Monsky's Theorem to regular polygons.

#theorem[
  @kasimatis_dissections_1989 Let $n >= 5$ be an integer. A regular $n$-gon is dissectable into $m$ triangles of equal areas if and only if $m$ is a multiple of $n$.
]

All regular polygons which can be divided into an even number of triangles of equal area have an even number of sides. Such polygons are a subset of a class of polygons known as _convex centrally symmetric polygons_, any polygon which is unaffected by $180$ degree rotations about some point.

#definition[
  Let $P$ be a polygon, $P$ is _convex_ and _centrally symmetric_ if and only if $P$ is convex and there exists some point $p$ such that a $180$ degree rotation of $P$ about $p$ results in a polygon which is the exact same as $P$.
]

It is natural to ask the question: what about equidissections of convex centrally symmetric polygons? The same year as the publication of Kasimatis' paper on equidissections of regular polygons, Stein presented the conjecture that no centrally symmetric polygon has odd equidissection @stein_equidissections_1989. This result was proven to be true by Paul Monsky one year later.

#theorem[
  @monsky_conjecture_1990 No centrally symmetric polygon has odd equidissection.
]

Stein then retraced his steps back to Monsky's theorem, exploring an alternative pathway for expanding Monsky's theorem. He conjectured that Polyominos, or gluings of the square, do not have odd equidissection @stein_cutting_1999, and proved the result for polygons of odd area. This conjecture was proven in full by Iwan Praton.

#theorem[
  @praton_cutting_2002 Any tiling of the unit square cannot be divided into an odd number of triangles of equal area.
]

We will provide a proof of this theorem in the next chapter, as this proof is the guiding basis for most modern exploration of Stein's Conjecture.

The study of polyominos was separated from previous explorations of polygons which only have even equidissections by the fact that they are potentially concave. Stein utilized this to present his open conjecture on the equidissection of balanced polygons by relaxing the requirements present in the class of centrally symmetric polygons which are not present in polyominos. The special property of polyominos is that they are potentially concave, and that they are not necessarily symmetric about a central point. Instead of a symmetric property, they can be divided into pairs of edges which are parallel and of equal length.

The category of all balanced polygons is broad, so all attempts to prove Stein's conjecture have instead focused on subsets of this conjecture. The most comprehensive result proven so far is a result by Daniil Rudenko on balanced polygons whose vertices lay upon the integer lattice.

#theorem[
  @rudenko_equidissection_2012 If $P$ is a balanced lattice polygon with odd integer area, then it cannot be divided into any odd number of triangles of equal area.
]

Notice that while Rudenko's is the most comprehensive, it does not cover all possible cases of the two previous theorems presented in this chapter as it only considers balanced lattice polygons with odd area. As a result of this, Iwan Pratons theorem on polyominos, and Kasimatis's theorem on centrally symmetric polygons still stand as non-subsumed theorems.

== Polyominos<poly>

In the previous section we introduced Stein's conjecture on balanced polygons and a number of sub-theorems which prove this conjecture for a specific subset of balanced polygons. One such sub-theorem introduced was on polyominos, polygons made up of gluings of squares. In this section we will prove that theorem as promised. The theorem, originally shown by Iwan Praton, is that all polyominos contain no odd equidissections.

We will begin by studying the structure of polyominos in @structurepoly, this will allow us to view polyominos as cells, and index each of these cells. We will then utilize this view of polyominos as cells to study the boundary word of a given polyomino in @boundarypoly, this will allow us to show that the boundary word of a given polyomino is related to the boundary word of each of its cells allowing us to prove our result for the case that a polyomino has odd area. We will then study how the boundary word of a cell of a given polyomino is effected by affine transformations with non-zero determinant in @transformpoly. This will guide us towards a representation of polyominos as matrices in @matrixpoly, which will allow us to prove our result.

=== The Structure of Polyominos<structurepoly>

To begin, we will study the structure of a given polyomino. Recall that polyominos are gluings of squares along congruent edges. We will refer to each square in a polyomino as a _cell_.

#definition[
  Every polyomino $P$ is constructed of a gluing of squares, each square which $P$ is constructed from is a _cell_ of $P$.
]

#example[
  An example of a polyomino and its division into cells is given in @polycells.
]

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
  placement: top,
)<polycells>

We will normalize the set of polyominos which we are studying by only investigating polyominos whose component cells are the unit square.

#proposition[
  Let $P$ be a polyomino, then there exists an area preserving affine transformation $A$ such that any cell of the polyomino $A(P)$ is a square of side length one whose vertices lie upon the integer lattice $ZZ^2$.
]
#proof[
  Let $P$ be a polyomino, then there exists a square $S$ such that $P$ is made up a gluing of translations of $S$. If $S$ has side length $s$, then the transformation which scales the plane by size $1/s$ carries the square $S$ to a side length and area of $1$.
]

For convenience, we will assume our polyominos to lie upon the integer lattice and be constructed of unit squares since we can carry any polyomino to such a polyomino while preserving the integrity of any possible equidissection. We will call such polyominos _lattice polyominos_.

#definition[
  A lattice polyomino is any polyomino who's vertices all lay on the integer lattice $ZZ^2$.
]

We can describe any such lattice polyomino by describing which squares on the integer lattice are included in such a polyomino. To facilitate this we will index cells on the _integer lattice_.

#definition[
  The $(i, j)$-th cell on the integer lattice is the square of length one with bottom left corner located at $(i, j)$.
]

We now have all of the information we need to begin to study the boundary word of any given polyomino.

=== The Boundary Word of a Polyomino<boundarypoly>

In the previous section we introduced polyominos, as well as indexed the cells of each polyomino, in this section we will begin to study the properties of the boundary word of polyominos.

Now, recall that if a polygon $P$ has a non-contractible boundary word relative to the $2$-adic coloring, then any dissection of $P$ contains a three-colored triangle relative to the $2$-adic coloring. This three-colored triangle must have an area which is inconsistent with an equidissection of $P$ into an odd number of triangles.

To show that a polyomino $P$ has a non-contractible boundary word we will define a valueing function on _cells_ of a polyomino based on a cells boundary word. Viewing the sum of the value of these boundary words allows us to show that a given polyomino has a non-contractible $2$-adic boundary word, allowing us to prove our result.

We will first define the direction of an $A B$ edge on the boundary word.

#definition[
  An $A B$ edge has a _counterclockwise_ orientation if it is colored $A$, then $B$ in a counterclockwise direction. If it is colored $A$, then $B$ in a clockwise direction it is oriented _clockwise_.
]

#lemma[
  The boundary word $W$ of a polygon is non-contractible if the number of counterclockwise $A B$ edges is equal to the number of counterclockwise $A B$ edges.
]<eqwd>

#proofsketch[
  This lemma is shown in a similar fashion as at @3contract, it can also be proven as a corollary of @3contract.
]

This will allow us to define the cell valueing function, which counts if a cell has a counter-clockwise $A B$ edge, a clockwise $A B$ edge, or no $A B$ edges.

#definition[
  We define the cell valueing function $cal(C)$ from the set of cells on the integer lattice to the integers as follows: Assign the value $+1$ to a counterclockwise $A B$ edge and the value $-1$ to a clockwise $A B$ edge. Assign a value of $+1$ to a cell if the sum of the values of its $A B$ edges is $+1$, and $-1$ if it is $-1$ and $0$ if the sum is $0$.
]

Since the value of a cell counts the number of $A B$ edges with clockwise or counterclockwise orientation present in a given cell, we can utilize this to show that the value of the boundary word of a polyomino is equivalent to the sum of the values of its cells. Notice further that a boundary word is contractible if and only if its value is equal to $0$. This allows us to show that any polygon containing an inequal number of $+1$ and $-1$ cells has non-contractible boundary word.

#corollary[
  Suppose a given polyomino $P$ has a number of $+1$ valued cells which isn't equal to its number of $-1$ valued cells. Then, its $2$-adic boundary word is non-contractible@praton_cutting_2002[Lemma 2].
]<complete>

#proof[
  Recall that a boundary word is non-contractible if the number of its clockwise oriented $A B$ edges is not equal to the number of  its counterclockwise oriented $A B$ edges as shown in @eqwd. Also notice that if there is an $A B$ edge on a cell which resides on the interior of the polyomino, then the adjoining cell contains a $B A$ edge. Then, if we take the sum of the values of each cell which makes up a polyomino, any edge lying on the interior of the polyomino does not contribute to this sum since the value contributed by the $A B$ edge is cancelled out by its corresponding $B A$ edge. So, the sum of the values of cells in a polyomino $P$ is equal to the number of counter-clockwise $A B$ edges minus the count of clockwise $A B$ edges on the boundary of $P$, which is zero if and only if these two numbers are equal. Therefore $P$ has a non-contractible boundary word since boundary words are only contractible if the number of $A B$ and $B A$ edges are equal.
]

So, our goal is to show that $P$ has an unequal number of $+1$ valued and $-1$ valued cells. If $P$ has odd area, this is trivial. For polyominos of even area, we will have to apply an affine transformation onto $P$ to create an uneven number of $+1$ valued and $-1$ valued cells, which we will begin to explore in the next section.

=== Transforming Polyominos<transformpoly>

In the previous section we showed that any polyomino with an unequal number of $+1$ and $-1$ valued cells has no odd equidissection. We showed the result for odd area polyominos, but for even area polyominos we must transform the polyomino utilizing an affine transformation with nonzero determinant to carry a polyomino to one which has an unequal number of $+1$ and $-1$ valued cells.

#definition[
  We will define the transformation function $f_(r, s): ZZ^2 -> QQ^2$ as $ f_(r, s)(x, y) = ((x)/(2^r), (y)/(2^s)). $ The transformed $p$-adic coloring of a polyomino $P$ for a given $r, s$ is the coloring $C_p (f_(r, s) (P))$.
]

#proposition[
  For any $r, s in ZZ$, $f_(r, s)$ is an affine transformation.
]

We will leave it up to the reader to verify that $f_(r, s)$ is an affine transformation by showing that $f_(r, s)$ for any $r, s in ZZ$ can be represented as the result of a linear transformation and a translation.

Recall that under the $2$-adic coloring function $C_2$, a point on the integer lattice $ZZ^2$ is colored $A$ if and only if its $x$ and $y$ coordinates are divisible by $2$. This gives rise to the following lemma.

#lemma[
  Let $x, y in ZZ^2$, then $C_p (f_(r, s)(x, y)) = A$ if and only if $x equiv 0 mod 2^(r + 1)$ and $y equiv 2^(s + 1) mod 2$.
]
#proof[
  Any integer has positive $p$-adic valuation if and only if it is even, so any point on the integer lattice is colored $A$ if and only if its $x$ and $y$ coordinates are even by our construction of $C_2$.
]

Since the pattern of $A$ colored points on the integer lattice $ZZ^2$ is dependent on the value of their points modulus a given value, this pattern is repetitive! This allows us to define the pattern which the $+1$ and $-1$ valued cells form under the transformed $p$-adic coloring for a given value of $r$ and $s$.

#proposition[@praton_cutting_2002
  A cell is colored $+1$ if and only if its bottom left or top right corner is colored $A$. A cell is colored $-1$ if and only if its bottom right or top left corner is colored $A$.
]
#proofsketch[
  This proposition can be easily shown by enumerating the possible colors relative to the $2$-adic coloring function of each point on the integer lattice.
]

#lemma[
  @praton_cutting_2002
  The $+1$ valued cells in a given transformed polyomino $f_(r s ) (T)$ are at $(i, j)$ and $(i + 1, j + 1)$ where $i equiv 0 mod 2^(r + 1)$ and $j equiv 0 mod 2^(s + 1)$. The $-1$ valued cells are $(i + 1, j)$ and $(i, j + 1)$.
]<valuedcells>

This lemma follows as a direct result of application of the previous proposition and lemma.

#proof[
  Let $x, y in ZZ^2$ such that $x equiv 0 mod 2^(r + 1)$ and $y equiv 2^(s + 1) mod 2$ then the bottom left corner of the cell $(x, y)$ is colored $A$, and so it is assigned the value $+1$. Similarly, the cell $(x + 1, y + 1)$ is assigned the value $+1$, and the cells $(x + 1, y)$ and $(y + 1, x)$ are assigned the value $-1$.
]

The values of any given cell for a given $r$ and $s$ can then be enumerated on a handy graph.

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
  caption: [The pattern of valuein for cells of $T$ for a given $r$ and $s$.],
)<bw>


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
    caption: [The pattern of valueing for cells of $T$ for a given $r, s = 0$.],
  )
]


// We can utilize this pattern to show exactly when a cell is valued $+1$ or $-1$.

// #theorem[
//   A cell is valued $+1$ if and only if its lower right or upper left corner is colored $A$. Similarly a cell is valued $-1$ if and only if its upper right or lower left corner is colored $A$. All other cells are uncolored.
// ]

// #proof[
//   Let $C$ be a cell whose lower right corner is colored $A$, then $C$ is one of the following squares:

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

We will define an indicator function, which measures if a cell at a certain position is present in a given polyomino. This will allow us to represent the total value sum of a polyomino as a mathematic expression.

#definition[
  For a given polyomino $T$ we define the function $chi_(i, j)(T) = 1$ if cell $(i, j)$ is $T$, and $0$ if the cell is not present.
]

Then, we can measure directly the number of $+1$ valued cells in a polyomino, the number of $-1$ valued cells, and the total value of a polyomino.

#theorem[
  @praton_cutting_2002
  The sum of the values of each of a polyominos cells is equivalent to
  $
    sum_((i, j) in ZZ^2) chi_(i, j) cal(C)(i, j).
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
]<sumvalues>

These sums look daunting, however, notice that we are simply counting the number of $+1$ and $-1$ cells which are filled, the locations of these cells are visually shown in @bw.

#proof[
  Recall that in @valuedcells, we have shown that for a given $r, s in ZZ$,$ cal(C) (C_2 (f_(r, s) (x, y))) = +1 $ if and only if $ (x, y) equiv (0, 0) mod (2^(r + 1), 2^(s + 1)) "or" (x, y) equiv (1, 1) mod (2^(R + 1), 2^(s + 1)) $ and $ cal(C) (C_2 (f_(r, s) (x, y))) = -1 $ if and only if $ (x, y) equiv (1, 0) mod (2^(r + 1), 2^(s + 1)) "or" (x, y) equiv (0, 1) mod (2^(R + 1), 2^(s + 1)). $ Therefore, the number of $+1$ or $-1$ cells is simply the sum of $chi_(i, j)$ in all such possible locations of a $+1$ or $-1$ cell.
]

Now, remember, we are looking for polyominos in which there exists some affine transformation of the form $f_(r, s)$ where the total value sum of a polyomino is unequal. We will do so by studying polyominos for which there are no $f_(r, s)$ transformations for a specific set of values of $r$ and $s$.

#definition[
  A polyomino $T$ is $m$-balanced if for every value of the positive integers $r$ and $s$ such that $r + s = m$ the count of $+1$ valued cells is equal to the count of $-1$ valued cells.
]

Notice that if $T$ is not $m$-balanced, then there exists an affine transformation in which we can show that every division of $T$ into an odd number of triangles contains at least one $3$-colored triangle. In the next section we will introduce a representation of a polyomino as a matrix which allows us to easily determine if a given polyomino is $m$-balanced, ultimately allowing us to provide our proof.

=== The representation of Polyominos as Matrices<matrixpoly>

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
  caption: [The polyomino $T$ for the sake of @matexampl],
  placement: bottom,
)<examplepolyomino>.

In the previous section we introduced transformations of the form $f_(r, s)$. We explored such transformations, and eventually introduced the concept of an $m$-balanced polyomino. In this section we will utilize a representation of a given polyomino as a matrix which will allow us to show that for every polyomino $T$ there exists an $m$ such that $T$ is not $m$-balanced, allowing us to provide the proof which we have been working towards.

Notice that for a given value of $m$, and any $r, s in ZZ^+$ such that $r + s = m$, the pattern of valueing on cells repeats every $2^(m + 1)$. We will utilize this fact to represent polyominos as matrices, where a zero in a given cell of the matrix represents there is no cell present at this location in the polyomino, and a one represents there is a cell present at this location in the polyomino. Since the pattern of coloring repeats every $2^(m+1)$ cells, we can represent our polyomino in a matrix which is $2^(m+1)$ cells wide and tall. This represents instead how many cells there are in a polyomino whose coordinates fall upon a certain location in our value pattern.

#definition[
  The matrix C associated with a polyomino $T$ and an $m in ZZ$ is defined as $ c_(i j) = sum_(i' equiv i mod 2^(m + 1)) sum_(j' equiv j mod 2^(m+1)) chi_(i' j')(T). $
]

#example[
  Suppose $T$ is the polyomino shown in @examplepolyomino. Then, the corresponding matrix $C$ for $T$ with $m = 4$ is
  $
    mat(
      2, 1, 1, 1;
      1, 0, 0, 1;
      1, 1, 0, 1;
      1, 1, 0, 0;
    ).
  $
  For $m = 2$, the corresponding matrix to $T$ is:
  $ mat(
    4, 4;
    2, 2;
  ) $.
]<matexampl>

In topological terms, $c_(i j)$ counts how many times the $(i, j)$-th cell of a $m times m$ torus is covered when a polyomino $T$ is placed on its surface. There is another non-topological way to think about this. The pattern of an $m$-balanced polygon in either axis is a repetitive pattern of at most $2^(m+1)$ as shown in our handy guide to the patterns of our colorings @bw. This means that for the purpose of deciding if a given polyomino is $m$-balanced, we do not lose any information by encoding the values of its cells onto a matrix modulus $2^(m+1)$ in either axis.

We will then define a function based on this matrix which counts the number of cells a given polyomino $P$ has which are present in a given position of the repetitive coloring pattern defined by a certain $r$ and $s$. This pattern might repeat multiple times for a given $m$, so we must count them multiple times.

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
      (6, 0),
      (6, 1),
      (6, 2),
      (6, 3),
      (6, 4),
      (6, 5),
      (6, 6),
      (0, 6),
      (1, 6),
      (2, 6),
      (3, 6),
      (4, 6),
      (5, 6),
    ) {
      draw-cell(cell, [$0$])
    }

    for cell in (
      (5, 0),
      (5, 1),
      (5, 2),
      (5, 3),
      (5, 4),
      (5, 5),
      (0, 5),
      (1, 5),
      (2, 5),
      (3, 5),
      (4, 5),
    ) {
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
    draw-cell((6, -1), [$2^(m + 1) - 1$], stroke: none)
    draw-cell((-1.5, 6), [$2^(m + 1) - 1$], stroke: none)
    draw-cell((-1.5, 4), [$2^(s + 1) - 1$], stroke: none)
  }),
  caption: [The pattern of coloring for cells of a matrix $C$ for a given $r$ and $s$. The innner pattern repeats until the whole matrix is filled.],
  placement: top,
)

#definition[
  We define the function
  $
    Gamma^(r, s, a, b) (C) = sum_(i equiv a mod 2^(r + 1)\ 0 <= i < 2^(m + 1)) sum_(j equiv b mod b^(s + 1)\ 0 <= j < 2^(m + 1)) c_(i j).
  $
]

This allows us to easily count the number of $+1$ and $-1$ valued cells in a given polyomino.

#lemma[
  @praton_cutting_2002
  The number of $+1$ valued cells in a polyomino $T$ for a given $r, s$ is equal to $Gamma^(r, s)_(0, 0)(C) + Gamma^(r, s)_(1, 1)$. The number of $-1$ valued cells is equal to $Gamma^(r, s)_(1, 0)(C) + Gamma^(r, s)_(0, 1)$.
]

#proof[
  If the function $ Gamma_(r, s,x, y) (C) = n $ then there exists a set of $n$ cells $X$ in our polyomino such that for any cell indexed $(i, j)$ is in $X$ if and only if it satisfies the condition $i equiv x mod 2^(r + 1) "and" j equiv x mod 2^(s + 1).$ Now, recall from @valuedcells that any $+1$ valued cell is indexed $(i, j)$ such that $i equiv 0 mod 2^(r + 1) "and" j equiv 0 mod 2^(s + 1) "or" i equiv 1 mod 2^(r + 1) "and" 1 equiv 0 mod 2^(s + 1).$ Therefore the number of $+1$ valued cells in a polyomino $T$ is provided by $ Gamma^(r, s)_(0, 0)(C) + Gamma^(r, s)_(1, 1). $ By similar application of @valuedcells it follows that the number of $-1$ valued cells is equal to $ Gamma^(r, s)_(1, 0)(C) + Gamma^(r, s)_(0, 1). $
]

This provides a way in which to measure if a matrix represents an $m$-balanced polyomino.

#proposition[
  @praton_cutting_2002[Lemma 3]
  $T$ is $m$-balanced if and only if $ Gamma^(r, s)_(a, b)(C) + Gamma^(r, s)_(a + 1, b + 1) (C) = Gamma^(r, s)_(a + 1, b)(C) + Gamma^(r, s)_(a, b + 1) $ for all $r, s in ZZ^+$ such that $r + s = m$ and $a, b <= m$.
]<gammambalance>

#proof[
  The number of $+1$ and $-1$ valued cells in $T$ is given by $Gamma^(r, s)_(a, b)(C) + Gamma^(r, s)_(a + 1, b + 1) (C)$ and $Gamma^(r, s)_(a + 1, b)(C) + Gamma^(r, s)_(a, b + 1)$. If $T$ is $m$-balanced these two values must be equal for all $r + s = m$.
]

Now, we will get to the meat of our proof technique. Given an $m$-balanced polyomino $P$, we can construct a smaller $m$-balanced polyomino by contracting the matrix associated with $P$. Notice that this mirrors the technique of contracting the boundary word which we utilized in our proof of Monsky's Theorem.

#definition[
  Let $C$ be a $2^(m + 1) times 2^(m + 1)$ matrix. Then, we construct a $2^m times 2^m$ matrix $C'$ where
  $
    c'_(i, j) = cases(
      c_(2 i, j) + c_(2i, j + 2^m) "if" i "is even,",
      c_(2i - 1, j) + c_(2i - 1, j + 2^m) "otherwise."
    )
  $
]

#lemma[If $C$ is $m$-balanced, then $C'$ is $(m - 1)$-balanced. @praton_cutting_2002[Lemma 4]]
#proof[
  We proceed with our proof by showing that $C'$ provides the condition of @gammambalance. Let $r$ and $s$ such that $r + s = m - 1$. If $a$ is even then,
  $
    Gamma^(r, s)_(a, b)(C') &= sum_(i equiv a mod 2^(r + 1)\ 0 <= i < 2^(m)) sum_(j equiv b mod b^(s)\ 0 <= j < 2^(m)) c'_(a, b) \
    &= sum_(i equiv a mod 2^(r + 1)\ 0 <= i < 2^(m)) sum_(j equiv b mod b^(s)\ 0 <= j < 2^(m)) c_(2a, b) + c_(2a, b + 2^m) \
    &= sum_(i equiv a mod 2^(r + 2)\ 0 <= i < 2^(m + 1)) sum_(j equiv b mod b^(s + 1)\ 0 <= j < 2^(m + 1)) c_(a, b) \
    &= Gamma^(r + 1, s)_(a, b) (C).
  $
  A similar calculation shows this equivalency for the odd case. Then,
  $
    Gamma^(r, s)_(a, b)(C') + Gamma^(r, s)_(a + 1, b + 1) (C') &= Gamma^(r, s)_(a + 1, b)(C') + Gamma^(r, s)_(a, b + 1) (C')
  $
  since $ Gamma^(r + 1, s)_(a, b)(C) + Gamma^(r + 1, s)_(a + 1, b + 1) (C) &= Gamma^(r + 1, s)_(a + 1, b)(C) + Gamma^(r + 1, s)_(a, b + 1) (C). $
  Therefore $C'$ is $(m - 1)$-balanced.
]

As we continue with these contraction steps, we are eventually presented with a $2 times 2$ matrix. We will define a function $beta(C)$ for a matrix $C$ which takes in a matrix, and provides the corresponding contracted matrix.

#definition[
  Let $beta(C)$ be the $2 times 2$ matrix where
  $
    beta_(i j) = sum_(i' equiv i mod 2) sum_(j' equiv j mod 2) c_(i'j').
  $
]

#theorem[
  @praton_cutting_2002[Theorem 5]
  Let $C$ be an $m$-balanced matrix of size $2^(m + 1) times 2^(m + 1)$, then the sum of the entries of $beta_(C)$ is divisible by $2^(m+1)$.
]

#proof[
  @praton_cutting_2002
  We will proceed via induction on the following three statements:
  + Every element of $beta(C)$ is divisible by $2^(m - 2)$,
  + Every row and column sum of $beta(C)$ is divisible by $2^(m-1)$,
  + and the sum of the entries in $beta(C)$ is divisible by $2^(m)$.

  First suppose $m = 0$, then every element of $beta(C)$ is divisible by $2^(-1)$, and each of its row sums and column sums are divisible by $2^0 = 1$. Now, $C$ is vacously $0$-balanced so $beta_(00) + beta_(11) = beta_(01) + beta_(10)$, which implies the sum of the entries in $beta(C)$ is divisible by $2$.

  Now, suppose for some $m - 1$ the three statements which we are performing induction upon hold true. Consider the matrix $alpha(C)$ defined by $ alpha_(i j)(C) = sum_(i' equiv i mod 4) sum_(j' equiv j mod 2) c_(i j). $ Notice that the matrix $ tilde(alpha) = mat(
    alpha_(0 1), alpha_(1 1);
    alpha_(0 0), alpha_(1 0);
  ) = beta(C'). $ Since $C'$ is $(m - 1)$-balanced, by our previous assumption $beta(C') = tilde(alpha)$ satisfies the condition that the sum of its entries are divisible by $2^(m)$ and that both the sums $alpha_(0 0) + alpha_(1 1)$ and $alpha_(0 1) + alpha_(1 0)$ are divisible by $2^(m - 1)$. This implies that $alpha_(00) equiv alpha_(20) mod 2^(m - 1)$. Then $alpha_(00) + alpha_(20) = beta_(00)$ is divisible by $2^(m - 1)$ since each of these are divisible by $2^(m-2)$. We can use a similar argument to show that the rest of the elements of $beta(C)$ are divisible by $2^(m-1)$. Thus, we have shown that the first statement holds true for $m$. Now, notice that by our supposition, the sum of each column of $alpha(C)$ is divisible by $2^(m - 1)$ and that the sum of any two adjacent columns is divisible by $2^m$. Notice that $ beta_(00) + beta_(01) = alpha_(00) + alpha_(20) + alpha_(01) + alpha_(21). $ Then the sum of the first column of $beta(C)$ is divisible by $2^m$. Via a similar argument we can establish divisibility by $2^m$ for the rest of the rows and columns of $beta(C)$. This implies $beta_(00) + beta_(01) equiv 0$ or $2^m$ $mod 2^(m + 1)$, and similarly for the sum $beta_(10) + beta_(11)$. Recall that $C$ is balanced, so $ beta_(00) + beta_(11) = beta_(01) + beta_(10). $ Then, $ beta_(00) + beta_(01) = beta_(10) + beta_(11). $ Suppose the sum $ beta_(00) + beta_(01) + beta_(10) + beta_(11) $ is not divisible by $2^(m + 1)$. Then $ beta_(00) + beta_(01) equiv.not beta_(10) + beta_(11) mod 2^(m + 1). $ Without loss of generality we may assume $ beta_(00) + beta_(01) equiv 0 mod 2^(m + 1). $ Then $ beta_(00) + beta_(11) equiv 2^(m - 1) mod 2^m. $ It follows that $ beta_(11) equiv 2^(m - 1) - beta_(00). $ Also, $beta_(01) equiv - beta_(00) mod 2^m$. Then $ beta_(01) + beta_(11) equiv 2^(m - 1) mod 2^m $ which is a contradiction of the fact that all of the row and column sums of $beta(C)$ are divisible by $2^m$. Then the sum $ beta_(00) + beta_(01) + beta_(10) + beta_(11) $ is divisible by $2^(m + 1)$ and our result follows via induction.
]

We can now prove the final theorem, by tracing these contraction steps in reverse to show that any matrix representing a polyomino cannot be $m$-balanced, showing that there must exist some $r$ and $s$ such that the number of $+1$ squares is inequal to the number of $-1$ squares, providing non-contractibility of the boundary word, allowing us to prove our theorem.

#theorem[
  @praton_cutting_2002
  There is no equidissection of any polyomino with an odd number of triangles.
]

#proof[
  Let $T$ be a polyomino with area $A$ where $2*(A) = m$. Then, if $T$ is $m$-balanced and so is $C(T)$. This would imply the sum of all entries in $C(T)$ which is equal to A, is divisible by $2^(m + 1)$. However, this would contradict the $2$-adic valuation of $A$ being equal to $m$. So, $T$ is not $m$-balanced. Then there exists some $r, s$ with $r + s = m$ such that there are an uneven number of black and white squares allowing us to apply @complete to show there exists an three triangle $t$ in any odd dissection of $T$ which precludes odd equidissection. Therefore, any odd dissection of $T$ is not an equidissection.
]

The meat of this proof technique is the topological approach of valueing cells and finding that the sum of the individual values of glued cells is equal to the value of the mass of glued cells. In the next section we will expand on this technique to provide the proof that no odd area balanced lattice polygon has odd equidissection.

== Equidissections of Odd Area Balanced Lattice Polygons

// affine transformation to area preserving affine transformation
// ABCD - alpha beta gamma delta
// p-adic boundary word

So far in this chapter we have introduced Stein's conjecture on the equidissection of balanced polygons and explored theorems which provide subsets of this conjecture. In the previous section we provided a proof of the subset of this conjecture concerning polyominos. The rest of this chapter is concerned with Daniil Rudenko's proof that there exists no odd equidissection of any odd area balanced lattice polygon.

In @even-odd we will introduce a $4$-coloring on lattice polygons which we will call the _even-odd_ coloring that measures the parity of a certain point on the integer lattice. We will then introduce a different way of viewing the boundary word as a formal sum in @boundarysumsum. This perspective on the boundary word will introduce many insights into the even-odd coloring and its relation to our standard $p$-adic $3$-coloring. We will utilize these insights to draw an equivalence between the area of a balanced lattice polygon and the boundary sum it contains in @area. We will then conclude with the Daniil Rudenko's proof that there exists no odd equidissection of any odd area balanced lattice polygon.

=== The Even-Odd Coloring<even-odd>

In this section we will construct a 4-coloring on lattice polygons known as the _even-odd_ coloring which we will relate to the $p$-adic three coloring on polygons.

If a set of vertices lay on the integer lattice we can directly measure their parity instead of measuring an abstraction of their parity via the $p$-adic metric. We will define the _even-odd mapping_ as a mapping which measures the parity of a integer plane vertex.

#definition[
  We will define the even-odd mapping $ overline(star): ZZ^2 -> {(0, 0), (0, 1), (1, 0), (1, 1)} $ for every $(x, y) in ZZ^2$ as $overline(star)(x, y) = (0, 0)$ if $x equiv 0 mod 2$ and $y equiv 0 mod 2$, $overline(star) (x, y) = (1, 0)$ if $x equiv 1 mod 2$ and $y equiv 0 mod 2$, and so on.
]

Notice that such a mapping naturally defines a $4$-coloring on integer vertices.

#definition[
  The even-odd coloring function $C^4: ZZ^2 -> {alpha, beta, gamma, delta}$ is defined as follows: For $(x, y) in ZZ^2$, the vertex $(x, y)$ is colored $alpha$ if $overline(star)(x, y) = (0, 0)$, $beta$ if $overline(star)(x, y) = (1, 0)$, $gamma$ if $overline(star)(x, y) = (1, 1)$, and $delta$ if $overline(star)(x, y) = (0, 1)$.
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
          value,
        )
        if stroke != none {
          mark(
            (pos.at(0) + cell-size / 8, pos.at(1) + cell-size / 8),
            (pos.at(0) - cell-size / 2, pos.at(1) - cell-size / 2),
            symbol: ")>",
            scale: 1,
            stroke: stroke,
          )
        }
      }
    }

    draw-cell((0, 0), [$alpha$])
    draw-cell((1, 1), [$gamma$])
    draw-cell((1, 0), [$beta$])
    draw-cell((0, 1), [$delta$])

    draw-cell((2, 0), [$alpha$])
    draw-cell((3, 1), [$gamma$])
    draw-cell((3, 0), [$beta$])
    draw-cell((2, 1), [$delta$])

    draw-cell((0, 2), [$alpha$])
    draw-cell((1, 3), [$gamma$])
    draw-cell((1, 2), [$beta$])
    draw-cell((0, 3), [$delta$])

    draw-cell((2, 2), [$alpha$])
    draw-cell((3, 3), [$gamma$])
    draw-cell((3, 2), [$beta$])
    draw-cell((2, 3), [$delta$])

    for x in range(0, 4) {
      draw-cell((x, -1), [#x], stroke: none)
      draw-cell((-1, x), [#x], stroke: none)
    }

    draw-cell((4, -1), [$dots.c$], stroke: none)
    draw-cell((-1, 4), [$dots.v$], stroke: none)
  }),
  caption: [The pattern of coloring for the integer lattice under $C^4$, the even-odd coloring function. The label of each cell notates the color of its bottom left vertex.],
)

To disambiguate this coloring from the $p$-adic coloring we have been working with, moving forward we will call the boundary word resulting from the even-odd coloring function the _even-odd boundary word_ and the boundary word resulting from the $p$-adic valuation the _$p$-adic boundary word_.  As we will find, these two colorings are intimately related. If a vertex has a certain even-odd coloring, then it has a certain $p$-adic coloring.

#proposition[
  @rudenko_equidissection_2012[pp. 9]
  Let $(x, y) in ZZ^2$. Then,
  + $C_2(x, y) = A$ if $C^4(x, y) = alpha$,
  + $C_2(x, y) = B$ if $C^4(x, y) = delta$,
  + and $C_2(x, y) = C$ if $C^4(x, y) = gamma, beta$.
]
#proofsketch[
  One can deduce the positivity or negativity of $2$-adic valuation of an integer by its parity. This allows us to find the $2$-adic coloring of each of these lattice points.
]

This property gives an equivalence to the $2$-adic coloring of the even-odd mapping of a integer valued vertex and the $2$-adic coloring of that vertex. We can compare the even-odd coloring of a vertex and the $p$-adic coloring of a vertex to produce contradiction. We will utilize this strategy to produce our proof of Rudenko's Theorem.

=== The Boundary Sum<boundarysumsum>

//edits to make: make Omega(P) Omega_C(P) A B C D -> alpha beta gamma delta, sigma_1 sigma_2 sigma_3

In the previous section we defined a $4$-coloring over the set of points on an integer lattice. In our proof of Monsky's Theorem we studied the boundary produced by a $3$-coloring as a word. While the properties of boundary words produced by $4$-colorings are interesting, we will not explore them in this chapter. We will instead during this chapter view the boundary induced by $4$-colored words as _formal sums_ which we will introduce later. First, we will provide a bit more exposition on boundary words which we will use to relate the $4$-colored boundary sum to the $3$-colored boundary word.

The first definition relates to when a cyclic word cannot be contracted any further.

#definition[
  Let $W$ be a cyclic word. A _contracting sequence_ on $W$ is a sequence of contracting steps on $W$ resulting in a cyclic word $W'$. A _complete contracting sequence_ is a sequence of contracting steps on $W$ resulting in a cyclic word $W'$ which cannot have any further contracting steps performed on it. A _contracted cyclic word_ is any cyclic word which cannot have any further contracting steps performed on it.
]

This allows us to define a theorem which shows that the contractibility game contains no strategy whatsoever. That is, a cyclic word is non-contractible if any contracting sequence on a cyclic word finds a dead end.

#theorem[
  @abrams_generalized_2022[Lemma 11]
  Let $W$ be a cyclic word. $W$ is non-contractible if and only if any complete contracting sequence on $W$ results in a non-empty cyclic word.
]

We can now proceed to our algebraic view of the boundary word. Such a view of the boundary word will be provided as a structure called a formal sum which counts the coloring of certain edges on the boundary of a polygon.

#definition[
  A formal sum $S$ is a sum over a set of elements of a set $X$ is a sum $ S = sum_(x in X) c_x x, $ where all $c_x$ are integer coefficients.
]

#example[
  For a set $X = {alpha, beta, gamma, delta}$, a formal sum over $X$ could be $ alpha + beta + beta + gamma + delta. $ As a convention, if we have multiple of the same element in a formal sum we can add a coefficient to that element to represent the number of that element, for example $ alpha + beta + beta + gamma + delta = alpha + 2 beta + gamma + delta. $
]

We will define a formal sum known as the boundary sum which represents the coloring of the boundary of a polygon as a formal sum of colored edges.

#definition[
  The boundary sum of a polygon $P$ relative to a coloring function $C$ with colors $Q$ is the sum $ Omega(P) = sum_(X in Q) sum_(Y in Q) mu_(X, Y) X Y $ where $mu_(X, Y)$ is the count of edges on the boundary of $P$ colored $X, Y$.
]

We can then define a group over the set of all such boundary sums. This will allow us to represent the boundary of a polygon as the sum of its interior which will power many of our later proofs.

#definition[
  The contraction group is the group over all boundary sums of any polygon $P$ relative to a coloring function $C$ with colors $Q$. Notice that since these sets represent a cyclic word they must represent a cycle. That is, for $X, Y in Q$ if a formal sum $S$ contains an $X Y$ edge, then it must contain an edge starting with $Y$. First, we will name the identity element $0$. For a given $X, Y$ in $Q$ we define $X Y = -Y X$ and $X X = 0$. Notice that since formal sums are sums, we can take two formal sums belonging to the contraction group $W$ and $W'$ and we achieve the sum $W + W'$ by substituting in the corresponding formal sums for both $W$ and $W'$.
]

#figure(
  diagram(
    node-stroke: .1em,
    edge-stroke: .1em,
    cell-size: 20mm,
    node-shape: circle,
    node-inset: 0.25em,
    node-defocus: 0,
    node((0, 1))[$alpha$],
    node((1, 1))[$beta$],
    node((1, 0))[$gamma$],
    node((0, 0))[$delta$],
    edge((0, 0), (0, 1), "--"),
    edge((0, 1), (1, 1), "--"),
    edge((1, 1), (1, 0), "--"),
    edge((1, 0), (0, 0), "--"),
    edge((0, 0), (1, 1), "--"),
    edge((1, 0), (0, 1), "--"),
    edge((0, 0), (0, 1), "->-"),
    edge((0, 1), (1, 1), "->-"),
    edge((1, 1), (1, 0), "->-"),
    edge((1, 0), (0, 0), "->-"),

    node((1.25, 0.5), stroke: none)[$+$],

    node((1.5, 1))[$alpha$],
    node((2.5, 1))[$beta$],
    node((2.5, 0))[$gamma$],
    node((1.5, 0))[$delta$],
    edge((1.5, 0), (1.5, 1), "--"),
    edge((1.5, 1), (2.5, 1), "--"),
    edge((2.5, 1), (2.5, 0), "--"),
    edge((2.5, 0), (1.5, 0), "--"),
    edge((1.5, 0), (2.5, 1), "--"),
    edge((2.5, 0), (1.5, 1), "--"),

    edge((1.5, 0), (2.5, 0), "->-"),
    edge((2.5, 0), (2.5, 1), "->-"),
    edge((2.5, 1), (1.5, 0), "->-"),
    edge((2.5, 0), (2.5, 0), "->-", bend: 160deg),

    node((2.75, 0.5), stroke: none)[$=$],

    node((3, 1))[$alpha$],
    node((4, 1))[$beta$],
    node((4, 0))[$gamma$],
    node((3, 0))[$delta$],
    edge((3, 0), (3, 1), "--"),
    edge((3, 1), (4, 1), "--"),
    edge((4, 1), (4, 0), "--"),
    edge((4, 0), (3, 0), "--"),
    edge((3, 0), (4, 1), "--"),
    edge((4, 0), (3, 1), "--"),
    edge((3, 0), (3, 1), "->-"),
    edge((3, 1), (4, 1), "->-"),
    edge((4, 1), (3, 0), "->-"),
  ),
  caption: [A representation of the addition of $Omega(P)$ and $Omega(P')$ from @boundaddexmp.],
)<boundadd>

#example[
  Consider the two polygons, $P$ and $P'$ as shown in @boundadd with boundary word $ W = alpha beta gamma delta "and" W' = gamma beta delta gamma. $ Then, $ Omega(P) = alpha beta + beta gamma + gamma delta + delta alpha "and" Omega(P') = gamma beta + beta delta + delta gamma + gamma gamma. $ So, $ Omega(P) + Omega(P') &= alpha beta + beta gamma + gamma delta + delta alpha + delta beta + beta delta + delta gamma + gamma gamma \ &= alpha beta + beta gamma + gamma delta - alpha delta - beta gamma + beta delta - gamma delta + 0 \ &= alpha beta - alpha delta + beta delta. $.
]<boundaddexmp>

// #theorem[
//   Let $P$ be a polygon with a dissection $T$ such that for all $t in T$, $t$ is not three-colored relative to the $p$-adic coloring function. Then the $p$-adic boundary word of $T$ is contractible.
// ]

Each four colored boundary sum can be factored into the sum of multiples of three triangles. In algebraic terms, the contracting group is generated by three triangles.

#theorem[
  #footnote[
    A proof of this theorem is provided as a part of @rudenko_equidissection_2012[Lemma 3]
  ] Let $W$ be a boundary sum derived from the even-odd coloring function. Then, there exists a $mu_1, mu_2, mu_3 in ZZ$ such that $ omega(W) = mu_1 (alpha beta + beta gamma + gamma alpha) + mu_2 (alpha gamma + gamma delta + gamma alpha) + mu_3 (beta delta + delta gamma + gamma beta). $
]

The proof of this theorem follows from the fact that our group is representative of the set of cycles over the connected graph with four vertices $K_4$.
#figure(
  diagram(
    node-stroke: .1em,
    edge-stroke: .1em,
    cell-size: 30mm,
    node-shape: circle,
    node-inset: 0.25em,
    node-defocus: 0,
    node((0, 1))[$alpha$],
    node((1, 1))[$beta$],
    node((1, 0))[$gamma$],
    node((0, 0))[$delta$],
    edge((0, 0), (0, 1)),
    edge((0, 1), (1, 1)),
    edge((1, 1), (1, 0)),
    edge((1, 0), (0, 0)),
    edge((0, 0), (1, 1)),
    edge((1, 0), (0, 1)),
  ),
  caption: [The connected graph with 4 vertices, known as $K_4$.],
)
The minimum number of $3$ cycles which cover a given graph $G$ is equivalent to the number of edges in $G$ minus the number of edges in a spanning tree of $G$.
#figure(
  diagram(
    node-stroke: .1em,
    edge-stroke: .1em,
    cell-size: 30mm,
    node-shape: circle,
    node-inset: 0.25em,
    node-defocus: 0,
    node((0, 1))[$alpha$],
    node((1, 1))[$beta$],
    node((1, 0))[$gamma$],
    node((0, 0))[$delta$],
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
    node-inset: 0.25em,
    node-defocus: 0,
    node((0, 1))[$alpha$],
    node((1, 1))[$beta$],
    node((1, 0))[$gamma$],
    node((0, 0))[$delta$],
    edge((0, 0), (0, 1)),
    edge((0, 1), (1, 1)),
    edge((1, 1), (1, 0), "--"),
    edge((1, 0), (0, 0), "--"),
    edge((0, 0), (1, 1), "--"),
    edge((1, 0), (0, 1)),
  ),
  caption: [A spanning tree of $K_4$, with its removed edges highlighted. Notice how each removed edge defines a unique triangle, and the set of each triangle contains every edge on $K_4$.],
)

#definition[
  We will denote the three cycles which every boundary sum can be factored into as follows:
  $
    sigma_1 & = alpha beta + beta gamma + gamma alpha \
    sigma_2 & = alpha gamma + gamma delta + gamma alpha \
    sigma_3 & = beta delta + delta gamma + gamma beta \
  $
]

Since each of these triangles contain a unique edge which neither of the other triangles contain, the only way for a boundary sum to be equal to the identity of the contracting group is for it to contain none of these three triangles. This gives rise to the following theorem.

#theorem[
  Let $P$ be a polygon with a coloring function $C$ over the set ${alpha, beta, gamma, delta}$ such that $Omega_C (P) = mu_1 sigma_1 + mu_2 sigma_2 + mu_3 sigma_3$ for $mu_1, mu_2, mu_3 in ZZ$. Then, $Omega(W) = 0$ if and only if $mu_1 = mu_2 = mu_3 = 0$.#footnote[
    A proof of this theorem is provided as a part of @rudenko_equidissection_2012[Lemma 3]
  ]
]

The proof of this theorem can be provided by verifying that there is no way to represent any of these three cycles $sigma_1, sigma_2, sigma_3$ as a multiple of the other two.

So far we have considered $4$-colored boundary sums, however we can also consider $3$-colored boundary sums.

#theorem[
  Let $P$ be a polygon such that $Omega_C_2 (P) != 0$. Then, the $2$-adic boundary word $W$ of $P$ is non-contractible.
]<lemma2>

#proof[
  Suppose for the sake of contradiction there exists a polygon $P$ with boundary word such that $Omega_C_2 (P) != 0$ and the $2$-adic boundary word $W$ of $P$ is contractible. Notice that any dissection of $P$ contains no three colored triangle since its boundary word is contractible. Also notice: $ Omega(C_p (A(P))) = sum_(t in T) Omega_C_2 (t), $ for a given dissection $T$ of $A(P)$. Any triangle which is not three colored is either colored $A B A$, $A B B$, $A C C$, $A C A$ $C B B$ or $B C B$ relative to $C_2$. For each of these triangles $omega_C_2 (A(P)) = 0$. Then, $ Omega_C_2 (A(P)) = sum_(t in T) Omega_C_2 (t) = 0. $ Our result follows by contradiction.
]

We can stretch this proof technique to a stronger theorem by applying affine transformations to it. For this theorem we will restrict our attention to _area preserving affine transformations_, those which do not effect the area of polygons.

#definition[
  An area preserving affine transformation is an affine transformation whos linear component has a determinant of $1$.
]

The fact that area preserving affine transformations, well, preserve area allows us to exploit the fact that they also preserve the $p$-adic valuation of area.

#corollary[
  @rudenko_equidissection_2012[Lemma 2]
  Let $P$ be a polygon with dissection $T$ such that every $2* ("Area" t) > 0$ for all $t in T$. Then $Omega_C_2 ( A (P)) = 0$ for any affine transformation $A$ which preserves area.
]

#proof[
  #footnote[This proof follows the proof provided by #cite(<rudenko_equidissection_2012>, form: "prose", supplement: [Lemma 2]).]
  Let $t$ be a triangle such that $2* ("Area" t) > 0$, and $A$ be an affine transformation which preserves area. Notice that $"Area" A(t) = "Area" t$ so $ 2*("Area" A(t)) = 2*("Area" t) > 0. $ Then $"Area" A(t)$ is not three colored by reverse application of @triarea. So $Omega(A(t)) = 0$. Therefore $ Omega_C_p (A(P)) = sum_(t in T) Omega_C_p A(t) = 0. $
]

To better exploit this property of area preserving affine transformations, we will define a coloring function explicitly based on these transformations.

#definition[
  We will define the function $C^A_2: ZZ^2 -> {A, B, C}$ as $C^A_2 (x, y) = C_2 (A(x, y))$ for a given area preserving affine transformation $A$.
]

This coloring function is craftily defined to commute with the $overline(star)$ function which we have defined the even-odd coloring on.

#theorem[
  Let $(x, y) in ZZ^2$ and $A$ be an area preserving affine transformation, then $C_2^A (overline((x, y))) = C_2^A (x, y)$.
]

#proof[
  #footnote[This proof follows from the proof provided by #cite(<rudenko_equidissection_2012>, form: "prose", supplement: [Lemma 3]).]
  First, let $(x, y) in ZZ^2$. If $E$ is the identity transformation, $C_2^E (x, y) = A$ if and only if $(x, y) equiv (0, 0) mod 2$, and similarly $C_2^E (x, y) = B$ if and only if $(x, y) equiv (0, 0) mod 2$, $C_2^(E) (x, y) = C$ if $(x, y) equiv (1, 0)$ or $(1, 1) mod 2$. Then, $ C_2E (x, y) = C_2^E overline((x, y)), $ if $E$ is the identity matrix. Now notice that for any affine transformation $Alpha$ on the integer lattice: $ Alpha(x, y) equiv Alpha overline((x, y)) mod 2. $ Therefore, $ C_2^Alpha overline((x, y)) = C_2^E (Alpha overline((x, y))) = C_2^E (Alpha (x, y)) = C_2^(Alpha) (x, y). $
]

We will utilize this commutivity to show that if the $p$-adic boundary sum is zero, then so is the even-odd boundary sum.

#theorem[
  @rudenko_equidissection_2012[Lemma 3]
  Let $P$ be a lattice polygon with $Omega_C_2 (P) = 0$, then $Omega_C^4 (P) = 0$.
]<lemma3>

#proof[
  @rudenko_equidissection_2012[Lemma 3]
  Consider the following area preserving affine transformations:
  $
    E & = (x, y) -> (x, y) \
    U & = (x, y) -> (x + y, y) \
    V & = (x, y) -> (y + 1, x)
  $

  Now, suppose there does not exist an affine transformation with nonzero determinant $A$ such that the $2$-adic boundary word $W$ of $A(P)$ is non-contractible. Recall we can write: $ Omega_C^4 (W) = mu_1 (alpha beta + beta gamma + gamma alpha) + mu_2 (alpha gamma + gamma delta + gamma alpha) + mu_3 (beta delta + delta gamma + delta beta), $ for $mu_1, mu_2, mu_3 in ZZ$. Now $ 0 &= Omega_C_2 (W) \ &= C_2^E (Omega_C_2 (W)) \ &= C_2^E (mu_1 (alpha beta + beta gamma + gamma alpha) + mu_2 (alpha gamma + gamma delta + gamma alpha) + mu_3 (beta delta + delta gamma + delta beta)) \ &= C_2^E (mu_1 (alpha beta + beta gamma + gamma alpha)) + C_2^E (mu_2 (alpha gamma + gamma delta + gamma alpha)) + C_2^E (mu_3 (beta delta + delta gamma + delta beta)) \ &= mu_1 C_2^E (alpha beta + beta gamma + gamma alpha) + mu_2 C_2^E (alpha gamma + gamma delta + gamma alpha) + mu_3 C_2^E (beta delta + delta gamma + delta beta) \ &= mu_1 (A B + B C + C A) + mu_2 (A C C C + C A) + mu_3 (C B + C C + B C) \ &= mu_1 (A B + B C + C A) + mu_2 (0) + mu_3 (0) \ &= mu_1 (A B + B C + C A). $ So $mu_1 = 0$. Repeating this process for $U$ and $V$ shows that $mu_2$ and $mu_3$ are similarly zero, allowing us to show $Omega_C^4 = 0$.
]

By applying this theorem in reverse, we are able to show that a lattice polygon with non-contractible even-odd boundary sum has a non-contractible $p$-adic boundary word.

#corollary[
  Let $P$ be a lattice polygon such that $Omega_C^4(P) != 0$. Then, there exists an area preserving affine transformation $A$ such that the $p$-adic boundary word $W$ of $A(P)$ is non contractible.
]

#proof[
  If $Omega_C^4 (P) != 0$, then $Omega_C_2 (P) != 0$ by reverse application of our previous theorem. Our result follows by @lemma2.
]

Now, to provide our result, we need only show that balanced polygons with odd area must have a boundary sum of zero.

=== The Area of a Balanced Polygon<area>
In the previous section we introduced the concept of the boundary sum and used it to show that a lattice polygon which has nonzero even odd boundary sum has a non-contractible $p$-adic boundary word. In this section we will utilize this theorem to show that a balanced lattice polygon with odd area has a non-contrcatible $p$-adic boundary word.

Recall that at the beginning of this section we explored the intimate relationship between parallelograms and balanced polygons. We will now exploit this sacred relationship for our own personal gain. First, notice that the parity of the area of a lattice parallelogram is related to its even-odd boundary sum.

#lemma[
  @rudenko_equidissection_2012[Lemma 4]
  Let $P$ be a lattice parallelogram. The even-odd boundary sum of $P$ is $0$ if and only if the area of $P$ is even.
]<parallelogram>

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
  Our boundary sum is zero if any of our two vertices are equivalent modulus two. Notice also, that if any of our vertices are equivalent modulus two, then the the set of vectors $(1, x_1, y_1), (1, x_2, y_2),$ and $(1, x_3, y_3)$ are linearly dependent modulus two. Then,
  $ "Area" P = mat(
    delim: bar,
    1, 1, 1;
    x_1, x_2, x_3;
    y_1, y_2, y_3;
  ) equiv 0 mod 2. $ This is due to the fact that the determinant of a linearly dependent matrix is always zero. Therefore the area of $P$ is even if and only if the even-odd boundary word of $P$ is contractible.#footnote[The methodology of this proof follows from the proof presented by @rudenko_equidissection_2012.]
]

Notice that we have shown a stronger statement in our proof of this theorem, that the vertices of a parallelogram must be linearly independent modulus $2$. This gives rise to the following corollary.

#corollary[@rudenko_equidissection_2012[Lemma 4]
  Let $P$ be a lattice parallelogram. Then, $P$ has odd area if and only if $P$ is four-colored relative to the even-odd coloring function.
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
  As shown in the previous proof, this matrix must not be linearly dependent mod two, so each of these three vertices must not be equivalent mod two. Therefore $P$ is four colored under the even-odd coloring function since no pair of its vertices can be equivalent mod two.
]

We will define an action of the symmetric group $S_n$ on the set of balanced polygons. This set acts on a balanced polygon $P$ by shuffling around its side vectors. We will then utilize the fact that the group which represents permutations $S_n$ is constructed from transpositions which correspond to the addition or subtraction of a parallelogram from $P$.

#definition[
  We will define the action of the symmetric group $S_n$ which represents the set of all permutations on a balanced polygon $P$ as follows: We will consider our balanced polygon to be defined by a series of points $ P = P_1 + P_2 + dots + P_n. $ Represent each point of our balanced polygon as a sum of side vectors: $ P_i = overline(P_1 P_2) + overline(P_2 P_3) + ... + overline(P_(i -1) P_i), $ where $overline(P_i P_(i + 1)) = (P_(i + 1) - P_i)$. We can define an action of the group $S_n$ on $P$ by defining each $ P_i = overline(P_sigma^-1(1) P_(sigma^-1(1) + 1)) + overline(P_sigma^-1(2) P_(sigma-1(2) + 1)) + ... + overline(P_sigma^-1(i - 1) P_(sigma^-1(i - 1) + 1)). $
]

#example[
  Notice that the group $S_n$, which is the set of all permutations, acts by permuting the side vectors of our balanced polygon $P$.

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
    caption: [$L$ with the action of $sigma = (12)(456)$ on $L$ overlaid ontop of it.],
  )
]

It is common knowledge that any element in the group which represents all permutations $S_n$ can be represented as a series of transpositions.

#definition[
  We will define $tau_i in S_n$ to denote a transposition $(i, i + 1)$, the transposition which swaps elements $i$ and $i + 1$.
]

#example[
  For a broken line $ L = (6, 2) (7, 4) (4, 6) (3, 8) (2, 6) (3, 4), $ we can represent $L$ as a series of side vectors: $ overline(L) = (-1, -2), (3, -2), (1, -2), (-1, 2), (-3, 2), $ alongside a starting point $(6, 2)$. The action of $sigma = (23)$ on $L$ swaps the second and third side vectors. So $ sigma (overline(L)) = (-1, -2), (1, -2), (3, -2), (-1, 2), (-3, 2), $ and $ sigma (L) = (6, 2) (3, 4) (4, 6) (3, 8) (6, 6),(5, 4). $

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

Each of these transpositions represents swapping two side vectors, which effects the area of a balanced polygon by the oriented area of the parallelogram formed by these two side vectors.

#theorem[
  Let $P$ be a balanced lattice polygon, $tau_i in S_n$ be a transposition $(i, i + 1)$, and $p_i$ be the parallelogram formed by $overline(P_(i + 1) P_(i + 2))$ and $overline(P_i P_(i + 1))$. Then $ "Area" tau_j(P) = "Area" P - mat(
    delim: bar,
    overline(P_(i + 1) P_(i + 2))_x, overline(P_(i) P_(i + 1))_x;
    overline(P_(i + 1) P_(i + 2))_y, overline(P_(i) P_(i + 1))_y;
  ). $ Also, let the boundary sum of $tau_j (P)$ be $Omega$. Then, $Omega = W - Omega(p_i)$.
]
#proof[
  #footnote[This proof follows from the methodology presented by #cite(<rudenko_equidissection_2012>, form: "prose", supplement: [Lemma 5]).]
  The tranposition $tau_i$ either adds the parallelogram $p_i$ to $tau_i(P)$ or removes the parallelogram $p_i$ from $tau_i (P)$ depending on the orientation of the boundary $p_i$ which is measured in both the boundary sum, and the oriented area of $p_i$ which is equal to $ mat(
    delim: bar,
    overline(P_(i + 1) P_(i + 2))_x, overline(P_(i) P_(i + 1))_x;
    overline(P_(i + 1) P_(i + 2))_y, overline(P_(i) P_(i + 1))_y;
  ). $
]

Notice also, that because of @parallelogram, the parity of the area of a balanced polygon $P$ is effected by a transposition $tau_i$ if and only if the parallelogram corresponding to $tau_i$ has a nonzero boundary word.

#corollary[
  Let $P$ be a balanced lattice polygon, let $tau_i in S_n$ be a transposition $(i, i + 1)$, and $p_i$ be the parallelogram formed by $overline(P_(i+1) P_(i + 2))$ and $overline(P_i p_(i + 1))$. Then $"Area" tau_j (P) equiv "Area" P$ if and only if $omega(p_i) = 0$.
]
#proof[
  If $phi_i != 0$, then $ phi_i = sigma_2 + sigma_3, sigma_4 + sigma_1, "or" sigma_1 + sigma_2 $ and the area of $p$ is odd by @parallelogram. Otherwise, the area of $p$ is even and $phi_i = 0$ by @parallelogram.#footnote[This proof follows from the methodology presented by #cite(<rudenko_equidissection_2012>, form: "prose", supplement: [Lemma 5]).]
]

This allows us to relate the area of a balanced lattice polygon to its even-odd boundary sum.

#lemma[
  @rudenko_equidissection_2012[Lemma 5]
  Let $P$ be a balanced lattice polygon. Then, there exist a $mu_1, mu_2, mu_3$ such that $ Omega_(C^4) (p) = mu_1(sigma_2 + sigma_3) + mu_2(sigma_4 + sigma_1) + mu_3(sigma_1 + sigma_2), $ and $ "Area" P equiv mu_1 + mu_2 + mu_3 mod 2. $
]<lemma5>

#proof[
  #footnote[This proof follows from the methodology presented by #cite(<rudenko_equidissection_2012>, form: "prose", supplement: [Lemma 5]).]
  Let $P$ be a balanced lattice polygon with boundary word $W$. Without loss of generality we can consider the point $P_0$ to be $(0, 0)$. We can represent the group $S_n$ as a product of tranpositions. Now, consider the permutation $sigma in S_n$ of the side vectors of $P$ in which after every odd indexed side vector, the side vector following it is the side vector which is parallel, congruent, and of opposite orientation to it. It is clear that $sigma (S_n)$ has zero area and boundary sum. Then, $ Omega_(C^4) (P) = mu_1(sigma_2 + sigma_3) + mu_2(sigma_4 + sigma_1) + mu_3(sigma_1 + sigma_2), $ where $mu_1 + mu_2 + mu_3$ is equal to the number of transpositions $tau_i$ which make up $sigma$ where $p_i$ has odd area. Notice also that the area of $P$ is made up of all such triangles $p_i$ so $ "Area" P equiv mu_1 + mu_2 + mu_3 mod 2. $
]

We are now able to compare the area of a balanced lattice polygon with its $2$-adic boundary word to produce contradiction, providing our result.

#theorem[
  @rudenko_equidissection_2012
  There exists no odd equidissection of a balanced lattice polygon $P$ with odd area.
]

#proof[
  Suppose $P$ is a balanced polygon with odd area, then $ Omega_(C^4) (P) = mu_1(sigma_2 + sigma_3) + mu_2(sigma_4 + sigma_1) + mu_3(sigma_1 + sigma_2), $ where $mu_1 + mu_2 + mu_3$ are odd due to @lemma5. Then there exists an affine transformation with non-zero determinant $A$ such that the boundary word $W$ relative to $C_2$ of $A(P)$ is non-contractible.  Let $T$ be a dissection of $A(P)$ with $n$ triangles such that $n$ is odd. Then there exists a triangle $t$ in $T$ such that $2*("Area" P) <= -1$. Therefore $T$ is not a equidissection since $ 2*("Area" P) <= -1 < 0 = 0 - 0 = 2*("Area" A) - 2*(n) = 2*(("Area" A(P))/n). $
]

= Future Research Pathways<apply>

== Limitations of Rudenko's Approach

Rudenko's Approach, while greatly powerful is limited in two ways, we will dedicate a section of this chapter to each of these limitations, and their potential solutions.

The first limitation of Rudenko's approach to Stein's Conjecture is that it only applies to balanced lattice polygons with odd area, if we are able to remove the odd area restriction, we can extend a proof of Stein's Conjecture to all polygons with rational vertices, or polygons which otherwise lay on a lattice which can be carried to the integer lattice while scaling the area of all polygons equally.

The second limitation is that Rudenko's Approach only applies to polygons which lay on the integer lattice or can be carried to the integer lattice. If we found a technique which removed this limitation we are able to prove Stein's Conjecture in the general case.

== "Lifting" the even-odd mapping

Rudenko's Approach hinges on a modulus $2$ equivalency between the area of a integer area balanced lattice polygon and the number of cycles present in that polygons even-odd boundary word to show that odd area balanced lattice polygons cannot be divided into any odd number of triangles of equal area. If we can draw a modulus $2^n$ equivalency, we can show that any balanced lattice polygon whose area is not a multiple of $2^n$ cannot be divided into any odd number of triangles of equal area. If we showed this for every $n$ we would prove the result for all balanced polygons which lay on the rational lattice.

One avenue to show such a result is instead of considering a mod $2$ even odd mapping over lattice polygons, we can consider a mod $2^n$ mapping over lattice polygons. We will refer to such a mod $2^n$ map as the $star_n$ map.

#definition[
  The map $star_n$ maps lattice polygons to cyclic words over $2^n$ characters.
]

However, we run into the issue that the generators of the group of cyclic graphs over $2^n$ vertices grows quite quickly. As earlier shown, for the case of $n = 1$ there are $3$ generators for such a graph.

#proposition[
  The contraction group for $star_n$ is generated by a set of $k(k - 1)/2 - (k - 1)$ where $k = 2 dot 2^n$.
]

This means the number of generators for each set grows incredibly quickly, providing a headache for any actual attempts of this approach. It is unclear if the number of generators for each set grows faster than the number of area preserving affine transformations required to provide an equivalent of @lemma3.

== 4 Colorings of the Plane

Rudenko's approach predates the introduction of Jamie Pommersheim and Aaron Abrams Non-Abelian Sperner's Lemma. This version of Sperner's Lemma allows us to find complete triangles in $n$-colored divisions of polygons into triangles with non contractible boundary words, rather than just $3$-colorings. In the previous section we modernized Rudenko's approach such as to utilize the language of Jamie Pommersheim and Aaron Abrams. This modernization makes it more clear that Rudenko is constructing a $4$-coloring over balanced lattice polygons, and then using such a $4$-coloring to make statements regarding our standard $3$-coloring, ultimately using Sperner's Lemma on that $3$-coloring to prove the theorem. This begs the question, what if we cut out the $3$-coloring and directly apply our fancy new version of Sperner's Lemma to a $4$-coloring of the plane? However, this technique runs into a problem quickly, it is not evidently clear if there is a $4$-coloring of the plane $C^4_p$ which satisfy the following two properties necessary for a general proof of Stein's Conjecture:

1. Under $C^4_p$ all dissections of balanced polygons into an odd number of triangles have non-contractible boundary word, or can by carried by area preserving affine transformation to a polygon which has a non-contractible boundary word.
2. Also, under $C^4_p$ all $3$ colored triangles have area which precludes an odd equidissection.

It is not immediately clear how to satisfy the first property, however, the second property is one which we can easily write down as a series of inequalities which must be satisfied

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

// In @rudenko_equidissection_2012, Rudenko studies a subset of Stein's Conjecture for polygons whose vertices lay on an integer grid.

// #definition[
//   A _lattice polygon_ is a polygon whose vertices are integer-valued.
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

