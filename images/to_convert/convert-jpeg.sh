echo ">> converting jpegs"

list=$(ls -r ./*.jpeg)
for file in $list ; do
  convert -resize 40% ${file} ${file}.jpeg
done

#  convert ${file} -define jpeg:extent=512kb ${file}.jpeg