
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

echo "Your URL is saved: $url"

echo "Location: $path/$name/output.html"
