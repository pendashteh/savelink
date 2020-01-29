
read -p "Url? " url
read -p "Title? " name
name=$(date +%Y%d%m)"-"$name

read -e -p "Location? " path

if [ ! -d $path ]; then
  echo "Path not found."
  exit;
fi
cd $path
mkdir -p $name
cd $name
wget $url -O output.html

echo -e "URL:\t"$url"\nTime:\t"$(date +%Y-%m-%d %H:%M:%S)"\nFilesize:\t"$(stat --printf="%s" output.html) > info.txt

echo "Your URL is saved: $url"

echo "Location: $path/$name/output.html"
