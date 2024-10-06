#!/bin/bash

#function for adding a new directory
function addDir(){
    path=$1
    dir_name=$2
    
    #check if user has given both required inputs or not(One can do it using -z also)
    if [[ $path == "" || $dir_name == "" ]]; then
        echo "Please enter both inputs required"
    else
        # checking if directory is not existing already then only create new directory
        if [ ! -d "$path/" ]; then
            echo "Path doesn't exist"
        elif [ ! -d "$path/$dir_name" ]; then
            mkdir "$path/$dir_name"
            echo "created dir"
        else
            echo "Directory already exist"
        fi
    fi
}

#function for deleting a directory
function deleteDir(){
    path=$1
    dir_name=$2
    rmdir "$path/$dir_name"
    echo "directory deleted"
}

