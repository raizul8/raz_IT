# git merge tool kompare

# Your branch is ahead of 'origin/master' by 3 commits.
git fetch
# or
git push origin master
# if your local changes are bad then simply remove them or reset your local master to the state on remote git 
reset --hard origin/master

#  in config url needs to be with ssh so it won't ask for password
[remote "origin"]
	url = ssh://git@github.com/raizul8/repo1.git

#Create a new repository on the command line

touch README.md
git init
git add README.md or git add *
git commit -m "first commit"
git remote add origin https://github.com/raizul8/razIT.git
git remote add origin git@github.com:raizul8/web_10_07_2017.git
git push -u origin master

cd /home/raz/razIT
git add -u
git add *
git commit -m "$(date)"
git push --repo https://raizul8:razvan88@github.com/raizul8/razIT2.git

# Deal with git submodule
git rm --cached <folder_name>

git add .
git commit -m "<your_message>"
git push --all

git add -A stages All

git add . stages new and modified, without deleted

git add -u stages modified and deleted, without new

#  Adding the -a option to the git commit command makes Git automatically stage every file that is already tracked before doing the commit, letting you skip the git add part:
git commit -a

#Push an existing repository from the command line
git remote add origin https://github.com/raizul8/razIT.git
git push -u origin master

# You can propose changes (add it to the Index) using
git add <filename>
git add *

# The next time you commit, the file will be gone and no longer tracked. If you modified the file and added it to the index already, you must force the removal with the -f option.
# next time you commit WEB-INF folder will no longer be there
git rm -r --cached WEB-INF


git rm file.txt 
# removes the file from the repo but also deletes it from the local file system.

# Another useful thing you may want to do is to keep the file in your working tree but remove it from your staging area. In other words, you may want to keep the file on your hard drive but not have Git track it anymore. This is particularly useful if you forgot to add something to your .gitignore file and accidentally staged it, like a large log file or a bunch of .a compiled files. To do this, use the --cached option:
# untracks the file
git rm --cached file.txt

 # adds all modified file changes to the stage
git add -u

# add all symbolic links in .gitignore
find . -type l >> .gitignore

# remove all symbolic links from repository
find . -type l -exec git rm --cached {} \;

# if you delete a file you have to run this, or use git rm filename
git add -u
git commit -m "Delete many old files"

# Removing multiple files from a Git repo that have already been deleted from disk, updates index
$ git add -u
This tells git to automatically stage tracked files -- including deleting the previously tracked files.

# For Git 2.0
# To stage your whole working tree:
$ git add -u :/

# To stage just the current path:
$ git add -u .

sudo git push --repo https://raizul8:razvan88@bitbucket.org/name/repo.git


# change previous commit
git commit --amend

# stage file
git add Delete.txt
# unstage file
git reset HEAD Delete.txt

git clone https://github.com/libgit2/libgit2
 # target directory is called mylibgit.
git clone https://github.com/libgit2/libgit2 mylibgit

# To see what you’ve changed but not yet staged, type 
git diff

# If you want to see what you’ve staged that will go into your next commit, you can use git diff --staged. This command compares your staged changes to your last commit:
git diff --staged

# rename
git mv file_from file_to

git tag
# You can also search for tags with a particular pattern. The Git source repo, for instance, contains more than 500 tags. If you’re only interested in looking at the 1.8.5 series, you can run this:
git tag -l "v1.8.5*"

# Git uses two main types of tags: lightweight and annotated.
# A lightweight tag is very much like a branch that doesn’t change – it’s just a pointer to a specific commit.
# Annotated tags, however, are stored as full objects in the Git database. 
git tag -a v1.4 -m "my version 1.4"

git show v1.4

# Lightweight Tags
# Another way to tag commits is with a lightweight tag. This is basically the commit checksum stored in a file – no other information is kept. To create a lightweight tag, don’t supply the -a, -s, or -m option:
git tag v1.4-lw

# Now, suppose you forgot to tag the project at v1.2, which was at the “updated rakefile” commit. You can add it after the fact. To tag that commit, you specify the commit checksum (or part of it) at the end of the command:
git log --pretty=oneline
git tag -a v1.2 9fceb02

# By default, the git push command doesn’t transfer tags to remote servers. You will have to explicitly push tags to a shared server after you have created them. This process is just like sharing remote branches – you can run git push origin [tagname].
git push origin v1.5

