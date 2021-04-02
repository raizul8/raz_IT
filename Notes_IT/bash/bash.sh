~/.bashrc, .bash_aliases, .gitconfig
# Stow is a tool for managing the installation of multiple software packages in the same run-time directory tree.
# for bash autocomplete
/etc/bash_completion.d/

# run shell script with ./ to say run from this directory
# or sh file.sh

# forward search Ctrl+S, add below command to ~/.bashrc
stty -ixon 

# # is a comment so you can search your command by searchin useful
command #useful
ls -a #useful

alias in ~/.bashrc
# become root
sudo -i
# exit root
exit CTRL+D

# reload the .profile
source ~/.profile
. ~/.profile

# go to end delete all to left
Ctrl + E Ctrl + U

# Clean up the line: 
# go to start of line delete all after
Ctrl + A Ctrl + K

#completely clear screen
reset

# start command in background independent of terminal
nohup command &>/dev/null &
nohup qbittorrent &>/dev/null &

# pass 
# save pass to gith
pass git push -u

# update-rc.d
service --status-all
service apache2 start, stop
service apache2 status
# remove mysql boot start script
update-rc.d -f mysql remove

# send password to command
echo mypassword | sudo -S command

# send command to terminal as string
gnome-terminal -- /bin/sh -c '
	echo "t1.txt"
	echo "lxterminal"
	/bin/sh;
'

setuid Permission
# When set-user identification (setuid) permission is set on an executable file, a process that runs this file is granted access based on the owner of the file (usually root), rather than the user who is running the executable file. This special permission allows a user to access files and directories that are normally only available to the owner. For example, the setuid permission on the passwd command makes it possible for a user to change passwords, assuming the permissions of the root ID:

setgid Permission
# The set-group identification (setgid) permission is similar to setuid, except that the process's effective group ID (GID) is changed to the group owner of the file, and a user is granted access based on permissions granted to that group. 

# setgid has no effect if the group does not have execute permissions. setgid is represented with a lower-case "s" in the output of ls. In cases where it has no effect it is represented with an upper-case "S".

Sticky Bit
# The sticky bit is a permission bit that protects the files within a directory. If the directory has the sticky bit set, a file can be deleted only by the owner of the file, the owner of the directory, or by root. This special permission prevents a user from deleting other users' files from public directories such as /tmp:
drwxrwxrwt 7  root  sys   400 Sep  3 13:37 tmp

# example 
sudo chgrp users /media/disk
sudo chmod g+w /media/disk # gives the group writer permissions
sudo chmod g+s /media/disk # all files/folder inside take group ownership of the parent folder


# This expands all variables and prints the full commands before output of the command.
set -x
ls $PWD


# What does 'S' permission mean to a directory? And why it doesn't let me get rid of it?
# 'S' = The directory's setgid bit is set, but the execute bit isn't set.

# 's' = The directory's setgid bit is set, and the execute bit is set.

# SetGID = When another user creates a file or directory under such a setgid directory, the new file or directory will have its group set as the group of the directory's owner, instead of the group of the user who creates it.

# To remove the setGID bit:
chmod g-s eclipse/
# You can set or clear the bits with symbolic modes like u+s and g-s, and you can set (but not clear) the bits with a numeric mode.

# EDIT SUDOERS FILE safely
sudo visudo -f /etc/sudoers

# 1. As root, prevent write (and maybe other) access to your script:
chown root /absolute/path/to/your/script.sh
chmod 700 /absolute/path/to/your/script.sh

chown -hR root /u    Change the owner of /u and subfiles to "root".
-h, --no-dereference   affect symbolic links instead of any referenced file
                         (useful only on systems that can change the
                         ownership of a symlink)

sudo chown -hR raz2:raz2 ~/xx

# 2. Verify that noone except root can replace the script, e.g. by modifying the access 
# rights of the parent folder:

chown root /absolute/path/to/your/
chmod 755 /absolute/path/to/your/

# 3. Modify sudo access rights in /etc/sudoers with visudo:

ALL    ALL = (root) NOPASSWD: /absolute/path/to/your/script.sh
ALL    ALL = (root) NOPASSWD: /home/raizul2/razIT/scriptsExtensions/ShellScripts/timer/timer.sh


# install deb pkg and dependencies
sudo dpkg -i --force-depends *.deb

# unnistall pkg
sudo apt-get remove packagename
sudo apt-get purge packagename
dpkg --remove packagename
dpkg --purge packagename

dpkg -i {.deb package}	Install the package	
dpkg -i zip_2.31-3_i386.deb

dpkg -i {.deb package}	Upgrade package if it is installed else install a fresh copy of package	
dpkg -i zip_2.31-3_i386.deb

dpkg -R {Directory-name}	Install all packages recursively from directory	
dpkg -R /tmp/downloads

