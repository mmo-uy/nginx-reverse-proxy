# /bin/bash
# echo '192.168.148.101 site1.example.com' | sudo tee -a /etc/hosts &&
# echo '192.168.148.101 site2.example.com' | sudo tee -a /etc/hosts

# ifconfig | ruby -e "print STDIN.read.match(/inet (\d*\.\d*\.\d*\.\d*).*broadcast/)[1]" | pbcopy | sudo tee -a /etc/hosts

#!/bin/bash

# Obtain the localhost IP address using the given command
localhost_ip=$(ifconfig | ruby -e "print STDIN.read.match(/inet (\d*\.\d*\.\d*\.\d*).*broadcast/)[1]")

# Prompt the user for a site name
read -p "Enter the site name (or press Enter for default): " site_name

# Use a default site name if the user didn't provide one
if [ -z "$site_name" ]; then
    site_name="example.com"
fi

# Append the IP and site name to /etc/hosts
echo "$localhost_ip    $site_name" | sudo tee -a /etc/hosts

echo "Site entry added to /etc/hosts:"
echo "$localhost_ip    $site_name"