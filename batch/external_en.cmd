:tl5
cls

echo.
echo.
echo.       ===================================================================================
echo.       =                        外部程序工具                                             =
echo.       ===================================================================================
echo.       =                                                                                 =
echo.       =      1]   打开硬件监视器                                                        =
echo.       =                                                                                 =
echo.       =      2]   AutoRuns                                                              =
echo.       =                                                                                 =
echo.       =      3]   进程资源管理器                                                        =
echo.       =                                                                                 =
echo.       =      0]   退出                                                                  =
echo.       =                                                                                 =
echo.       ===================================================================================
echo.       警告：    这些程序均非作者所拥有。
echo.                       它们是从官方来源在互联网上收集的开源软件。
echo.                           使用风险自负。
echo.
echo.

set /p tool=选项 =   

if "%tool%" == "0" (
    cd "%~p0"
    cd..
    main_en.cmd
)
if "%tool%" == "1" (
    @REM 检查程序目录中是否已存在这些文件，以避免重复下载
    if not exist "tools\OpenHardwareMonitor" (
        @REM 如果不存在，通过powershell发起网络请求，获取.zip扩展包，解压到目录文件夹以便管理
        POWERSHELL Invoke-WebRequest -Uri "https://openhardwaremonitor.org/files/openhardwaremonitor-v0.9.6.zip" -OutFile "ohm.zip"
        timeout 5
        @REM Expand-Archive允许操作带.zip扩展名的压缩文件
        POWERSHELL Expand-Archive -Path ohm.zip
        CD ohm
        MOVE "OpenHardwareMonitor" "%~p0\tools"
        cd..
        RMDIR /S /Q ohm
        DEL ohm.zip
    )
    cd "tools\OpenHardwareMonitor"
    start OpenHardwareMonitor.exe
    echo.
    echo.
    echo 完成
    cd..
    cd..
    goto tl5
)
if "%tool%" == "2" (
    if not exist "tools\Autoruns" (
        POWERSHELL Invoke-WebRequest -Uri "https://download.sysinternals.com/files/Autoruns.zip" -OutFile "Autoruns.zip"
        timeout 5
        POWERSHELL Expand-Archive -Path Autoruns.zip
        MOVE "Autoruns" "tools"
        DEL Autoruns.zip
    )
    cd "tools\Autoruns"
    start Autoruns64.exe
    echo.
    echo.
    echo 完成
    cd..
    cd..
    goto tl5
)
if "%tool%" == "3" (
    if not exist "tools\ProcessExplorer" (
        POWERSHELL Invoke-WebRequest -Uri "https://download.sysinternals.com/files/ProcessExplorer.zip" -OutFile "ProcessExplorer.zip"
        timeout 5
        POWERSHELL Expand-Archive -Path ProcessExplorer.zip
        MOVE "ProcessExplorer" "tools"
        DEL ProcessExplorer.zip
    )
    cd "tools\ProcessExplorer"
    start procexp64.exe
    echo.
    echo.
    echo 完成
    cd..
    cd..
    goto tl5
)
else (
    goto tl5
)
