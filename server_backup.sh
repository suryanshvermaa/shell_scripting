#!/bin/bash

#  This is a script for backup with 5 day rotation
#  Useage : 
# ./server_backup.sh <path to your source> <path to backup folder>

function display_usage() {
    echo " Useage: ./server_backup.sh <path to your source> <path to backup folder>"
}

source_dir=$1
backup_dir=$2
timestamp=$(date '+%Y-%m-%d-%H-%M-%S')


function create_backup(){
	zip -r "${backup_dir}/backup_${timestamp}.zip" ${source_dir}
}

function perform_rotation() {
    backups=($(ls -t "${backup_dir}/backup_"*.zip))
    echo "${backups[@]}"

    if [[ "${#backups[@]}" -gt 5 ]]; then
            echo "Performing rotion for 5 days"
            backups_to_remove=("${backups[@]:5}")
            echo "${backups_to_remove[@]}"

            for backup in "${backups_to_remove}";
            do
                rm -f $backup
            done
    fi
}

if [[ $# -eq 0 ]]; then
        display_usage
fi
create_backup
perform_rotation
