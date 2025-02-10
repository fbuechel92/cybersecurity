#! /bin/zsh
#
#Usage:
#zsh scanPorts.sh <input: CIDR> <output file> 

# Define scan function to test if port is open
scan(){
    host=$HOST
    printf '%s' $host
    
    for ((port=1;port<1024;port++)); do
        if nc -z -w1 ${host} ${port} > /dev/null 2>&1; then
            printf ' %d' "$port"
        fi
    done
}

# Create a list of IPs of our network
HOSTS=$(nmap -sn $1 | grep -E -o "\(([0-9]{1,3}\.){3}[0-9]{1,3}\)" | tr -d "()")

# Create output file
TODAY=$(date +scan_%Y-%m-%d)
OUTFILE=$TODAY

while read -r HOST; do
    HOSTARRAY+=($HOST)
done <<< $HOSTS

# Call the scan function for each host and print open ports
for HOST in $HOSTARRAY; do
    scan $HOST
    printf '\n'
done > $OUTFILE