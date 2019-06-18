
![title](https://i.imgur.com/w142YXM.jpg)
- 华擎B360M-HDV 
- Intel Core i5-8400
- AMD Radeon R9 270X


1.基于[Len'DMG](http://bbs.pcbeta.com/search.php?mod=forum&searchid=3518&orderby=lastpost&ascdesc=desc&searchsubmit=yes&kw=Len)制作，config直接使用++config八代台式机核显hd630(需设置核显显存大于64M).plist++ （初次能直接进系统)，未做多大改动；
 - EFI不是万能药，需要自己根据自己的配置作修改
 - 同Windows一样，系统装好后不能直接食用，需配置适合自己的驱动（一般是 显卡+声卡）
 - 驱动文件位于
 >EFI
 >>kext
 >>>other
 
 - 隐藏多余引导项：
	- preboot
	- recovery
	
2.主板声卡为ALC887，根据https://blog.daliansky.net/AppleALC-Supported-codecs.html查阅节点一个一个的试出来：1~7外放有声音但前端插入耳机没声音，所以目前选取inject11声音基本全部正常；



3.无法关机(会重启系统)的解决办法参考了http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1804882&highlight=%B9%D8%BB%FA，已正常关机；


4.图片预览打不开？在BIOS高级选项里面开启IGPU后正常（核显加速？）；


5.笔记本显示屏改装为副屏，双显示器无法同时开启，否则开机要么副屏不是花屏就是绿屏，要么副屏息屏而主屏画面变蓝显示器识别为副屏（主DP 副HDMI；
解决办法：不需要插拔线，每次开机把主屏关机等进系统后再把主屏打开双屏就都正常了。


综上，经轻度体验后感觉基本完美
感谢各位！
