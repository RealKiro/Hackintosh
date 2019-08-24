# 如何使用：
1.  打开终端命令行界面：进入ssdtPRGen.sh所在的目录，执行： chmod +x ./ssdtPRGen.sh
2. 接着就要开始运行脚本开始工作了。以我的core-i5-3380M为例，首先你要看看你的CPU是不是在所支持的列表中。可以打开ssdtPRGen.sh脚本查看CPU列表。（当然我的是在支持列表中）
3.  你需要的相关参数：执行：./ssdtPRGen.sh -h就可以看到详细使用。

    以我的CPU为例。
    
    *ACPI表中我的CPU名称是CPU0，即就是：-a CPU0
    
    *ID 编号，我的是 Mac-94245B3640C91C81，即就是：-b Mac-94245B3640C91C81
    
    *CPU类型编号，0 = Sandy Bridge，1 = Ivy Bridge，2 = Haswell，3 = Broadwell
    
    我的是Sandy Bridge，即就是：-c 0
    *逻辑处理器个数，我的是2个，即就是:-l 2
    
    *机器型号，我的是MacBookPro8,1，即就是：-m MacBookPro8,1
    
    （如果你不知道自己该是什么型号，使用：./ssdtPRGen.sh -s可以给出一个合适的型号）
    
    *CPU型号，我的是i5-3380M，即就是：-p i5-3380M
    
    *最大频率，i5-3380M最大是3100Mhz，即就是：-turbo 3600
    
    *最大功率：-t 35
    
    所以最终要这样写：
```
./ssdtPRGen.sh -a CPU0 -b Mac-6F01561E16C75D06 -c 1 -l 2 -m MacBookPro9,2 -p 'i5-3380M' -turbo 3600 -t 35

```
复制代码到命令行回车
自己根据自己的情况变化着来
不出意外，就会在: ~/Library/ssdtPRGen 目录下生成 ssdt.aml 和 ssdt.dsl
最后参考ssdtPRGen总教程合并编译为aml放入patched目录
完工

---
参考：

- (ssdtPRGen.sh的简单标准的用法（另外纠正一个论坛一个普遍的错误的ssdtPRGen.sh用法）)[http://bbs.pcbeta.com/viewthread-1720374-1-1.html]

- (ssdtPRGen.sh提取制作SSDT)[http://bbs.pcbeta.com/viewthread-1612058-1-7.html]

