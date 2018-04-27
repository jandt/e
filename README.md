# e

This is going to be a clone of [LaPingvino's](https://github.com/LaPingvino) phantastic editor [e](https://github.com/LaPingvino/e), rewritten in [Red](https://www.red-lang.org).

This work is in its earliest stages, but this README is already written in it.

There is one important difference to the original implementation: Line moving with `:` is relative. Other details are missing or different. 

Have Fun. And thanks to LaPingvino for the inspiration.

## Startup

Install [red](https://www.red-lang.org).<sup>[1](#brew)</sup>

At the moment, e runs only in interpreted mode. Run
     
	 red e.red

<a name="brew">1</a>: Mac OS users: There's a [homebrew](https://brew.sh) package, so just do `brew install red`.

## Usage

There are two buffers: The command buffer and the file buffer.

Just start typing at the prompt (`> `). If your line is not a command, it is appended to the command buffer. Otherwise it is executed.

`cb` displays the content of the command buffer. 

`i`, `a`, and `r` (insert, append, replace) move text from the command buffer to the file buffer. Before/after/instead of the current line. `d` deletes the current line from the file buffer.

`p` (print) the content of the file buffer, from the current line on.

`o` (open) reads a file into the file buffer, `w` (write) writes it to a file. The file name is taken from the command buffer. `new` empties the file buffer.

`:` *numlines* moves the current line by the numlines forward. (Negative numlines move backwards.) `<` goes to the first line (top), `>` after the last line. `s` (search) moves to the next line that contains the word given in the cb.

`ls` gives a list of files in the current directory. No further such functions are implemented, but you can use the `runred` command described below.

In doubt, refer to the source code.

#### Differences to the original `e`
- Some command names are shorter
- The print command at the moment only prints the whole buffer.
- `o`, `w`, `s` take the *last* line of the command buffer as argument, and leave the rest of it in place.
- `p` and `d` leave the command buffer unchanged, in other words:
- only `a`, `i` and `r` "consume" the command buffer

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
	
All `e` commands can be used in `runed` mode, only `<` and `>` must be called as `top` and `bottom` respectively, to avoid name clashes with the comparison operators.

Operators must then be given in red syntax, i.e. `o %somefile.txt`, `i ["Insert this line", "and this"]`.


## Esperanto

There should be some mentioning of Esperanto in this text. So here it is: Esperanto is very good.

