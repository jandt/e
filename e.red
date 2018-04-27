Red[]

buf: []

new: func[][buf: copy []]
o: func [f [file!]][
   if error? try [buf: read/lines f print ["Opened file:" f]]
      	     	 [print ["Could not load file:" f]]]

p: func [][foreach line buf [print line]]

w: func [f [file!]][write/lines f head buf print ["Wrote file:" f]]

d: func [][buf: remove buf]

i: func [lines [block!]][
   go-back: negate length? lines
   buf: skip insert buf lines go-back]

a: func [lines [block!]][
   go-back: negate (length? lines) + 1
   buf: skip insert next buf lines go-back]

r: func [lines [block!]][
   change buf lines]

s: func [word [string!]][
   i: 0
   foreach line buf[
   	   found: find line word
	   if found [return buf: skip buf i]
	   i: i + 1
	   ]
   print "Not found."
   buf]

top: func [][buf: head buf]

bottom: func [][buf: tail buf]


commandbuf: []

pop-command:  func [] [take/last commandbuf]
clear-commands: func [] [clear commandbuf]
oops!: :clear-commands
oops: :pop-command
cb: func [] [foreach line commandbuf[print line]]

noarg: func [][print "Argument expected."]
check-cb: func[][
	  unless empty? commandbuf
	  	 [print "Btw, there is still stuff in the command buffer."]]
new-com: :new
o-com: func [][either name: pop-command [o to-file name][noarg]]
p-com: :p
w-com: func [][either name: pop-command[w to-file name check-cb][noarg]]
d-com: :d
i-com: func [][i commandbuf clear-commands]
a-com: func [][a commandbuf clear-commands]
r-com: func [][r commandbuf clear-commands]
s-com: func [][either word: pop-command [s word][noarg]]

runred: func [][text: copy ""
                foreach line commandbuf [text: rejoin [text " " line]]
OA		do to-block text clear-commands]

commands: ["new" new-com "o" o-com "p" p-com "w" w-com "d" d-com
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
