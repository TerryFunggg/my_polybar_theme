desktop=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3+1}')
if [ $desktop == "-" ]; then
	echo "tailed"
else
	layout=$(bsp-layout get $desktop)
	if [ $layout == "-" ];then
		echo "tiled"
	else
		echo $layout
	fi
fi
