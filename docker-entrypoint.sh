#!/bin/sh

WORKDIR=/data
cd ${WORKDIR}

# 如果当前目录为空，则新建一个博客网站
if [ "`ls -A $WORKDIR`" = "" ]; then
    echo ">>>>>>>>>>> 当前目录为空,初始化一个博客网站"
    hexo init ./
    echo ">>>>>>>>>>> 安装依赖"
    npm config set registry http://registry.npm.taobao.org/
    npm install
else
    echo ">>>>>>>>>>> 使用已有的博客"
fi

# 清除缓存文件和已生成的静态文件
hexo clean
# 生成静态文件
hexo generate
# 启动服务器
hexo server -p ${HEXO_SERVER_PORT} -s
