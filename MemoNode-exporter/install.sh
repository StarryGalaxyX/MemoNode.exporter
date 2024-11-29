#!/bin/bash
node_home=/memo/keeper/k1_2
node_release=mefs-keeper
#链及合约地址、group、公共节点,使用默认设置，如有更新，请及时修改
version=2
Endpoint=https://testchain.metamemo.one:24180
Role_contarct=0xECdD63267f94F818D1510DCC75617e1Cc6C03A71
Group=2
Bootstrap="/ip4/10.10.9.16/tcp/4001/p2p/12D3KooWE6qxHZ4bDMXpNu65Dhogja2s7YXB7CRmLQsvQGggRRHn"
#创建钱包地址、查看钱包地址
cat   <<EOF
a 注册wallet Address
b 启动节点
c 查看Address及sk
* 任意键退出
EOF
while :
do
read -p "please you selcted": selcte
case $selcte in
a|A)
MEFS_PATH=$node_home ./$node_release init --password=memoriae
MEFS_PATH=$node_home ./$node_release config set --key=contract.version --value=$version
MEFS_PATH=$node_home ./$node_release config set --key=contract.endPoint --value=$Endpoint
MEFS_PATH=$node_home ./$node_release config set --key=contract.roleContract --value=$Role_contarct
MEFS_PATH=$node_home ./$node_release bootstrap clear
MEFS_PATH=$node_home ./$node_release bootstrap add $Bootstrap
MEFS_PATH=$node_home ./$node_release wallet default
;;
b|B)
MEFS_PATH=$node_home nohup ./$node_release daemon start --api=/ip4/127.0.0.1/tcp/5001 --swarm-port=15001 --group=$Group  >$node_home/keeper.log 2>&1 &
;;
c|C)
MEFS_PATH=$node_home ./$node_release wallet default
wallet=`MEFS_PATH=$node_home ./$node_release wallet default|awk '{print $2}'`
MEFS_PATH=$node_home ./$node_release wallet export $wallet
;;
*)
exit
;;
esac
done
