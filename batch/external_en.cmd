:tl5
cls

echo.
echo.
echo.       ===================================================================================
echo.       =                        �ⲿ���򹤾�                                             =
echo.       ===================================================================================
echo.       =                                                                                 =
echo.       =      1]   ��Ӳ��������                                                        =
echo.       =                                                                                 =
echo.       =      2]   AutoRuns                                                              =
echo.       =                                                                                 =
echo.       =      3]   ������Դ������                                                        =
echo.       =                                                                                 =
echo.       =      0]   �˳�                                                                  =
echo.       =                                                                                 =
echo.       ===================================================================================
echo.       ���棺    ��Щ�������������ӵ�С�
echo.                       �����Ǵӹٷ���Դ�ڻ��������ռ��Ŀ�Դ�����
echo.                           ʹ�÷����Ը���
echo.
echo.

set /p tool=ѡ�� =   

if "%tool%" == "0" (
    cd "%~p0"
    cd..
    main_en.cmd
)
if "%tool%" == "1" (
    @REM ������Ŀ¼���Ƿ��Ѵ�����Щ�ļ����Ա����ظ�����
    if not exist "tools\OpenHardwareMonitor" (
        @REM ��������ڣ�ͨ��powershell�����������󣬻�ȡ.zip��չ������ѹ��Ŀ¼�ļ����Ա����
        POWERSHELL Invoke-WebRequest -Uri "https://openhardwaremonitor.org/files/openhardwaremonitor-v0.9.6.zip" -OutFile "ohm.zip"
        timeout 5
        @REM Expand-Archive���������.zip��չ����ѹ���ļ�
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
    echo ���
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
    echo ���
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
    echo ���
    cd..
    cd..
    goto tl5
)
else (
    goto tl5
)
