#import "quiz_bank.typ":*
#show heading: set text(font: "Harano Aji Gothic", fill: gradient.linear(..color.map.crest))
#set heading(numbering: "1.")
#set page(numbering: "1")
#set text(font: "Harano Aji Mincho", lang:"ja")
#show raw: set text(font: ("Roboto Mono", "Harano Aji Gothic"), lang: "ja")

#set par(leading: 1em, first-line-indent: 1em)
#show math.equation: set text(font: "TeX Gyre Pagella Math")

#set par(linebreaks: "optimized")
#show enum: set block(breakable: true)

#show strong: set text(fill:maroon.darken(30%))
#show strong: set text(font: "Harano Aji Gothic") 
#let kuran_count = counter("kuran_counter")

#show link: set text(fill: eastern.darken(30%))

#show: codly-init.with()

#codly(
  languages: (
    R: (
      name: "",
      icon: box(image("img/R_logo.svg",width:9pt, height:7pt)),
      color: white
    ),
  )
)

//問題自体は[quiz_bank.typ]に格納する．
#align(center)[ #text(size:18pt,font: "Harano Aji Gothic", weight: "bold", fill: gradient.linear(..color.map.crest))[ゲーム理論・練習問題集]\

多鹿 智哉 \@ 日本大学 経済学部

教科書：上條・矢内 (2023)『Rで学ぶゲーム理論』朝倉書店
]
//問題の具体的なsourceはquiz_bank.typを参照すること


= 問題
#tests_gen(Quiz,style:"Q", numbering-style: "number", subgroups:("Q11", "Q3"),  question-style: test-question-style-no-space, answer-style: test-answer-style)



#pagebreak()
= ヒント

コードを読む時の注意:
- `l`は小文字のエル，`I`は大文字のアイ, `1`は数字の１
- `0`は数字のゼロ, `o`はアルファベット小文字のオー，`O`は大文字オー


#tests_gen(Quiz,style:"Q", numbering-style: "number", subgroups:("Q11", "Q3"),  question-style: commentary_pick)
 