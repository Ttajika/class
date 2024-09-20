#import "@preview/lemmify:0.1.5": *
#import "@preview/physica:0.9.2": * 
#import "translation.typ": *

#let cap_body(it) = {if it != none {return it.body}
else {return it}
}

#let inactive_versions(name_varsion) = {
    let name_version(title: none, label:none, body) = {
        }
}


#let noindent() = {h(-1em)}

#let indent() = {h(1.2em)}

//autonumbering equations

#let tjk_numb_style(tag,tlabel,name) = {
 if tag == true  {
   if name == none{
   return  it => "("+str(tlabel)+")"}
   else {return it => "("+str(name)+")"}
 }
 else {
   return  "(1)"
 }

  
}

#let aeq(tlabel, name:none, tag:false, body) ={
        locate(loc =>{
        let  eql = counter("tjk_auto-numbering-eq" + str(tlabel))
        if eql.final(loc).at(0) == 1{
          [#math.equation(numbering: tjk_numb_style(tag,tlabel,name),block: true)[#body]
         #label(str(tlabel))]
         if tag == true{counter(math.equation).update(i => i - 1)}
          }
        
        else {
         [#math.equation(numbering:none,block: true)[#body] ]
        }
      })
}





#let eq_refstyle(it,lang:"en") = {
  return  {
  let lbl = it.target
  let eq = math.equation
  let el = it.element
  let eql = counter("tjk_auto-numbering-eq"+str(lbl))
    eql.update(1)
    if el != none and el.func() == eq {
    link(lbl)[
    #numbering(
      el.numbering,
      ..counter(eq).at(el.location())
    ) ]
    } else {it}
  }
}

#let plurals(single,dict) ={
  if single in dict.keys() {
    return dict.at(single)
  }else {return single}
}


#let ref_tag(it) = {
  show ref: it => {
    return it.element.supplement
  }
  ref(it)
}


#let refs(..sink,dict:plurals_dic,add:" and ",comma:", ") = {
  let args = sink.pos()
  let numargs = args.len()
  let current_titles = ()
  let titles_dic = (:)
  if numargs == 1 {link(ref(args.at(0)).target)[#ref(args.at(0))]}
  else {
  show ref: it => plurals(it.element.supplement.text,dict)
  ref(args.at(0)) + " "
  show ref: it => {
     let c_eq = it.element.counter
      numbering(it.element.numbering,
      ..c_eq.at(it.element.location()))
  }
  if numargs == 2{link(ref(args.at(0)).target)[#ref(args.at(0))] + ""+ add +"" + link(ref(args.at(1)).target)[#ref(args.at(1))]}
  else{
  for i in range(numargs){
   if i< numargs - 1 {link(ref(args.at(i)).target)[#ref(args.at(i))] + comma+"" }
   else {add+"" + link(ref(args.at(i)).target)[#ref(args.at(i))]}
  }}
  }
}



#let counter_body(num) = {if num != none {return num.counter}
else {return num}}

//定理環境の基本設定：より高度な設定はLemmifyを用いる
  

#let my_thm_style(
  thm-type, name, number, body
) = {

 block(width:100%, breakable: true, above:0em, below:0em)[
  #strong(thm-type)
  #if number != none {
    strong(number)
  }#if name  == none {"."}#if name != none {
    " "+ [(#name).] + " "
  }
  #emph(body)
] 
indent()
}



#let my_defi_style(
  thm-type, name, number, body
) = {
  block(width:100%, breakable: true,  above:0em, below:0em)[
  #strong(thm-type) 
  #if number != none {
    strong(number) 
  }#if name == none {"."}
  #if name != none {[(#name).] 
  }
  #body] 
  indent()
}



#let my_proof_style(
  thm-type, name, number, body, lang
) =  {
  block(width:100%, breakable: true)[
  #if name  == none {strong(trans.at(lang).at("Proof")) +"."}
  #if name != none {
  [#strong[#proofname(name,lang)]] 
  }
    #body  #h(1fr) #QERmark(lang)
  ]
}


#let theorem_base(thm_style, kind, supplement) ={
  return{ (name:none, numbering:numbering,content) =>  figure(
    content,
    caption: name,
    kind: kind,
    supplement: supplement
  ) }
}


#let trans_thm(str,lang) = {
  if lang == "jp"  {
    return theorem_jp.at(str)
  }
  else {return str}
}

