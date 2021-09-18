# list all commands
help commands

# just pres n or p to navigate shell
# Shells

# Nu will work inside of a single directory and allow you to navigate around your filesystem by default. Nu also offers a way of adding additional working directories that you can jump between, allowing you to work in multiple directories at the same time.

# To do so, use the enter command, which will allow you create a new "shell" and enter it at the specified path. You can toggle between this new shell and the original shell with the p (for previous) and n (for next), allowing you to navigate around a ring buffer of shells. Once you're done with a shell, you can exit it and remove it from the ring buffer.

# Finally, to get a list of all the current shells, you can use the shells command.


# > help config
Configuration management.

Usage:
  > config <subcommand> {flags}

Subcommands:
  config get - Gets a value from the config
  config set - Sets a value in the config
  config set_into - Sets a value in the config
  config clear - clear the config
  config load - Loads the config from the path given
  config remove - Removes a value from the config
  config path - return the path to the config file

Flags:
  -h, --help: Display this help message


# to each element in list concatenate -> 
# the ^ in ^echo means do not use the built in echo
echo "a" "b" "c" | each {^echo "->" $it}

-> a
-> b
-> c

# When u close terminal it's gone
# Scoped environment variables

# You can also set environment variables that will be available in the current scope (the block you're in and any block inside of it).

# To do so, you can use the let-env command.

> let-env FOO= BARRRRRRRRRRRe | echo $nu.env.FOO 
# or 
> FO=BARRRRRRRRRRRe  echo $nu.env.FO

# let-env is similar to the export command in bash


# A powerful form of string uses backticks. These allow you to create a string from inputs in the pipeline.

> ls | each { echo `{{name}} is {{size}}` }


# Select only the colomns you want
ls | select name size

# Select the rows you want
ls | nth 0 2
# or use skip to jump over the rows you don't want
nth --skip 0 2


#// Glob patterns (wildcards)

# In Nushell, file operations may also allow you to pass in a glob pattern, sometimes called a 'wildcard'. This allows you to give a pattern that may match multiple file paths.

# The most general pattern is the *, which will match all paths. More often, you'll see this pattern used as part of another pattern, for example *.bak and temp*.

# In Nushell, we also support double * to talk about traversing deeper paths that are nested inside of other directories. For example, ls **/* will list all the non-hidden paths nested under the current directory.

# In addition to *, there is also the ? pattern which will match a single character. For example, you can match the word "port" by using the pattern p???.#

# //
# Duration

# Durations represent a length of time. A second, 5 weeks, and a year are all durations.

# Eg) 1wk is the duration of one week.

# This chart shows all durations currently supported:
# Duration 	Length
# 1sec 	one second
# 1min 	one minute
# 1hr 	one hour
# 1day 	one day
# 1wk 	one week
# 1mon 	one month
# 1yr 	one year

# #

# Ranges

# A range is a way of expressing a sequence of values from start to finish. They take the form 'start' + '..' + 'end'. For example, the range 1..3 means the numbers 1, 2, and 3.
# #
# Inclusive and non-inclusive ranges

# Ranges are inclusive by default, meaning that the ending value is counted as part of the range. The range 1..3 includes the number 3 as the last value in the range.

# Sometimes, you may want a range that comes up to a number but doesn't use that number in the output. For this case, you can use ..< instead of ... For example, 1..<5 is the numbers 1, 2, 3, and 4.

# #

# Open-ended ranges

# Ranges can also be open-ended. You can remove the start or the end of the range to make it open-ended.

# Let's say you wanted to start counting at 3, but you didn't have a specific end in mind. You could use the range 3.. to represent this. When you use a range that's open-ended on the right side, remember that this will continue counting for as long as possible, which could be a very long time! You'll often want to use open-ended ranges with commands like first, so you can take the number of elements you want from the range.

# You can also make the start of the range open. In this case, Nushell will start counting with 0, and go up from there. The range ..2 is the numbers 0, 1, and 2.

# Use of range command
ls | range 4..7
ls | range 3..

# #


# Lists

# Lists can hold more than one value. These can be simple values. They can also hold rows, and the combination of a list of rows is often called a "table".

# Example: a list of strings

> echo [sam fred george]
───┬────────
 0 │ sam 
 1 │ fred 
 2 │ george 
───┴────────

#
# Tables

# The table is core data structure in Nushell. You'll see as you run commands that many of them return tables as output. A table has both rows and columns.

# We can create our own tables similarly to how we create a list. Because tables also contain columns and not just values, we pass in the name of the column values:

> echo [[Column1, Column2]; [Value1, Value2]]

───┬─────────┬─────────
   | Column1 │ Column2 
───┼─────────┼─────────
 0 │ Value1  │ Value2  
───┴─────────┴─────────

# We can also create a table with multiple rows of data:

> echo [[Column1, Column2]; [Value1, Value2] [Value3, Value4]]
───┬─────────┬─────────
   │ Column1 │ Column2 
───┼─────────┼─────────
 0 │ Value1  │ Value2  
 1 │ Value3  │ Value4  
───┴─────────┴─────────


#// Blocks

# Blocks represent a block of code in Nu. For example, in the command each { echo $it } the block is the portion contained in curly braces, { echo $it }. Blocks are a useful way of representing code that can be executed on each row of data.
#

# Groups

# Take this example:

foo {
  line1
  line2; line3 | line4
}

# Inside the block, you have two separate groups that run to completion, a group is a semicolon-separated list of pipelines, the last of which is output to the screen.

#     line1 is a group unto itself, so that command will run to completion and get displayed on the screen.
#     line2 is a pipeline inside of the second group. It runs, but its contents are not viewed on the screen.
#     line3 | line4 is the second pipeline in the second group. It runs, and its contents get viewed.


