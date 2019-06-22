
![title](https://i.imgur.com/w142YXM.jpg)
- 华擎B360M-HDV 
- Intel Core i5-8400
- AMD Radeon R9 270X

![title](https://i.imgur.com/SzHNSRG.jpg)

1. 基于[Len'DMG](http://bbs.pcbeta.com/search.php?mod=forum&searchid=3518&orderby=lastpost&ascdesc=desc&searchsubmit=yes&kw=Len)配置，config可直接使用：
	>   config八代台式机核显hd630(需设置核显显存大于64M).plist 

	-  初次能直接进系统，未做多大改动（以下大部分均在[Clover Configurator](https://mackie100projects.altervista.org/download-clover-configurator/)内修改）：
		* 移除多余引导项，添加 有EFI备份的其他盘号 使其在Clover引导隐藏
		* ig-platform-id 改为3e910003或3e920003
		* 引导参数保持默认LastBootedVolume，启动时间改为6S（可自动选中上一次打开的系统引导）
		* 声卡ID注入11
		* 正常开机后，去掉全部引导参数，如 -v 等
		* 变频： CPU设置 -- HWP开启

 	- EFI不是万能药，需要自己根据自己的配置作修改
 	- 同Windows一样，系统装好后不能直接食用，需配置适合自己的驱动（一般是 显卡+声卡）
 	- 驱动文件目录位于
 		> EFI
 		>> kext
 		>>> other

 	- 基本驱动都默认给你添加好了，需要什么别的驱动可以自己添加
 		* 注意USBinjectAll.kext（USB万能驱动）iMac机型最高为19.1，，机型19.2鼠标或键盘很可能不能用，如需19.2请自己修改

 	- 隐藏多余引导项：
		- preboot
		- recovery
	
![title](https://i.imgur.com/HKTOOSk.jpg)

2. 主板声卡为ALC887，根据https://blog.daliansky.net/AppleALC-Supported-codecs.html 查阅节点一个一个的试出来：1~7外放有声音但前端插入耳机没声音，所以目前选取inject11声音基本全部正常；

![title](https://i.imgur.com/RvNd9eH.jpg)


3. 无法关机(会重启系统)的解决办法参考了:[安装10.14后无法关机(会重启系统)的解决办法](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1804882&highlight=%B9%D8%BB%FA) ，已正常关机；


4. 图片预览打不开？在BIOS高级选项里面开启IGPU后正常（核显加速？）；


5. 笔记本显示屏改装为副屏，双显示器无法同时开启，否则开机要么副屏不是花屏就是绿屏，要么副屏息屏而主屏画面变蓝显示器识别为副屏（主DP 副HDMI；
	- [x] 解决办法：不需要插拔线，每次开机把主屏关机等进系统后再把主屏打开双屏就都正常了。

---
1. 显卡AMD Radeon R9 270X直接免驱

2. [Clover启动无法倒计时进入系统参考解决方案](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1786366&highlight=%B5%B9%BC%C6%CA%B1)

3. EFI是Len的可以直接拿来用，进系统后只需配置好驱动即可。如果黑果小兵的EFI没法用可以试试Len的，兼容性做的很棒！

---
> AppleALC使用方法：
	
>> - [下载最新AppleALC](https://github.com/acidanthera/AppleALC/releases)放进lilu同级目录
>> - 删掉VoodooHDA万能声卡驱动
>> - 查阅Alc887节点，Audio注入11重启（[无效的话一个一个试](https://blog.daliansky.net/AppleALC-Supported-codecs.html )）

综上，经轻度体验后感觉基本完美
感谢各位！

---

# 参考

*  [macOS Mojave 的硬件兼容性列表](https://github.com/CrazyPegAsus/macOS-Mojave-Compatibility-hardware-list)

*  [黑果小兵](https://blog.daliansky.net/)

*  [Len’S DMG](http://bbs.pcbeta.com/search.php?mod=forum&searchid=3518&orderby=lastpost&ascdesc=desc&searchsubmit=yes&kw=Len)

*  [ASROCK B360M-HDV_Hackintosh EFI](https://github.com/kennydiff/B360M-HDV_Hackin)

*  [CPU-S轻松检测CPU信息和变频档位，还可生成变频SSDT](http://bbs.pcbeta.com/viewthread-1698338-1-1.html)

*  [暂时只适用于10.13的N卡驱动nvidia-drivers](https://www.tonymacx86.com/nvidia-drivers/)

*  [黑苹果必备：Intel核显platform ID整理及smbios速查表](https://blog.daliansky.net/Intel-core-display-platformID-finishing.html)

*  [新手常见(五国)(-v图)错误解决(原版,破解kernel,补丁kext下载)](http://bbs.pcbeta.com/viewthread-863656-1-1.html)

*  [黑苹果（Hackintosh）的折腾时光](https://www.jianshu.com/p/bd57a9324f08)

*  [Hackintosh黑苹果长期维护机型EFI及安装教程整理](https://github.com/daliansky/Hackintosh)

*  [【黑果小兵】[远景首发]Hackintool(原Intel FB-Patcher)使用教程及插入姿势](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1794948&highlight=fb)

*  [hotpatch详解](https://www.jianshu.com/p/7e9c045eef6a)

*  [[教程] 装完系统后的一件事，Clover Acpi hotpatch给机器打补丁。](http://bbs.pcbeta.com/viewthread-1802902-1-3.html)

*  [【指南】给笔记本的DSDT/SSDTs打补丁](https://www.kancloud.cn/chandler/mac_os/482278#ACPI_205)

*  [[交流] 通过DSDT和SSDT成功实现变频的必要步骤［综合信息帖］](http://bbs.pcbeta.com/viewthread-1578829-1-1.html)

*  [[教程] [授权翻译] 使用补丁修改DSDT/SSDT [DSDT/SSDT综合教程]](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1571455)

*  [联合DSDT和SSDT进行反编译——减少DSDT和SSDT错误的尝试](http://bbs.pcbeta.com/viewthread-1475332-1-1.html)

*  [ssdtPRGen.sh](https://github.com/Piker-Alpha/ssdtPRGen.sh)

*  [[原创内容] ssdtPRGen.sh的简单标准的用法（另外纠正一个论坛一个普遍的错误的ssdtPRGen.sh用法）](http://bbs.pcbeta.com/viewthread-1720374-1-2.html)

*  [[教程] ssdtPRGen.sh提取制作SSDT](http://bbs.pcbeta.com/viewthread-1612058-1-7.html)

*  [充分运用MaciASL软件的补丁源－让黑苹果高手帮你完善DSDT](http://bbs.pcbeta.com/viewthread-1576959-1-1.html)

*  [[DSDT] 10.13.X-10.14.5 开启建兴/浦科特/海力士等NVMe固态原生支持补丁 解决硬盘不识别](http://bbs.pcbeta.com/viewthread-1774117-1-1.html)

*  [【新手教程】轻轻松松驱动AMD显卡，适用于所有A卡的通用解决办法](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1637874&highlight=%C7%E1%C7%E1%CB%C9%CB%C9%C7%FD%B6%AFAMD)

*  [对笔记本的 DSDT／SSDT 打补丁](https://blog.csdn.net/wr132/article/details/54798754)

*  [Mojave折腾笔记本电脑触摸板驱动心得](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1805317&highlight=%B4%A5%C3%FE%B0%E5)

*  [关于黑苹果下修正ThinkPad小红点飘移的探讨](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1794564&page=2#pid48732925)

*  [关于黑苹果下修正ThinkPad小红点飘移的探讨](http://bbs.pcbeta.com/viewthread-1794564-1-1.html)

*  [OS-X-Voodoo-PS2-Controller源码](https://github.com/tluck/OS-X-Voodoo-PS2-Controller)

*  [OS-X-Voodoo-PS2-Controller](https://bitbucket.org/RehabMan/os-x-voodoo-ps2-controller/downloads/)

*  [Clover Configurator](https://mackie100projects.altervista.org/download-clover-configurator/)

*  [AppleALC支持的Codecs列表及AppleALC的使用](https://blog.daliansky.net/AppleALC-Supported-codecs.html)

*  [黑苹果定制声卡驱动（ALC892为例)](https://www.jianshu.com/p/29a74f0664f1)

*  [AppleALC](https://github.com/acidanthera/AppleALC/releases)

*  [WhateverGreen](https://github.com/acidanthera/WhateverGreen/releases)

*  [Enable macOS HiDPI](https://github.com/xzhih/one-key-hidpi)

*  [改为19.2机型，usb端口不识别](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1815666&highlight=19.2)

*  [黑苹果引导工具 Clover 配置详解](https://www.jianshu.com/p/b156b0177a24)

* [balenaEtcher](https://www.balena.io/etcher/)

---
# ⚠️
* 参考部分有些是笔记本配置指南，台式机请慎用！
* 几乎所有驱动都可以通过Hackintool这款工具下载，不需要单独到处找，部分配置也可以通过它来完成。