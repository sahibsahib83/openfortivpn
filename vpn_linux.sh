#linux version
#!/usr/bin/bash
date
sudo pkill openfortivpn
read -p "Secure Code : " code
if [ ${#code} == 6 ]; then
	sudo sed -i "s/otp\ \=\ [0-9]*/otp\ \=\ $code/" /etc/openfortivpn/config
	echo $?
else
	echo "not valid , Using old code"
fi
echo "Vpn loading.."
sudo openfortivpn |tee vpn.log &
until [ `ip r | wc -l` -ge 10 ]
do
	sleep 1
done
date
echo "Vpn running in background"
