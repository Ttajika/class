
#import "slide_template.typ": *

#show: project.with(
title:"基礎ミクロ経済学のための数学",
authors: ("多鹿 智哉",),

emph_color:white.darken(2%),
size:20pt,
//margin:(right:20pt、top:10pt、 left:20pt、 bottom:10pt)
)

#import "@preview/cades:0.3.0": qr-code


#show link: underline 

#text(size:10pt)[Powered by Typst (#link("https://typst.app/")[typst.app])]


#slide-heading-outline.update(1)
//これを１にすればヘッドラインに目次(headingのlevelが１のもののみ)を加えられます．



= はじめに

- 大学１年生向けのミクロ経済学に必要な数学を学習します

#columns()[
- 計算が苦手な人は以下のアプリを使ってみましょう

  - #link("https://www.wolframalpha.com/")[WolframAlpha]
    #qr-code("www.wolframalpha.com/", height:3cm)
  - #link("https://vimeo.com/928301937/7323999c71?")[使い方]
    #qr-code("vimeo.com/928301937/7323999c71?", height:3cm)

  #colbreak()
- 質問があれば以下のLINEオープンチャットで質問できます
 
  #link("https://line.me/ti/g2/g_JP5wrv7AczQ4NLhNyXa4xGsys0f4BTkg4i_w?utm_source=invitation")[数学相談ルーム（LINEオープンチャット）]
    #qr-code("https://line.me/ti/g2/g_JP5wrv7AczQ4NLhNyXa4xGsys0f4BTkg4i_w?utm_source=invitation", height:4cm)
  ]
= 等式変形

 等式でできること
- 両辺に同じ数を足しても等式はそのまま

  - 例： $x=a$ ならば $x+b=a+b$

- 両辺に同じ数をかけても等式はそのまま

  - 例： $x=a$ ならば $b x= b a$

- 割る数が$0$でなければ両辺を同じ数で割ってもよい

  - 例： $a x= a b$ であり、$a eq.not 0$ ならば $x=b$


= 等式を解く　

- 変数を$x$としたとき、 $x=dots.c (x"を含まない式")$とすることを「*等式を$x$について解く*」と呼ぶ.

  - 例： 
    
        $ && &b x +1 =3 && #h(1em) \
          =>&& &b x +1 +(-1) = 3+(-1) #h(1em) &&"(両辺に"-1"を足す)"\
          =>&& &b x = 2 && "(計算する)"\
          =>&& & cases(
            x  = 2/b  &"(もし"b eq.not 0 "なら)",
            "解なし" &" (もし"b=0"なら)"
          )
        $


= 式変形

- くくる
  - $a x-b x$ と言う式があるとき、$a x-b x =(a-b) x$とできる
  - これを*「（$x$で）くくる」*という
- 分数の和
  - $a/b + c/d$ は分母を揃えて足す。$b、d eq.not 0$であることから　$a/b = a/b d/d$、 $c/d=c/d b/b$とし、
    $
    a/b + c/d= a/b d/d + c/d b/b = (a d)/(b d)+ (b c)/(b d)=(a d +  b c)/(b d )
    $
    と計算する。このように分母を揃えることを*「通分する」*と言う
- 分数分の分数
    -  $(a)/(c/d)$ のように分数の中に分数が入るとき、 分母分子に同じものをかけて簡単にする
    $
    a/(c/d)= (a d)/(c/d d)=(a d)/(c)
    $
  

= 関数

- 入力を出力に割り当てるものを*関数*と呼ぶ
  - 例： $f(x)=2x+1$
    - このときの入力は $x$、 出力は$f(x)$（関数の値とも言う）
    
    - 関数は $f$
  
  - 例：自動販売機
  
    - 入力は押したボタン、出力は出てくる飲み物
  
  - 例： $u(x,y)=x dot y$
  
    - 入力する変数が二つあっても同じ。ここの入力は $x$ と $y$
    
    - 出力は $x dot y$
= 微分
  
#columns[
  - 関数の傾き: 
    $
    (f(x+h)-f(x))/h
    $

    - $x$ が $h$ だけ増えたとき、$f$ の値が $h$ の何倍増えるか
    
    

  - #link("https://vimeo.com/804148111")[$h$が小さくなると接線の傾きに近づく_（動画）_]
    #qr-code("vimeo.com/804148111", height:3cm)
    - 微分する $=$ 接線の傾きを求める作業
