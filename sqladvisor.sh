#!/bin/bash
type=$1
if [[ $type == yg ]];then
     docker run --rm -v $PWD/components/sqladvisor/conf.d:/data web_sqladvisor -f /data/yg_sql.cnf -v 1
elif [[ $type == sjx ]];then
     docker run --rm -v $PWD/components/sqladvisor/conf.d:/data web_sqladvisor -f /data/sjx_sql.cnf -v 1
else
     echo '参数错误, 只能传yg或sjx'
fi