// 
# Now that our data is in a table, we can use all the commands we've used on tables before:

> open people.txt | lines | split column "|" first_name last_name job | str trim | sort-by first_name

───┬────────────┬───────────┬──────────
   │ first_name │ last_name │ job 
───┼────────────┼───────────┼──────────
 0 │ Antonio    │ Vivaldi   │ Composer 
 1 │ Bob        │ Ross      │ Painter
 2 │ Octavia    │ Butler    │ Writer 
───┴────────────┴───────────┴──────────

//
# The "Cargo.lock" file is actually a .toml file, but the file extension isn't .toml. That's okay, we can use the from command using the toml subcommand:

> open Cargo.lock | from toml
──────────┬───────────────────
 metadata │ [row 107 columns] 
 package  │ [table 130 rows] 
──────────┴───────────────────

# The from command can be used for each of the structured data text formats that Nu can open and understand by passing it the supported format as a subcommand.
#

//
# Opening in raw mode

# While it's helpful to be able to open a file and immediately work with a table of its data, this is not always what you want to do. To get to the underlying text, the open command can take an optional --raw flag:

> open Cargo.toml --raw

[package]                                                                                        
name = "nu"
version = "0.1.3"
authors = ["Yehuda Katz <wycats@gmail.com>", "Jonathan Turner <jonathan.d.turner@gmail.com>"]
description = "A shell for the GitHub era"
license = "MIT"

//
# Fetching URLs

# In addition to loading files from your filesystem, you can also load URLs by using the fetch command. This will fetch the contents of the URL from the internet and return it to you:

> fetch https://www.jonathanturner.org/feed.xml
─────┬───────────────────────────
 rss │ [row attributes children] 
─────┴───────────────────────────

//
# Working with lists

# A list is an ordered collection of values. The literal syntax for creating a list is to include expressions in square brackets separated by spaces or commas (for readability). For example, [foo bar baz] or [foo, bar, baz].

# To iterate over the elements in a list, use the each command. The $it special variable holds the output of the previous command. When used in a block passed to the each command, it holds the current item. To change $it to have $it.index and $it.item values, add the --numbered (-n) flag. For example:
# Similar to for

let names = [Mark Tami Amanda Jeremy]
echo $names | each { build-string "Hello, " $it "!" }
# Outputs "Hello, Mark!" and three more similar lines.

echo $names | each -n { build-string $($it.index | inc) "_" $it.item }

# The split row command creates a list from a string based on a delimiter. For example, let colors = $(echo "red,green,blue" | split row ",") creates the list [red green blue].

# To access a list item at a given index, use $name.index where $name is a variable that holds a list. For example, the second element in the list above which is "Tami" can be accessed with $names.1.

# The length command returns the number of items in a list. For example, echo [red green blue] | length outputs 3.

# The empty? command determines whether a string, list, or table is empty. It can be used with lists as follows:

= $colors | empty? # false

let colors = []
= $colors | empty? # true

# The in and not in operators are used to test whether a value is in a list. Operators can only be used in "math mode". One way to enter math mode is to begin an expression with =. For example:

let colors = [red green blue]
= blue in $colors # true
= yellow in $colors # false


# The where command can be used to create a subset of a list. The following example gets all the colors whose names end in "e".

let colors = [red orange yellow green blue purple]

echo $colors | where {= $(echo $it | str ends-with 'e')}

# The block passed to where must evaluate to a boolean.
# This outputs the list [orange blue purple].

let scores = [7 10 8 6 7]
echo $scores | where $it > 7 # [10 8]


# Invocations

# What if instead of a value, you needed to run a command and use its output? For this, you can use an invocation.

# Invocations also start with $ and are wrapped with parentheses. The parentheses contain a pipeline that will run to completion, and the resulting value will then be used. For example, $(ls) would run the ls command and give back the resulting table and $(git branch --show-current) runs the external git command and returns a string with the name of the current branch.

# Invocations can also be pipelines and not just single commands. If we wanted to get a list of filenames larger than ten kilobytes, we can use an invocation to run a pipelines and assign this to a variable:

> let names-of-big-files = $(ls | where size > 10kb)
> echo $names-of-big-files
───┬────────────┬──────┬──────────┬──────────────
   │    name    │ type │   size   │   modified   
───┼────────────┼──────┼──────────┼──────────────
 0 │ Cargo.lock │ File │ 155.3 KB │ 17 hours ago 
 1 │ README.md  │ File │  15.9 KB │ 17 hours ago 
───┴────────────┴──────┴──────────┴──────────────

#
# Invocation paths

# Invocations also support paths. For example, let's say we wanted to get a list of the filenames in the current directory. One way to do this is to use a pipeline:

> ls | get name

# We can do a very similar action in a single step using an invocation path:

> echo $(ls).name

# 
> echo  $(ls).name $(ls).type 


# 
# Going beyond directories

# Nu can also create shells from other things aside from paths in a filesystem. Let's say, for example, you're working with a large data set and don't want to lose your place inside of it.

# To see how this works, let's do the following exercise. Currently, we list the Nu plugins we have developed in the "Cargo.toml" file. Let's say we just created a new plugin in the src/plugins directory called "doc.rs", and we're interested to know if it's listed in the "Cargo.toml" as well so that it can be compiled and installed correctly for Nu.

# Let's enter the file "Cargo.toml" from Nu's source code:

/home/jonathant/Source/nushell(master)> enter Cargo.toml

/> ls
────────────────────┬───────────────────────────
 bin                │ [table 18 rows] 
 build-dependencies │ [row nu-build serde toml] 
 dependencies       │ [row 29 columns] 
 dev-dependencies   │ [row nu-test-support] 
 features           │ [row 19 columns] 
 package            │ [row 12 columns] 
 workspace          │ [row members] 
