# SWP_Spring20IU
This repository is for the implementation of the project for Software Project Course in Innopolis University for Spring 2020. The project is to create a Mixed-Reality Virtual Assistant that works with MR devices like Hololens

## Notes for Development:

* For each development sprint, there will be a branch to push our work for the sprint on it.
* Checkout to the sprint branch (The code name: sprint<num_sprint>) 
```bash
  git checkout <sprint_name>
```

* For adding, commiting and pushing work into the branch
```bash
  git add .
  git commit -m <commit_msg>
  git push origin <sprint_name>
```

For the commit messages, it is prefered to start the commit with square brackets and inside it one or more of the following flags (Fixing Bugs, Enhancements, Adding Feature, Documentation, Organization (for improving the structure of the folders)) and the rest of the commit message as bullet points with semicolon as seperator

For example:
```bash
  git commit -m "[Enhancements] improve the search algorithm; change the counter"
```

* After each sprint, the work will be merged with the master branch unless there is an exception.
```bash
  git checkout master
  git merge <sprint_name>
  git push origin master
```

* For working in parallel on different ways for the same feature, another branch can be created.
```bash
  git chcekout -b <branch_name>
  git push origin <branch_name>
```

* Before any starting in coding any work, pull the newest version, and after adding impelementing something new, add and commit, and before closing your machine push your work.
