#import "src/formula.typ": *
#import "src/interface.typ": *
#import "src/frameline.typ": *
#import "src/chart.typ": *

#let proof(frameline: frameline(), assumption-mode: "fixed", indexation: "1", proof) = {
  
  assert(assumption-mode in assumption-modes, message: assumption-mode-error)
  chart(frameline, assumption-mode, parse(proof, indexation))
}