dpkg -r {package}	Remove/Delete an installed package except configuration files	
dpkg -r zip

dpkg -P {package}	Remove/Delete everything including configuration files	
dpkg -P apache-perl

dpkg -l	List all installed packages, along with package version and short description	
dpkg -l
dpkg -l '*apache*'
dpkg -l | grep -i 'sudo'
dpkg -l {package}	List individual installed packages, along with package version and short description	
dpkg -l apache-perl

dpkg -L {package}	Find out files are provided by the installed package i.e. list where files were installed
dpkg -L apache-perl
dpkg -L perl

dpkg -c {.Deb package}	List files provided (or owned) by the package i.e. List all files inside debian .deb package file, very useful to find where files would be installed	
dpkg -c dc_1.06-19_i386.deb

dpkg -S {/path/to/file}	Find what package owns the file i.e. find out what package does file belong	
dpkg -S /bin/netstat
dpkg -S /sbin/ippool

dpkg -p {package}	Display details about package package group, version, maintainer, Architecture, display depends packages, description etc	
dpkg -p lsof

dpkg -s {package} | grep Status	Find out if Debian package is installed or not (status)	
dpkg -s lsof | grep Status

# list of installed packages
dpkg --get-selections | grep -v deinstall

# install latest package
sudo add-apt-repository ppa:maco.m/ruby
sudo apt-get update
sudo apt-get install rubygems

# go to previous folder
cd ~-

# create multiple files
touch {apple, banana, cherry, durian}

# create 1000 files
touch file_{1..1000}

# wc word count
# ls -1 list horizontal
ls -1 | wc -l

# xargs changes directory
echo '/home/raz2/ca1/c1' | xargs bash -c 'cd "$0"'

# // exclude from grep word2
grep "word1" | grep -v "word2"

# exclude multiple
grep 'test' somefile | grep -vE '(error|critical|warning)'

# awk example
echo 'One two' | awk '{print $2}'

# kill process
ps ax | grep redstone1.dart | grep -v "color=auto" | awk '{print $1}' | xargs kill
ps ax | grep redstone1.dart | head -1 | awk '{print $1}' | xargs kill

# default gateway
route -n - default gateway should be on the last line.

# network stuff, im on ethernet
ifconfig

172.17.0.30

# write to file
echo "Some text here." > myfile.txt
# or with cat
cat > outfile.txt <<EOF
some text
to save
EOF

# create file 
cat f2.txt

# append data to file
cat >>foo.txt

# parent makes missing subdirectories
mkdirt -p dir1/lala/x3

# Send input to stdin
/my/bash/script <<< 'This string will be sent to stdin.'

# herefile stdin
/my/bash/script <<EOF
line 1
line 2
line 3
EOF

# cp command
cp file directory

# service
sudo service --status-all

sudo service mysql status
sudo service mysql stop
sudo service mysql start

# find if binary already in search path
which dart
whereis dart
locate dart1.dart
find / -name core

# case insensitive
find ~/ -iname


A < symbol connects the command’s
STDIN to the contents of an existing file. The > and >> symbols redirect STDOUT;
> replaces the file’s existing contents, and >> appends to them.

# To redirect both STDOUT and STDERR to the same place, use the >& symbol. To
# redirect STDERR only, use 2>.
program-name 2> error.log

To execute a second command only if its precursor completes successfully, you
can separate the commands with an && symbol. For example,
$ lpr /tmp/t2 && rm /tmp/t2

Conversely, the || symbol executes the following command only if the preceding
command fails (produces a nonzero exit status).


The shell treats strings enclosed in single and double quotes similarly, except that
double-quoted strings are subject to globbing (the expansion of filename-matching
metacharacters such as * and ?) and variable expansion

# Back-ticks execute command and replace it with the result
echo "There are `wc -l /etc/passwd` lines in the passwd file."
There are 28 lines in the passwd file.

# delimiter space field 3
cut -d' ' -f3 f1.txt
This is earth => earth

wc -l, -w, or -c: count lines, words, and characters

# The device /dev/tty is a synonym for the current terminal. For example,
$ find / -name core | tee /dev/tty | wc -l
# prints both the pathnames of files named core and a count of the number of core
# files that were found.

# first to lines
head -n 2 f1.txt

# last two lines
tail -n 2 f1.txt
# tail -f waits for new lines to be added to the end of the file and prints them as they appear. -f means follow
tail -f file.txt

# source is useful when the script sets up environment variables or makes other
# customizations that apply only to the current shell. It’s commonly used in scripting
# to incorporate the contents of a configuration file written as a series of bash
# variable assignments
source helloworld.sh or 
. helloworld.sh or 

