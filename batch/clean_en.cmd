:tll
cls

echo.
echo.
echo.       ===================================================================================
echo.       =                                 清理工具                                        =
echo.       ===================================================================================
echo.       =                                                                                 =
echo.       =      1]   系统清理                                                              =
echo.       =                                                                                 =
echo.       =      2]   清除事件查看器日志                                                    =
echo.       =                                                                                 =
echo.       =      3]   清理Windows Defender                                                  =
echo.       =                                                                                 =
echo.       =      4]   设置Windows Defender历史时间（默认30天）                             =
echo.       =                                                                                 =
echo.       =      5]   移除Windows（10和11）水印                                             =
echo.       =                                                                                 =
echo.       =      6]   清除最近文件列表                                                      =
echo.       =                                                                                 =
echo.       =      0]   退出                                                                  =
echo.       =                                                                                 =
echo.       ===================================================================================
echo.                                        作者：白桃    咸鱼：软糖awa
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
    @REM 安静地删除临时文件夹；包括本地和Windows的。同时运行内部窗口清理器，还清理DNS缓存。
    echo 在继续之前保存并关闭所有内容
    pause
    @REM 临时文件
    echo.
    del C:\Users\"%username%"\AppData\Local\Temp /f /s /q
    del C:\Users\"%username%"\AppData\Local\IconCache.db /f /s /q
    rd C:\Users\"%username%"\AppData\Local\Temp /s /q
    echo.
    del C:\Windows\Temp /f /s /q
    rd C:\Windows\Temp /s /q
    @REM DNS
    echo.
    CLEANMGR /D C:
    POWERSHELL Get-DnsClientCache
    POWERSHELL Clear-DnsClientCache
    @REM 回收站
    rd /s /q "%userprofile%"\RecycleBin
    echo.
    mkdir "%userprofile%"\RecycleBin
    pause
    goto tll
)
if "%tool%" == "2" (
    echo 清除事件查看器日志...
    @REM wevtutil是一套系统指令，允许你读取、修改和删除事件日志和帖子。
    @REM 使用"cl"清除所有事件日志（应用程序、安全、系统）
    wevtutil.exe cl Application
    wevtutil.exe cl Security
    wevtutil.exe cl System
    echo 事件查看器日志成功删除。
    pause
    goto tll
)
if "%tool%" == "2" (
    echo Clearing Event Viewer logs...
    @REM wevtutil is a set of system instructions that allow you to read, modify, and delete event logs and posts.
    @REM with "cl" clears all event logs (application, security, system)
    wevtutil.exe cl Application
    wevtutil.exe cl Security
    wevtutil.exe cl System
    echo Event Viewer logs successfully removed.
    pause
    goto tll
)
if "%tool%" == "3" (
    echo.
    @REM delete the content and service folder silently to clear the history of actions.
    cd C:\ProgramData\Microsoft\Windows Defender\Scans\History
    DEL Service /f /s /q
    RD Service /s /q
    MD Service
    pause
    goto tll
)
if "%tool%" == "4" (
    echo.
    echo "How much time should you define as a limit so that the history of Windows Defender is periodically deleted. Specify it in Days (ONLY WITH NUMBERS)"
    set /p time=
    echo. 
    echo.
    echo. you chose "%time%" Days!
    @REM runs a custom PowerShell command, setting the preference to scan items after the requested days in %time%
    POWERSHELL Set-MpPreference -ScanPurgeItemsAfterDelay "%time%"
    echo. Done!
    pause
    goto tll
)
if "%tool%" == "5" (
    @REM adds the registry key in currentVersion/Windows/ called "DisplayNotRet" with value 0. to tell Windows not to draw the version watermark on the screen.
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "DisplayNotRet" /t REG_DWORD /d "0" /f
    echo. For the changes to take effect, restart the computer
    echo. Done...
    pause
    goto tll
)
if "%tool%" == "6" (
    echo.
    @REM 删除RecentDocs键，以清除资源管理器中最近打开文件的列表
    REG DELETE "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f
    echo. 完成...
    pause
    goto tll
)
else (
    goto tll
)