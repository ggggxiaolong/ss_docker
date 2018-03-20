# ShadowSocks-go DockerFile

* 搭建多用户的Docker image
* 还没写完呢

iptables 配置
====
> https://github.com/shadowsocks/shadowsocks-libev/issues/1439

```shell
#清空所有链
iptables --flush
iptables --delete-chain
iptables --table mangle --flush
iptables --table mangle --delete-chain
#设定默认规则
iptables --policy INPUT DROP
iptables --policy OUTPUT ACCEPT
iptables --policy FORWARD DROP
#允许SSH
iptables --append INPUT --protocol tcp --dport 22 -j ACCEPT
#允许Shadowsocks端口
iptables --append INPUT --protocol tcp --dport 8339 -j ACCEPT
#允许Kcptun端口
iptables --append INPUT --protocol tcp --dport 29900 -j ACCEPT
#允许合法接入链接
iptables --append INPUT --match conntrack --ctstate ESTABLISHED,RELATED --jump ACCEPT
#永久化
iptables-save > /etc/iptables_rules
echo "/sbin/iptables-restore < /etc/iptables_rules" >> /etc/rc.local
```
