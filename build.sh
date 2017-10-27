
if [ $# != 3 ]; then
	echo ""
	echo "usage:" 
	echo "	[port] [password] [encrypt]"
	echo "	example: ./build.sh 404 MiaoMiaoMia0? camellia-256-cfb"
	echo ""
	echo "	ecrypt recommend: "
	echo "	camellia-128-cfb"
	echo "	camellia-192-cfb"
	echo "	camellia-256-cfb"
	echo "	chacha20-ietf-poly1305"
	echo "	chacha20-ietf"
	echo ""
	echo ""
	exit 1;
fi
apt-get install software-properties-common -y
add-apt-repository ppa:max-c-lv/shadowsocks-libev -y
apt-get update -y
apt install shadowsocks-libev -y
PORT=$1
PASSWD=$2
ENCRYPT=$3
TAR_DIR=ctrl
EXE=start_ss.sh
mkdir $TAR_DIR
cd $TAR_DIR
echo 'nohup ss-server -p '$PORT' -k '$PASSWD' -m '$ENCRYPT' &' > $EXE
chmod 755 $EXE


