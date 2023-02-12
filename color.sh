#color logging
greenfg="\e[1;32m"
greenbg="\e[1;42m"
whitefg="\e[1;37m"
blackbg="\e[1;40m"
yellowfg="\e[1;93m"
redfg="\e[1;91m"
redbg="\e[1;41m"
end="\e[0m"


NOTICE(){
   log "${greenfg}NOTICE ${1}"
}

SUCCESS(){
   log "${greenbg}SUCCESS ${1}"
}

INFO(){
   log "${whitefg}INFO ${1}"
}

DEBUG(){
   log "${blackbg}DEBUG ${1}"
}

WARN(){
   log "${yellowfg}WARN ${1}"
}

ERROR(){
   log "${redfg}ERROR ${1}"
}

FATAL(){
   log "${redbg}FATAL ${1}"
}

log(){
    echo -e "$1 ${end}"
}

#NOTICE "test"
#SUCCESS "test"
#INFO "test"
#DEBUG "test"
#WARN "test"
#ERROR "test"
#FATAL "test"
