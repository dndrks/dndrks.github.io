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
  elif [ $file == "230319" ]; then
    bkg="#9F5240"
    font="#cedbf2"
    hover="#DDDAD2"
    dot="#D9C376"
  elif [ $file == "230416" ]; then
    bkg="#5B4A2F"
    font="#A9AEB0"
    hover="#AA4A43"
    dot="#D3C7C1"
  elif [ $file == "230521" ]; then
    bkg="#316DB1"
    font="#F5F953"
    hover="#FEFEFE"
    dot="#F0B7BF"
  elif [ $file == "230618" ]; then
    bkg="#6C7871"
    font="#D1C4A9"
    hover="#FEFEFE"
    dot="#F0B7BF"
  elif [ $file == "230715" ]; then
    bkg="#060606"
    font="#41935F"
    hover="#B841BC"
    dot="#FDFDFD"
  elif [ $file == "230820" ]; then
    bkg="#C7D6E4"
    font="#3F5FA3"
    hover="#BB6A4B"
    dot="#AC5732"
  fi
  target=${file}.html
  cat head.htm_ > ${target}
  cmark --unsafe ${file}.md >> ${target}
  cat foot.htm_ >> ${target}
  sed -i '' 's|BKG_COLOR|'$bkg'|g' ${target}
  sed -i '' 's|FONT_COLOR|'$font'|g' ${target}
  sed -i '' 's|HOVER_COLOR|'$hover'|g' ${target}
  sed -i '' 's|DOT_COLOR|'$dot'|g' ${target}
  sed -i '' -e 's#DATE#'$date'#g' ${target}
done