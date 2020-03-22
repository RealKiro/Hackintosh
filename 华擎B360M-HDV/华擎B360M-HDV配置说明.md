`2020.03.22`
- 精简一些无用的东西，为OpenCore作准备（咕咕咕咕……

- [ ] OpenCore参考：
* [OpenCore 官方文档](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/Configuration.pdf)
* [OpenCore 官方文档迭代](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/Differences/Differences.pdf)
* [OpenCore Vanilla Guide](https://khronokernel.github.io/Opencore-Vanilla-Desktop-Guide/)
* [使用OpenCore安装黑苹果](https://github.com/cattyhouse/oc-guide)
* [精解 OpenCore | 黑果小兵](https://blog.daliansky.net/OpenCore-BootLoader.html)
* [使用 OpenCore 引导黑苹果 | Xjn’s Blog](https://blog.xjn819.com/?p=543)

* [Acidanthera](https://github.com/acidanthera)
* [OpenCore Configuration](https://blog.xjn819.com/wp-content/uploads/2019/10/Configuration.pdf)

`2019.10.30`
- 更新至 `Catalina 10.15.1 (19B88)`
- 更新 `Clover`
- 更新 `WhateverGreen` 解决 `升级后黑屏` 问题

`2019.10.17`
- 重新抹盘重装升级至Catalina 10.15 (19A602)一切基本正常甚至更好了
- 磁盘多了个`Mac-Data`宗卷不知道是什么鬼

`2019.10.08`
- 升级至Catalina 10.15 (19A583)正式版，一切基本正常

`2019.09.27`
- 小补丁更新至10.14.6 (18G103)，一切正常

`2019.08.29`
- [x] 换回`Len`的八代配置，使用正常
- [x] 添加解除端口限制补丁
- [x] 机箱加了个前置HD面板，重新定制USB

`2019.08.29` 
- 无损升级至10.14.6 (18G95)，一切正常
- 原先用的十铨8G 2400MHZ，今天加了根 Apacer黑豹 8G 内存条，BIOS手动超频到 2666MHZ 系统正常

    ~~途中出的小事故是：插槽2不识别用酒精擦了下插槽就正常识别了好险。。。~~

`2019.08.28` 
- [ ] `TODO` 等有空重新定制端口，明显已经超过了15个限制；大佬建议：先要解除limit...然后再hackintool定制才行

- [ ] `TODO` 除前面板一个 USB3.0 外其他 USB口 都正常，不影响其他口正常使用

---

![title](https://i.imgur.com/w142YXM.jpg)
- `华擎B360M-HDV` 
- `Intel Core i5-8400`
- AMD Radeon R9 270X（免驱卡）
- 无损更新  `MacOS Mojave 10.14.6 18G84` ，补丁 `18G87` 更新也基本正常能用
![title](https://i.imgur.com/SzHNSRG.jpg)

图片仅作参考

---
0. 黑苹果前BIOS设置：
	![title](https://i.imgur.com/ACC3LZo.png)

1. 基于[`Len'DMG`](http://bbs.pcbeta.com/search.php?mod=forum&searchid=3518&orderby=lastpost&ascdesc=desc&searchsubmit=yes&kw=Len) 配置，其config可直接使用：
	>> config.plist

	> 或

	>> config八代台式机核显uhd630.plist (推荐使用)

	- 初次不需要改动就能直接进系统，后面未做多大改动（以下大部分均在[Clover Configurator](https://mackie100projects.altervista.org/download-clover-configurator/)内修改）：
		* 移除多余引导项，添加 有EFI备份的其他盘号 使其在Clover开机引导界面隐藏
		* ig-platform-id 改为3e920003
		* 引导参数选择LastBootedVolume，启动时间改为6S（重启电脑后可自动选中上一次打开的系统引导）
		* 机型选择iMac19,1
		* 声卡ID注入11（AppleALC）
		* 正常开机后，去掉部分不需要用到的引导参数，如 -v 等
		* 变频： CPU设置 -- HWP开启

 	- EFI不是万能药，最好自己根据自己的配置略作修改
 	- 同Windows一样，系统装好后不能直接食用，需配置适合自己的驱动（一般是 显卡+声卡）
 	- 驱动文件目录位于
 		> EFI
		>> CLOVER
 		>>> kext
 		>>>> other

 	- 基本驱动 镜像包 里面都默认自带，需要什么别的驱动可以自己添加
 		* 注意`USBinjectAll.kext`（USB万能驱动）iMac机型最高为19.1，，机型19.2鼠标或键盘很可能不能用，如需19.2请自己修改

		![title](https://i.loli.net/2019/07/26/5d3ab7706440243648.png)

	- 声卡为万能声卡`VoodooHDA.kext`, 无需注入声卡开机默认能使用；如不想用万能声卡可使用`AppleALC.kext`, 但是必须`注入ID`或修改Codec。

 	- 隐藏多余引导项：
		- `preboot`
		- `recovery`
	
![title](https://i.imgur.com/HKTOOSk.jpg)

2. 主板声卡为ALC887，根据[AppleALC支持的Codecs列表及AppleALC的使用](https://blog.daliansky.net/AppleALC-Supported-codecs.html) 查阅节点一个一个的试出来：1~7外放有声音但前端插入耳机没声音，所以目前选取inject11声音基本全部正常；

![title](https://i.imgur.com/RvNd9eH.jpg)

> AppleALC使用方法：
	
>> - [下载最新AppleALC](https://github.com/acidanthera/AppleALC/releases)放进lilu同级目录
>> - 删掉`VoodooHDA`万能声卡驱动
>> - 查阅Alc887节点，Audio注入11重启（[无效的话一个一个试](https://blog.daliansky.net/AppleALC-Supported-codecs.html )）

3. 无法关机(会重启系统)的解决办法参考了:[安装10.14后无法关机(会重启系统)的解决办法](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1804882&highlight=%B9%D8%BB%FA) ，已正常关机；


4. 图片预览打不开？在BIOS高级选项里面开启IGPU后正常（核显加速？）；


5. 笔记本显示屏改装为副屏，双显示器无法同时开启，否则开机要么副屏不是花屏就是绿屏，要么副屏息屏而主屏画面变蓝显示器识别为副屏（主DP 副HDMI；
	- [x] 解决办法：不需要插拔线，每次开机把主屏关机等进系统后再把主屏打开双屏就都正常了。
	- [x] 10.14.5版本不需要关显示屏方法：ig-platform-id设置为3e9b0007或3e9b0001，目前会频繁自动重启系统，估计是超频造成的？已重新换成3e920003（Clover版本4972），目前双屏直接启动都正常，启动进度条有绿条但不影响。
	- [x] 升级10.14.6后双屏无法同时开机，有知道怎么解决的可以告诉我
6. 
    Q：黑果每次开机或重启都要求输入iCloud密码？
    A：注销iCloud账户后重新登陆，重启电脑就好了

7. 显卡`AMD Radeon R9 270X`直接免驱，当初作为小白直接配的时候核显用HDMI接口会黑屏，所以加了块AMD独显

8. [Clover启动无法倒计时进入系统参考解决方案](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1786366&highlight=%B5%B9%BC%C6%CA%B1)

9. EFI是 `Len` 的可以直接拿来用，进系统后只需配置好驱动即可。如果 `黑果小兵` 的EFI没法用可以试试 `Len` 的，兼容性做的很棒！

👌 综上，经轻中度体验后感觉基本完美，能作为生产工具使用。
感谢各位！

---

# 参考

*  [macOS Mojave 的硬件兼容性列表](https://github.com/CrazyPegAsus/macOS-Mojave-Compatibility-hardware-list)

*  [`黑果小兵`](https://blog.daliansky.net/)

*  [`Len’S DMG`](http://bbs.pcbeta.com/search.php?mod=forum&searchid=3518&orderby=lastpost&ascdesc=desc&searchsubmit=yes&kw=Len)

*  [`balenaEtcher`](https://www.balena.io/etcher/)

*  [ASROCK B360M-HDV_Hackintosh EFI](https://github.com/kennydiff/B360M-HDV_Hackin)

*  [黑苹果引导工具 Clover 配置详解](https://www.jianshu.com/p/b156b0177a24)

*  [解决华擎主板新BIOS无法启动macOS](https://github.com/cattyhouse/oc-guide/wiki/我的一些黑苹果笔记)

*  [暂时只适用于10.13的N卡驱动nvidia-drivers](https://www.tonymacx86.com/nvidia-drivers/)

*  [黑苹果必备：Intel核显platform ID整理及smbios速查表](https://blog.daliansky.net/Intel-core-display-platformID-finishing.html)

*  [新手常见(五国)(-v图)错误解决(原版,破解kernel,补丁kext下载)](http://bbs.pcbeta.com/viewthread-863656-1-1.html)

*  [黑苹果（Hackintosh）的折腾时光](https://www.jianshu.com/p/bd57a9324f08)

*  [`Hackintosh`黑苹果长期维护机型EFI及安装教程整理](https://github.com/daliansky/Hackintosh)

*  [【黑果小兵】[远景首发]`Hackintool`(原Intel FB-Patcher)使用教程及插入姿势](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1794948&highlight=fb)


*  [10.13.X-10.14.5 开启建兴/浦科特/海力士等NVMe固态原生支持补丁 解决硬盘不识别](http://bbs.pcbeta.com/viewthread-1774117-1-1.html)

*  [轻轻松松驱动AMD显卡，适用于所有A卡的通用解决办法](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1637874&highlight=%C7%E1%C7%E1%CB%C9%CB%C9%C7%FD%B6%AFAMD)
*  [OS-X-Voodoo-PS2-Controller源码](https://github.com/tluck/OS-X-Voodoo-PS2-Controller)

*  [`OS-X-Voodoo-PS2-Controller`](https://bitbucket.org/RehabMan/os-x-voodoo-ps2-controller/downloads/)

*  [`Clover Configurator`](https://mackie100projects.altervista.org/download-clover-configurator/)

*  [AppleALC支持的Codecs列表及AppleALC的使用](https://blog.daliansky.net/AppleALC-Supported-codecs.html)

*  [黑苹果定制声卡驱动（ALC892为例)](https://www.jianshu.com/p/29a74f0664f1)

*  [`AppleALC`](https://github.com/acidanthera/AppleALC/releases)

*  [`WhateverGreen`](https://github.com/acidanthera/WhateverGreen/releases)

*  [Enable macOS HiDPI](https://github.com/xzhih/one-key-hidpi)

*  [改为19.2机型，usb端口不识别](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1815666&highlight=19.2)

* [关于黑果小兵的10.14.x解除USB端口限制补丁的补充帖（20190826补充说明）](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1826217&highlight=%B6%CB%BF%DA%CF%DE%D6%C6)

*  [`virtual smc`](https://github.com/acidanthera/VirtualSMC/releases)  可以代替 `facksmc` ，请自行选择

- [从技术角度谈谈10.11的USB驱动机制，兼论10.11 USB安装盘的花屏禁行问题](http://bbs.pcbeta.com/viewthread-1646768-1-1.html)
- [10.11 USB问题之下篇，一步一步教你解决USB问题](http://bbs.pcbeta.com/viewthread-1651615-1-1.html)

- [解决10.11 El Capitan USB 摄像头 蓝牙无法使用问题（自制遮盖器法）](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1647984)

---
## `OpenCore` 及 `AMD` 相关：
* [OpenCore](https://github.com/acidanthera/OpenCorePkg)

* [使用OpenCore安装黑苹果](https://github.com/cattyhouse/oc-guide)

* CPU是AMD的内核补丁：[AMD Vanilla](https://github.com/AMD-OSX/AMD_Vanilla)
---
## ⚠️
* BIOS固件千万不要升级，否则容易出问题！建议保持3.1及以下版本。
* 参考部分有些是笔记本配置指南，来源于书签🔖暂时懒得整理，台式机配置可选择性地阅读并慎用！
* 几乎所有驱动都可以通过Hackintool这款工具下载，不需要单独到处找，部分配置也可通过它来完成。
* 键盘布局：
	* USB键盘 -- Win 是 Command 
	* PS2/I2C键盘 -- Alt 是 Command
+ 由于台式机比笔记本传感器等硬件要简单，所以配置起来台式机更容易一点，DSDT反编译 或 `hotpatch` 热修补等非常复杂的操作台式机是不需要的
+ 白苹果显卡核显标准名称是 `IGPU` ，独显是 `GFX0` ， 所以我的笔记本显卡名称`VID`需要换成`IGPU`就是这个原因，详见`遮盖器`。
