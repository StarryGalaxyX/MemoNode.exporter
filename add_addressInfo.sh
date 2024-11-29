#!/bin/bash
IFS=$'\n\n'
MEFS_PATH=/memo/provider/p1/.mefs-provider
keeper=/memo/provider/p1/mefs-provider
>.keeper.address
>.ip_wallet
#输出Address
echo "Address:"
for i in `cat ./ip`
do
ssh $i "MEFS_PATH=$MEFS_PATH $keeper wallet default"|awk '{print $2}' >>.keeper.address
ssh $i "MEFS_PATH=$MEFS_PATH $keeper wallet default"|awk '{print $2}'
done
paste ip .keeper.address >.ip_wallet
#输出私钥
echo "私钥："
for i in `cat ./.ip_wallet`
do
ip=`echo $i|awk '{print $1}'`
wa=`echo $i|awk '{print $2}'`
#echo $wa
ssh $ip MEFS_PATH=$MEFS_PATH $keeper wallet export $wa|awk '{print $3}'
done
#输出网络id
echo "网络ID:"
for i in `cat ./ip`
do
ssh $i "MEFS_PATH=$MEFS_PATH $keeper net info"|awk '{print $3}'|awk -F "," '{print $1}'
done
