#import "@preview/showybox:2.0.1": showybox
#import "@preview/suiji:0.3.0": *


#let default-quiz-style(name:"問題",　question:[], answer:[], commentary:[], point:[], tag:[], id:[], hide-id:false, ) = {
show figure: it => {
  showybox(frame: (border-color: blue.darken(10%),
  body-color: white, title-color: blue.lighten(90%),),
  sep: (
    dash: "dashed"
  ),
  breakable: true,
  title-style: (
    color: blue.darken(60%),
    weight: "regular",
    align: left
  ),
  title: [#text(size:1.2em)[#strong[#name #tag (#point\p).]]],
  [#it.body]
  )
} 
[#figure(kind:"question",supplement: name)[#question]
#label(id)]
}

#let default-answer-style(name:"解答例",　question:[],answer:[], commentary:[], tag:[],id:[], hide-id:false, ) = {
show figure: it => {
  showybox(frame: (border-color: red.darken(10%),
  body-color: white, title-color: red.lighten(90%),),
  breakable: true,
  sep: (
    dash: "dashed"
  ),
  title-style: (
    color: red.darken(60%),
    weight: "regular",
    align: left
  ),
  title: [#text(size:1.2em)[#strong[#name #tag.]]],
  [#it.body],
  [解説：#commentary]
  )
}
[#figure(kind:"answer",supplement: name)[#answer]
#label(id+"A")]
}


#let test-question-style(name:"問題",　question:[], answer:[], commentary:[], point:[], tag:[], id:[], hide-id:false, ) = {
  show figure: it => {
    align(left)[#text(size:1.1em)[#strong[#ref(label(id)).]] #it.body \ ]
  }
  [#figure(kind:"question",supplement: name)[#question]
#label(id)]
//解答分のスペースを取る．  
hide[#text(size:3em)[#answer]\ ]
}


#let test-question-style-no-space(name:"問題",　question:[], answer:[], commentary:[], point:[], tag:[], id:[], hide-id:false, ) = {
  show figure: it => {

    align(left)[
   #v(-1em) 
    \ #strong[#name #tag (#point\pt). ] #it.body  
  ]
  }
  [#figure(kind:"question",supplement: name)[#question]
#label(id)]
}


#let commentary_pick(name:"問題",　question:[], answer:[], commentary:[], point:[], tag:[], id:[], hide-id:false, ) = {
 if commentary != []{
   show figure: it => {
    v(-1em)
    align(left)[\ #strong[#name #tag. ] #it.body   ] 
  }
  [#figure(kind:"question",supplement: name)[#commentary]
#label(id)]
}
}

#let test-answer-style(name:"問題",　question:[],answer:[], commentary:[], tag:[],id:[], hide-id:false, ) ={
show figure: it => {align(left)
    [#text(size:1.1em)[#strong[#name #tag. ]] #h(1em) #it.body  ]
  }
[#figure(kind:"question",supplement: name)[#question \ ]
#label(id)]
//解答分のスペースを取る．  
[  #line(stroke: (thickness: .5pt, dash: "dotted"),length:100%)

  #strong[略解：] #answer
#line(stroke: (thickness: 1pt, dash: "dashed"),length:100%)
]
}




#let Quiz_create(..quiz) ={
  return quiz.pos()
}

#let quiz(id,question:[],answer:[], commentary:[],show-question: true, show-answer: true, category: (), point: 0) = {


return (id: id,question: question,answer: answer, commentary: commentary, show-question:show-question, show-answer:show-answer, category:category,point: point)

}


#let quiz-numbstyle(id, n,numbering-style) = {
  if numbering-style == "id" {return id}
  if numbering-style == "number" {return n}
  
}

#let Subgroups(quizbank, list, categ, mode) = {
  if mode == "" {return quizbank}
  if mode == "sub" {
  let subquizs = ()
  for quiz in quizbank {
    if quiz.id in list {
      subquizs.push(quiz)
    }
  }
  return subquizs
}
  if mode == "cat" {
  let subquizs = ()
  for quiz in quizbank {
    if quiz.category in categ {
      subquizs.push(quiz)
    }
  }
  return subquizs
}
}



#let tests_gen(quizbank, subgroups: (),  categories:(), style: "both", numbering-style: "id",mode:"", show-total-score:false, question-style: default-quiz-style, answer-style: default-answer-style) = {
 
 let active_quizbank = Subgroups(quizbank, subgroups, categories, mode)
  
 let n = 0
 if style == "Q" {
   for quiz in active_quizbank {
    n = n + 1
    let numb = quiz-numbstyle(quiz.id, n,numbering-style)
    question-style(name:"問題",question: quiz.question, answer: quiz.answer, commentary: quiz.commentary,point: quiz.point, id: quiz.id, tag:numb)    
  }
}
if style == "A" {
  for quiz in active_quizbank {
    n = n + 1
    let numb = quiz-numbstyle(quiz.id, n,numbering-style)
    if quiz.show-answer == true{
    answer-style(question: quiz.question, answer: quiz.answer, commentary: quiz.commentary, id: quiz.id, tag:numb)    
    }  
}
}

if style == "both" {
  for quiz in active_quizbank {
    n = n + 1
    let numb = quiz-numbstyle(quiz.id, n,numbering-style)
    question-style(name:"問題",question: quiz.question, answer: quiz.answer, commentary: quiz.commentary,point: quiz.point, id: quiz.id, tag:numb)    
    if quiz.show-answer == true{
    answer-style(question: quiz.question, answer: quiz.answer, commentary: quiz.commentary, id: quiz.id, tag:numb)   
  }
  }
}

if style == "Q-A" {
  for quiz in active_quizbank {
    n = n + 1
    let numb = quiz-numbstyle(quiz.id, n,numbering-style)
    question-style(name:"問題",question: quiz.question, answer: quiz.answer, commentary: quiz.commentary,point: quiz.point, id: quiz.id, tag:numb)  }
  let n = 0
   for quiz in active_quizbank {
    n = n + 1
    let numb = quiz-numbstyle(quiz.id, n,numbering-style)
    if quiz.show-answer == true{
    answer-style(question: quiz.question, answer: quiz.answer, commentary: quiz.commentary, id: quiz.id, tag:numb)   
  }
  }
}

}
  
#let seed = datetime.today().year() * datetime.today().month() * datetime.today().day()

#let random_test(quizbank, size: 1, subgroups: (),  categories:(), style: "both", numbering-style: "id", show-total-score:false, question-style: default-quiz-style, mode: "", answer-style: default-answer-style, seed:seed) = {

let active_quizbank = Subgroups(quizbank, subgroups, categories, mode)  
let id_list = ()
for quiz in active_quizbank {
  id_list.push(quiz.id)
}

let rng = gen-rng-f(seed)
let chosen_groups = ()
{(rng, chosen_groups) = choice-f(rng, id_list, size: size, replacement:false)
}

tests_gen(quizbank, subgroups: chosen_groups,  categories:(), style: style, numbering-style: numbering-style,mode:"sub", show-total-score: show-total-score, question-style: question-style, answer-style: answer-style)
}

#let numberer(pre:"", post:"", chars) ={
  let cs = chars.clusters()
  let csl = cs.len()
  (n) => {
    let s = if 0 < n and n <= csl {cs.at(n - 1)}
    pre + s + post
  } 
}

#let katanumb = numberer(pre:"",post:"","アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲン")

#let kuranenv(body) = {
      let kuran_count = counter("kuran_counter")
      kuran_count.update(0)
      body
}


#let kuran(n:none) ={
  if n == none {
    let kuran_count = counter("kuran_counter")
    kuran_count.step()
    box(inset:(x:9pt,y:3pt), stroke:1pt,baseline: 20%)[#context[#numbering(katanumb,kuran_count.get().at(0))
    
    ]
    ]
  }
  else {
    box(inset:(x:9pt,y:3pt), stroke:1pt,baseline: 20%)[#numbering(katanumb,n)]
    }
  
}

#let Ngame(players,strategies,payoffs,caption:none) = {
  
  let glist = ()   

  let g_list = strategies.at(1)
    g_list.insert(0,"")
    glist.push(g_list)

  for i in range(strategies.at(0).len()){
    let g_list = payoffs.at(i)
    g_list.insert(0,strategies.at(0).at(i))
    glist.push(g_list)  
  }
　return {
  box(table(columns: strategies.at(1).len()+2,
      align: center + horizon,
      stroke: (x,y) => (
        top: if y == 2 {1pt} else {0pt},
        left: if x == 2 {1pt} else {0pt}
      ),
      [], table.cell(colspan: strategies.at(1).len()+1, players.at(1)),
          table.cell(rowspan: (strategies.at(0).len()+1), players.at(0)),
      ..glist.flatten()
    )  )
    
}
}
