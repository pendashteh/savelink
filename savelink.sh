url=$1
[ -z "$url" ] && read -p "Url? " url || echo "Url: "$url
title=$(echo $url | sed -e 's#https\?://##g;s/www.//g;s/[^A-Za-z0-9._-]/_/g')
read -p "Title? [$title]" name
[ -z "$name" ] && name=$title
name=$(date +%Y%m%d)"-"$name

path_default=$HOME/.savelink/data

read -e -p "Location? [$path_default]" path
[ -z "$path" ] && path=$path_default
[ ! -d "$path" ] && mkdir -p $path

if [ ! -d $path ]; then
  echo "Path not found."
  exit;
fi
cd $path
mkdir -p $name
cd $name
wget $url -O output.html

echo -e "URL:\t"$url"\nTime:\t"$(date +%Y-%m-%d--%H:%M:%S)"\nFilesize:\t"$(stat --printf="%s" output.html) > info.txt

echo "Your URL is saved: $url"

echo "Location: $path/$name/output.html"
