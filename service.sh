#!/bin/bash
###############################################################################
#  Name:        Derek Van Vuuren
#  Date:        20190123
#  Version:     1.0.2
#  Description: service.sh allows for easy management for system services
###############################################################################
service=$1

function menu
{
       echo The current service is $service
      PS3='Please enter your choice: '
      options=("Start" "Stop" "Restart" "Status" "Enable" "Disable" "Quit")
      select opt in "${options[@]}"
      do
          case $opt in
              "Start")
                  startfcn
                ;;
              "Stop")
                  stopfcn
                    ;;
              "Restart")
                  restartfcn
                  ;;
              "Status")
                  statusfcn
                  ;;
              "Enable")
                  enablefcn
                  ;;
              "Disable")
                  disablefcn
                  ;;
              "Quit")
                  echo "Bye!!!!"
                  exit;
                  ;;
              *) echo "invalid option $REPLY";;
          esac
      done

  }

  function startfcn
  {
    systemctl start $service
    systemctl status $service |grep Active:
    menu
  }
  function stopfcn
  {
    systemctl stop $service
    systemctl status $service |grep Active:
    menu
  }
  function restartfcn
  {
    systemctl restart $service
    systemctl status $service |grep Active:
    menu
  }
  function statusfcn
  {
    systemctl status $service
    menu
  }
  function enablefcn
  {
    systemctl enable $service
    systemctl status $service |grep Active:
    menu
  }
  function disablefcn
  {
    systemctl disable $service
    systemctl status $service |grep Active:
    menu
  }
if [[ $EUID -ne 0 ]]; then
     echo "This script requires adminstrative privilages.
     Please run as root or an account with sudo."
     exit 1
  else
      menu
fi
