#import "functions.typ": *
#import "@preview/cetz:0.2.2"
#import "@preview/codly:1.0.0": *

  
#set text(font: "Harano Aji Mincho",lang:"jp")
#show strong: set text(font: "Harano Aji Gothic", lang:"jp") 
#show raw: set text(font:"Harano Aji Gothic")
//see https://typst.app/docs/reference/foundations/calc





Quiz_createで問題のリストを作成する． Quiz = Quiz_createとするとQuizが問題のリストを格納する変数

- quiz関数で，形式に合った問題を作成する. 以下その各種引数の説明

- 最初の引数はid: これがラベルにもなるので，問題を引用するときは @Q2 のようにできる．回答のラベルはAをつけて @Q2A
  - なので別のidにAをつけたものをidにするとラベルが重複しエラーが出るので注意．

- question: 問題文. []　の中に入力する

- answer: 解答. [] の中に入力する

- commentary:  解説. [] の中に入力する

- point: 配点． 整数を入力する. 合計点を計算するシステムは未実装．

#let Quiz = Quiz_create(
  // quiz("Q1", question:[
  //   各プレイヤーが，５つの戦略を持つゲームを書きなさい．
  // ], answer:[
    
  // ], point:3, show-answer:true, category:"Term1"),
  //  quiz("Q2", question:[
  //   ３人のプレイヤーがいるゲームの利得表を書きなさい．
  // ], answer:[
    
  // ], point:3, show-answer:true, category:"Term1"),
  quiz("Q3", question:[
    次のゲームの弱支配戦略・強支配戦略を見つけなさい．
    
    + #Ngame(("A","B"), 
    (("U","D"),("L","R")), 
    (([1,3],[2,6]),
    ([3,2],[2,3])
    )
    )
    
    + #Ngame(("A","B"), 
    (("U","D"),("L","R")), 
    (([3,6],[2,6]),
    ([3,4],[2,4])
    )
    )
    
    + #Ngame(("A","B"), 
    (("U","M", "D"),("L","C","R")), 
    (([1,3],[2,6],[2,3]),
    ([3,2],[1,3],[2,3]),
    ([2,1],[2,3],[3,2])
    )
    )
    
  ], answer:[
    
  ], point:5, show-answer:true, category:"Term1"),
  quiz("Q4", question:[
    次のゲームの支配される戦略の逐次的消去によって残る戦略の組をすべてみつけなさい．
  
    + #Ngame(("A","B"), 
    (("U","D"),("L","R")), 
    (([1,3],[2,6]),
    ([3,2],[2,3])
    )
    ) 
      

    + #Ngame(("A","B"), 
    (("U","M", "D"),("L","C","R")), 
    (([1,3],[2,6],[2,3]),
    ([3,2],[1,3],[2,3]),
    ([2,1],[2,3],[3,2])
    )
    )
    
    + #Ngame(("A","B"), 
    (("A1","A2", "A3", "A4", "A5", "A6"),("B1","B2","B3","B4","B5", "B6","B7")), 
    (([5,3],[2,3],[2,6],[3,5],[2,6],[1,1],[2,2]),
    ([3,2],[3,4],[5,3],[4,1],[3,2],[3,2],[3,3]),
    ([5,3],[2,5],[5,4],[2,3],[3,9],[2,3],[3,10]),
    ([3,2],[4,4],[4,3],[5,2],[4,3],[9,5],[5,3]),
    ([1,2],[5,5],[3,3],[2,4],[3,4],[4,6],[6,4]),
    ([3,1],[2,3],[4,2],[6,1],[1,1],[2,5],[3,4])
    )
    )
    
  ], answer:[
    
  ], point:5, show-answer:true, category:"Term1"),
  quiz("Q5", question:[
    次のゲームの純粋戦略ナッシュ均衡の組をすべてみつけなさい．
    + #Ngame(("A","B"), 
    (("U","D"),("L","R")), 
    (([1,3],[2,6]),
    ([3,2],[2,3])
    )
    )
    + #Ngame(("A","B"), 
    (("U","D"),("L","R")), 
    (([3,6],[2,6]),
    ([3,4],[2,4])
    )
    )
    + #Ngame(("A","B"), 
    (("U","M", "D"),("L","C","R")), 
    (([1,3],[2,6],[2,3]),
    ([3,2],[1,3],[2,3]),
    ([2,1],[2,3],[3,2])
    )
    )
    + #Ngame(("A","B"), 
    (("A1","A2", "A3", "A4", "A5", "A6"),("B1","B2","B3","B4","B5", "B6","B7")), 
    (([5,3],[2,3],[2,6],[3,5],[2,6],[1,1],[2,2]),
    ([3,2],[3,4],[5,3],[4,1],[3,2],[3,2],[3,3]),
    ([5,3],[2,5],[5,4],[2,3],[3,9],[2,3],[3,10]),
    ([3,2],[4,4],[4,3],[5,2],[4,3],[9,5],[5,3]),
    ([1,2],[5,5],[3,3],[2,4],[3,4],[4,6],[6,4]),
    ([3,1],[2,3],[4,2],[6,1],[1,1],[2,5],[3,4])
    )
    )
    
  ], answer:[
    
  ], point:5, show-answer:true, category:"Term1"),
  quiz("Q5.5", question:[
   @Q5 で求めたナッシュ均衡がパレート効率的かどうかそれぞれ調べなさい．
    
  ], point:6, show-answer:true, category:"Term1"),
  
  quiz("Q6", question:[
    N人鹿狩りゲームの変形版として，次のゲームを考える．
    - 参加者が$k$人以上であれば, 参加者は 利得$10$を得る．不参加者は利得$0$を得る．
    - 参加者が$k$人より少なければ，参加者も不参加者も利得は0である．

    + このゲームのナッシュ均衡を全て求めなさい．
    + どのような状況がこのゲームに当てはまるだろうか？考えなさい．
    
  ], commentary:[
    参加者が$ell$人のとき，次の2点を確かめる．(1) 参加していないプレイヤーが参加したがるか (2) 参加しているプレイヤーが参加したがらないか
    
  ], point:8, show-answer:true, category:"Term1"),

  quiz("Q7", question:[
    N人鹿狩りゲームの変形版として，次のゲームを考える．
    - 参加者が$k$人以上であれば, 参加者は利得$10$を得る．不参加者は利得$20$を得る．
    - 参加者が$k$人より少なければ，参加者も不参加者も利得は0である．

    + このゲームのナッシュ均衡を全て求めなさい．
    + どのような状況がこのゲームに当てはまるだろうか？考えなさい．    
  ], commentary:[
    参加者が$ell$人のとき，次の2点を確かめる．(1) 参加していないプレイヤーが参加したがるか (2) 参加しているプレイヤーが参加したがらないか
    
  ], point:8, show-answer:true, category:"Term1"),

  quiz("Q7.5", question:[
    ２プレイヤー・2戦略のゲームを Rgamer を用いて1000個作成し，純粋戦略ナッシュ均衡の存在する割合を計算しなさい．ただし，利得はランダムにすること．
  ], commentary:[ 
  - ループを使う．例えば次のようにすると，1から1000まで, {}の中身を繰り返す．{}の中身にゲームを生成し，ナッシュ均衡を求めるコードを入れる．
    ```R
    N <- 1000 #Nは繰り返しの数である．
    for (i in 1:N){
      ...
      game <- ...
      game_sol <- ...
      ...
    }
    ```
    ...のところには適切なコードが入るものとする（この部分を自身で考える）．
  - ランダムな４つの成分を持つベクトルを出力するには例えば以下のようにする．
    ```R
    payoff1 <- runif(4, min = 1, max = 100)
    ```
    これにより，1から100までのランダムな実数を4つ生成するベクトルをpayoff1に代入できる．

  - ナッシュ均衡が存在しない場合，それを出力するコードはNULLを出力する．その場合は
    ```R
    if (is.null(game_sol$psNE) { 
      x <- x + 1
    }
    ```
    このようにすれば，NULLが発生するたびに，xという変数に1を足していくというコードになる．つまり，ナッシュ均衡が存在しないゲームの数を数え上げることになる．
    
  ], point:8, show-answer:true, category:"Term1"),
  
   quiz("Q7.8", question:[
    ２プレイヤー・2戦略のゲームを Rgamer を用いて1000個作成し，パレート効率的な純粋戦略ナッシュ均衡が存在する割合を計算しなさい．
    ただし，利得はランダムにすること．
  ], commentary:[
    パレート最適かどうかをチェックするには以下の関数を定義する.このコードでは，与えられたナッシュ均衡がパレート効率的であればTRUEを，そうでなければFALSEを出力する関数(`isPareto`)を作成している．
    ```R
    #引数はゲームとナッシュ均衡. これはrgamerを用いて求める．
    isPareto <- function(game, NE) {
        m <- length(game$df$s1) #mは戦略の組み合わせの総数
        Num <- NULL
        
        # NEのインデックスを探す
        for (i in 1:m) {
          g <- paste0("[", game$df[i, 3], ", ", game$df[i, 4], "]")
          if (g == NE) {
            Num <- i
            break #breakはループを打ち切る命令
          }
        }
        
        # Numが見つからない場合のエラーハンドリング
        if (is.null(Num)) {
          stop("NEが見つかりません")
        }
        #NEpayoffはナッシュ均衡における利得
        #NEpayoff[1]がプレイヤー１の，NEpayoff[2]がプレイヤー２の利得
        NEpayoff <- c(game$df$payoff1[Num], game$df$payoff2[Num])
        
        # パレート最適性のチェック
        # jは戦略組の番号
        for (j in 1:m) {
          cond1 <- all(game$df$payoff1[j] >= NEpayoff[1], game$df$payoff2[j] >= NEpayoff[2])　
          cond2 <- any(game$df$payoff1[j] > NEpayoff[1], game$df$payoff2[j] > NEpayoff[2])
          
          # 両方の条件が満たされた場合
          if (cond1 && cond2) {
            print("is Not Pareto")
            return(TRUE)
            break   #breakはループを打ち切る命令
          }
        }
        print("is Pareto")
        return(FALSE)
      }
    ```
    
  ], point:10, show-answer:true, category:"Term1"),
    quiz("Q7.4", question:[
    ２プレイヤー・2戦略のゲームを Rgamer を用いて1000個作成し，強支配戦略均衡の存在する割合を計算しなさい．ただし，利得はランダムにすること．], point:8),

   quiz("Q8", question:[
     次のゲームの混合戦略ナッシュ均衡を求めなさい．
     
        #Ngame(("A","B"), 
    (("U","D"),("L","R")), 
    (([4,6],[2,1]),
    ([3,2],[4,4])))
  ], answer:[
    
  ], point:7, show-answer:true, category:"Term1"),
  quiz("Q9", question:[
     次のゲームの混合戦略ナッシュ均衡を求めなさい．
     
       #Ngame(("A","B"), 
    (("U","D"),("L","R")), 
    (([$a,e$],[$d,f$]),
    ([$b,h$],[$c,g$])))
    
    ただし，$a>b$, $c>d$, $e>f$, $g>h$ であるとする．
  ], answer:[
    
  ], point:9, show-answer:true, category:"Term1"),

  quiz("Q11", question:[
     次のゲームは査察ゲームという．
     
       #Ngame(("査察官","旅行者"), 
    (("調査する","調査しない"),("危険物を持ち込む","持ち込まない")), 
    (([$-c,-z$],[$-c,0$]),
    ([$-d,a$],[$0,0$])))
    
    ただし，$a,d,c,z>0$ かつ $d>c$であるとする．つまり，$a$は持ち込みの利益，$z$は罰則の重さ，$d$は持ち込まれたことによる被害，$c$は調査の費用である．
    + $a,d,c,z$に適当な数字を入れ，混合戦略ナッシュ均衡を求めなさい．
    + 1で入れた数字について，$a$の値を増やしたとき，危険物を持ち込む確率はどう変化するか？ ほかの$d,c,z$についてもそれぞれ同じことを考えなさい．

  ], answer:[
    
  ], point:10, show-answer:true, category:"Term1"),

  quiz("Q9.5", question:[
     次のゲームの混合戦略ナッシュ均衡をすべて求めなさい．
     
       #Ngame(("A","B"), 
    (("U","D"),("L","M","R")), 
    (([$1,3$],[$0,2$],[$1,1$]),
    ([$0,1$],[$1,2$],[0,3])))
    
  ], answer:[
    
  ], point:15, show-answer:true, category:"Term1"),
  
  quiz("Q10", question:[
    次のゲームを考える．
    - 参加者が $k$ 人以上であれば, 参加者は利得$10$を得る．不参加者は利得$20$を得る．
    - 参加者が $k$ 人より少なければ，参加者も不参加者も利得は0である．
    - 人の数は $n$ である．

    このゲームの混合戦略ナッシュ均衡を考えるために次に答えなさい．
    + 参加者が $k-2$ 人以下であることが予想されるとき，ある一人が参加することで利益が増えるかどうか答えなさい．
    + 参加者が $k$ 人以上であることが予想されるとき，ある一人が参加することで利益が増えるかどうか答えなさい．
    + ある一人が参加する確率が $r$ であるとき，参加者が $k-1$ 人である確率を求めなさい．
    + ある一人が参加する確率が $r$ であるとき，参加することと参加しないことが無差別になるような $r$ の値を求めなさい．
    + 混合戦略ナッシュ均衡における，一人が参加する確率 $r$ を求めなさい．
     
  ], answer:[
    
  ], point:9, show-answer:true, category:"Term1", commentary:[$n$ 人中 $k$ 人が参加する確率は $attach(C,bl:n,br:k)  = (n!)/((n-k)!k!)$である．]),
  quiz("Q12", question:[
    クールノー競争を考える．逆需要曲線が $P(x)=100-x$ であるとし，企業1の費用が$10$, 企業2の費用が $c$ であるとする．
    + $c=10$のときのナッシュ均衡を求めなさい.
    + $c$を増加させていったとき，ナッシュ均衡における企業2の生産量が$0$になるような最小の値を求めなさい．
    
     
  ], answer:[
    
  ], point:8, show-answer:true, category:"Term1"),
  quiz("Q13", question:[
    次のゲームは差別化ベルトラン競争と呼ばれるものの一種である．
  $
  pi_1(p_1,p_2)= (D-p_1+1/2 p_2) times (p_1-c_1)\
  pi_2(p_1,p_2)= (D+1/2 p_1- p_2)times (p_2-c_2)
  $
  + $D, c_1,c_2$に適当な数値を代入し，このゲームのナッシュ均衡を求めなさい.
  + $D$の値が増えたとき，ナッシュ均衡はどう変化するか答えなさい．$c_1,c_2$がそれぞれ増えたときについてもそれぞれ答えなさい．
    
     
  ], answer:[
    
  ], point:8, show-answer:true, category:"Term1"), 
  quiz("Q14", question:[
    後出しジャンケンのゲームの木を描きなさい
    
     
  ], answer:[
    
  ], point:6, show-answer:true, category:"Term1"), 
    quiz("Q14.1", question:[
    二目並べのゲームの木を描きなさい．ただし，以下のマスの上で行われるとする．
     #align(center)[
    #cetz.canvas({
    import cetz.draw: *
    rect((0,0),(2,2))
    rect((0,0),(1,1))
    rect((1,1),(1,2))
    rect((1,2),(2,1))
    content((.5,.5),[a])
    content((.5,1.5),[b])
    content((1.5,.5),[d])
    content((1.5,1.5),[c])
      })]
     
  ], answer:[
    
  ], point:6, show-answer:true, category:"Term1"),
   quiz("Q14.2", question:[
    三目並べ (tick-tack-toe) のゲームの木を答えなさい．ただし，以下のマスの上で行われるとする．
     #align(center)[
    #cetz.canvas({
    import cetz.draw: *
    rect((0,0),(3,3))
    for j in (0,1,2) {
    for i in (0,1,2){
    rect((0+j,0+i),(1+j,1+i))
    content((0.5+j,0.5+i),[#numbering("a",i+3*j+1)])
    }
    }
    
    
 
    
      })]
     
  ], answer:[
    
  ], point:12, show-answer:true, category:"Term1"),
   quiz("Q15", question:[
    次のゲームの木で表されるゲーム（*ムカデゲーム*）のバックワードインダクションによる解を求めなさい．
    #align(center)[
    #cetz.canvas({
    import cetz.draw: *
    line((0,0),(10,0), mark:(end:"straight"))
    for i in range(5){
      line((2*i,0),(2*i,-1.5), mark:(end:"straight"))
      circle((2*i,0),radius: 1mm, fill:white)
    let name = {
      if calc.odd(i+1) {1} else {2} }
      let payoff1 = {
        i+2 - 2*name 
      }
      let payoff2 = {
        i + 3- 4/name 
      }
      content((2*i,0),[P#name],padding:(y:4mm), anchor:"south")
      content((2*i+1,-0.2),[C],padding:(y:4mm), anchor:"south")
      content((2*i +.2,-1.2),[D],padding:(y:4mm), anchor:"south")

      content((2*i,-2.5),[$(#payoff1, #payoff2)$],padding:(y:4mm), anchor:"south")
    }
    content( (10,0), [$(3,5)$], anchor:"west",padding:(x:2mm))
}
    )]
    
     
  ], answer:[
    
  ], point:8, show-answer:true, category:"Term1"),
  
  quiz("Q16", question:[
    2人鹿狩りゲームの変形版として，次のゲームを考える．
    - 寄付額が20になったら全員が利得11を獲る．
    - 寄付額が20未満なら，寄付額分のお金を失う．

     プレイヤー１，プレイヤー２の順番に寄付額を決定する場合のバックワードインダクションの解をひとつ求めなさい．ただし，各プレイヤーは無差別であれば寄付することを選ぶとする．
  ], answer:[
    
  ], point:12, show-answer:true, category:"Term1"),
    quiz("Q17", question:[
    @Q16 のゲームを考える．

    プレイヤー１，２が同時に寄付額を決めるステージが２回あるとき，次のようなサブゲーム完全均衡を求めなさい． 
    + 均衡経路上の寄付額は0
    + 均衡経路上の合計寄付額は20
    ただし，各プレイヤーは無差別であれば寄付することを選ぶとする．
  ], answer:[
    
  ], point:14, show-answer:true, category:"Term1"),
    quiz("Q18", question:[
      @Q16 のゲームを考える．
      
    プレイヤー１，２が同時に寄付額を決めるステージが２回あるとき，サブゲーム完全均衡を求めなさい．ただし各プレイヤーはステージ１，２のどちらか一度しか寄付できないとする． 
    ただし，各プレイヤーは無差別であれば寄付することを選ぶとする．
  ], answer:[
    
  ], point:14, show-answer:true, category:"Term1"),
  quiz("Q19", question:[
      自分の利得が $x$, 相手の利得が $y$ のとき，主観的な利得 $pi(x,y)$ が次のように定義されるとする．
      $
      pi(x,y)= x-alpha y
      $
      これをシャーデンフロイデのモデルと呼ぶ．$alpha$の値を適当に設定し，最後通牒ゲームを分析しなさい．その上で，不平等回避のモデルでの結果とどのような違いがあるか答えなさい．
  ], answer:[
    
  ], point:8, show-answer:true, category:"Term1"),

   
  
  quiz("Q20", question:[
    提案者が利得10の分前を提案し，応答者は何をしようと提案者が提案する通りに利得が実現する．このゲームを*独裁者ゲーム*と呼ぶ．
    
      @Q19 のシャーデンフロイデのモデルと不平等回避のモデルで独裁者ゲームの結果にどのような違いが起きるか，答えなさい．
     
  ], answer:[
    
  ], point:10, show-answer:true, category:"Term1"), 

  quiz("Q15.1", question:[
    （記憶力のないプレイヤーたちによるムカデゲーム）次のゲームの木で表されるゲームの純粋戦略サブゲーム完全均衡をすべて求めなさい．ただし，同じ曲線で囲まれたノードは同じ情報集合に属するとする．
    #align(center)[
    #cetz.canvas({
    import cetz.draw: *
      //情報集合
     hobby((2-0.2, 0.1), (5, -.8),  (6.2, 0.2), omega: 0, stroke: (paint: red.lighten(20%), thickness: 14pt, cap: "round"))
     hobby((2-0.2, 0.1), (5., -.8),  (6.2, 0.2), omega: 0, stroke:(paint: red.lighten(100%), thickness: 8pt, cap: "round"))
     hobby((-0.1, -0.1), (1, 1),  (4, -0.),  (5.2, 1),  (8.1, -0.1), omega: 0, stroke: (paint: blue.lighten(20%), thickness: 14pt, cap: "round"))
      hobby((-0.1, -0.1), (1, 1),  (4.0, -0.), (5.2, 1),  (8.1, -.1), omega: 0, stroke: (paint: blue.lighten(100%), thickness: 8pt, cap: "round"))
    line((0,0),(10,0), mark:(end:"straight"))
    for i in range(5){
      line((2*i,0),(2*i,-1.5), mark:(end:"straight"))
      circle((2*i,0),radius: 1mm, fill:white)
    let name = {
      if calc.odd(i+1) {1} else {2} }
      let payoff1 = {
        i+2 - 2*name 
      }
      let payoff2 = {
        i + 3- 4/name 
      }
      content((2*i,0),[#box(fill:white.transparentize(10%))[P#name]],padding:(y:4mm), anchor:"south")
      content((2*i+1,-0.2),[#box(fill:white.transparentize(10%))[C]],padding:(y:4mm), anchor:"south")
      content((2*i +.2,-1.2),[D],padding:(y:4mm), anchor:"south")

      content((2*i,-2.5),[$(#payoff1, #payoff2)$],padding:(y:4mm), anchor:"south")
    }
    content( (10,0), [$(3,5)$], anchor:"west",padding:(x:2mm))
   
   
  }  
    
    )]
    
     
  ], commentary:[同じ情報集合に含まれるノードでは同じ行動をする事に注意をする．情報集合がいくつあるかを考える．
    
  ], point:9, show-answer:true, category:"Term1"),
  
  quiz("QM", question:[以下のCSVファイルをダウンロードし，ボストン方式とDA方式によるマッチング結果をそれぞれ出力しなさい. \
  - #link("https://www.dropbox.com/scl/fi/kh8s2k4wkdnb29865e61c/Male_pref.csv?rlkey=wbotpzz46yvo5cjxg9bnxug5r&st=84hzjkyb&dl=0")[男性の選好の名簿]

  - #link("https://www.dropbox.com/scl/fi/68y9v7hqxvppyovyhfo4p/Female_pref.csv?rlkey=hscpy8yie2iuqqvfwujlivi0c&st=6ezzhg2c&dl=0")[女性の選好の名簿]
], point: 8),
quiz("QM2", question:[次の選好をもつ人々を考える.

/ M1: W1 W2
/ M2: W2 W1

/ W1: M2 M1
/ W2: M1 M2

+ 男性側提案DA方式によるマッチングを求めなさい
+ 1で求めたマッチングについて，W2が M1 という選好を提示する（つまりM2は受け入れ不能と詐称する）ときの男性側提案DA方式によるマッチングを計算することで，男性側提案DA方式が女性にとって耐戦略的でないことを示しなさい．
+ 女性側提案DA方式によるマッチングを求めなさい
+ 1で求めたマッチングについて，女性側提案DA方式が男性にとって耐戦略的でないことを示しなさい．

  
],point:5),
  quiz("Q21", question:[
      人とモノのマッチングモデルを考える．つまり，人にモノを一つづつ割り当てることを考える．

      次のようなアルゴリズムを*逐次独裁者アルゴリズム*と呼ぶ.
      + 人の優先順位を決める
      + 最初に決めた順位の順に人がモノをひとつづつ選んでいく．

      このアルゴリズムが耐戦略的かつ効率的であることを説明しなさい．
  ], answer:[
    
  ], point:10, show-answer:true, category:"Term1"),
  quiz("Q21.5", question:[人と各個人の物についてのリストが与えられたとき，逐次独裁者アルゴリズムによって配分を出力する関数を作りなさい．
  ], answer:[
    
  ], point:10, show-answer:true, category:"Term1"),
  quiz("Q22", question:[
      人とモノのマッチングモデルを考える．つまり，$n$ 人に $n$ 種類のものを割り当てる．

      次のような方式を*最良交換サイクル方式*と呼ぶ.
      + 人に適当にモノを割り当てる
      + 各個人は自分が最も欲しいモノを持っている人を指差す
      + 指さしのサイクルができれば，そのサイクルを使ってモノを交換する．サイクルの外の人はそのまま自分に割り当てられたモノをもつ
      + サイクルで交換した人を除外し，残りの人たちで同じことを繰り返す．

      この方式が耐戦略的であることを説明しなさい．
  ], answer:[
    
  ], point:10, show-answer:true, category:"Term1", commentary:[
  - 最良交換サイクル方式を例によって説明する．人が4人(M1, M2, M3, N4), モノが三つあるとする（O1, O2, O3, O4）．人の好みは次のようになっている.
    / M1: O2 O1 O3 O4
    / M2: O3 O2 O1 O4
    / M3: O1 O4 O2 O3
    / M4: O1 O3 O2 O4

    + まず最初に人にモノをランダムに割り当てる．ここではM1にO1, M2にO2, M3にO3, M4にO4を割り当てたことにしよう．
    + 次に，各個人が一番欲しいモノを持っている人を指差す．M1はO2が一番欲しいのでM2を，M2はO3が一番欲しいのでM3をM3はO1が一番欲しいのでM1を指差す．ここで，M1がM2を，M2がM3を，M3がM1を指差しているのでサイクルができている．M4はM1を指差すが，ここではサイクルができていない.

    + M1 $->$ M2 $->$ M3 $->$ M1というサイクルができたので彼らの中でモノを交換する．つまりM1はM2の持っているO2を，M2はM3の持っているO3を，M3はM1のもっているO1を得る．
    + 残ったM4は残っているのが彼自身しかいないので，自分自身を指差し（これがサイクルになる） O4を得る．
    + 全員の交換が終われば方式は終了する.

  - 耐戦略的かどうかは自分が嘘をついてどうなるかを考えれば良い．例えば本来１回目でサイクルが作れる人は自分が一番欲しいモノを得ているので嘘をついても仕方ない．２回目でサイクルが作れる人は二番目に欲しいモノを得ているが，仮に１回目で嘘をついても，サイクルには入れないので今より良いモノは得られない．3回目以降も同じである．
    
  ]),
  quiz("Q22.5", question:[人と各個人の物についてのリストが与えられたとき，最良交換サイクルアルゴリズムによって配分を出力する関数を作りなさい．
  ], answer:[
    
  ], point:10, show-answer:true, category:"Term1"),

 
  
  
)












