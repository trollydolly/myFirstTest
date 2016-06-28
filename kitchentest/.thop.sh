git rm VERSION
echo VERSION >> .gitignore
git add .gitignore
git commit -m "Drop VERSION as it is managed by thor-scmversion now"
git tag 0.0.1
git push --tags