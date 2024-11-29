#!/bin/bash
MEFS_PATH=/memo/provider/p1/.memo-provider
provider=/memo/provider/p1/mefs-provider
IFS=$'\n\n'
for i in `cat ./provider.txt`
do
n=`echo $i | awk '{print $1}'`
p=`echo $i | awk '{print $2}'`
g=`echo $i | awk '{print $3}'`
ssh $n "MEFS_PATH=$MEFS_PATH $provider net declare '/ip4/$g/tcp/$p'"
done
