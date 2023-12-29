:tl7
cls

echo.
echo.
echo.       ===================================================================================
echo.       =                               快捷方式                                          =
echo.       ===================================================================================
echo.       =                                                                                 =
echo.       =      1]   关于Windows                                                           =
echo.       =                                                                                 =
echo.       =      2]   更改UAC设置                                                           =
echo.       =                                                                                 =
echo.       =      3]   安全与维护                                                            =
echo.       =                                                                                 =
echo.       =      4]   Windows故障排除                                                       =
echo.       =                                                                                 =
echo.       =      5]   计算机管理                                                            =
echo.       =                                                                                 =
echo.       =      6]   系统信息                                                              =
echo.       =                                                                                 =
echo.       =      7]   事件查看器                                                            =
echo.       =                                                                                 =
echo.       =      8]   程序                                                                  =
echo.       =                                                                                 =
echo.       =      9]   系统属性                                                              =
echo.       =                                                                                 =
echo.       =     10]   互联网选项                                                            =
echo.       =                                                                                 =
echo.       =     11]   互联网协议配置                                                        =
echo.       =                                                                                 =
echo.       =     12]   性能监视器                                                            =
echo.       =                                                                                 =
echo.       =     13]   资源监视器                                                            =
echo.       =                                                                                 =
echo.       =     14]   任务管理器                                                            =
echo.       =                                                                                 =
echo.       =     15]   注册表编辑器                                                          =
echo.       =                                                                                 =
echo.       =     16]   系统还原                                                              =
echo.       =                                                                                 =
echo.       =     17]   系统配置                                                              =
echo.       =                                                                                 =
echo.       =     18]   DirectX诊断工具                                                      =
echo.       =                                                                                 =
echo.       =     19]   微软恶意软件移除工具                                                  =
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
    winver
    pause
    echo.
    goto tl7
)
if "%tool%" == "2" (
    UserAccountControlSettings
    pause
    echo.
    goto tl7
)
if "%tool%" == "3" (
    C:\WINDOWS\System32\wscui.cpl
    pause
    echo.
    goto tl7
)
if "%tool%" == "4" (
    C:\WINDOWS\System32\control.exe /name Microsoft.Troubleshooting
    pause
    echo.
    goto tl7
)
if "%tool%" == "5" (
    compmgmt
    pause
    echo.
    goto tl7
)
if "%tool%" == "6" (
    msinfo32
    pause
    echo.
    goto tl7
)
if "%tool%" == "7" (
    eventvwr
    pause
    echo.
    goto tl7
)
if "%tool%" == "8" (
    C:\WINDOWS\System32\appwiz.cpl
    pause
    echo.
    goto tl7
)
if "%tool%" == "9" (
    C:\WINDOWS\System32\control.exe system
    pause
    echo.
    goto tl7
)
if "%tool%" == "10" (
    C:\WINDOWS\System32\inetcpl.cpl
    pause
    echo.
    goto tl7
)
if "%tool%" == "11" (
    ipconfig
    pause
    echo.
    goto tl7
)
if "%tool%" == "12" (
    perfmon
    pause
    echo.
    goto tl7
)
if "%tool%" == "13" (
    resmon
    pause
    echo.
    goto tl7
)
if "%tool%" == "14" (
    C:\WINDOWS\System32\taskmgr.exe /7
    pause
    echo.
    goto tl7
)
if "%tool%" == "15" (
    regedt32
    pause
    echo.
    goto tl7
)
if "%tool%" == "16" (
    rstrui
    pause
    echo.
    goto tl7
)
if "%tool%" == "17" (
    msconfig
    pause
    echo.
    goto tl7
)
if "%tool%" == "18" (
    dxdiag
    pause
    echo.
    goto tl7
)
if "%tool%" == "19" (
    mrt
    pause
    echo.
    goto tl7
)
else (
    goto tl7
)