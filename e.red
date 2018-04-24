Red[]

buf: []

o: func [f [file!]][buf: read/lines f]

p: func [][foreach line buf [print line]]

w: func [f [file!]][write/lines f head buf]

d: func [][buf: remove buf]

i: func [lines [block!]][
   go-back: negate length? lines
   buf: skip insert buf lines go-back]

a: func [lines [block!]][
   go-back: negate (length? lines) + 1
   buf: skip insert next buf lines go-back]

r: func [lines [block!]][
   change buf lines]

search: func [word [string!]][
	i: 0
	foreach line buf[
	       	found: find line word
		if found [return buf: skip buf i]
		i: i + 1
		]
	buf]

top: func [][buf: head buf]

bottom: func [][buf: tail buf]


commandbuf: []

oops!: func [] [clear commandbuf]
oops:  func [] [take/last commandbuf]
cb: func [] [foreach line commandbuf[print line]]

o-com: func [][if name: commandbuf/1 [o to-file name oops!]]
p-com: func [][p  oops!]
w-com: func [][w to-file commandbuf/1 oops!]
d-com: func [][d  oops!]
i-com: func [][i commandbuf oops!]
a-com: func [][a commandbuf oops!]
r-com: func [][r commandbuf oops!]
s-com: func [][if word: commandbuf/1 [search word] oops!]
<-com: func [][top oops!]
>-com: func [][bottom oops!]

runred: func [][text: copy ""
                foreach line commandbuf [text: rejoin [text " " line]]
		do to-block text]

commands: ["o" o-com "p" p-com "w" w-com "d" d-com
	  "i" i-com "a" a-com "r" r-com
	  "s" s-com
	  "cb" cb "oops" oops "oops!" oops!
	  ;"quit" quit
	  "<" top ">" bottom
	  "ls" ls "runred" runred
	  ]

repl: func[][
        buf: []
	forever[
	  line: ask "> "
	  if line = "quit" [return none]
	  if line/1 = #":" [buf: skip buf to-integer next line continue]
	  fun: select/skip commands line 2
	  if line/1 = #"." [line: next line]
	  either :fun [do fun][append commandbuf line]]
	  ]

repl
