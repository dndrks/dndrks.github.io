#echo -e "$(date +%y%m%d) - $@\n$(cat ~/perm/dndrks.github.io/n.md)" > ~/perm/dndrks.github.io/n.md
echo "$(date +%y%m%d) - $@" >> ~/perm/dndrks.github.io/n.md
nano ~/perm/dndrks.github.io/n.md