#colbreak()
  - 傾きを求めると何が良い？

    - 増加局面か減少局面かがわかる
      - 微分の値がプラス $->$ 少し増やせば $f$ の値は増える.
      - 微分の値がマイナス $->$ 少し増やせば $f$ の値は減る.

  - $x$ において微分した値を記号で $f'(x)$ と書く

  - $x$ がほんの少し（$h$だけ）増えると $f$ の値は $f'(x) dot.c h$だけ増える

]
  
== 微分の公式1
#columns[
- $f(x)=a$ $->$ $f'(x)=0$
#colbreak()
- $f(x)=a x$ $->$ $f'(x)=a$
]
== 微分の公式2
#let tred(body) = math.equation[#set text(fill: maroon); #body]
#let tblue(body) = math.equation[#set text(fill: blue); #body]
#columns[
  - $f(x)=x^a$ $->$ $f'(x)=a x^(a-1)$

- なぜかを $f(x)=x^2 = #tblue[x] dot.c #tred[x]$ で考える.
  - $#tred[x]$ を変数と思えば傾きは $#tblue[x]$
  
    - $#tred[x]$が $h$ 増えれば、$f$ は $#tblue[x] dot.c h$増える
    
  - $#tblue[x]$ を変数と思えば傾きは $#tred[x]$
  
    - $#tblue[x]$が $h$ 増えれば、$f$ は $#tred[x] dot.c h$増える
    
  - $x$が $h$ 増えれば $#tred[x]$ も $#tblue[x]$ も $h$ 増える

    - $x$が $h$ 増えれば $f$は\
      $#tblue[x] dot.c h+#tred[x] dot.c h=2x dot.c h$増える

    - 微分は $2x$
    
  
  
  
  
  #colbreak()

#set list(spacing: 4em)
    - 例1： $f(x)=x^4$
    
    
      
      - 

    - 例2： $f(x)=x^(1/2)$
      
      - 

    - 例3： $f(x)=x^(-3)$

      - 
  ]
== 微分の公式3

#set list(spacing: 4em)

  - $f(x)=a g(x)$ $->$ $f'(x)=a g'(x)$

    - 例4： $f(x)=3x^2$

      - 
    
  - $f(x)=h(x)+g(x)$ $->$ $f'(x)=h'(x)+g'(x)$

    - 例5： $f(x)=2x^3+3a$

      - 

  
= 最大化問題

  - $f(p)$ の $p$ に関する*最大化解*とは
  
    - どんな $p$ に対しても $f(p^*)>= f(p)$ が成立するような $p^*$ のこと
  
    - $f(p^*)$ を*最大値*と呼ぶ

  - *最大化解であるための必要条件（一階の条件）* 
    - $f'(p^*)=0$
    - なぜ？
      - $f'(p^*)>0$ なら $p^*$ から少し $p$ を増やせば $f(p)$ の値が大きくなる
      - $f'(p^*)<0$ なら $p^*$ から少し $p$ を減らせば $f(p)$ の値が大きくなる
      - どっちのケースでも $f(p^*)$ は最大値になってない

== 最大化解を求める手順

- この方法は最大値があり、微分がいつでもでき、入力する値に制限がないことが前提

+ $f'(p)=0$ となる $p$ を探す

+ それらの $p$ のなかで、 $f(p)$ の値が一番大きいものが最大化解.


- 例：$f(p)=-p^2+2p$


= 偏微分

- *偏微分*は、関数に複数変数があるときに、ある一つの変数について微分することです
  - 微分とやることは同じ
#let pd(num,denom) = $(diff num)/(diff denom)$

- 例1： $f(x,y)=x^2+y^3$のとき
  - 関数 $f$ を $x$ で偏微分することを $pd(,x) f(x,y)$と書く
  - 上の例では $pd(,x)f(x,y)=2 x$
  
  - $y$ は $x$ とは関係ない文字なので、定数として扱う

== 偏微分続き
  
- 例2: $f(x,y)=x^2 y^4$のとき
  - 関数 $f$ を $y$ で偏微分することを $pd(,y)f(x,y)$ と書く
  
  - 上の例では $pd(,y)f(x,y)=4x^2 y^3 $ 
  - $x^2　$ は $y$ に関係のない文字なので、$y$で偏微分するときは定数扱い