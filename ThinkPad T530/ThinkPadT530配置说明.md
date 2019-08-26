`2019.08.26`

- 重新制作config，原``Len`s DMG`` HD4000高分屏会卡NVRAM（五国）循环重启故弃用
- 用 hotpatch动态补丁 代替 DSDT-SSDT反编译静态补丁 
- [x] 核显驱动正常，applbkl=1   MacBookPro9,2    0x01660004
- [x] 声卡用的 `AppleALC` , 手动注入ID为40 ，正常
- [x] 睡眠基本正常
- [x] 亮度调节正常
- [x] 关机正常、重启正常
- [x] 摄像头正常

Find | Replace | 备注
:----------- | :-----------:| -----------:
 `EHC1`       | `EH01`       |
`EHC2`        | `EH02`       |
`XHCI`        |`XHC`          |
~~`XHC1`    |~~`XHC`~~ |DSDT无此参数
    
- [ ] `TODO` 触控板不正常 -- 找不到触控板
- [ ] `TODO` 电池显示不正常 -- 不显示


---

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
4. 合盖正常，休眠正常，睡眠正常
---
 


# 二.指南

 

- [x] 无损更新 MacOS Mojave 10.14.6 18G84使用正常，在此基础上小补丁更新至18G87后翻车了。。。（找到问题原因或有解决方法欢迎提交issue）

1. 推荐镜像：[黑果小兵](https://blog.daliansky.net)   <sup>[5]</sup> 或   [Len’S DMG](http://bbs.pcbeta.com/search.php?mod=forum&searchid=3518&orderby=lastpost&ascdesc=desc&searchsubmit=yes&kw=Len) <sup>[6]</sup>
二者总有一个默认配置能进系统的，不能进说明你机子不是主流需要爬贴或用[相同机型的EFI](http://bbs.pcbeta.com/viewthread-1795904-1-1.html) <sup>[7]</sup> 替换
 	- [x] EFI不是万能药，需要自己根据自己的配置作修改
 	- [x] 同Windows一样，系统装好后不能直接食用，需配置适合自己的驱动（一般是 显卡+声卡，其他默认能使用）
 	- [x] 隐藏多余引导项：
 		- preboot
 		- recovery 
 
4. [DSDT-SSDT教程](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1571455) <sup>[8]</sup> ：建议看视频操作
	- [x] 可以驱动核显、亮度调节、电源管理、USB驱动等，不需要有编程基础
		* MaciASL有2种版本（[Rehabman MaciASL](https://bitbucket.org/RehabMan/)和[Acidanthera MaciASL](https://github.com/acidanthera/MaciASL/releases)），其中Acidanthera 的莫名其妙的问题一堆，Rehabman的6.2a版好用推荐（0错误）
		* [ThinkPad T530等型号电池显示补丁](https://github.com/RehabMan/Laptop-DSDT-Patch/blob/master/battery/battery_Lenovo-X220.txt) <sup>[9]</sup>
		* [ssdtPRGen.sh提取制作SSDT](http://bbs.pcbeta.com/viewthread-1612058-1-7.html)     
		* [ssdtPRGen.sh的简单标准的用法](http://bbs.pcbeta.com/viewthread-1720374-1-2.html) <sup>[10]</sup>
3. [AppleALC原版](https://github.com/acidanthera/AppleALC/releases)<sup>[11]</sup> 没修改过Codec，仅[Audio注入](https://blog.daliansky.net/AppleALC-Supported-codecs.html)<sup>[12]</sup> 40，基本正常，可以自动识别并切换外放和耳机
4. 触摸板驱动：ApplePS2SmartTouchPad.kext红点无法使用，所以使用默认的[VoodooPS2Controller](https://bitbucket.org/RehabMan/os-x-voodoo-ps2-controller/downloads/)<sup>[13]</sup>，仅Win和Alt键映射反了，其他正常（单击需要在系统偏好设置->鼠标 看看勾选没，起初没勾选还以为驱动有问题^-^|||）

	- [x] 白苹果台式机和笔记本键位略有区别，以白苹果为准

5. SDHC卡槽驱动：[VoodooSDHC.kext](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1259442&highlight=VoodooSDHC.kext)<sup>[14]</sup>
	🐷没有通过内建，还在研究中。

	![title](https://i.loli.net/2019/07/26/5d3ab7a521f8b31691.png)

6. 无线网卡驱动：Intel无解，我用的烧录夹刷入BCM94322HM8L（免驱）[白名单](http://bbs.pcbeta.com/search.php?mod=forum&searchid=700&orderby=lastpost&ascdesc=desc&searchsubmit=yes&kw=%B0%D7%C3%FB%B5%A5)后都正常，没有动手能力的建议买USB无线网卡（最好免驱），否则使用有线<sup>[15]</sup>

7. 更新10.14.6后U盘插入显示“USB配件需要电源”无法识别，通过Hackintool定制USB已解决<sup>[16]</sup>

8. 正在研究`hotpatch`（动态补丁）方法以替代DSDT-SSDT反编译生成的静态补丁<sup>[17]</sup>

---

# 三.参考

 - [Hackintosh黑苹果长期维护机型整理清单](https://blog.daliansky.net/Hackintosh-long-term-maintenance-model-checklist.html)

[1] 
- [时隔一年余，T530再装黑苹果，基本完美](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1662532&highlight=T530)
- [[WorkInProgress] ThinkPad T530 - El Captain](https://www.tonymacx86.com/threads/workinprogress-thinkpad-t530-el-captain.176687/)

[2] [NVS5400不能驱动，放弃了独显](https://xratzh.com/2017/12/26/T430安装折腾macOS/)

[3] [T530 白名单解决方案！！！](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1590994&highlight=T530)

[4] [关于黑苹果下修正ThinkPad小红点飘移的探讨](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1794564&highlight=%B9%D8%D3%DA%BA%DA%C6%BB%B9%FB%CF%C2%D0%DE%D5%FDThinkPad%D0%A1%BA%EC%B5%E3%C6%AE%D2%C6%B5%C4%CC%BD%CC%D6)

[5] [黑果小兵](https://blog.daliansky.net)

[6] [Len’S DMG](http://bbs.pcbeta.com/search.php?mod=forum&searchid=3518&orderby=lastpost&ascdesc=desc&searchsubmit=yes&kw=Len) 
   
[7]
- [相同机型的EFI](http://bbs.pcbeta.com/viewthread-1795904-1-1.html)
- [黑果小兵 EFI](https://github.com/daliansky/Hackintosh))


[8]
- [guide-patching-laptop-dsdt-ssdts](http://www.tonymacx86.com/threads/guide-patching-laptop-dsdt-ssdts.152573/)
- [使用补丁修改DSDT/SSDT [DSDT/SSDT综合教程]](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1571455)

[9] 
* [Rehabman MaciASL](https://bitbucket.org/RehabMan/)		
	[Acidanthera MaciASL](https://github.com/acidanthera/MaciASL/releases)
* [修改DSDT实现电量显示方法【转载】](https://blog.daliansky.net/Modify-DSDT-to-achieve-power-display-method.html)
* [ThinkPad T530等型号电池显示补丁](https://github.com/RehabMan/Laptop-DSDT-Patch/blob/master/battery/battery_Lenovo-X220.txt)  
* [Laptop-DSDT-Patch/battery/](https://github.com/RehabMan/Laptop-DSDT-Patch/tree/master/battery)

* [T530-OSX](https://bitbucket.org/tpmac/t530-osx/src/master/)

[10] 变频：
* [ssdtPRGen.sh提取制作SSDT](http://bbs.pcbeta.com/viewthread-1612058-1-7.html)     
* [ssdtPRGen.sh的简单标准的用法](http://bbs.pcbeta.com/viewthread-1720374-1-2.html) 

[11] [AppleALC](https://github.com/acidanthera/AppleALC/releases)

[12] [AppleALC支持的Codecs列表及AppleALC的使用](https://blog.daliansky.net/AppleALC-Supported-codecs.html)

[13][VoodooPS2Controller](https://bitbucket.org/RehabMan/os-x-voodoo-ps2-controller/downloads/)

[14] [ThinkPad W520 SD卡读卡器驱动 VoodooSDHC.kext分享](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1259442&highlight=VoodooSDHC.kext)

[15] [白名单](http://bbs.pcbeta.com/search.php?mod=forum&searchid=700&orderby=lastpost&ascdesc=desc&searchsubmit=yes&kw=%B0%D7%C3%FB%B5%A5)
 
[16] 
- [Hackintool(原Intel FB-Patcher)使用教程及插入姿势](https://blog.daliansky.net/Intel-FB-Patcher-tutorial-and-insertion-pose.html)
- [FakePCIID.kext + FakePCIID_XHCIMux.kext等](https://bitbucket.org/RehabMan/os-x-fake-pci-id/downloads/)

[17] 
- [RehabMan hotpatch](https://github.com/RehabMan/OS-X-Clover-Laptop-Config/tree/master/hotpatch)
- [黑果小兵 hotpatch](https://blog.daliansky.net/macOS-Mojave-10.14.6-18G87-Release-version-with-Clover-5033-original-image.html)
- [hotpatch详解](https://blog.daliansky.net/hotpatch-detailed-solution.html)
- [祝贺远景开放，开启完美黑苹果新天地！(抛弃传统DSDT方法，完美黑苹果）](http://bbs.pcbeta.com/viewthread-1741377-1-1.html)
- [【分享】我的 Hotpatch 学习笔记](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1733965&highlight=hotpatch)
- [Hotpatch简易教程（修复声卡、屏蔽独显、驱动核显、快捷键调节亮度）](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1766329)
- [[指南] hackintosh之hotpatch](https://www.kancloud.cn/chandler/mac_os/481699)
    
    注： Clover自带hex转换器
    

---

# 四．后记：

1. Codec提取了但教程还没看，感觉有点复杂，好在一切正常就懒得看了。
2. 参考引用都是带超链接的可以直接点开，没有链接说明编辑器有问题不是我有问题，后续远景如果能支持MarkDown语法编辑就更好了。
3. 远景编辑器很辣鸡！
 
---
⚠️
* BIOS固件建议不要升级，没能力也千万不要随意更改，否则容易出问题！
