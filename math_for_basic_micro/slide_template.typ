//fontawesomeの読み込み
#import "@preview/fontawesome:0.1.0": *
//CeTZの読み込み
#import "@preview/cetz:0.1.0"
//カラーとフォントの設定. 
#let default_color = eastern.lighten(30%)
#let emph_color = white
#let strong_color = rgb("3cb371")
#let textcolor = black

//フォントはarrayで設定すれば，英字は英字用の，日本語は日本語用のフォントで設定してくれる
#let body-font = ("MPLUS2")
#let sans-font = ("MPLUS2")

#let slide_counter = counter("slide_counter")
#let subslide = counter("subslide_counter")
#let subslide_c = counter("subslide_current")
#let pause_c = counter("pause_number")
#let pause_a = counter("pause_all")

#let slide-heading-number = counter("slide-heading-number")
#slide-heading-number.update(0)

#let slide-heading-outline = counter("slide-heading-outline")
#slide-heading-outline.update(0)

#let heading-outline(color:default_color) ={
locate( loc =>{
let headings = query(selector(heading.where(level: 1,outlined:true)),loc)
let current-headings = counter(heading).at(loc).at(0)
let i = 0
let headings-name = ()
let head-col = ()
let head-weight = ()
while i< headings.len(){
if i+1 == current-headings{
headings-name.push(text(font: sans-font, fill:color.darken(30%), weight:700, headings.at(i).body,size:10pt))}
else {
headings-name.push(text(font: sans-font, fill:color.lighten(10%), weight:400, headings.at(i).body,size:10pt))}
i = i+1
}
 pad(
    top: -1.0em,
    bottom: 0.0em,
    x: 0em,
    grid(
      columns: (1fr,) * headings.len(),
      gutter: 0em,
      ..headings-name.map(name => align(center, 
       name
      ))))
}
)
}

#let header_slide(title,now:0, end:0,color:default_color, tcolor:emph_color) = {
  locate(loc => {
  set text(size: 23pt)
  let a =  slide-heading-outline.at(loc).at(0)
  
pad(left: -20pt)[
#cetz.canvas(length:1cm,{
  import cetz.draw: *
group({
rect((0,2.12),(28.5,.7),fill:color.lighten(99%), stroke:none)
line((0,.9+2*a),(29,.9+2*a), stroke:4pt+color.darken(20%))

content((.2,1.4+2*a),anchor:"left",[
  #if title != "" { h(5pt);box(outset: (x: 9pt, y: 13pt))[#text(fill:color.darken(30%),font:sans-font, weight:700)[#title]]}
  ])
content((0,2+a),anchor:"left")[
#if slide-heading-outline.at(loc).at(0) == 1{
  heading-outline(color:color)}]
circle((28.8,1.6+2*a), radius:.8,stroke:4pt+color.darken(20%),fill:white)
content((28.8,1.6+2*a),[#text(size:20pt,fill:color.darken(20%),weight:700)[#now]])
//content((28.5,1.),[#text(size:15pt)[#end]])
//line((27.6,.65),(28.8,1.9), stroke:4pt+default_color.darken(20%))
})
})]

})

}





