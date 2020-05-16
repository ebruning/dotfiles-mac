#!/usr/bin/env: zsh 

echo "$(hostname)"

case "$(uname -s)" in
    Linux*)
    	echo "Linux"
	;;
    Darwin*)
	echo "Mac"
	if [[ "$(hostname)" != "zendrivembp" ]] then
    		echo "work"
	fi
	;;
esac
