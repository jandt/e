# e

This is going to be a clone of [LaPingvino's](https://github.com/LaPingvino) phantastic editor [e](https://github.com/LaPingvino/e), rewritten in [Red](https://www.red-lang.org).

This work is in its earliest stages, but this README is already written in it.

There is one important difference to the original implementation: Line moving with `:` is relative. Other details are missing or different. 

Have Fun. And thanks to LaPingvino for the inspiration.

## usage

There are two buffers: The command buffer and the file buffer.

Just start typing at the prompt (`> `). If your line is not a command, it is appended to the command buffer. Otherwise it is executed.

`cb` displays the content of the command buffer. 

`i`, `a`, and `r` (insert, append, replace) move text from the command buffer to the file buffer. Before/after/instead of the current line. `d` deletes the current line from the file buffer.

`p` (print) the content of the file buffer, from the current line on.

`o` (open) reads a file into the file buffer, `w` (write) writes it to a file. The file name is taken from the command buffer.

`:` *numlines* moves the current line by the numlines forward. (Negative numlines move backwards.) `<` goes to the first line (top), `>` after the last line. `s` (search) moves to the next line that contains the word given in the cb.

`ls` gives a list of files in the current directory. No further such functions are implemented, but you can use the `runred` command described below.

In doubt, refer to the source code.

### Example session

    > # e
    >
	> This is going to be a clone of LaPingvino's phantastic editor
	> [e](https://github.com/LaPingvino/e) ...
	> i
	> p
    # e
	
	This is going to be a clone of LaPingvino's phantastic editor
	[e](https://github.com/LaPingvino/e) ...
	> README_dummy.md
	> w
	> [e]
	> s
	> p
	[e](https://github.com/LaPingvino/e) ...
	> [e](https://github.com/LaPingvino/e), rewritten in [Red](https://www.red-lang.org).
	> r
	> <
    > p
    # e
	
	This is going to be a clone of LaPingvino's phantastic editor
	[e](https://github.com/LaPingvino/e), rewritten in [Red](https://www.red-lang.org).
	> README_dummy.md
	> w

## runred

There is no javascript engine used, so there is no `runjs` command. But there is runred:

    > a ["Hello World." "Now you can use Red syntax at the e prompt."]
    > runred
    > p
    Hello World.
    Now you can use Red syntax at the e prompt.
    >

## Esperanto

There should be some mentioning of Esperanto in this text. So here it is: Esperanto is very good.

