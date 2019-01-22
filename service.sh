#!/bin/bash
###############################################################################
#  Name:        Derek Van Vuuren
#  Date:        20190122
#  Version:     1.0.1
#  Description: service.sh allows for easy management for system services
###############################################################################
service=$1

function menu
{
       echo The current service is $service
      PS3='Please enter your choice: '
      options=("Start" "Stop" "Restart" "Status" "Enable" "Quit")
      select opt in "${options[@]}"
      do
          case $opt in
              "Start")
                  start
                ;;
              "Start")
                  stop
                    ;;
              "Restart")
                  restart
                  ;;
              "Status")
                  status
                  ;;
              "Enable")
                  enable
                  ;;
              "Quit")
                  echo "Bye!!!!"
                  exit;
                  ;;
              *) echo "invalid option $REPLY";;
          esac
      done

  }

  function start
  {
    systemctl start $service
    menu
  }
  function stop
  {
    systemctl stop $service
    menu
  }
  function restart
  {
    systemctl restart $service
    menu
  }
  function status
  {
    systemctl status $service
    menu
  }
  function enable
  {
    systemctl enable $service
    menu
  }

  if [[ $EUID -ne 0 ]]; then
     echo "This script requires adminstrative privilages.
     Please run as root or an account with sudo."
     exit 1
  else
      menu
  fi
