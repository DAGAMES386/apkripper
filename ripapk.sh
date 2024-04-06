#! /bin/bash

# Commands for listing packages
listallpackages=$(adb shell pm list packages)
listuserpackages=$(adb shell pm list packages -3)
makedir=0

# init (Checks if the user uses the prefix -m)
if [[ "$1" == "-m"  ]]; then
	makedir=1
fi

# Describes the options for listing packages
echo "Please choose to list all packages [1] or only user installed packages [2]"

while read; do
	if [ $REPLY == "1" ]; then
		printf "$listallpackages" | tr ' ' \n
		break
	elif [ $REPLY == "2" ]; then
		printf "$listuserpackages" | tr ' ' \n
		break
	else
		echo "Invalid Input"
	fi
done
printf "\nPlease enter the package identifier:\n"

# Checks if the indentifier exists so there isn't an error thrown that breaks the program

while read; do
	if adb shell pm path $REPLY; then
		outputapkpath=$(adb shell pm path $REPLY)
		outputapkpath=${outputapkpath//"package:"/}
		identifier=$REPLY
		break
	else
		echo "Invalid Input"
	fi
done

choicearray=($outputapkpath)
# echo ${choicearray[*]}

# Prints out the APKs to rip

printf "\nPlease choose which apk to rip\n"

linetosay=0
whattopull=0

arraysize=${#choicearray[@]}


# Loop for listing available APKs
for i in "${choicearray[@]}"
do
	printf "\n"
	echo $linetosay "Rip ${choicearray[$linetosay]}"
	linetosay=$((linetosay+1))
done

printf "\n$arraysize Rip All\n"

# Options for pulling the apk (This is messy, maybe I'll rework it if I get a star)
while read; do
	if [[ $REPLY -lt ${#choicearray[@]} ]] && [[ $makedir -eq 1 ]]; then
		mkdir $identifier
		cd $identifier
		adb pull ${choicearray[$REPLY]}
		break
	elif [[ $REPLY -lt ${#choicearray[@]} ]]; then
		adb pull ${choicearray[$REPLY]}
		break
	elif [[ $REPLY = "$arraysize" ]] && [[ $makedir -eq 1 ]]; then
		mkdir $identifier
		cd $identifier
		while [ $whattopull -lt $arraysize ]
		# This is a loop for pulling all of the apks in a directory
		do
			adb pull ${choicearray[$whattopull]}
			whattopull=$((whattopull+1))
		done
		break
        elif [ $REPLY = "$arraysize" ]; then
                while [ $whattopull -lt $arraysize ]
                # This is a loop for pulling all of the apks in a directory
                do
                        adb pull ${choicearray[$whattopull]}
                        whattopull=$((whattopull+1))
                done
                break
	else
		echo "invalid option"
	fi
done
