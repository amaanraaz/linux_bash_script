#!/bin/bash

#### Part-1 #####

operation=$1
location=$2
filename=$3
message=$4
message2=$5

# create a directory
if [ "$operation" == "addDir" ]; then
	mkdir -p  "$location/$filename"
	echo "dir create"
# Delete a directory
elif [ "$operation" == "deleteDir" ]; then
	rmdir "$location/$filename"
	echo "$filename dir deleted"

# Only list files in a dir
elif [ "$operation" == "listFiles" ]; then
	ls -p "$location" | grep -v /

# Only list dirs in a dir
elif [ "$operation" == "listDirs" ]; then
	ls -p "$location" | grep /

# List all contents(dir and files) in a dir
elif [ "$operation" == "listAll" ]; then
	ls -l "$location"

################################################
#Part-2 of assignment
###############################################

# Create a file in a dir
elif [ "$operation" == "addFile" ]; then
	if [ "$message" == "" ]; then
		touch "$location/$filename"
	else
		echo "$message"> "$location/$filename"
	fi

# Add content to file
elif [ "$operation" == "addContentToFile" ]; then
	echo "$message">>"$location/$filename"

# Add content to file beginning
elif [ "$operation" == "addContentToFileBegining" ]; then
	echo "$message" | cat - "$location/$filename" > "$location"/temp_file && mv "$location"/temp_file "$location/$filename"

# Show top n lines of content
elif [ "$operation" == "showFileBeginingContent" ]; then
	head -n "$message" "$location/$filename"

# show end n lines of content
elif [ "$operation" == "showFileEndContent" ]; then
	tail -n "$message" "$location/$filename"

# Show file content of nth line
elif [ "$operation" == "showFileContentAtLine" ]; then
	head -n "$message" "$location/$filename" | tail -n 1

# show content in a line of range
elif [ "$operation" == "showFileContentForLineRange" ]; then
	head -n "$message2" "$location/$filename" | tail -n +"$message"

# move file both type with new name or old name work same 
elif [ "$operation" == "moveFile" ]; then
	mv "$location" "$filename"

# copy file for both condition with or without new name 
elif [ "$operation" == "copyFile" ]; then
	cp "$location" "$filename"

# clear content of file
elif [ "$operation" == "clearFileContent" ]; then
	>"$location/$filename"

# delete file
elif [ "$operation" == "deleteFile" ]; then
	rm -rf "$location/$filename"

else
	echo "something went wrong"

fi 
