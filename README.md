# SWP_Spring20IU
This repository is for the implementation of the project for Software Project Course in Innopolis University for Spring 2020. The project is to create a Mixed-Reality Virtual Assistant that works with MR devices like Hololens and to create a web interface that you can create throught it a presentations that consist of multiple slides with images, text, ...etc.

## Table of contents

*  [Notes for Development](#notes-for-development)

*  [Deployment instructions](#deployment-instructions)

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

## Deployment instructions
To run the application, frontend and backend servers must be lauched.
* to launch a frontend server, in `./web-client/src/` run:
```
    npm run serve
```
* to launch a backend server, in `./src/` run:
```
    python3 main.py
```
* to download and setup the ar assistant android app, find the apk [here](https://github.com/hany606/SWP_Spring20IU/blob/master/ar_app/build/app/outputs/apk/app.apk)