# If you have a lot of tags that you want to push up at once, you can also use the --tags option to the git push command. This will transfer all of your tags to the remote server that are not already there.
git push origin --tags

# git log

# One of the more helpful options is -p, which shows the difference introduced in each commit. You can also use -2, which limits the output to only the last two entries:
git log -p -2

git log --pretty=oneline
# format your git log
git log --pretty=format:"%h - %an, %ar : %s"

# the time-limiting options such as --since and --until are very useful. For example, this command gets the list of commits made in the last two weeks:
git log --since=2.weeks

# git checkout -- <file> is a dangerous command. Any changes you made to that file are gone – Git just copied another file over it. Don’t ever use this command unless you absolutely know that you don’t want the file.
# Unmodifying a Modified File
git checkout -- CONTRIBUTING.md

# To add a new remote Git repository as a shortname you can reference easily
git remote add pb https://github.com/paulboone/ticgit
git remote -v

# Now you can use the string pb on the command line in lieu of the whole URL. For example, if you want to fetch all the information that Paul has but that you don’t yet have in your repository, you can run 
git fetch pb
# Paul’s master branch is now accessible locally as pb/master – you can merge it into one of your branches, or you can check out a local branch at that point if you want to inspect it.

# use fetch if git says you are ahead with x commits
git fetch


# If your current branch is set up to track a remote branch (see the next section and Git Branching for more information), you can use the git pull command to automatically fetch and then merge that remote branch into your current branch. This may be an easier or more comfortable workflow for you; and by default, the git clone command automatically sets up your local master branch to track the remote master branch (or whatever the default branch is called) on the server you cloned from. Running git pull generally fetches data from the server you originally cloned from and automatically tries to merge it into the code you’re currently working on.


# If you want to see more information about a particular remote, you can use the git remote show [remote-name] command. If you run this command with a particular shortname, such as origin, you get something like this:
git remote show
git remote show origin

# rename pb to pablo
git remote rename pb pablo

# remove remote
git remote rm pablo


# What a branch is.
# A branch in Git is simply a lightweight movable pointer to one of these commits. The default branch name in Git is master. As you start making commits, you’re given a master branch that points to the last commit you made. Every time you commit, it moves forward automatically.



# create new branch testing
git branch testing
# switch branch
git checkout testing

# delete branch
git branch -d hotfix

# You can easily see this by running a simple git log command that shows you where the branch pointers are pointing. This option is called --decorate.
git log --oneline --decorate


# Branch divergence. If you run git log --oneline --decorate --graph --all it will print out the history of your commits, showing where your branch pointers are and how your history has diverged.
git log --oneline --decorate --graph --all

#------ MY ALIASES ---------
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.dec 'log --oneline --decorate --graph --all'
git config --global alias.decone 'log --oneline --decorate'
git config --global alias.unstage 'reset HEAD --'
git config --global alias.sts 'status -s'
git config --global alias.ciam 'commit -a -m'
git config --global alias.logs 'log --abbrev-commit --pretty=oneline'

git config --global alias. ''

# As you can tell, Git simply replaces the new command with whatever you alias it for. However, maybe you want to run an external command, rather than a Git subcommand. In that case, you start the command with a ! character. This is useful if you write your own tools that work with a Git repository. We can demonstrate by aliasing git visual to run gitk:

$ git config --global alias.visual '!gitk'

# To create a branch and switch to it at the same time, you can run the git checkout command with the -b switch:
$ git checkout -b iss53

# Temporarily switch to a different commit

# If you want to temporarily go back to it, fool around, then come back to where you are, all you have to do is check out the desired commit:

# This will detach your HEAD, that is, leave you with no branch checked out:
git checkout 0d1d7fc32


# Or if you want to make commits while you're there, go ahead and make a new branch while you're at it:

git checkout -b old-state 0d1d7fc32

# Hard delete unpublished commits

# If, on the other hand, you want to really get rid of everything you've done since then, there are two possibilities. One, if you haven't published any of these commits, simply reset:

# This will destroy any local modifications.
# Don't do it if you have uncommitted work you want to keep.
git reset --hard 0d1d7fc32

