#import "quiz_bank.typ":*
#show heading: set text(font: "Harano Aji Gothic", fill: gradient.linear(..color.map.crest))
#set heading(numbering: "1.")
#set page(numbering: "1")
#set text(font: "Harano Aji Mincho", lang:"ja")
#set par(leading: 1em, first-line-indent: 1em)
#show math.equation: set text(font: "TeX Gyre Pagella Math")

#show strong: set text(fill:maroon.darken(30%))
#show strong: set text(font: "Harano Aji Gothic") 
#let kuran_count = counter("kuran_counter")

#show link: set text(fill: eastern.darken(30%))

//問題自体は[quiz_bank.typ]に格納する．
#align(center)[ #text(size:18pt,font: "Harano Aji Gothic", weight: "bold", fill: gradient.linear(..color.map.crest))[専門研究（一）課題]\

多鹿 智哉 \@ 日本大学 経済学部

教科書：上條・矢内 (2023)『Rで学ぶゲーム理論』朝倉書店
]
//問題の具体的なsourceはquiz_bank.typを参照すること


　 \
#tests_gen(Quiz,style:"Q", numbering-style: "number", subgroups:("Q11", "Q3"),  question-style: test-question-style, answer-style: test-answer-style)