#let project(
  title: "",
  title_notes: none,
  authors: (),
  institutions: (),
  notes: (),
  date: "",
  body,
  default_color: eastern.lighten(30%),
  emph_color: white,
  strong_color: rgb("3cb371"),
  textcolor: black,
  size:18pt,
  body-font:body-font,
  sans-font:sans-font
) = {
  // Set the document's basic properties.
  set document()
  set page("presentation-16-9",
  margin: (right:15pt,top:2pt, left:20pt, bottom:10pt),)

  // Save heading and body font families in variables.

// slideの作成. headingをスライドの区切りにする

  show heading: it => {
// slide_numberの更新
  pagebreak(weak:true)
  counter("slide_counter").step() 
//header 
  locate(loc => {
  let now = counter("slide_counter").at(loc).at(0)
  let end = counter("slide_counter").final(loc).at(0)
  header_slide(now:now,end:end,color:default_color,tcolor:emph_color)[
  #if slide-heading-number.at(loc).at(0)==1 {counter(heading).display()} 
  #it.body]
  let a = slide-heading-outline.at(loc).at(0) 
  v(-a*2.3cm)
})
} 







set heading(numbering: "1.1.")


  // Set body font family.
  set text(font: body-font, lang: "jp", fill:textcolor)

  set footnote(numbering: "*")
  // Title row.
  counter("slide_counter").step()
  // box(width: 1fr, outset: (x: 10pt, y: 15pt), repeat[]);
  // [#text(font:"Neo Euler", weight:900, size:25pt)[#counter("slide_counter").display("1/1", both:true)]]
header_slide(now:counter("slide_counter").display(),color:default_color,tcolor:emph_color)[]
  align(center)[
    #set text(font: sans-font, weight: 700, 4em)
//    #line(length:100%, stroke:3pt+default_color)
    #box(fill:default_color, outset: (x: 15pt, y: 15pt),radius: 10pt)[#text(fill:emph_color)[#title]]
 //   #line(length:100%, stroke:3pt+default_color)
    #if title_notes !=none {footnote[#title_notes]}
    #v(1em, weak: true)
    #set text(font: sans-font, weight: 500, 0.5em)
    #date
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
      ..authors.map(author => align(center, 
       text(font: sans-font, weight: 700, 2em, author)
      )),
      ..institutions.map(institutions => align(center, strong(institutions)))
    ),
  )


  // Main body. 基本設定.

//listのマーカーの設定
 set list(marker: ([#text(fill:default_color.darken(20%))[#fa-angle-right()]], text(fill:default_color, size:15pt)[#fa-angles-right()]))

// footnoteの設定
  set footnote(numbering: "1")
  counter(footnote).update(0)
// paragraphの設定． indent 1em, 行送り.5em
  set par(justify: false, first-line-indent: 1em, leading: .5em)
// fontの設定
  set text(font: sans-font, size:size, weight:400)
  show emph: set text(font: sans-font, fill: default_color.darken(24%), weight:600)
  show strong: set text(font: sans-font, fill: default_color.darken(14%), weight:500)
//数式フォントの設定
  show math.equation: set text(font: ("TeX Gyre Termes Math","M PLUS 2"),weight:400, size:size * 1.05)
//set math.equation(numbering: "(1)")
//items with numberingの設定
  set enum(numbering: "1.a.")

//引用形式の設定
//  set cite(brackets: true)
  body
}

//その他ショートカット
#let ya = {text(fill:default_color)[#fa-arrow-right()]}






//theorem型の関数の定義.figureと数式とheadingしか参照できないのでfigureを使って定義する．
#let thm_counter = counter("thm_counter")

#let theorem_base(title: none, kind: "Theorem", bodyface: text, frame_color:none, tlabel: none,body) ={
    let current_thm_counter = counter("thm_counter"+(tlabel))
    locate(loc => {
    if current_thm_counter.at(loc).at(0)==0{
    let thm_base_counter = counter("thm"+str(kind)).at(loc).at(0); counter("thm"+str(kind)+(tlabel)).update(thm_base_counter)
    counter("thm"+str(kind)+(tlabel)).update(n => n+1)
    }})
    show figure: it => {
    align(left)[#par(first-line-indent: 0em)[
      #rect(width: 95%, stroke: 3pt+frame_color,outset: (x:0pt,y:8pt), inset: (x:10pt))[
      #rect(width: 100%, fill: frame_color, stroke: 0pt+frame_color,outset:(x: 10pt, y: 12pt), inset: (y:-5pt))[#text(fill: emph_color,weight:700)[
      #it.supplement 
      #it.caption]]
      #it.body]]
    ]}
  locate(loc => {
  let thmlabel = "thm"+str(kind)+(tlabel)
  
  let title_text = {
    if title == none{ str(kind) +str(" ") + str(counter("thm"+str(kind)+(tlabel)).at(loc).at(0))+"."} 
    else { str(kind) +str(" ") + str(counter("thm"+str(kind)+(tlabel)).at(loc).at(0))+ "("+title+")."}
    }
    if counter("thm_counter"+(tlabel)).at(loc).at(0) == 0{
    [#figure(kind:kind, supplement: none, caption:title_text, body)
    #label(tlabel)]}
    else {
    figure(kind:kind, supplement: none, caption:title_text, body)}
  
})
    locate(loc => {
    if current_thm_counter.at(loc).at(0)==0{
    counter("thm"+str(kind)).step()
    counter("thm_counter"+(tlabel)).step()
  }}
)
}

// theorem 関数の定義。 ここを変えれば変わる.
#let theorem(title: none, label:none, kind:"Theorem", frame_color:default_color, body) = {
theorem_base(title: title, kind: kind, tlabel:label,frame_color:frame_color, body)
}

#let prop(title: none, label:none, frame_color:default_color, body) = {
theorem_base(title: title, kind: "Proposition", tlabel:label,frame_color:frame_color, body)
}

#let lemma(title: none, label:none,frame_color:default_color, body) = {
theorem_base(title: title, kind: "Lemma", tlabel:label, frame_color:frame_color,body)
}

#let cor(title: none, label:none,frame_color:default_color, body) = {
theorem_base(title: title, kind: "Corollary", tlabel:label,frame_color:frame_color, body)
}

