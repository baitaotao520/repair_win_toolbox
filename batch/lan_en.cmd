:tl2
cls

echo.
echo.
echo.       ===================================================================================
echo.       =                                 网络工具                                        =
echo.       ===================================================================================
echo.       =                                                                                 =
echo.       =      1]   内部DNS清理                                                           =
echo.       =                                                                                 =
echo.       =      2]   DNS测试                                                               =
echo.       =                                                                                 =
echo.       =      3]   内部DNS选择器                                                         =
echo.       =                                                                                 =
echo.       =      4]   查看WiFi密码                                                          =
echo.       =                                                                                 =
echo.       =      0]   退出                                                                  =
echo.       =                                                                                 =
echo.       ===================================================================================
echo.                                    作者：白桃    咸鱼：软糖awa
echo.
echo.

set /p tool=选项 =   

if "%tool%" == "0" (
    cd "%~p0"
    cd..
    main_en.cmd
)
if "%tool%" == "1" (
    @REM 清理缓存可以解决缓存存储不良的问题，有时缓存中存储太多元素会减慢系统速度
    echo.
    echo.
    echo.
    POWERSHELL Get-DnsClientCache
    echo.
    echo.
    POWERSHELL Clear-DnsClientCache
    echo.
    echo.
    pause
    goto tl2
)
if "%tool%" == "2" (
    @REM ping不同的DNS点可以看到哪个有更少的延迟和数据丢失，以便以后自动分配
    echo.
    echo Google DNS
    ping 8.8.8.8
    echo.
    ping 8.8.4.4
    echo.
    echo.
    echo CloudFire DNS
    ping 1.1.1.1
    echo.
    ping 1.0.0.1
    echo.
    echo.
    echo Open DNS
    ping 208.67.222.222
    echo.
    ping 208.67.220.220
    echo.
    echo.
    pause
    goto tl2
)
if "%tool%" == "3" (
    @REM 指示并分配最快的dns给你的连接，并在你的网络端口中配置它们
    echo.
    echo.
    echo.
    netsh interface show interface
    echo.
    echo.
    set /p Red= 指定要应用DNS更改的接口名称 =   
    echo.
    echo.
    set /p DNS1= 指定你想应用的最快DNS =   
    echo.
    echo.
    set /p DNS2= 指定你想应用的第二快DNS =   
    echo.
    echo.
    @REM netsh是用于管理计算机网络的命令包
    netsh interface ipv4 set dnsservers "%Red%" static "%DNS1%" primary
    netsh interface ipv4 add dnsservers "%Red%" "%DNS2%" index=2
    echo.
    echo 完成！
    echo.
    pause
    goto tl2
)
if "%tool%" == "4" (
    goto axw
    :vlt
    echo.
    echo 完成！
    echo.
    pause
    goto tl2
)
else (
    goto tl2
)
@REM 它被从容器中分离出来，因为在那里没有执行变量的创建
:axw
netsh wlan show profile
echo.
set /p wifi= Wifi = 
echo.
pause
echo.
@REM 显示存储密码的网络配置文件列表
netsh wlan show profile name="%wifi%" key=clear
pause
goto vlt
