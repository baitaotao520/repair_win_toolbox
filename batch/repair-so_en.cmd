:tl1
cls

echo.
echo.
echo.       ===================================================================================
echo.       =                                 WINDOWS 工具                                     =
echo.       ===================================================================================
echo.       =                                                                                 =
echo.       =      1]   系统文件检查                                                         =
echo.       =                                                                                 =
echo.       =      2]   检查和修复文件                                                       =
echo.       =                                                                                 =
echo.       =      3]   系统镜像还原                                                         =
echo.       =                                                                                 =
echo.       =      4]   分析磁盘上的数据结构                                                  =
echo.       =                                                                                 =
echo.       =      5]   将MBR磁盘转换为GPT（不建议）                                         =
echo.       =                                                                                 =
echo.       =      6]   强制系统更新（不建议）                                               =
echo.       =                                                                                 =
echo.       =      7]   检查并应用系统更新                                                    =
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
    echo.
    echo.
    echo.
    sfc /scannow
    echo.
    echo.
    pause
    echo.
    goto tl1
)
if "%tool%" == "2" (
    echo.
    echo.
    echo.
    DISM /Online /Cleanup-Image /CheckHealth
    echo.
    echo.
    DISM /Online /Cleanup-Image /ScanHealth
    echo.
    echo.
    pause
    echo.
    goto tl1
)
if "%tool%" == "3" (
    echo.
    echo.
    echo.
    DISM /Online /Cleanup-Image /StartComponentCleanup
    echo.
    echo.
    DISM /Online /Cleanup-Image /RestoreHealth
    echo.
    echo.
    pause
    echo.
    goto tl1
)
if "%tool%" == "4" (
    echo.
    echo.
    echo.
    chkdsk C: /F /R
    echo.
    echo 需要重新启动，请在继续之前保存所有内容
    pause
    shutdown /r
    pause>NUL
    exit
)
if "%tool%" == "5" (
    cls
    echo.
    echo.   警告...
    echo "该工具设计为从Windows预安装环境（Windows PE）命令提示符中运行，但也可以从操作系统（OS）中运行。"
    echo.   重要...
    echo. 在尝试转换驱动器之前，请确保设备支持UEFI。
    echo.
    echo. 将磁盘转换为GPT分区样式后，必须配置固件以以UEFI模式启动。
    set /p confirm="您是否要继续（由您负责）？ [1-继续; 0-退出]"
    if "%confirm%" == "1" goto 5op4a 
    if not "%confirm%" == "1" goto salir
    :5op4a
    POWERSHELL DiskPart /s dp.cmd
    cd C:\Windows\System32
    echo.
    set /p disk=指定要转换为非GPT的磁盘号   
    @REM 首先，验证所选磁盘是否适合转换。
    mbr2gpt /validate /disk:"%disk%" /allowFullOS
    echo.
    set /p valid="只有！如果过程没有失败。继续 [1-继续; 0-退出]："
    if "%valid%" == "1" goto 5op4b
    if not "%valid%" == "1" goto salir
    :5op4b
    @REM 如果成功将磁盘转换为GPT；使用fullOs变体
    mbr2gpt /convert /disk:"%disk%" /allowFullOS
    echo.
    echo. 重设...
    echo. 进入BIOS并启用SecureBoot
    shutdown /r /t 60
    exit
)
if "%tool%" == "6" (
    echo.
    echo 正在搜索和更新。
    @REM 查找(/detectnow)并强制系统更新(/updatenow)
    wuauclt /detectnow /updatenow
    echo. 此过程在后台运行，根据您的互联网速度可能需要一些时间。
    pause
    echo.
    goto tl1
)
if "%tool%" == "7" (
    echo 正在碎片整理驱动器...
    defrag C: /U /V
    pause
    echo.
    goto tl1
)
else (
    goto tl1
)
