#import "formula.typ": *
#import "frame.typ": *

#let indices(fms) = {
  
    let font-size = 11pt // fix...

    return stack(
      dir: ttb,
      spacing: height - font-size + 3.5pt,
      ..fms.map(it => move(dy: font-size, text(size: 11pt, it.index))) // fix larger text
    )
}

#let rules(fms) = {
    let font-size = 11pt // fix...

    return stack(
      dir: ttb,
      spacing: height - font-size + 3.5pt,
      ..fms.map(it => move(dy: font-size, $it.rule$))
    )
}


#let diagram(fms) = {

  let psd = parse(fms).filter(x =>
  x != spacing and
  x not in utils // I hate this
  )

  stack(
    dir: ltr,
    spacing: 11pt,
    indices(psd),
    frame(fms),
    rules(psd)
  )
}

