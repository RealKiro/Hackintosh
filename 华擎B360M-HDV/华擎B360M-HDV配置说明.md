
![title](https://i.imgur.com/w142YXM.jpg)
- 华擎B360M-HDV 
- Intel Core i5-8400
- AMD Radeon R9 270X

![title](https://i.imgur.com/SzHNSRG.jpg)

1. 基于[Len'DMG](http://bbs.pcbeta.com/search.php?mod=forum&searchid=3518&orderby=lastpost&ascdesc=desc&searchsubmit=yes&kw=Len)配置，config可直接使用：
	>   config八代台式机核显hd630(需设置核显显存大于64M).plist 

	* 初次能直接进系统，未做多大改动：
		* 移除多余引导项，添加 有EFI备份的其他盘号 使其在Clover引导隐藏
		* ig-platform-id 改为3e910003或3e920003
		* 引导参数保持默认LastBootedVolume，启动时间改为6S（可自动选中上一次打开的系统引导）
		* 声卡ID注入11
		* 正常开机后，去掉全部引导参数，如 -v 等

 	- EFI不是万能药，需要自己根据自己的配置作修改
 	- 同Windows一样，系统装好后不能直接食用，需配置适合自己的驱动（一般是 显卡+声卡）
 	- 驱动文件目录位于
 		> EFI
 		>> kext
 		>>> other

 	- 基本驱动都默认给你添加好了，需要什么别的驱动可以自己添加

 	- 隐藏多余引导项：
		- preboot
		- recovery
	
![title](https://i.imgur.com/HKTOOSk.jpg)

2. 主板声卡为ALC887，根据https://blog.daliansky.net/AppleALC-Supported-codecs.html 查阅节点一个一个的试出来：1~7外放有声音但前端插入耳机没声音，所以目前选取inject11声音基本全部正常；

![title](https://i.imgur.com/RvNd9eH.jpg)


3. 无法关机(会重启系统)的解决办法参考了http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1804882&highlight=%B9%D8%BB%FA ，已正常关机；


4. 图片预览打不开？在BIOS高级选项里面开启IGPU后正常（核显加速？）；


5. 笔记本显示屏改装为副屏，双显示器无法同时开启，否则开机要么副屏不是花屏就是绿屏，要么副屏息屏而主屏画面变蓝显示器识别为副屏（主DP 副HDMI；
	- [x] 解决办法：不需要插拔线，每次开机把主屏关机等进系统后再把主屏打开双屏就都正常了。

---
1. 显卡AMD Radeon R9 270X直接免驱

2. [Clover启动无法倒计时进入系统参考解决方案](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1786366&highlight=%B5%B9%BC%C6%CA%B1)

3. EFI是Len的可以直接拿来用，进系统后只需配置好驱动即可。如果黑果小兵的EFI没法用可以试试Len的，兼容性做的很棒！

---
> AppleALC使用方法：
	
- [x] [下载最新AppleALC](https://github.com/acidanthera/AppleALC/releases)放进lilu同级目录
- [x] 删掉VoodooHDA万能声卡驱动
- [x] 查阅Alc887节点，Audio注入11重启（[无效的话一个一个试](https://blog.daliansky.net/AppleALC-Supported-codecs.html )）

综上，经轻度体验后感觉基本完美
感谢各位！

---

# 参考
[1] [黑果小兵](https://blog.daliansky.net/)

[2] [Len’S DMG](http://bbs.pcbeta.com/search.php?mod=forum&searchid=3518&orderby=lastpost&ascdesc=desc&searchsubmit=yes&kw=Len)

[3] [ASROCK B360M-HDV_Hackintosh EFI](https://github.com/kennydiff/B360M-HDV_Hackin)

[4] [【原创工具】CPU-S轻松检测CPU信息和变频档位，还可生成变频SSDT](http://bbs.pcbeta.com/viewthread-1698338-1-1.html)