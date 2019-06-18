# 一．前言
![配置](https://i.imgur.com/mNrrsPx.png)

2012年的ThinkPad T530 <sup>[1]</sup> 笔记本，某宝2年前买的二手，现在Windows10+Mac双系统基本配置完成

![title](https://i.imgur.com/PHtV0hJ.png)

注意：
**善用搜索引擎，多多爬帖**
1. 独显NVS5400无解，只能驱动核显（DSDT方式成功驱动）[2]
2. 无线网卡默认为Intel，无解（由于联想、HP的BIOS有无线网卡白名单，不在白名单内的无线网卡型号只要用了就进不了任何系统引导，BIOS也进不了），建议使用USB无线网卡（有能力的可以根据其他教程刷白名单）^[3]^
3. ThinkPad小红点漂移太灵敏了，需要改^[4]^
-------------------------------------------------
 


# 二.指南

 

成功上MacOS Mojave10.14.4

1. 推荐镜像：黑果小兵   ^[5]^或   Len’S DMG ^[6]^
二者总有一个默认配置能进系统的，不能进说明你机子不是主流需要爬贴用相同机型的EFI^[7]^替换
 
4. DSDT-SSDT教程 ^[8]^：建议看视频操作
5. 可以驱动核显、亮度调节、电源管理、USB驱动等，不需要有编程基础
	* ThinkPad T530等型号电池显示补丁^[9] ^
	* 可以全部在DSDT里面打补丁
	* ssdtPRGen.sh提取制作SSDT     
	* ssdtPRGen.sh的简单标准的用法 ^[10]^
9. AppleALC原版^[11]^ 没修改过Codec，仅Audio注入^[12]^30，基本正常，可以自动识别并切换外放和耳机
10. 触摸板驱动：ApplePS2SmartTouchPad.kext红点无法使用，所以换了VoodooPS2Controller^[13]^，仅Win和Alt键映射反了，其他正常（单击需要在系统偏好设置->鼠标 看看勾选没，起初没勾选还以为驱动有问题^-^|||）
11. SDHC卡槽驱动：VoodooSDHC.kext^[14]^
12. 无线网卡驱动：Intel无解，我用的烧录夹刷入BCM94322HM8L（免驱）白名单后都正常，没有动手能力的建议买USB无线网卡（最好免驱），否则使用有线^[15]^

---

三.参考

 

[1]时隔一年余，T530再装黑苹果，基本完美
[2]NVS5400不能驱动，放弃了独显
[3]T530 白名单解决方案！！！
[4]关于黑苹果下修正ThinkPad小红点飘移的探讨
[5]黑果小兵  
[6]Len’S DMG     
[7]相同机型的EFI
[8]使用补丁修改DSDT/SSDT [DSDT/SSDT综合教程] 
[9]ThinkPad T530等型号电池显示补丁  Laptop-DSDT-Patch/battery/
[10]ssdtPRGen.sh提取制作SSDT     ssdtPRGen.sh的简单标准的用法 
[11]AppleALC
[12]AppleALC支持的Codecs列表及AppleALC的使用
[13]VoodooPS2Controller
[14]ThinkPad W520 SD卡读卡器驱动 VoodooSDHC.kext分享
[15]白名单
 
四．后记：

1.Codec提取了但教程还没看，感觉有点复杂
2.参考引用都是带超链接的可以直接点开，没有链接说明编辑器有问题不是我有问题，后续远景如果能支持MarkDown语法编辑就更好了
3.这次是完善修改格式
 