@echo off
echo Setting up firewall rules
echo.

ipfw -q -f flush

ipfw add 100 pass all from any to any via lo*
ipfw add check-state
ipfw add allow all from me to 62.149.15.210 keep-state
ipfw add allow all from me to 62.149.15.214 keep-state
rem DNS Allow
ipfw add allow udp from me to any dst-port 53 keep-state
rem DHCP Allow
ipfw add allow udp from any 68 to any dst-port 67 out keep-state
ipfw add allow udp from any 67 to any in keep-state
rem mail
ipfw add allow tcp from me to any 25 out keep-state setup
ipfw add allow tcp from me to any 110 out keep-state setup
ipfw add allow tcp from me to any 587 out keep-state setup


ipfw add 65534 deny all from any to any
