cat head.htm_ > index.html
cmark --unsafe index.md >> index.html
cat foot.htm_ >> index.html

date=$(date -r index.md +%D)
sed -i '' -e 's#DATE#'$date'#g' index.html
