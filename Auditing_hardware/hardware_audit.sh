#!/bin/bash

# Function to print section headers
print_section_header() {
    echo "--------------------------------"
    echo "$1"
    echo "--------------------------------"
}

# Function to print key-value pairs with highlighting
print_key_value() {
    key="$1"
    value="$2"
    expected="$3"

    if [ "$value" != "$expected" ]; then
        echo -e "\e[31m$key:\e[0m $value (Expected: $expected)"
    else
        echo "$key: $value"
    fi
}

# Function to print list with highlighting
print_list() {
    header="$1"
    shift
    list=("$@")

    echo "$header:"
    for item in "${list[@]}"; do
        echo "- $item"
    done
}

# Server Uptime
print_section_header "Server Uptime"
uptime

# Last Server Reboot Timestamp
print_section_header "Last Server Reboot Timestamp"
last reboot | head -n 1

# Server Local Time Zone
print_section_header "Server Local Time Zone"
print_key_value "Time Zone" "$(date +%Z)" "IST"

# Last 10 installed packages with dates
print_section_header "Last 10 installed packages with dates"
rpm -qa --last | head -n 10

# OS version
print_section_header "OS version"
print_key_value "OS Version" "$(cat /etc/redhat-release)" "RHEL"

# Kernel version
print_section_header "Kernel version"
uname -r

# CPU - Virtual cores, Clock speed, Architecture
print_section_header "CPU Information"
lscpu | grep -E 'Model name|CPU MHz|CPU(s)|Architecture'

# Disk Information
print_section_header "Disk Information"
df -h

# Private and Public IP
print_section_header "IP Information"
ip addr show

# Private and Public DNS or Hostname
print_section_header "DNS or Hostname"
hostname
hostname -I

# Networking - Bandwidth
print_section_header "Networking - Bandwidth"
netstat -i

# Networking - OS Firewall (Allowed Ports & Protocols)
print_section_header "Networking - OS Firewall"
iptables -L

# Networking - Network Firewall (Allowed Ports & Protocols)
print_section_header "Networking - Network Firewall"
firewall-cmd --list-all

# CPU Utilization
print_section_header "CPU Utilization"
top -bn1 | grep "Cpu(s)"

# RAM Utilization
print_section_header "RAM Utilization"
free -m

# Storage Utilization
print_section_header "Storage Utilization"
df -h

# Current User Password Expiry
print_section_header "Current User Password Expiry"
chage -l "$(whoami)" | grep "Password expires"
