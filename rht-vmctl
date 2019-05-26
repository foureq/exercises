#!/bin/bash
echo2(){
abc01=`sudo virsh list --all | grep $vm | awk '{print $2}'` 
abc02=`sudo virsh list --all | grep $vm | awk '{print $3}'` 
 if [ $abc02 == running ];then
  echo -e $abc01  "\e[32;1m[running]\e[0m"
 else
   echo -e $abc01 "\033[31m[shutdown]\033[0m"

 fi
}
##################################################################
help(){
echo " Usage: rht-vmctl  VMCMD   VMNAME  
  where VMCMD is one of:
    start      - obtain and start up VMNAME
    stop       - stop a running VMNAME
    poweroff   - if running, force stop VMNAME
    reset      - poweroff, return to saved or original state, start VMNAME
    status     - display libvirt status of VMNAME 
  where VMNAME is one of: 
    classroom
    server
    desktop "
}
#########################################################
IMG_DIR=/var/lib/libvirt/images/

virdef(){
sudo virsh define /root/.$1  &> /dev/null
echo -e "$2 \e[32;1m[OK]\e[0m"
}

#######################################################
create(){
qemu-img create -f qcow2 -b $IMG_DIR/.$1  $IMG_DIR/$2 &> /dev/null
}
###########################################################
rmimg(){
if [ -e $IMG_DIR/$1 ]; then
    rm -rf $IMG_DIR/$1
fi
}
##################################################
undef(){
id=`sudo virsh dominfo $1 2> /dev/null | grep running`
if  [ -n "$id"  ];then
        /usr/bin/sudo virsh destroy $1 &> /dev/null
fi
sudo virsh undefine $1 &>/dev/null
}
########################################################
classroom(){
undef classroom
rmimg rh254-classroom-vda.ovl
create rh254-classroom-vda.qcow2 rh254-classroom-vda.ovl
virdef classroom.xml classroom
sudo virsh start classroom
}                        
#################################################################
server(){
undef server
rmimg rh254-server-vda.ovl
rmimg rh254-server-vdb.ovl
create rh254-server-vda.qcow2 rh254-server-vda.ovl
create rh254-server-vdb.qcow2 rh254-server-vdb.ovl
virdef server.xml server
sudo virsh start server
}
###################################################################
desktop(){
undef desktop
rmimg rh254-desktop-vda.ovl
rmimg rh254-desktop-vdb.ovl
create rh254-desktop-vda.qcow2 rh254-desktop-vda.ovl
create rh254-desktop-vdb.qcow2 rh254-desktop-vdb.ovl
virdef desktop.xml desktop
sudo virsh start desktop
}
################################################################
if [ -z $1 ] || [ -z $2 ];then
  help
elif [ $2 == 'classroom' ];then 
  case $1 in
   start)
   sudo virsh start $2 ;;
   stop)
   sudo virsh  shutdown $2 ;;  
   poweroff)
   sudo virsh destroy $2 ;;
   status)
   vm=$2
   echo2 ;;
   reset)
  classroom ;;
  *)
   help ;;   
  esac
elif [ $2 == 'server' ];then 
  case $1 in
   start)
   sudo virsh start $2 ;;
   stop)
   sudo virsh  shutdown $2 ;;  
   poweroff)
   sudo virsh destroy $2 ;;
   status)
   vm=$2
   echo2  ;;   
   reset)
  server ;;
  *)
   help ;;   
  esac
elif [ $2 == 'desktop' ];then 
  case $1 in
   start)
   sudo virsh start $2 ;;
   stop)
   sudo virsh  shutdown $2 ;;  
   poweroff)
   sudo virsh destroy $2 ;;
   status)
   vm=$2
   echo2 ;;   
   reset)
  desktop ;;
  *)
   help ;;   
  esac
else  
   help
fi
