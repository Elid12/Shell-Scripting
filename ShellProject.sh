#!/bin/bash

# functions that create files
makeFileTest() {
echo "This is a random text used for this project. It will be added into files just to create a content and not have empty files. Please ignore this." > test.txt
}

makeFileSample() {
echo "This is a random text used for this project. It will be added into files just to create a content and not have empty files. Please ignore this. Also, I decided to create another function, so I can have a variety of texts and combinations." > sample.txt
}

makeFileRandom() {
echo "butterfly, pink, mango, zoo" > random.odt
}

makeFileSymbols() {
echo "! * ? % # @ ( ^ . : " > symbols.pdf
}

# beginning of code execution
echo "Welcome!"

echo "Type the name of the directory in which processing will happen."
read Directory
mkdir $Directory

cd $Directory

makeFileTest
makeFileSample
makeFileRandom
makeFileSymbols

echo "" #leave an empty line for better readability
ls
echo ""

counter=0 #variable to count actions a user has taken

until [[ ${counter} -gt 2 ]]
do

echo "Type 'ana' for analytics or 'del' for delete or 'arr' for arrange."
read action
counter=$((counter+1))

if [ "$action" = "ana" ] 
    then
        echo ""	
	echo "Write the regex you want to use. This will count total number of words matching this regex."	
	read regix
	
	echo ""
	
	for FILE in *; do 
		cat $FILE
		grep -c ${regix} $FILE
		echo "";
	done
			
elif [ "$action" = "del" ] 
    then
        echo ""	
	echo "Enter file size. Files larger than that size will be deleted."
	read fileSize
        find . -type f -size +${fileSize}c -delete
        ls
       	
elif [ "$action" = "arr" ]
    then
        echo ""
	echo "Enter file type such as pdf,txt,odt. This will move the file into a new directory."
	read fileType
	fileToFind=$(find . -name "*.$fileType" -type f)
	echo ${fileToFind}
	mv ${fileToFind} /home/ubuntu/NEW
		
else
	echo "Invalid command."
fi

done
