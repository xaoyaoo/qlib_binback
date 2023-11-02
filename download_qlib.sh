#!/bin/bash

# 获取当前日期的前一天（如果执行脚本的时间为周六，则直接使用当前日期）

yesterday=$(date --date="yesterday" +%Y-%m-%d)


# 构建下载链接
download_url="https://github.com/chenditc/investment_data/releases/download/${yesterday}/qlib_bin.tar.gz"
#echo $download_url

# 指定保存文件夹路径
tmp_dir="./"

# 下载文件并保存到指定文件夹
wget -O "${tmp_dir}qlib_bin.tar.gz" "$download_url"

# 生成并保存 MD5 值
md5=$(md5sum "${tmp_dir}qlib_bin.tar.gz" | awk '{print $1}')
echo "${yesterday} ${md5}" > "${tmp_dir}qlib_bin.tar.gz.md5"

# 如果下载成功，将文件移动到目标文件夹
if [ -e "${tmp_dir}qlib_bin.tar.gz" ]; then
    echo "下载完成！"
else
    echo "下载失败！"
fi
