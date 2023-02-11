#!/bin/bash

## ⬇ GIT SETUP ⬇ ##

# get repo name
echo "Enter the name of the git repository you wish to create: "
read repo_name

# get gitlab user
echo "Enter your gitlab username: "
read gitlab_user

# create and cd to folder
mkdir $repo_name
cd $repo_name

# create local repo
git init

# create main immediately
git checkout -b main

# download and add .gitignore
curl "https://www.toptal.com/developers/gitignore/api/flask" -o .gitignore
git add .
git commit -m "chore: .gitgnore"

# create remote repo
git remote add origin https://gitlab.com/$gitlab_user/$repo_name

# push and link branches
git push -u origin main

# create and switch to dev branch
git checkout -b dev

## ⬇ PYTHON SETUP ⬇ ##

# create virtual environment
python -m venv .venv

# activate virtual environment
source .venv/Scripts/activate

# install flask
pip install flask

# create requirements.txt
pip freeze > requirements.txt

# push setup and conclude setup
git add .
git commit -m "chore: deps"
git push --set-upstream origin dev

# open vscode
code .
echo "Made by dxxxxy#0776, go ahead and have fun :)"