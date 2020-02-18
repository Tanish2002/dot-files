 #!/bin/sh

xdopath=$(which xdo) if [ $? -ne 0 ]; then echo "Cannot find \`xdo\` command." 1>&2 exit 1 fi

id=$(xdo id -N "Polybar")

if xprop -id $id | grep -q "Normal"; then xdo hide -N "Polybar" else xdo show -N "Polybar" fi 
