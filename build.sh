echo ">> root .md to .html"

list=$(ls -r ./*.md)
for file in $list ; do
  date=$(date -r ${file} +%D)
  file=${file:2}
  file=${file%.*}
  echo "$file"
  if [ $file == "spb2023" ] ; then
    bkg="#d8d8d8"
    font="#000000"
    link="#b2ffff"
    hover="#EC6F2B"
    fontsize=0.96em
  else
    bkg="#FED1C7"
    font="#333"
    link="#333"
    hover="#555"
    fontsize=0.8em
  fi
  target=${file}.html
  cat head.htm_ > ${target}
  cmark --unsafe ${file}.md >> ${target}
  cat foot.htm_ >> ${target}
  sed -i '' 's|BKG_COLOR|'$bkg'|g' ${target}
  sed -i '' 's|FONT_COLOR|'$font'|g' ${target}
  sed -i '' 's|LINK_COLOR|'$link'|g' ${target}
  sed -i '' 's|HOVER_COLOR|'$hover'|g' ${target}
  sed -i '' 's|FONT_SIZE|'$fontsize'|g' ${target}
  sed -i '' -e 's#DATE#'$date'#g' ${target}
done

alias change='cd tabs'
change
echo "entering tabs folder"
./build.sh

alias change='cd ..'
change
alias change='cd images'
change
echo "entering images folder"
./build.sh

alias change='cd ..'
change
alias change='cd beloved'
change
echo "entering beloved"
./build.sh