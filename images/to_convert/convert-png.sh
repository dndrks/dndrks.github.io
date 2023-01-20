echo ">> converting pngs"

list=$(ls -r ./*.png)
for file in $list ; do
  convert -resize 40% ${file} ${file}
done

#  convert ${file} -define jpeg:extent=512kb ${file}.jpeg