#let claim(title: none, label:none,frame_color:default_color, body) = {
theorem_base(title: title, kind: "Claim", frame_color:frame_color,tlabel:label, body)
}

#let definition(title: none, label:none,frame_color:default_color, bodyface: text,body) = {
theorem_base(title: title, kind: "Definition",frame_color:frame_color, tlabel:label, body)
}


#let assumption(title: none, label:none,frame_color:default_color, bodyface: text,body) = {
theorem_base(title: title, kind: "Assumption", frame_color:default_color, tlabel:label, body)
}

#let proof(title: none, body) ={
   let title_text = {
    if title == none {"Proof"} 
    else {
      "Proof of "+title+"."  }
    }
  
  [#par(first-line-indent: 0em)[ #strong[#title_text] #h(1em)
  #body
  #box(width: 1fr, repeat[]);
  $qed$ ]]
}






//set heading(numbering: "1.1",  outlined:false)




//Dynamic slideの設定
#let slide(title:"",body,slabel:"", level:1,color:default_color,tcolor:emph_color) ={
// slide_numberの更新
  subslide.update(0)
  subslide_c.update(0)
  pause_c.update(0)




  set heading(supplement:none,level:level)
  if slabel == "" [#heading(level:level)[#title]]
  else [#heading(level:level)[#title]; #label(slabel)]

//
  body

  locate(loc => {
  let current_subslide = 0
  let ss = subslide.at(loc).at(0)
  let slabels = ()
  let i = 0
  while i < ss {slabels.push("")
    i = i + 1
    } 
  while current_subslide < ss {
    //ヘッダーの作成
    counter("slide_counter").update(n => n - 1)
    heading(outlined: false,numbering:none)[#title]
    // 
    subslide_c.step()
    pause_c.step()
    pause_a.update(0)
    body
    current_subslide = current_subslide + 1
  }
  })
}

#let Labelling(slabel) = {
  if slabel == "" []
  else [
  #show heading: it => {}
  #let sslabel = slabel
  #heading(outlined: false)[]
  #label(sslabel)]
}



#let showstyles(mode:none,body) ={
  if mode == "t" {
    text(fill:textcolor.lighten(80%))[#body]
  }
  if mode == "h" {
    hide[#body]
  }
  
}




//Pause

#let pause(body,slabel:"", mode:none) ={
  Labelling(slabel)
  locate(loc =>{
  let css = subslide_c.at(loc).at(0)
  let pss = pause_a.at(loc).at(0)
  if pss < css [#body]
  else [#showstyles(mode:mode,body)]
  pause_a.step()
  if css == 0 {subslide.step()}
})
}


//subslide

#let only(number, body, mode:none) = {
    locate(loc =>{
    let current_subslide = subslide_c.at(loc).at(0)
    let subslide_n = subslide.at(loc).at(0)
    //subslide_c.display()
    if type(number) == "integer" { 
    if current_subslide == number {
      body
    } else {}
    if current_subslide == 0 {
    if subslide_n < number {
      subslide.update(number)
    }}} 
    if type(number) == "array" {
    let serch_num(nm) = {
      if nm == current_subslide {
        return true
      } else{return false}
    }
     if type(number.find(serch_num))== "integer" {
      body
    } else {[#showstyles(mode:mode,body)]}
    let mnumber = {number.last()}
    if current_subslide == 0{
    if subslide_n < mnumber {
      subslide.update(mnumber)
    }}
    }
})
    
}

#let onlya(number, body, mode:none) = {
    locate(loc =>{
    let current_subslide = subslide_c.at(loc).at(0)
    let subslide_n = subslide.at(loc).at(0)
    if current_subslide >= number {
      body
    } else {[#showstyles(mode:mode,body)]}
    if current_subslide == 0{
    if subslide_n < number {
      subslide.update(number)
    }}
})
}



//空のボックス

#let bbox(title: none, bodyface: text, tlabel: none,body, boxcolor: default_color, title_color: emph_color) ={
  par(first-line-indent: 0em)[
  #rect(width: 100%, stroke: 3pt+boxcolor,outset: (x:0pt,y:8pt), inset: (x:10pt))[
   #rect(width: 100%, fill: boxcolor, stroke: 0pt+boxcolor,outset:(x: 10pt, y: 12pt), inset: (y:-5pt))[#text(fill: title_color,weight:700)[#title]]
  #bodyface[#body]]
  ] 
}



