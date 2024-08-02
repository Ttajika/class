//https://hohei3108.hatenablog.com/entry/2022/01/27/005123 をTypstに移植することを目標にする

#let ansbox_num = counter("ansbox_num") 

#let h_out(height, rows) = {
if type(height) != array {
  let heights = ()
  for i in range(rows){
    heights.push(height)
  }
  return heights
}
else {return height }
}

#let ansbox(..args, type: "default", daimon: "1", shomon: "(1)", height:1.5cm,answer:(), hideanswer:false) = {
let list = args.pos()
let rows = list.len()
let heights = h_out(height, rows)
ansbox_num.step()
let row_list = ()
let cur_sho = 1
let total = 0
for i in range(rows) {
  let cells = ()
  let col_cel = ()
  let algn = ()
  for j in range(list.at(i)){
    algn.push(center+horizon)
    algn.push(left)
    col_cel.push(2em)
    col_cel.push(1fr)
    cells.push([#numbering(shomon, cur_sho)])
    cells.push([#if answer != () {if hideanswer == true{hide[#answer.at(total+j)]}else{answer.at(total+j)} }])
    cur_sho = cur_sho + 1
  }
  row_list.push(table(stroke: (x,y) => {if calc.odd(x) {(left:(dash:"dotted"), right:1pt, y:1pt) } else {(x:1pt, y:1pt)}}, columns:col_cel,..cells,rows:heights.at(i), align:algn))
  total = total + list.at(i)

}
let colls 
context[
#let cur_dai = ansbox_num.get().at(0)
#grid(columns:(2em, 1fr),   
grid.cell(rowspan: rows,
stroke: 1pt,
inset: 10pt,
align:center+horizon,
[#numbering(daimon,cur_dai)],
),   ..row_list
)



]
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


#ansbox(1,4,10,10,10,10,10,10,10,10,10,10,4)
