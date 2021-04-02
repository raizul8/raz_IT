# gpm gvp gvm

# List available go version (local)
gvm list

# List available go version (ready to be downloaded)
gvm listall

# Installing go
gvm install go1.3

# Using a version
gvm use go1.3

alias gvm_create="gvm pkgset create"
alias gvm_delete="gvm pkgset-delete"
alias gvm_list="gvm pkgset list"
alias gvm_env="gvm pkgenv"

function gvm_use {
	gvm pkgset use $1 --default
}

# Creating a pkgset
gvm pkgset create my-pkgset-name
# delete it
gvm pkgset-delete pkg2

# view packages
gvm pkgset list

# Configure environment variables
gvm pkgenv my-pkgset-name

# Using it
gvm pkgset use my-pkgset-name
gvm pkgset use my-pkgset-name --default
gvm pkgset use global

# /home/raz/.gvm/pkgsets/go1.7.3/global/bin/goimports

# Godeps file example
package  # no version always last version from head
github.com/nu7hatch/gotrail               v0.0.2
github.com/replicon/fast-archiver         v1.02
github.com/garyburd/redigo/redis          a6a0a737c00caf4d4c2bb589941ace0d688168bb
launchpad.net/gocheck                     r2013.03.03   # Bazaar repositories are supported
code.google.com/p/go.example/hello/...    ae081cd1d6cc  # And so are Mercurial ones

$ gpm             # Same as 'install'.
$ gpm get         # Parses the Godeps file, gets dependencies and sets them
                  # to the appropriate version but does not install them.
$ gpm install     # Parses the Godeps file, installs dependencies and sets
                  # them to the appropriate version.
$ gpm version     # Outputs version information
$ gpm help 


# always start with source gvp
source gvp      Modifies GOPATH and GOBIN to use the .godeps directory.
gvp version     Outputs version information.
gvp help        Prints this message.
gvp in          The function that is called when executing "source gvp"
gvp out         Return the prompt to normal


#.env file 
~/gvp/bin/gvp

# workflow
source gvp # you can have an .env file it will run source gvp
# have Godeps file
gpm install
source gvp out # or close terminal




















