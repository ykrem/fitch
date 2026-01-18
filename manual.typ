#import "@preview/tidy:0.4.3"
#show link: it => {set text(fill: blue); underline(it)}

#import "lib.typ": *
// #import "src/framing.typ":*

A Typst library for visualising #link("https://en.wikipedia.org/wiki/Fitch_notation")[Fitch-Style] proof diagrams, with custom syntax optimized for speedy writing, conciseness, and flexibility.

= Proof Syntax

= The `framing`

= The `proof` function
#{
/// Draw a Fitch-Style proof diagram.
/// -> content
let proof(

/// The `framing` used to construct the diagram.
/// -> framing
framing: framing(),
// be explicit with the values in the prev. section... or just include it all here.

/// How will the lengths of assumption lines will be determined. Can be
/// - `"fixed"`: uniformly assigned as `framing.assumpe-length`
/// - `"widest"`: uniformly assigns to the length of widest assumption in the entire proof.
/// - `"dynamic"`: assigns to the length of widest assumption in the current deepest *sub*\proof.
/// - `"dynamic-single"`: assigns to the length of the last assumption before the assumption line.
/// -> string
assumption-mode: "fixed",

/// How the lines will be indexed as a Typst
/// [numbering](https://typst.app/docs/reference/model/numbering). Defaults to 1,2,3... 


/// -> string
indexation: "1",
/// The proof using proof syntax.
/// -> array
proof-arr,
) = none // what is this for?

let docs = tidy.parse-module(
  read("manual.typ"),
  name: "Fitch-Style"
)

tidy.show-module(docs)
}