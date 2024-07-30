#import "useful_functions.typ": *
#let par_block(it,font, leading:0.5em) =   { if it.block == true{
   return par(leading:leading)[#text(font: font)[#it]]//; set par(leading:.5em)}
  }else{return text(font: font)[#it]}}

#let sans-font = ("TeX Gyre Heros","Harano Aji Gothic")
  
#let project(
  title: "",
  abstract: none,
  authors: (),
  institutions: (),
  notes: (),
  date: Today(),
  body-font: ("TeX Gyre Termes","Harano Aji Mincho"),
  sans-font: ("TeX Gyre Heros","Harano Aji Gothic"),
  math-font: ("TeX Gyre Termes Math","Harano Aji Mincho"),
  leading: 1.0em,
  lang: "en",
  font-size: 12pt,
  style: "report",
  body,
) = {
  // Set the document's basic properties.
//  set document(author: authors, title: title)
  set page(numbering: "1", number-align: center, margin: 1in)


  // Set body font family.
  set text(font: body-font, lang:lang)
  show heading: set text(font: sans-font)
  show par: it => {
    v(0.1em)
    it
    v(0.1em)
  }
  set heading(numbering: "1.1.", supplement: [Section])
  set footnote(numbering: "*")
  
  // Title row.
  if style == "report" {
  align(center)[
    #text(font: sans-font, weight: 700, 1.75em)[#title]
  ]
  // Author information.
  let author_note = authors.zip(notes)
  pad(
    top: 0.5em,
    bottom: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center, [#text(size:1.2em)[#author]])),
      ..institutions.map(institutions => align(center, strong(institutions)))
    ),
  )
  align(center)[#text(font: body-font, weight: 500, 1em)[#date]]
}

  if style == "dissertation" {
  page(numbering: none)[
  #align(center+horizon)[
    #text(font: sans-font, weight: 700, 2.75em)[#title]
  ]
  #v(4cm)
  // Author information.
  #let author_note = authors.zip(notes)
  #pad(
    top: 0.5em,
    bottom: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center, [#text(size:1.2em)[#author]])),
      ..institutions.map(institutions => align(center, strong(institutions)))
    ),
  )
  #align(center+horizon)[#text(font: body-font, weight: 500, 1.2em)[提出日：#date]]
]
  counter(page).update(1)
  outline(title:"目次")
  pagebreak()
}

  // Main body. 基本設定.
  // paragraphの設定． indent 1em, 行送り1.2em
  set par(justify: true, first-line-indent: 1em, leading: leading)
 
  set block(spacing: leading)
  // fontの設定
  set text(font: body-font, size:font-size)
  set text(cjk-latin-spacing: auto)

  //数式フォントの設定
  show math.equation: it => {
    if it.block == true {par_block(it,math-font,leading:leading)
    v(-leading)
    h(1em)
    }
    else {par_block(it,math-font)}
    }

  // footnoteの設定
  set footnote(numbering: "1")  
  
  counter(footnote).update(0)

  show emph: set text(font: body-font)
  show strong: set text(font: sans-font)



  
  set enum(numbering: "1.a.")
  show ref: it => eq_refstyle(it,lang:lang)


  
  //定理環境その他の設定
  show figure: it => {
  let c_eq = counter_body(it)
  let thenumber = numbering(
      it.numbering,
      ..c_eq.at(it.location()))
  if it.kind in theo_list{
  let name = cap_body(it.caption)
  my_thm_style(trans.at(lang).at(it.kind), name, thenumber, it.body)
  }
  else if it.kind in defi_list{
  let name = cap_body(it.caption)
  my_defi_style(trans.at(lang).at(it.kind), name, thenumber, it.body)
  }
  // else if it.supplement.text in others_list {
  // align(center)[
  // #it.body
  // #trans.at(lang).at(it.supplement.text) #thenumber: #cap_body(it.caption)]
  // }
  else if it.kind == "Proof" {
    let name = cap_body(it.caption)
    my_proof_style(trans.at(lang).at(it.kind), name, it.numbering, it.body,lang)}
  else {it}
} 
  

  
  if abstract != none {
    align(center)[#text(1em, strong[#abstract_name.at(lang)])]
    block(inset: (left:6%, right:6%))[
    #text(0.95em)[#par( leading: 0.8*leading)[#abstract]]]}

  body
}
