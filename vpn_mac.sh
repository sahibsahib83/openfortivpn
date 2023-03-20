#mac version
#!/bin/sh
date
sudo pkill openfortivpn > /dev/null 2>&1
read -p "Secure Code : " code
if [ ${#code} == 6 ]; then
        sudo sed -E -i '' "s/otp\ \=\ [0-9]{6}/otp\ \=\ $code/" /usr/local/etc/openfortivpn/openfortivpn/config
else
        echo "not valid , Using old code"
fi
echo "Vpn loading.."
sudo openfortivpn |tee vpn.log   &
until [ `netstat -nr| wc -l` -ge 100 ]
do
        sleep 1
done
date
echo "Vpn running in background"
