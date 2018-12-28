# oracle11g-installer
在jaspeen的脚本基础上增加了centos的中文支持；
更改了oracle 11g安装的语言为en,zh_CN；
修改了oracle 11g默认字符集为ZHS16GBK；
修改了系统配置：alter system set "_allow_level_without_connect_by" = true;  

如果需要修改系统用户密码可以修改setup.sh；
如果需要修改数据库用户密码和配置可以修改dbca.rsp；
或者修改初始化脚本entrypoint_oracle.sh；

oracle 11g docker image generator base centos
copied for jaspeen

Image for running Oracle Database 11g Standard/Enterprise. Due to oracle license restrictions image is not contain database itself and will install it on first run from external directory.

This image for development use only

Usage
Download database installation files from Oracle site and unpack them to install_folder. Run container and it will install oracle and create database:

docker run --privileged --name oracle11g -p 1521:1521 -v <install_folder>:/install jaspeen/oracle-11g
Then you can commit this container to have installed and configured oracle database:

docker commit oracle11g oracle11g-installed
Database located in /opt/oracle folder

OS users:

root/install
oracle/install
DB users:

SYS/oracle
Optionally you can map dpdump folder to easy upload dumps:

docker run --privileged --name oracle11g -p 1521:1521 -v <install_folder>:/install -v <local_dpdump>:/opt/oracle/dpdump jaspeen/oracle-11g
To execute impdp/expdp just use docker exec command:

docker exec -it oracle11g impdp ..