# Alternatively, if there's work to keep:
git stash
git reset --hard 0d1d7fc32
git stash pop
# This saves the modifications, then reapplies that patch after resetting.
# You could get merge conflicts, if you've modified things which were
# changed since the commit you reset to.


# Undo published commits with new commits

# On the other hand, if you've published the work, you probably don't want to reset the branch, since that's effectively rewriting history. In that case, you could indeed revert the commits. With Git, revert has a very specific meaning: create a commit with the reverse patch to cancel it out. This way you don't rewrite any history.

# This will create three separate revert commits:
git revert a867b4af 25eee4ca 0766c053

# It also takes ranges. This will revert the last two commits:
git revert HEAD~2..HEAD

# Reverting a merge commit
git revert -m 1 <merge_commit_sha>

# To get just one, you could use `rebase -i` to squash them afterwards
# Or, you could do it manually (be sure to do this at top level of the repo)
# get your index and work tree into the desired state, without changing HEAD:
git checkout 0d1d7fc32 .

# Then commit. Be sure and write a good message describing what you just did
git commit



# list all branches
git branch
# last commit
git branch -v

# To see which branches are already merged into the branch you’re on, you can run 
git branch --merged:

# To see all the branches that contain work you haven’t yet merged in, you can run 
git branch --no-merged:


# To synchronize your work, you run a git fetch origin command. This command looks up which server “origin” is (in this case, it’s git.ourcompany.com), fetches any data from it that you don’t yet have, and updates your local database, moving your origin/master pointer to its new, more up-to-date position.

# Branch serverfix set up to track remote branch serverfix from origin.
# Switched to a new branch 'serverfix'
$ git checkout -b serverfix origin/serverfix

# If you want to see what tracking branches you have set up, you can use the -vv option to git branch. This will list out your local branches with more information including what each branch is tracking and if your local branch is ahead, behind or both.
git branch -vv


# merge example
git checkout -b hotfix # work on it
git checkout master
git merge hotfix
git branch -d hotfix

# check rebasing
# rebasing changes history of commits to look nice and linear
# In general the way to get the best of both worlds is to rebase local changes you’ve made but haven’t shared yet before you push them in order to clean up your story, but never rebase anything you’ve pushed somewhere.
$ git checkout experiment
$ git rebase master

$ git checkout master
$ git merge experiment

# shorter sha values of you commits
git log --abbrev-commit --pretty=oneline
git show 1c002d

# Stashing takes the dirty state of your working directory – that is, your modified tracked files and staged changes – and saves it on a stack of unfinished changes that you can reapply at any time.
# Now you want to switch branches, but you don’t want to commit what you’ve been working on yet; so you’ll stash the changes. To push a new stash onto your stack, run git stash or git stash save:
git stash
git stash list

 # If you don’t specify a stash, Git assumes the most recent stash and tries to apply it:
$ git stash apply

# The changes to your files were reapplied, but the file you staged before wasn’t restaged. To do that, you must run the git stash apply command with a --index option to tell the command to try to reapply the staged changes. If you had run that instead, you’d have gotten back to your original position:

$ git stash apply --index

$ git stash list
stash@{0}: WIP on master: 049d078 added the index file
stash@{1}: WIP on master: c264051 Revert "added file_size"
stash@{2}: WIP on master: 21d80a5 added number to log
$ git stash drop stash@{0}

# git clean
 # A safer option is to run git stash --all to remove everything but save it in a stash.

# Assuming you do want to remove cruft files or clean your working directory, you can do so with git clean. To remove all the untracked files in your working directory, you can run git clean -f -d, which removes any files and also any subdirectories that become empty as a result. The -f means force or "really do this".

# If you ever want to see what it would do, you can run the command with the -n option, which means “do a dry run and tell me what you would have removed”.

$ git clean -d -n



# By default, the git clean command will only remove untracked files that are not ignored. Any file that matches a pattern in your .gitignore or other ignore files will not be removed. If you want to remove those files too, such as to remove all .o files generated from a build so you can do a fully clean build, you can add a -x to the clean command.
$ git clean -n -d -x
Would remove build.TMP
Would remove test.o
Would remove tmp/

# If you don’t know what the git clean command is going to do, always run it with a -n first to double check before changing the -n to a -f and doing it for real. The other way you can be careful about the process is to run it with the -i or “interactive” flag.

# This will run the clean command in an interactive mode.

$ git clean -x -i




























