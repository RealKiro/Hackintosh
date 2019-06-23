# ThinkPadT530

# 一．前言
![配置](https://i.imgur.com/mNrrsPx.png)

2012年的ThinkPad T530 <sup>[1]</sup> 笔记本，某宝2年前买的二手，现在Windows10+Mac双系统基本配置完成

![title](https://i.imgur.com/PHtV0hJ.png)

注意：
**善用搜索引擎，多多爬帖**
1. 独显[NVS5400无解](https://xratzh.com/2017/12/26/T430安装折腾macOS/)，只能驱动核显（DSDT方式成功驱动）<sup>[2]</sup>
2. 无线网卡默认为Intel，无解（由于联想、HP的BIOS有无线网卡白名单，不在白名单内的无线网卡型号只要用了就进不了任何系统引导，BIOS也进不了），建议使用USB无线网卡（有能力的可以根据其他教程刷白名单）<sup>[3]</sup>
3. [ThinkPad小红点漂移](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1794564&highlight=%B9%D8%D3%DA%BA%DA%C6%BB%B9%FB%CF%C2%D0%DE%D5%FDThinkPad%D0%A1%BA%EC%B5%E3%C6%AE%D2%C6%B5%C4%CC%BD%CC%D6)太灵敏了，需要改<sup>[4]</sup>

---
 


# 二.指南

 

成功上MacOS Mojave10.14.4

1. 推荐镜像：[黑果小兵](https://blog.daliansky.net)   <sup>[5]</sup> 或   [Len’S DMG](http://bbs.pcbeta.com/search.php?mod=forum&searchid=3518&orderby=lastpost&ascdesc=desc&searchsubmit=yes&kw=Len) <sup>[6]</sup>
二者总有一个默认配置能进系统的，不能进说明你机子不是主流需要爬贴用[相同机型的EFI](http://bbs.pcbeta.com/viewthread-1795904-1-1.html) <sup>[7]</sup> 替换
 	- [x] EFI不是万能药，需要自己根据自己的配置作修改
 	- [x] 同Windows一样，系统装好后不能直接食用，需配置适合自己的驱动（一般是 显卡+声卡，其他默认能使用）
 	- [x] 隐藏多余引导项：
 		- preboot
 		- recovery 
 
4. [DSDT-SSDT教程](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1571455) <sup>[8]</sup> ：建议看视频操作
	- [x] 可以驱动核显、亮度调节、电源管理、USB驱动等，不需要有编程基础
		* [ThinkPad T530等型号电池显示补丁](https://github.com/RehabMan/Laptop-DSDT-Patch/blob/master/battery/battery_Lenovo-X220.txt) <sup>[9]</sup>
		* 可以全部在DSDT里面打补丁
		* [ssdtPRGen.sh提取制作SSDT](http://bbs.pcbeta.com/viewthread-1612058-1-7.html)     
		* [ssdtPRGen.sh的简单标准的用法](http://bbs.pcbeta.com/viewthread-1720374-1-2.html) <sup>[10]</sup>
3. [AppleALC原版](https://github.com/acidanthera/AppleALC/releases)<sup>[11]</sup> 没修改过Codec，仅[Audio注入](https://blog.daliansky.net/AppleALC-Supported-codecs.html)<sup>[12]</sup> 30，基本正常，可以自动识别并切换外放和耳机
4. 触摸板驱动：ApplePS2SmartTouchPad.kext红点无法使用，所以换了[VoodooPS2Controller](https://bitbucket.org/RehabMan/os-x-voodoo-ps2-controller/downloads/)<sup>[13]</sup>，仅Win和Alt键映射反了，其他正常（单击需要在系统偏好设置->鼠标 看看勾选没，起初没勾选还以为驱动有问题^-^|||）

	- [x] 白苹果台式机和笔记本键位略有区别，以白苹果为准

5. SDHC卡槽驱动：[VoodooSDHC.kext](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1259442&highlight=VoodooSDHC.kext)<sup>[14]</sup>
6. 无线网卡驱动：Intel无解，我用的烧录夹刷入BCM94322HM8L（免驱）[白名单](http://bbs.pcbeta.com/search.php?mod=forum&searchid=700&orderby=lastpost&ascdesc=desc&searchsubmit=yes&kw=%B0%D7%C3%FB%B5%A5)后都正常，没有动手能力的建议买USB无线网卡（最好免驱），否则使用有线<sup>[15]</sup>

---

# 三.参考

 

[1] [时隔一年余，T530再装黑苹果，基本完美](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1662532&highlight=T530)

[2] [NVS5400不能驱动，放弃了独显](https://xratzh.com/2017/12/26/T430安装折腾macOS/)

[3] [T530 白名单解决方案！！！](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1590994&highlight=T530)

[4] [关于黑苹果下修正ThinkPad小红点飘移的探讨](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1794564&highlight=%B9%D8%D3%DA%BA%DA%C6%BB%B9%FB%CF%C2%D0%DE%D5%FDThinkPad%D0%A1%BA%EC%B5%E3%C6%AE%D2%C6%B5%C4%CC%BD%CC%D6)

[5] [黑果小兵](https://blog.daliansky.net)

[6] [Len’S DMG](http://bbs.pcbeta.com/search.php?mod=forum&searchid=3518&orderby=lastpost&ascdesc=desc&searchsubmit=yes&kw=Len) 
   
[7] [相同机型的EFI](http://bbs.pcbeta.com/viewthread-1795904-1-1.html)

[8] [使用补丁修改DSDT/SSDT [DSDT/SSDT综合教程]](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1571455)

[9] 
* [ThinkPad T530等型号电池显示补丁](https://github.com/RehabMan/Laptop-DSDT-Patch/blob/master/battery/battery_Lenovo-X220.txt)  
* [Laptop-DSDT-Patch/battery/](https://github.com/RehabMan/Laptop-DSDT-Patch/tree/master/battery)

[10] 
* [ssdtPRGen.sh提取制作SSDT](http://bbs.pcbeta.com/viewthread-1612058-1-7.html)     
* [ssdtPRGen.sh的简单标准的用法](http://bbs.pcbeta.com/viewthread-1720374-1-2.html) 

[11] [AppleALC](https://github.com/acidanthera/AppleALC/releases)

[12] [AppleALC支持的Codecs列表及AppleALC的使用](https://blog.daliansky.net/AppleALC-Supported-codecs.html)

[13][VoodooPS2Controller](https://bitbucket.org/RehabMan/os-x-voodoo-ps2-controller/downloads/)

[14] [ThinkPad W520 SD卡读卡器驱动 VoodooSDHC.kext分享](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1259442&highlight=VoodooSDHC.kext)

[15] [白名单](http://bbs.pcbeta.com/search.php?mod=forum&searchid=700&orderby=lastpost&ascdesc=desc&searchsubmit=yes&kw=%B0%D7%C3%FB%B5%A5)
 
---

# 四．后记：

1. Codec提取了但教程还没看，感觉有点复杂
2. 参考引用都是带超链接的可以直接点开，没有链接说明编辑器有问题不是我有问题，后续远景如果能支持MarkDown语法编辑就更好了
3. 远景编辑器很辣鸡
 

---
---
---


-
-
-
-
-
-
-
-
-

MD通用 ^[1]abc  或  MD通用 <sup>[1]abc</sup>

MD通用 ^[2] abc  （只要中间有空格键就不会变上下标） 

本软件中错误的部分 ^[3]abc^ 