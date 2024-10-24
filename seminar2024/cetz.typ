#import "@preview/cetz:0.2.2"
#show: align.with(center)
#set page(width: auto, height:auto, margin:5mm)
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
    
    )