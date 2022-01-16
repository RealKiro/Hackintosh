# 1. Devices of Mine
- NoteBook：
	- [ThinkPad T530（目前拿来做NAS）](https://github.com/5T33Z0/Lenovo-T530-Hackintosh-OpenCore)
	- [RedMiBook16（目前主力）](https://github.com/XingKong746/RedmiBook16-Hackintosh)
	
- Desktop:
	- [AsRock B360M-HDV (矿卡已废,吃灰中)](https://github.com/RealKiro/Hackintosh)
	- [MSI Z370-A Pro（目前主力，凑合用）](https://github.com/FrostMiKu/msi-z370-hackintosh)
		- CPU : i5-8400 UHD630

# 2. Start
- [【黑果小兵】BIOS设置选项列表](https://blog.daliansky.net/macOS-Monterey-12.1-21C52-Release-version-with-OC-0.7.6-CLOVER-5143-and-FirPE-original-image.html#BIOS设置选项列表)
- Boot of System：
	- PE：change guidence priority（EasyUEFI useless）
		> Select 1 any in 3 below
		- [杏雨梨云PE杏雨梨云启动维护系统2022壬寅版](https://www.423down.com/7066.html)
		- [无垠PE启动维护系统办公维护版2022年元旦版](https://www.423down.com/13059.html)
		- [微PE工具箱合盘v2.2/2.1/1.2_原汁原味收藏版](https://www.423down.com/12632.html)

- System Mirror：	
	- [Microsoft Windows Mirror](https://next.itellyou.cn/) : avoid System damage 

	- [macOS Monterey 12.1 21C52 双EFI分区 Mirror](https://hongesttechnology-my.sharepoint.cn/:u:/g/personal/daliansky_hongesttechnology_partner_onmschina_cn1/EaWazjsAFhVAp7NqOEs_My0BvY3xpc4OPqRzWi2uQRjeYQ?e=i1XB6v) from 黑果小兵
	
- Boot Tools
	- [BalenaEtcher](https://etcher.io/) -- Flash Tool
		> Flash OS images to SD cards & USB drives, safely and easily.

	- OpenCore/Clover Configurator
		> 装好系统后建议用它来改`三码`激活FaceTime通话等
		- [OpenCore Configurator中文](http://bbs.pcbeta.com/viewthread-1838814-1-1.html)
		- [OpenCore Configurator](https://mackie100projects.altervista.org/download/occ/)
		- [Clover Configurator](https://mackie100projects.altervista.org/download/clover-configurator-global-edition/)
	
- EFI（略）
	> 根据自己的机型找对应的EFI替换，否则需要自己研究如何定做适合自己的OpenCore或Clover引导。	

- OpenCore Structure
```markdown
- EFI
    - BOOT                          如果不想删掉原Windows的Boot可将此文件夹改名
        - BOOTx64.efi               OpenCore引导文件，可使用EasyUEFI或进PE模式添加并设置为除外设外的第一启动项
    - OC
        - ACPI
            - SSDT-*.aml            相关热补丁，针对机型出现的一些问题可通过注入hot patch来解决
        - config.plist              配置文件，可使用OpenCore Configurator修改，注意要和添加的文件一一对应，不知道功能不要随意添加
        - Drivers
            - AudioDxe.efi          开机UEFI界面若需要声音效果需要加载。
            - CrScreenshotDxe.efi   开机UEFI的截图工具。
            - HiiDatabase.efi       用于给 Ivy Bridge (3 代酷睿) 或更老代主板上支持 UEFI 字体渲染, UEFI Shell 中文字渲染异常时使用, 新主板不需要。
            - NvmExpressDxe.efi     用于在 Haswell (4 代酷睿) 或更老的主板上支持 NVMe 硬盘, 新主板不需要。
            - OpenCanopy.efi        加载第三方开机主题。
            - OpenHfsPlus.efi       作用同HfsPlus.efi，OC默认附带的开源驱动
            - OpenRuntime.efi       内存寻址补丁（必须）
            - OpenUsbKbDxe.efi      给使用模拟 UEFI 的老主板在 OpenCore 界面正常输入用的, 请勿在 Ivy Bridge (3 代酷睿)及以上的主板上使用。
            - Ps2KeyboardDxe.efi    PS2键盘所需插件。
            - Ps2MouseDxe.efi       PS2鼠标所需插件。
            - UsbMouseDxe.efi       当MacOS被安装在虚拟机上所需要的鼠标插件。
            - XhciDxe.efi           用于在 Sandy Bridge（2代）及之前或更老的主板上加载XHCI控制器。
            - HfsPlus.efi           用于HFS格式文件系统，苹果闭源驱动（必须）
        - Kexts
            - Lilu.kext             驱动必备SDK
            - AppleALC.kext         声卡驱动
            - ACPIBatteryManager.kext 笔记本电池管理驱动
            - AirportItlwm.kext     英特尔WiFi适配器内核扩展
            - BlueToolFixup.kext    用于临时解决 macOS 12.0 Monterey 上各类蓝牙失效的问题（Monterey必须）
            - BrightnessKeys.kext   屏幕亮度快捷驱动
            - CpuTscSync.kext       用于解决部分休眠唤醒后的内核崩溃与CPU睡死问题的驱动补丁
            - CtlnaAHCIPort.kext    原AppleAHCIPort.kext ， 硬盘驱动
            - IntelBluetoothFirmware.kext  用于加载Intel蓝牙固件驱动（Monterey必须）
            - IntelBluetoothInjector.kext  用于Intel蓝牙注入驱动（Monterey必须）
            - NullEthernet.kext     内建虚拟有线网卡驱动
            - RealtekRTL8111.kext   RealtekRTL8111/8168 B/C/D/E/F/G/H等网卡驱动
            - SidecarEnabler.kext   用于解锁夜览、隔空投送等，不再维护（2021/10/06）
            - FeatureUnlock.kext    SidecarEnabler.kext替代品
            - SMCProcessor.kext     CPU核传感器
            - SMCSuperIO.kext       IO传感器       
            - VirtualSMC.kext       传感器驱动依赖  
            - WhateverGreen.kext    显卡驱动
            - IntelMausi.kext       Intel类千兆网卡驱动（带RJ45 LAN网口机器使用）
            - USBInjectAll.kext     USB驱动 （可用Hackintool定制自己的USB补丁）   
            - VoodooI2C.kext        Intel I2C控制器核心驱动
            - VoodooI2CHID.kext     Intel I2C-HID设备的触控板&触摸屏驱动
            - VoodooPS2Controller.kext    键盘驱动
            - XHCI-Injector.kext    主板驱动
        - OpenCore.efi              OpenCore引导文件
        + Resources                 资源相关目录，如主题、字体、声音等
        + Microsoft                 原Windows系统引导文件，双系统需保留

```
	
	
# 3. The Community
- [黑果小兵的部落阁](https://blog.daliansky.net/)
- [PCBeta远景论坛](https://bbs.pcbeta.com/)
- [GitHub](https://github.com/)
- [olarila.com](https://www.olarila.com/)
- [insanelymac.com](https://www.insanelymac.com/)
- [tonymacx86.com](https://www.tonymacx86.com/)
- Telegram：
	- [黑苹果osx86项目中文讨论/Hackintosh CHN Discussion](https://t.me/osx86zh)
	- [黑果小兵的部落阁 #安装问题讨论](https://t.me/macos_installer)
	- [Hackintosh Tech.](https://t.me/HackintoshTech)
- **QQ频道**：
	- [黑苹果Hachintosh｜路由器Router](https://qun.qq.com/qqweb/qunpro/share?_wv=3&_wwv=128&inviteCode=1D3zju&from=246610&biz=ka)

# 4. References
- [【黑果小兵】Hackintosh黑苹果长期维护机型整理清单](https://blog.daliansky.net/Hackintosh-long-term-maintenance-model-checklist.html)
- [olarila EFI](https://www.olarila.com/files)
- [【黑果小兵】新手入门教程](https://blog.daliansky.net/macOS-Monterey-12.1-21C52-Release-version-with-OC-0.7.6-CLOVER-5143-and-FirPE-original-image.html#新手入门教程)
- [【Xjn´s Blog】使用 OpenCore 引导黑苹果](https://blog.xjn819.com/post/opencore-guide.html)
- [Getting-Started-With-OpenCore](https://insanelymacdiscord.github.io/Getting-Started-With-OpenCore/)
- [OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide/)
- [OpenCore Drivers & Kexts Guide](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#firmware-drivers)
- [OpenCore 0.5+ 部件补丁](https://github.com/daliansky/OC-little)
- [iASL](https://acpica.org/downloads) -- DSDT-SSDT Hot Patch打补丁编译器
---
- [[GUIDE] HACKINTOSHING ON A MSI Z370-A PRO MOTHERBOARD](https://hackintosher.com/builds/guide-hackintoshing-msi-z370-pro/)
- [GitHub Z370-A](https://github.com/search?o=desc&q=Z370-A&s=updated&type=Repositories)
