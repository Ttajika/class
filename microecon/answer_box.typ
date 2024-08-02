answerbox.sty (https://hohei3108.hatenablog.com/entry/2022/01/27/005123) をTypstに移植することを目標にする



//#let ansbox_num = counter("ansbox_num") 

#let copy_array(height, rows) = {
if type(height) != array {
  let heights = ()
  for i in range(rows){
    heights.push(height)
  }
  return heights
}
else {return height }
}

#let ansbox(..args, type: "default", daimon: "1", shomon: "(1)", height:1.5cm,answer:(), hideanswer:false, shomon_width:2em, daimon_width:2em, box_width:1fr, shomon_start:1) = {
let list = args.pos()
let rows = list.len()
let heights = copy_array(height, rows)
let box_widths = copy_array(box_width, rows)
//ansbox_num.step()
let row_list = ()
let cur_sho = shomon_start
let total = 0
for i in range(rows) {
  let cells = ()
  let col_cel = ()
  let algn = ()
  for j in range(list.at(i)){
    algn.push(center+horizon)
    algn.push(left)
    col_cel.push(shomon_width)
    col_cel.push(box_widths.at(i))
    cells.push([#numbering(shomon, cur_sho)])
    cells.push([#if answer != () {if hideanswer == true{hide[#answer.at(total+j)]}else{answer.at(total+j)} }])
    cur_sho = cur_sho + 1
  }
  row_list.push(table(stroke: (x,y) => {if calc.odd(x) {(left:(dash:"dotted"), right:1pt, y:1pt) } else {(x:1pt, y:1pt)}}, columns:col_cel,..cells,rows:heights.at(i), align:algn))
  total = total + list.at(i)

}
let colls 
show figure: it => {

if daimon != none{
grid(columns:(daimon_width, 1fr),   
grid.cell(rowspan: rows,
stroke: 1pt,
align:center+horizon,
[#numbering(daimon,..it.counter.at(it.location()))],
),   ..row_list
)
} else {
grid(columns:(1fr),   
  ..row_list
)
} 

}
figure([1],kind:"answerbox",supplement: none)
}



#ansbox(1,4,3)



#ansbox(4,2,3, daimon:"1", shomon:"(a)", height:(1cm,2cm,3cm))

#ansbox(1,2,3, answer:([1],[2],[3],[4],[5],[$
(sum d^3)/(sum d^3)
$]),height:(2cm,auto,auto))

#ansbox(1,2,3, answer:([1],[2],[3],[4],[5],[$
(sum d^3)/(sum d^3)
$]),height:auto,hideanswer:true)

#ansbox(1,4,3)


#ansbox(1,4,10, daimon:none)


#ansbox(3,2,1, daimon:none, shomon:"問1.", shomon_width:4em)
//#v(-.47cm)
#ansbox(3,2,2, daimon:none, shomon:"問1.", shomon_width:4em, shomon_start:7, answer:([],[],[],[],[],[#image("img/patterns.png",width:100%)],[文字の大きさ]), box_width:(2cm,3cm,auto), height:(1cm,2cm,auto))