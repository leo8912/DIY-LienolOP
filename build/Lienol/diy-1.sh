#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#

#添加自定义源
 sed -i '$a src-git mypackages https://github.com/siropboy/mypackages' feeds.conf.default

#移除不用软件包
#rm -rf xxx/xxx/xxx/文件名
#rm -rf lede/package/lean/luci-theme-argon

#添加自定义插件链接（自己想要什么就github里面搜索然后添加）
git clone -b 18.06 https://github.com/garypang13/luci-theme-edge.git package/diy/luci-theme-edge  #主题-edge
git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git package/diy/luci-theme-infinityfreedom  #透明主题
git clone https://github.com/tty228/luci-app-serverchan.git package/diy/luci-app-serverchan  #微信推送
git clone https://github.com/garypang13/luci-app-eqos.git package/diy/luci-app-eqos  #内网IP限速工具
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/diy/luci-app-jd-dailybonus  #京东签到
git clone https://github.com/destan19/OpenAppFilter package/OpenAppFilter  #应用程序过滤

#增加LEDE的ShadowSocksR Plus+出国软件 (源码自带passwall出国软件)
sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/shadowsocksr-libev package/diy/shadowsocksr-libev
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/pdnsd-alt package/diy/pdnsd-alt
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/microsocks package/diy/microsocks
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/dns2socks package/diy/dns2socks
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/simple-obfs package/diy/simple-obfs
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/v2ray-plugin package/diy/v2ray-plugin
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/v2ray package/diy/v2ray
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/trojan package/diy/trojan
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ipt2socks package/diy/ipt2socks
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/redsocks2 package/diy/redsocks2

rm -rf ./package/lean/luci-theme-argon && git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/diy/luci-theme-argon  #新的argon主题
#全新的[argon-主题]此主题玩法很多,这里看说明【https://github.com/jerrykuku/luci-theme-argon/blob/18.06/README_ZH.md】
#用WinSCP连接openwrt，在/www/luci-static/argon里面创建background文件夹（如果本身就有background就不需要创建）来存放jpg png gif格式图片可以自定义登陆界面，gif图片为动态登陆界面

# 修改 argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
