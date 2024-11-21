#!/bin/bash

# Automated Network Scanning Tool using Nmap
# Author: Kathan Parekh (theHackerGeek)

# Function to display the menu
display_menu() {
    echo "========================================="
    echo " Automated Network Scanning Tool by theHackerGeek!"
    echo "========================================="
    echo "1. Scan a Single IP"
    echo "2. Scan a Range of IPs"
    echo "3. Scan for Open Ports"
    echo "4. Save Results to File"
    echo "5. Exit"
    echo "========================================="
}

# Function to scan a single IP
scan_single_ip() {
    read -p "Enter the IP address to scan: " ip
    echo "Scanning $ip..."
    nmap -v -A $ip
}

# Function to scan a range of IPs
scan_ip_range() {
    read -p "Enter the IP range (e.g., 192.168.1.1-254): " range
    echo "Scanning range $range..."
    nmap -v -sP $range
}

# Function to scan for open ports
scan_ports() {
    read -p "Enter the target IP: " target
    echo "Scanning open ports on $target..."
    nmap -v -sS -Pn $target
}

# Function to save results to a file
save_results() {
    read -p "Enter the target IP or range: " target
    read -p "Enter the file name to save results: " filename
    echo "Scanning $target and saving results to $filename..."
    nmap -v -A $target > $filename
    echo "Results saved to $filename"
}

# Main script logic
while true; do
    display_menu
    read -p "Choose an option (1-5): " choice
    case $choice in
        1) scan_single_ip ;;
        2) scan_ip_range ;;
        3) scan_ports ;;
        4) save_results ;;
        5) echo "Exiting the tool. Goodbye!" ; exit 0 ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
done
