#!/bin/bash

function esc(){
	local str=$1
	str=`echo $str | sed -E -e 's/\./\\\./g'`
	str=`echo $str | sed -E -e 's/\//\\\\\//g'`
	echo $str
}

BASEDIR=${0%/*}
echo $BASEDIR
cd $BASEDIR
cd ..

./deploy.sh

map=./jsdo.it/replace.map

if [ ! -e $map ]
then
	echo "Error: replace.map is not exists."
	exit 1;
fi

echo "Remove unnecessary codes."
sed -i -e '/\.\/style\.css/d' deploy/bals.htm
sed -i -e '/\.\/script\.js/d' deploy/bals.htm

echo "Replace image files path in deployed codes..."
cat $map | while read pair
do
	pair=(`echo $pair`)
	orig=${pair[0]}
	path=${pair[1]}
	orig="./img/$orig"
	path="$path"
	# echo $orig
	# echo $path
	# echo "sed s/$orig/$path/g"
	sed -i -e s#$orig#$path#g ./deploy/bals.htm
	sed -i -e s#$orig#$path#g ./deploy/script.js
	sed -i -e s#$orig#$path#g ./deploy/style.css
done

echo "Replace Done!"

sleep 1
