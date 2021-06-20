#! /bin/sh
while getopts "nc" arg #选项后面的冒号表示该选项需要参数
do
    case $arg in
	n)
	    google-chrome --app=https://www.notion.so;;
	c)
	    google-chrome --app=https://cplusplus.com;;
	?)  #当有不认识的选项的时候arg为?
	    echo "unkonw argument"
	    exit 1
	    ;;
    esac
done
