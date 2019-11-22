`2019.11.15`
## CLOVER
- 因为以前的补丁失效，故决定推倒重来--重新制作基于OC-little的hotpatch，不再采用DSDT-SSDT直接更改的方法（类似`从10.15 Beta4 的时候大批翻车就是因为这个PNP0C09 名称不是 EC` 这样的问题存在是主要原因）
> @宪武：当时OC已经有了，P-little是clover用的，也是向OC过度的最后一个版本，同时也是验证仿冒EC适用性。现在你应该用[OC-little](https://github.com/daliansky/OC-little)，，OC-little面向笔记本，适用于clover，OC

- 直接使用Len `config笔记本核显hd4000高分屏.plist`并在此基础上打补丁并更改完善
- [x] HD4000核显默认正常驱动
- [x] 声音：VoodooHDA正常，AppleALC异常（据说普遍出问题），暂时用VoodooHDA
- [x] 亮度调节：使用`SSDT-PNLF-SNB_IVY`已正常（或WhateverGreen.kext 内置亮度驱动 `applbkl =1` + `config勾选补丁` 亮度可更亮）
- [x] 触摸板：正常（更换virtualsmc.kext后正常了很神奇）
- [x] 小红点：正常
- [x] 电池显示：使用[ `ACPIBatteryManager.kext` ](https://bitbucket.org/RehabMan/os-x-acpi-battery-driver/downloads/)正常
- [x] 合盖息屏：正常
- [x] 自动息屏后亮屏：正常，点击键盘等正常亮屏
- [x] 睡眠：正常
- [x] WIFI：`BCM94322H8ML` 在`Mojave`及以下版本正常，在`Catalina`下异常;自带Intel无解
- [x] 读卡器：正常（用hackintool查看硬件ID并参考[W520](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1259442&highlight=VoodooSDHC.kext)，或改为[`0xE8231180`](https://github.com/lvs1974/VoodooSDHCMod/releases)）
- [x] USB：正常（背后一个USB2.0的口不识别是异常的）
- [x] 摄像头：正常

⚠️使用前请删除启动参数`-v`，最好机型重新生成一下以免和我的三码冲突

- 以下是EFI基本结构：

| - BOOT

    | - BOOTX64.efi

| - CLOVER

    | - CLOVERX64.efi

    | - config.plist

    | - ACPI

        | - origin  //原始ACPI表，CLOVER引导界面按F4可提取

        | - patched //根据原始ACPI打的补丁，参考OC-little

            | - SSDT-BKeyQ14Q15-TP-LPC  //17-亮度快捷键补丁

            | - SSDT-EXP1.SLOT-disbale  //22-禁止PCI设备

            | - SSDT-EXT3-LedReset-TP   //13-PTSWAK综合补丁和扩展补丁

            | - SSDT-FnF4_Q13-X1C5th    //14-PNP0C0E强制睡眠

            | - SSDT-HPET_RTC_TIMR-fix  //23-HPET_RTC_TIMR三合一补丁

            | - SSDT-MCHC   //09-添加丢失的部件

            | - SSDT-OCBAT0-TP_wtx20-60_e40-70_x1c1th-3th   //11-1-OC-Thinkpad电池补丁

            | - SSDT-PNLF-SNB_IVY   //05-OC-PNLF注入方法

            | - SSDT-PTSWAK //13-PTSWAK综合补丁和扩展补丁

            | - SSDT-PWRB   //09-添加丢失的部件

            | - SSDT-SMBU   //06-SBUS(SMBU)补丁

            | - SSDT-Thinkpad_Clickpad  //07-PS2键盘映射@OC-xlivans

    | - WINDOWS

    | - doc

    	| - 略

    | - drivers.backup

    	| - 略

    | - drivers64UEFI

        | - ApfsDriverLoader.efi  //APFS 文件系统引导驱动

        | - AptioMemoryFix.efi  //NVRAM 和内存驱动, 用于修复 UEFI 固件上的内存问题, 已与 OpenCore 合并为 FwRuntimeServices

        | - AudioDxe-64.efi  //用于在 Clover 启动时播放声音的 HDA 驱动, OpenCore 兼容性未知

        | - FSInject.efi  //Clover 用于注入内核驱动 (Kext) 的驱动, OpenCore 自带且使用更先进的方法

        | - HFSPlus.efi  //苹果自带的闭源 HFS 驱动, 不具有 Bless 和其它功能, 但是启动速度比它的等效驱动 VBoxHfs 快 3 倍

        | - VirtualSmc.efi  //VirtualSmc.kext配合使用的传感器驱动

    | - kexts

    	| - ACPIBatteryManager.kext  //电池相关驱动

    	| - FakePCIID.kext  //PCI硬件ID仿冒

    	| - HoRNDIS.kext  //USB连手机网络共享

    	| - IntelMausi.kext  //英特尔有线网卡 Acidanthera 分支

    	| - Lilu.kext  //SDK & Library

    	| - SMCProcessor.kext  //Acidanthera 的 SMC 和传感器驱动

    	| - SMCSuperIO.kext  //Acidanthera 的 SMC 和传感器驱动

    	| - USBInjectAll.kext  //USB相关驱动

    	| - VirtualSMC.kext  //Acidanthera 的 SMC 和传感器驱动

    	| - VoodooHDA.kext  //万能声卡驱动

    	| - VoodooPS2Controller.kext  //PS2 键盘/触摸板 驱动

    	| - VoodooSDHC.kext  //SDHC 读卡器驱动

    	| - WhateverGreen.kext  //显卡补丁驱动

    | - misc

    | - OEM

    | - ROM

    | - themes

    	｜ - 略

    | - tools

    	｜ - 略
    	

## OpenCore
- [ ] 待研究


---
### 重建缓存
```
sudo kextcache -i /
```

`2019.10.08`
- 我很不幸地告诉你：Catalina10.15正式版用以前的 DSDT或hotpatch方式 各种驱动仍然失效
    有成功驱动的请告诉我（有EFI更棒）

`2019.08.27` 
- 升级  `10.15beta`  遇到各种  `Bug`  ，由于笔记本不是主力机暂时停更等待2周后的正式版
- 如果你想正常使用请不要升级，保持 `10.14.6(18G84)及以下版本` 即可，配置没问题不要替换配置文件！

`2019.08.26`

- 重新制作config，原``Len`s DMG`` HD4000高分屏会卡NVRAM（五国）循环重启故弃用
- 用 hotpatch动态补丁 代替 DSDT-SSDT反编译静态补丁 
- [x] 核显驱动正常，applbkl=1   MacBookPro9,2    0x01660004
- [x] 声卡用的 `AppleALC` , 手动注入ID为40 ，正常
- [x] 睡眠基本正常
- [x] 亮度调节正常
- [x] 关机正常、重启正常
- [x] 摄像头正常

⚠️hotpatch名称并非  `白苹果` 标准名称，其实质为 `遮盖器` ，是为了和 `Hotpatch` 的 `Scope` 对应使用的 防止和你的原生ACPI部分混淆，`Replace` 和 `Hotpatch` 的 `Scope` 是对应的

Find | Replace | 备注
:-----------:| :-----------:| :-----------:
 `EHC1`       | `EH01`       |
`EHC2`        | `EH02`       |
`XHCI`        |`XHC`          |
~~`XHC1`~~|~~`XHC`~~ |DSDT无此参数
...|...|
    
- [ ] `TODO` 触控板不正常 -- 找不到触控板
- [ ] `TODO` 电池显示不正常 -- 不显示
- [ ] `TODO` WIFI不正常 -- 点不动

## hotpatch参考及致谢：
- [从技术角度谈谈10.11的USB驱动机制，兼论10.11 USB安装盘的花屏禁行问题](http://bbs.pcbeta.com/viewthread-1646768-1-1.html)
- [10.11 USB问题之下篇，一步一步教你解决USB问题](http://bbs.pcbeta.com/viewthread-1651615-1-1.html)
- [解决10.11 El Capitan USB 摄像头 蓝牙无法使用问题（自制遮盖器法）](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1647984)
- [黑果小兵daliansky/P-little](https://github.com/daliansky/P-little)

- [hotpatch详解](https://blog.daliansky.net/hotpatch-detailed-solution.html)

*  [hotpatch详解](https://www.jianshu.com/p/7e9c045eef6a)

*  [装完系统后的一件事，Clover Acpi hotpatch给机器打补丁。](http://bbs.pcbeta.com/viewthread-1802902-1-3.html)

- [祝贺远景开放，开启完美黑苹果新天地！(抛弃传统DSDT方法，完美黑苹果）](http://bbs.pcbeta.com/viewthread-1741377-1-1.html)

- [【分享】我的 Hotpatch 学习笔记](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1733965&highlight=hotpatch)

- [Hotpatch简易教程（修复声卡、屏蔽独显、驱动核显、快捷键调节亮度）](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1766329)

- [[指南] hackintosh之hotpatch](https://www.kancloud.cn/chandler/mac_os/481699)

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
4.
+ 触摸板驱动：ApplePS2SmartTouchPad.kext红点无法使用，所以使用默认的[VoodooPS2Controller](https://bitbucket.org/RehabMan/os-x-voodoo-ps2-controller/downloads/)<sup>[13]</sup>，仅Win和Alt键映射反了，其他正常（单击需要在系统偏好设置->鼠标 看看勾选没，起初没勾选还以为驱动有问题^-^|||）
* [Mojave折腾笔记本电脑触摸板驱动心得](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1805317&highlight=%B4%A5%C3%FE%B0%E5)

	- [x] 白苹果台式机和笔记本键位略有区别，以白苹果为准

5. SDHC卡槽驱动：[VoodooSDHC.kext](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1259442&highlight=VoodooSDHC.kext)<sup>[14]</sup>
	🐷没有通过内建，还在研究中。

	![title](https://i.loli.net/2019/07/26/5d3ab7a521f8b31691.png)

6. 无线网卡驱动：Intel无解，我用的烧录夹刷入BCM94322HM8L（免驱）[白名单](http://bbs.pcbeta.com/search.php?mod=forum&searchid=700&orderby=lastpost&ascdesc=desc&searchsubmit=yes&kw=%B0%D7%C3%FB%B5%A5)后都正常，没有动手能力的建议买USB无线网卡（最好免驱），否则使用有线<sup>[15]</sup>

7. 更新10.14.6后U盘插入显示“USB配件需要电源”无法识别，通过Hackintool定制USB已解决<sup>[16]</sup>

8. 正在研究`hotpatch`（动态补丁）方法以替代DSDT-SSDT反编译生成的静态补丁<sup>[17]</sup>

---

# 三.参考及致谢

 - [Hackintosh黑苹果长期维护机型整理清单](https://blog.daliansky.net/Hackintosh-long-term-maintenance-model-checklist.html)

[1] 
- [时隔一年余，T530再装黑苹果，基本完美](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1662532&highlight=T530)
- [[WorkInProgress] ThinkPad T530 - El Captain](https://www.tonymacx86.com/threads/workinprogress-thinkpad-t530-el-captain.176687/)

[2] [NVS5400不能驱动，放弃了独显](https://xratzh.com/2017/12/26/T430安装折腾macOS/)

[3] [T530 白名单解决方案！！！](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1590994&highlight=T530)

[4] 
*  [关于黑苹果下修正ThinkPad小红点飘移的探讨](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1794564&page=2#pid48732925)

*  [关于黑苹果下修正ThinkPad小红点飘移的探讨](http://bbs.pcbeta.com/viewthread-1794564-1-1.html)


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
* [充分运用MaciASL软件的补丁源－让黑苹果高手帮你完善DSDT](http://bbs.pcbeta.com/viewthread-1576959-1-1.html)

*  [[授权翻译] 使用补丁修改DSDT/SSDT [DSDT/SSDT综合教程]](http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1571455)

*  [联合DSDT和SSDT进行反编译——减少DSDT和SSDT错误的尝试](http://bbs.pcbeta.com/viewthread-1475332-1-1.html)

*  [对笔记本的 DSDT／SSDT 打补丁](https://blog.csdn.net/wr132/article/details/54798754)

*  [给笔记本的DSDT/SSDTs打补丁](https://www.kancloud.cn/chandler/mac_os/482278#ACPI_205)

* [修改DSDT实现电量显示方法【转载】](https://blog.daliansky.net/Modify-DSDT-to-achieve-power-display-method.html)
* [ThinkPad T530等型号电池显示补丁](https://github.com/RehabMan/Laptop-DSDT-Patch/blob/master/battery/battery_Lenovo-X220.txt)  
* [Laptop-DSDT-Patch/battery/](https://github.com/RehabMan/Laptop-DSDT-Patch/tree/master/battery)

* [T530-OSX](https://bitbucket.org/tpmac/t530-osx/src/master/)

[10] 变频：
*  [通过DSDT和SSDT成功实现变频的必要步骤［综合信息帖］](http://bbs.pcbeta.com/viewthread-1578829-1-1.html)

*  [ssdtPRGen.sh](https://github.com/Piker-Alpha/ssdtPRGen.sh)

* [ssdtPRGen.sh提取制作SSDT](http://bbs.pcbeta.com/viewthread-1612058-1-7.html)     
* [ssdtPRGen.sh的简单标准的用法](http://bbs.pcbeta.com/viewthread-1720374-1-2.html) 

*  [CPU-S轻松检测CPU信息和变频档位，还可生成变频SSDT](http://bbs.pcbeta.com/viewthread-1698338-1-1.html)


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
*  [hotpatch详解](https://www.jianshu.com/p/7e9c045eef6a)
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
