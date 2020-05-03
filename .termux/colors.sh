#!/data/data/com.termux/files/usr/bin/bash
DIR=`cd $(dirname $0); pwd`
COLORS_DIR=$DIR/colors
count=0

echo -e "預設的配色是很醜的Tango，"
echo -e "在下面選個好一點的把他換掉= =";

for colors in "$COLORS_DIR"/*; do
  colors_name[count]=$( echo $colors | awk -F'/' '{print $NF}' )
  echo -e "($count) ${colors_name[count]}";
  count=$(( $count + 1 ));
done;
count=$(( $count - 1 ));

while true; do
  read -p '輸入上面的號碼，空白就繼續用醜醜的Tango：' number;
  if [[ -z "$number" ]]; then
    break;
  elif ! [[ $number =~ ^[0-9]+$ ]]; then
    echo "別亂來，輸入正確的號碼！";
  elif (( $number>=0 && $number<=$count )); then
    eval choice=${colors_name[number]};
    cp -fr "$COLORS_DIR/$choice" "$DIR/colors.properties";
    break;
  else
    echo "別亂來，輸入正確的號碼！";
  fi
done

termux-reload-settings
