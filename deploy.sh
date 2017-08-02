#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

#remove public dir
rm -r public

# Build the project. 
hugo # if using a theme, replace by `hugo -t <yourtheme>`


# Add changes to git.
git add -A
git commit -m "$msg"
git push origin master


# Go To Public folder
cd public
rm -R ../../jraigneau.github.io/*
cp -R . ../../jraigneau.github.io/

cd ..
cd ..

cd jraigneau.github.io/

# Commit changes.
git add -A
git commit -m "$msg"
# Push source and build repos.
git push origin master

# Come Back
cd ..

cd zeneffy-hugo