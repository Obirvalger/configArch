# gyle.alt
ssh gyle.alt build --test-only -b sisyphus $(basename $(pwd)) `git describe`

ssh gyle.alt task new
ssh gyle.alt task add 183492 repo $(basename $(pwd)) `git describe`
ssh gyle.alt task run --test-only 183492

ssh gyle.alt task delsub 183221 100
ssh gyle.alt task rm 182833

ssh gyle.alt build del ruby-pry

# git.alt
ssh git.alt init-db $(basename $(pwd))

#git
git push -u origin `git describe`

git remote add origin git.alt:/people/obirvalger/packages/$(basename $(pwd)).git
