#import "src/formula.typ": open, close, assume

#let proof(
  framing: (height: 3em, thickness: .05em, stroke: black, assume-length: 2.25em, assume-thickness: .05em, assume-stroke: black),
  assumption-mode: "fixed", indexation: "1", proof) = {

  let framing-customizables = ("height", "thickness", "stroke", "assume-length", "assume-thickness", "assume-stroke")
  
  if type(framing) == length {
    framing = (height: 3em, thickness: .05em, stroke: black, assume-length: framing, assume-thickness: .05em, assume-stroke: black)
  }
  
  else if type(framing) == dictionary {
    assert(
      framing.keys().all(key => key in framing-customizables),
      message: "framing can only have " + framing-customizables.join(", ") + "."
      )
  }
  else {
    panic("framing must either be a length or a dictionary of the form (height: y, width: x)!")
  }
  let framing-measures = framing

  import "src/framing.typ": framing
  let framing = framing(height: framing-measures.height, assume-length: framing-measures.assume-length)

  // 1.1
  //let assumption-modes = ("fixed", "widest", "dynamic", "dynamic-single")

  // 1.0
  let assumption-modes = ("fixed", "widest", "dynamic-single")

  let assumption-mode-error = "Invalid assumption mode! Can only be" + assumption-modes.join(" or ") + "."
  
  assert(assumption-mode in assumption-modes, message: assumption-mode-error)

  
  import "src/chart.typ": diagram
  import "src/formula.typ": parse

  diagram(framing, assumption-mode, parse(proof, indexation))
}