#! /bin/zsh
#
#Usage:
#zsh scanPorts.sh <input: CIDR> <output file> 

# Define scan function
scan(){
    host=$HOST
    printf '%s' $host
    
    for ((port=1;port<1024;port++)); do
        echo > /dev/null 2>&1 < nc -z -w1 ${host} ${port}
        if (( $? == 0))
            then printf '%d' $port
        fi
    done
}

# Create a list of IPs of our network
HOSTS=$(nmap -sn $1 | grep -E -o "([1-9]{1,3}\.){3}[1-9]{1,3}")

while read -r HOST; do
    HOSTARRAY+=($HOST)
done <<< $HOSTS

# Call the scan function for each host
for HOST in $HOSTARRAY; do
    scan $HOST
done