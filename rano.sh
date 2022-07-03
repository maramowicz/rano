touch ~/.nanorc
if ! grep -q -F "include /usr/share/nano/rust.nanorc" ~/.nanorc; then
	echo "\"Rust syntax highlighting\" support in nano is not enabled so im enable it for you ;)"
	echo "include /usr/share/nano/rust.nanorc" >> ~/.nanorc
	read  -n 1 -p "And... done :D, press any key to continue..." mainmenuinput
fi

while :
do
	nano helloworld.rs
	rm helloworld
	if rustc helloworld.rs; then
		./helloworld
		read  -n 1 -p "Press any key to back to the editor, press Ctrl+C to stop this script" mainmenuinput
	else
		repeat=0
		while [ $repeat -lt 1 ]
		do
			repeat=1
			rustoutput=$(rustc helloworld.rs --error-format json 2>&1)
			sortedoutput=$(echo $rustoutput | jq -r 'select(.level=="error") | .spans | .[] | .file_name,.line_start,.column_start,.column_end')
			IFS="
";
			sortedarray=($sortedoutput)
			echo "Wow, you got a errors! Ok, lets see:"
			echo $sortedoutput | xargs -n4 | nl
			read -p "You can continue editing file with Enter. You can close this program too with Ctrl+C. But you can go to code that causes problems wiith writing number of error and htting Enter (if you close editor you back here). If you want to recompile your code, hit 'r' and then Enter" selectinput
			re='^[0-9]+$'
			if [[ $selectinput =~ $re ]] ; then
				repeat=0
				filename=${sortedarray[$((($selectinput-1)*4+0))]}
				row=${sortedarray[$((($selectinput-1)*4+1))]}
				column=${sortedarray[$((($selectinput-1)*4+2))]}
				nano +$row,$column $filename
				if rustc helloworld.rs; then
                			./helloworld
					repeat=1
                			read  -n 1 -p "Press any key to back to the editor, press Ctrl+C to stop this script" mainmenuinput
        			fi
			elif [[ $selectinput = "r" ]] ; then
				repeat=0
				rustc helloworld.rs
				./helloworld
			fi
		done
	fi
done
