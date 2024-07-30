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
  style: "report"//"dissertation"に変更すると卒論スタイルになる

)

= はじめに
#lorem(140)

#lorem(140)


= 関連文献

#roremu(330)

= 本論/方法

#roremu(400,offset: 330)

#roremu(400,offset: 730)




= 結論

#lorem(140)