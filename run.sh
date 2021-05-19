
#!/bin/bash
#
#开发用便捷脚本
#
soft() {
	echo "============================安装"
	yum install screen
	echo "install wget ----------------"
	echo y|yum install wget
	
	echo "get clef --------------------"
	wget https://github.com/ethersphere/bee-clef/releases/download/v0.4.9/bee-clef_0.4.9_amd64.rpm
	
	echo "rpm clef --------------------"
	rpm -i bee-clef_0.4.9_amd64.rpm
	
	echo "get bee ---------------------"
	wget https://github.com/ethersphere/bee/releases/download/v0.5.3/bee_0.5.3_amd64.rpm
	
	echo "rpm bee ---------------------"
	rpm -i bee_0.5.3_amd64.rpm
	
	echo "get clef-service ------------"
	# wget https://dworld-1252691683.cos.ap-nanjing.myqcloud.com/clef-service
	chmod a+x clef-service
	
	echo "ok"
}

clef() {
	screen -dmS "clef" ./clef-service start
}

bee() {
	screen -dmS "bee" bee start config.yaml
}


CMD=$1
case $CMD in
    1) soft ;;
	2) clef ;;
	3) bee ;;
    *) echo "CMD:
        1(按照环境)
        2(起clef)
        3(起节点)
        ";;
esac
