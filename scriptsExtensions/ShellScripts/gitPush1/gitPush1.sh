#!/bin/bash

# cd /home/raz/dartProjects_linux_1
# git add -u
# git add *
# git commit -m "$(date)"
# git push --repo https://user_git:password_git@github.com/user_git/dartProjects_linux_1.git

 # git config --global push.default matching
 # git config --global push.default simple

# git pull https://user_git:password_git@github.com/user_git/dartProjects_linux_1.git
# git pull https://user_git:password_git@github.com/user_git/razIT2.git master
# https://github.com/user_git/goKeep

	# echo '\ndartProjects_linux_1 Start -----------------\n'
	# cd /home/raz/dartProjects_linux_1
	# git add -u
	# git add *
	# git commit -m \"DartProj: $(date)\"
	# git push --repo https://user_git:password_git@github.com/user_git/dartProjects_linux_1.git
	# echo '\ndartProjects_linux_1 Done -----------------\n'

# for fish terminal use of "
# git commit -m "raz_IT: "(date)""

gnome-terminal -- /bin/bash -c '

	printf "\n -1: raz_IT Start -----------------\n";
	cd /home/raz/raz_IT
	git add -A
	# git add *
	git commit -m "raz_IT: $(date)"
	git push --repo git@github.com:user_git/raz_IT.git
	printf "\nraz_IT Done -----------------\n"

	printf "\n -2: keep_projects/ Start -----------------\n"
	cd /home/raz/code_projects/keep_projects
	git add -A
	# git add *
	git commit -m "keep_projects: $(date)"
	git push --repo git@github.com:user_git/keep_projects.git
	printf "\n keep_projects Done -----------------\n"



	printf "\nDone! Press Enter to close.\n"

	read v
'