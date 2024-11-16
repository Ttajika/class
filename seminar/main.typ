#import "@preview/roremu:0.1.0": roremu
#import "lib/setting.typ": *


#show: project.with(
  title: "タイトル",
  authors: ([
#table(stroke:0pt,columns:2,[#waritsuke(4,"氏名")
],[自分の名前を書く],[#waritsuke(4,"学籍番号")
],[学籍番号を書く])
  ],),
  lang: "jp",
  date: Today(style:"ymd-jp"),
  style: "dissertation"//"report"だとレポートスタイルに，"dissertation"に変更すると卒論スタイルになる
  ,seminar: "〇〇研究室"

)




= はじめに<ax>


@ax
@axx
== ああ<axx>
#roremu(140)A

#roremu(140)

== 箇条書き

箇条書きとは #roremu(100,offset:400)
#enum([あ
],[い],[う], numbering: "[a]")

次の等式$x=2x$を考える．

= 関連文献

#roremu(330)

@a によると @b は😯
= 本論/方法

#roremu(330)

#theorem[すごい定理]<c>

@c  #roremu(400,offset: 330)

#roremu(400,offset: 730)



#figure(caption:"日大経済のロゴ")[#image("logo.svg")]<d>
 
@d は日大のロゴ. 

  $
  e^(i pi)=-1
  $<e>
  
  @e 式はすごい式．$a^3+b^3=c^3+d^3$




= 結論

#lorem(140)


#bibliography-list(title:"参考文献",
numbering: "")[
  #bib-item(<a>, key: "著者a (2012)")[著者aのフルネーム (2012) "すごい論文" 雑誌名]
  #bib-item(<b>, key: "著者b (2024)")[著者bのフルネーム (2024) 「すごい本」 出版社]
  
]