#let theorem_create(tlabel, supple:none) = {
    if supple == none{
    return{theorem_base(my_thm_style, tlabel, tlabel)}
    } else {
    return{theorem_base(my_thm_style, tlabel, supple)}
    }
    
  }

#let theorem = theorem_create("Theorem", supple: "定理")
#let prop = theorem_create("Proposition", supple: "命題")
#let lemma = theorem_create("Lemma", supple: "補題")
#let rem = theorem_create("Remark", supple: "注意")
#let cor = theorem_create("Corollary")
#let claim = theorem_create("Claim")
#let fact = theorem_create("Fact")
#let defi = theorem_create("Definition")
#let assump = theorem_create("Assumption")
#let ex = theorem_create("Example")
#let proof = theorem_create("Proof", supple: "系")



#let theo_list = ("Theorem","Proposition","Lemma","Remark","Corollary","Claim","Fact")
#let defi_list = ("Definition","Assumption","Example")
#let others_list = ("Table","Figure")


  
  






#let content_remove_br(cont) = {
  if cont.has("body"){
    let valuecon = cont.body.at("children")
    let val_num = valuecon.len()
    let value = ""
    for i in range(1,val_num - 1 ) {
      value = value + valuecon.at(i)
      }
    return value
    }
    else {
      return cont
    }
  }

//conditional probability; different from phisyca Pr 
#let Pro(..sink) = {
  let args = sink.pos()
  let event = content_remove_br(args.at(0)) 
  if args.len() <= 1 {
    $op("Pr")(event)$ 
  }
  else {
  let condition = content_remove_br(args.at(1))
  $op("Pr")(event mid(|) condition)$ 
  }
}

#let argmax = $op("arg max", limits: #true)$
#let argmin = $op("arg min", limits: #true)$
#let cdot = $dot.c$
#let cdots = $dots.c$




//2player Normal form game
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
  table(columns: strategies.at(1).len()+2,
      align: center + horizon,
      stroke: (x,y) => (
        top: if y ==2 {1pt} else {0pt},
        left: if x==2 {1pt} else {0pt}
      ),
      [], table.cell(colspan: strategies.at(1).len()+1, players.at(1)),
          table.cell(rowspan: (strategies.at(0).len()+1), players.at(0)),
      ..glist.flatten()
    )  }
}

//Date functions




#let Today(style:"mdy-en") = {
  let y = datetime.today().year() 
  let m = datetime.today().month()
  let d = datetime.today().day()
  if style == "ymd-en" {
    return str(y)+" "+tjk_month_name.en.at(str(m))+" "+str(d)}
  if style == "mdy-en" {
    return tjk_month_name.en.at(str(m))+" "+str(d)+", "+str(y)}
  if style == "mdy-en-abr" {
    return tjk_month_name.en-abr.at(str(m))+" "+str(d)+", "+str(y)}
  if style == "ymd-jp" {
    return str(y)+"年"+ str(m)+"月"+str(d)+"日"}
  if style == "ymd-jp-nengou" {
    return tjk_wareki(y)+"年"+str(m)+"月"+str(d)+"日"}
  if style == "ymd-jp-wareki" {
    return tjk_wareki(y)+"年 "+tjk_month_name.jp.at(str(m))+str(d)+"日"}
  }

#let waritsuke(moji,body) = {

  
}
  
#let abstract_name = ("en": [#smallcaps[Abstract]], "jp":"概要")


#let waritsuke(moji,body) ={

context[
#let size = measure[も].width
#let wari_width = size * moji
#let body_mojisuu = calc.round(measure[#body].width/size)
#let cell_width = wari_width/body_mojisuu

#let haba = (wari_width - measure[#body].width)/(body_mojisuu - 1)


#let columns_cell = () 

#for i in range(moji) {
  columns_cell.push(cell_width)
}
#let body_array = ()
#let x = int(body.len()/3)
#for i in range(x) {
  body.at(3*i) 
  h(haba)
}
#h(-haba)




]
}