# content of helloworld.sh
export VAR1="VAR1_is_here"
# when executed VAR1 is set in the current shell type $VAR1 or env
The “dot” command is a synonym for source, e.g., . helloworld.

# find all txt files in current dir , remove f2.txt if found, print line result in loop
find . -type f -name '*.txt' | grep -v "f2.txt"| 
while read line;do	
	echo "-> $line";
done;

# prints last 4 commands from history
fc -l -4

2028	 fc -h
2029	 fc --help
2030	 man fc
2031	 man ls

# allows tabs
printf "\taa\tbb\tcc\n"

# if with and operator
b="b"
if [[ "a" == "a" && ($b == "b")]]; then
	echo "true"
else 
	echo "false"	
fi

# -n evaluates to true if user_name string not null
if [[ -n "$user_name" ]]; then

# Command-line arguments to a script become variables whose names are numbers.
# $1 is the first command-line argument, $2 is the second, and so on. $0 is the
# name by which the script was invoked.

# The variable $# contains the number of command-line arguments that were supplied,
# and the variable $* contains all the arguments at once. Neither of these variables
# includes or counts $0.

# The shell variable $? contains the exit status of the last command executed, whether used inside a script or at the command line.

# -ne(not equal) works with numbers not strings
if [[ 1 -ne 2 ]]; then
just use == and != with space


# for example, function example
# function arguments are treated just like command-line arguments
function f1 {
	echo "$1 $2 $#" #argumenst 1 and 2 of function, total arg of function
	for ((i=0; i<$#; i++))
	do
		echo "nr $i"
	done
}

# all txt files in current dir
for i in *.txt; do
	echo "arg: $i"
done

# use local if a is defined global
function f1 {
	echo "before local a= $a"
	local a="loca"
	echo "inside f1 after local a= $a"
}

# case example
case $1 in
	0) echo "it was 0" ;;
	1) echo "it was 1" ;;
	*) echo "it's *" 
esac

# $* or $@ all arguments, behave diff inside double quotes
for i in $*; do
	echo "arg: $i"
done

# internal field separator
export IFS='-'

# When printing the each value of special parameter “$*”, it gives only one value which is the whole positional parameter delimited by IFS.

# Whereas “$@” gives you each parameter as a separate word.

# read file
# exec says: take input from argument1(file), if argument1 is not a file => error
exec 0<$1
counter=1
while read line; do
	echo "$((counter++)): $line"
done

(…) parentheses indicate a subshell. What's inside them isn't an expression like in many other languages. It's a list of commands (just like outside parentheses). These commands are executed in a separate subprocess, so any redirection, assignment, etc. performed inside the parentheses has no effect outside the parentheses.
With a leading dollar sign, $(…) is a command substitution: there is a command inside the parentheses, and the output from the command is used as part of the command line (after extra expansions unless the substitution is between double quotes, but that's another story).
{ … } braces are like parentheses in that they group commands, but they only influence parsing, not grouping. The program x=2; { x=4; }; echo $x prints 4, whereas x=2; (x=4); echo $x prints 2. (Also braces require spaces around them and a semicolon before closing, whereas parentheses don't. That's just a syntax quirk.)
With a leading dollar sign, ${VAR} is a parameter expansion, expanding to the value of a variable, with possible extra transformations.
((…)) double parentheses surround an arithmetic instruction, that is, a computation on integers, with a syntax resembling other programming languages. This syntax is mostly used for assignments and in conditionals.
The same syntax is used in arithmetic expressions $((…)), which expand to the integer value of the expression.
# logical operators
[[…]] double brackets surround conditional expressions. Conditional expressions are mostly built on operators such as -n $variable to test if a variable is empty and -e $file to test if a file exists. There are also string equality operators: "$string1" = "$string2" (beware that the right-hand side is a pattern, e.g. [[ $foo = a* ]] tests if $foo starts with a while [[ $foo = "a*" ]] tests if $foo is exactly a*), and the familiar !, && and || operators for negation, conjunction and disjunction as well as parentheses for grouping. Note that you need a space around each operator (e.g. [[ "$x" = "$y" ]], not [[ "$x"="$y" ]]), and a space or a character like ; both inside and outside the brackets (e.g. [[ -n $foo ]], not [[-n $foo]]).
[ … ] single brackets are an alternate form of conditional expressions with more quirks (but older and more portable). Don't write any for now; start worrying about them when you find scripts that contain them.'

# array
l=(aa 'bb cc' dd)

echo ${l[1]} #bb cc
echo ${l[*|@]} #all elements
echo ${#l[*|@]} #length of array

# change owner and group, you can omit one of them 
sudo chown -R matt:staff ~matt/restore

# chmod recursive
sudo chmod -R 0775 ~/Folder

# find directory
find  / -type d -name "tutorial"
