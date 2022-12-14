echo ">> root .md to .html"

list=$(ls -r ./*.md)
for file in $list ; do
  date=$(date -r ${file} +%D)
  file=${file:2}
  file=${file%.*}
  echo "$file"
  target=${file}.html
  cat head.htm_ > ${target}
  cmark --unsafe ${file}.md >> ${target}
  cat foot.htm_ >> ${target}
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