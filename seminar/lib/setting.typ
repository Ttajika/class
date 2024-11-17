#import "useful_functions.typ": *
#import "useful_package.typ": *
#let par_block(it,font, leading:0.5em) =   { if it.block == true{
   return par(leading:leading)[#text(font: font)[#it]]//; set par(leading:.5em)}
  }else{return text(font: font)[#it]}}

#let sans-font = ("Liberation Sans","Harano Aji Gothic")
  
#let project(
  title: "",
  abstract: none,
  authors: (),
  institutions: (),
  notes: (),
  date: Today(),
  body-font: ("Libertinus Serif","Harano Aji Mincho"),
  sans-font: ("Libertinus Sans","Harano Aji Gothic"),
  math-font: ("Libertinus Math","Harano Aji Mincho"),
  leading: 1.0em,
  lang: "jp",
  font-size: 12pt,
  style: "report",
  seminar: "",
  body,
) = {
  // Set the document's basic properties.
//  set document(author: authors, title: title)
  set page(numbering: "1", number-align: center, margin: 1in,
  // header:[#context { if calc.even(counter(page).get().at(0)) {title} else {align(right)[
  //   #let headings = query(selector(heading.where(level: 1)))
  //   #let current_head = counter(heading).get().at(0)
  //   第 #current_head 章 #headings.at(current_head).body]
  // }}
  
  // ]
)


  // Set body font family
    // fontの設定
  set text(font: body-font, size:font-size,lang:lang)
  set text(cjk-latin-spacing: auto)
  show heading: set text(font: sans-font)

  show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(size: 0.925em)

 
  show emph: set text(font: body-font)
  show strong: set text(font: sans-font)
  
  show figure.where(kind:image): set figure(supplement: "図")
  show figure.where(kind:table): set figure(supplement: "表")
  show par: it => {
    v(0.1em)
    it
    v(0.1em)
  }
  set footnote(numbering: "*")


  
// レポートスタイルのタイトルの設定
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

//卒論スタイルの表紙の設定

  if style == "dissertation" {
  page(numbering: none)[
  #align(center+horizon)[
    #text(font: sans-font, weight: 700, 3em)[#title]
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
      ..authors.map(author => align(center, [#text(size:1.5em)[#author]])),
      ..institutions.map(institutions => align(center, strong(institutions)))
    ),
  )
  #if seminar != ""{align(center+horizon)[#text(font: body-font, weight: 500, 1.5em)[#seminar]]}
  #align(center+horizon)[#text(font: body-font, weight: 500, 1.5em)[提出日：#date]]
 
]
 show heading: set text(size:1.5em)
  counter(page).update(1)
  show outline.entry.where(
  level: 1
): it => {
  v(12pt, weak: true)
  let el = it.element
  strong([#if it.element.numbering != none{
    link(el.location(),"第"+numbering(
      "1",
      ..counter(heading).at(el.location())
    )+"章 "+it.element.body)} else {
       link(el.location(),it.element.body)
    }  #h(1fr) #(float(it.page.text)+1)])
}
  outline(title:"目次", indent:auto)
 // pagebreak()
  
 

}
  
   set heading(numbering: "1.1", supplement: [])
     show heading: it => {
    //v(-.5em)
    it 
    par(text(size: 0pt, ""))
    v(-leading)
  }
   show heading.where(level:1): it => {
   if style == "dissertation" {colbreak()
    if it.numbering != none {block[#text(size:1.5em)[第#counter(heading).display()章 #it.body]]}else {text(size:1.5em)[#it]}}
    else {it}
    par(text(size: 0pt, ""))
    //v(-leading)
  }

  show link: it => text(fill:blue)[#underline[#it]]

  show ref: it => {
     if it.has("element") {
       if it.element.func() == heading {
         if style == "dissertation" and it.element.level == 1 {"第"+it+"章"}
         else {it+"節"}
       } else {it}} else {it}
  }
  // Main body. 基本設定.
  // paragraphの設定． indent 1em, 行送り1.2em
  set par(justify: true, first-line-indent: 1em, leading: leading)
 
  set block(spacing: leading)


  //直書き引用文献書式の設定
  show: use-bib-item-ref.with(numbering: "1")

  //数式フォントの設定
  show math.equation: set text(font:math-font)
  show math.equation.where(block:false): it => [#text(font:body-font)[ ]#it#text(font:body-font)[ ]]

  // footnoteの設定
  set footnote(numbering: "1")  
  set figure(placement: auto)
  
  counter(footnote).update(0)



  set math.equation(numbering: "(1)")

 show math.equation.where(block: true): it => {
  if it.has("label")  {
      
      let tlabel = it.at("label")
     context{
       
        let  eql = counter("auto-numbering-eq" + str(tlabel))
        if eql.final().at(0) == 1{
           
          block(it) 
           
          }
        
        else {
          counter(math.equation).update(n => n - 1)
          block($display(it.body)$,spacing: leading)
        }
      }
    
  }
  else {counter(math.equation).update(n => n - 1)
        block($display(it.body)$,spacing: leading)}
}
  
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
