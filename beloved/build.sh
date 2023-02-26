echo ">> root .md to .html"

list=$(ls -r ./*.md)
for file in $list ; do
  date=$(date -r ${file} +%D)
  file=${file:2}
  file=${file%.*}
  echo "$file"
  if [ $file == "index" ]; then
    bkg="#1E3302"
    font="#ffff9f"
    hover="#b2ffff"
    dot="#fdbcb4"
  elif [ $file == "230122" ] ; then
    bkg="#1E3333"
    font="#ffff9f"
    hover="#b2ffff"
    dot="#fdbcb4"
  elif [ $file == "230219" ]; then
    bkg="#5097a3"
    font="#fafada"
    hover="#c3bdf9"
    dot="#e090ff"
  fi
  target=${file}.html
  cat head.htm_ > ${target}
  cmark --unsafe ${file}.md >> ${target}
  cat foot.htm_ >> ${target}
  # sed -i '' -e 's/$pattern/$replacement/g' ${target}
  sed -i -e 's|BKG_COLOR|'$bkg'|g' ${target}
  sed -i -e 's|FONT_COLOR|'$font'|g' ${target}
  sed -i -e 's|HOVER_COLOR|'$hover'|g' ${target}
  sed -i -e 's|DOT_COLOR|'$dot'|g' ${target}
  sed -i '' -e 's#DATE#'$date'#g' ${target}
done