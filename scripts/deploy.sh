git co -f deploy && git merge master && rake generate && git add . && git ci -m 'update' && git push heroku HEAD:master && git co master
