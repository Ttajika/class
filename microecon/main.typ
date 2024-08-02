#import "quiz_bank.typ":*

#set page(numbering: "1")
#set text(font: "Harano Aji Mincho")
#show strong: set text(font: "Harano Aji Gothic") 


//問題自体は[quiz_bank.typ]に格納する．
= ミクロ経済学問題集

\
#tests_gen(Quiz,style:"Q", numbering-style: "number", subgroups:("Q1", "Q2"), categories:(), mode:"", question-style: test-question-style, answer-style: test-answer-style)


//それぞれの変数の説明
//Quiz: quiz_bank.typでつくった問題のリスト． 形式に従った問題のリストであればなんでも良い．形式については[quiz_bank.typ]を参照のこと
//style: str型をとる． "Q" or "A" or "both" or "Q-A"
//numbering-style: "number" or "id"
//subgroups: idのリストを指定して， modeを"sub"に指定するとリストにあるidに対応する問題を出力する.
//categories: categoryのリストを指定して， modeを"cat"に指定するとカテゴリーが指定したものに対応する問題を出力する
//mode: デフォルトは""で，これは全ての問題を出力する. "sub"でsubgoupsで指定したidリスト，"cat"でカテゴリーで指定したものに限定して出力する.
//question-style: 問題の出力のスタイル．　いまのところ default-quiz-styleとtest-question-style, および test-question-style-no-spaceの３種類
//answer-style: 解答の出力のスタイル．　いまのところ default-answer-styleとtest-answer-styleの2種類





// = ランダムテスト


// \

// #let seed = datetime.today().year() * datetime.today().month() * datetime.today().day() 
// //seedには適当な数字を入れる．現状は日付を利用する

// #random_test(Quiz,style:"Q", size:3, numbering-style: "number", subgroups:(), categories:(), mode:"", question-style: test-question-style-no-space, answer-style: test-answer-style, seed:seed)

//ランダムに問題を出力する
//基本はtests_genと同じ
//size: 出力する問題の数を指定する
//seed：問題を選ぶための乱数のシード．デフォルトは今日の日付(ymd)の積（y*m*d）. シードが同じなら乱数も同じ．

解答欄も作ることができる．

#import "answer_box.typ":*



#ansbox(3,2,1, daimon:none, shomon:"問1.", shomon_width:4em)
//#v(-.47cm)
#ansbox(3,2,1, daimon:none, shomon:"問1.", shomon_width:4em, shomon_start:7, box_width:2cm)




