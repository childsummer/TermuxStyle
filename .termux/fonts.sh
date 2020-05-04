#!/data/data/com.termux/files/usr/bin/bash
DIR=`cd $(dirname $0) && pwd`
FONTS_DIR=$DIR/fonts
count=0

echo -e "預設的字體是醜醜的Ubuntu= ="
echo -e "你可以在下面選個好一點的把他換掉。";

for font in $FONTS_DIR/*/{*.ttf,*.otf}; do
	font_file[count]=$font;
	echo "[$count] $( echo ${font_file[count]} | awk -F'/' '{print $NF}' )";
	count=$(( $count + 1));
done;
count=$(( $count - 1 ));

while true; do
	read -p '輸入一個號碼，空白就繼續用醜醜的Ubuntu：' number;

	if [[ -z "$number" ]]; then
		break;
	elif ! [[ $number =~ ^[0-9]+$ ]]; then
		echo "別亂來，輸入正確的號碼！";
	elif (( $number >= 0 && $number <= $count )); then
		cp -fr "${font_file[number]}" "$DIR/font.ttf";
		break;
	else
		echo "別亂來，輸入正確的號碼！";
	fi
done;

termux-reload-settings