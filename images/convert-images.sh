echo ">> converting images"

list=$(ls -r ./*.HEIC)
for file in $list ; do
  convert ${file} -define jpeg:extent=512kb ${file}.jpeg
  convert -resize 40% ${file}.jpeg ${file}.jpeg
done
