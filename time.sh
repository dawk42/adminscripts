#!/bin/bash
# a time keeping script
# Written by Derek Van Vuuren
# Last Modified 14 Nov 2021

home="$HOME"
db_dir=".time_db"
db="tt.db"
d_func=`date +%Y%m%d,%H:%M`
time_db=$home/$db_dir/$db


database(){
if [ ! -f $time_db ]; then
	echo "Creating timekeeping database"
	mkdir $home/$db_dir
	touch $time_db
	echo -e "Time Keeping DB \nDate\tTime\nend" >> $time_db
else
	echo -e "Database $time_db is present\n"
	chmod 600 $time_db
fi
}

help(){
echo '''
Usage
  time.sh [options]

Options:
  -e                 records the end time
  -h		     print help and exit
  -r		     print a short report
  -s                 records the start time
'''
exit 0
}

quit(){
	chmod 400 $time_db
	exit 0
}

report(){ 
    tail $time_db
    quit
}

time_ent(){
	echo -e "$1\t $d_func" >> $time_db
}

start_ent(){
if [ $(tail -1 $time_db |awk '{print $1}') == end ]; then
	start_t=$d_func
	time_ent start
	echo "Start Time $start_t recorded"
	quit
else
	echo "Last entry is not an End time, please fix by entering an manual end time YYYYmmdd,HH:MM"
	read -p "End Time: " man_ent
	echo -e "end\t $man_ent" >> $time_db
	time_ent start
	quit
fi
}

stop_ent(){
if [ $(tail -1 $time_db |awk '{print $1}') == start ]; then
	end_t=$d_func
	time_ent end
	echo "Stop Time $end_t recorded"
	quit
else
	echo "Last entry is not an Start time, please fix by entering an manual end time YYYYmmdd,HH:MM"
	read -p "Start Time: " man_ent
	echo -e "start\t $man_ent" >> $time_db
	time_ent end
	quit
fi
}

if [[ $1 == '' ]] || [[ $1 == '-h' ]]
then
	help
elif [[ $1 == '-s' ]]
then
	database && start_ent
elif [[ $1 == '-e' ]]
then
	database && stop_ent
elif [[ $1 == '-r' ]]
then
	report
else
	help
fi
