:tll
cls

echo.
echo.
echo.       ===================================================================================
echo.       =                                 ������                                        =
echo.       ===================================================================================
echo.       =                                                                                 =
echo.       =      1]   ϵͳ����                                                              =
echo.       =                                                                                 =
echo.       =      2]   ����¼��鿴����־                                                    =
echo.       =                                                                                 =
echo.       =      3]   ����Windows Defender                                                  =
echo.       =                                                                                 =
echo.       =      4]   ����Windows Defender��ʷʱ�䣨Ĭ��30�죩                             =
echo.       =                                                                                 =
echo.       =      5]   �Ƴ�Windows��10��11��ˮӡ                                             =
echo.       =                                                                                 =
echo.       =      6]   �������ļ��б�                                                      =
echo.       =                                                                                 =
echo.       =      0]   �˳�                                                                  =
echo.       =                                                                                 =
echo.       ===================================================================================
echo.                                        ���ߣ�����    ���㣺����awa
echo.
echo.

set /p tool=ѡ�� =   

if "%tool%" == "0" (
    cd "%~p0"
    cd..
    main_en.cmd
)
if "%tool%" == "1" (
    echo.
    @REM ������ɾ����ʱ�ļ��У��������غ�Windows�ġ�ͬʱ�����ڲ�������������������DNS���档
    echo �ڼ���֮ǰ���沢�ر���������
    pause
    @REM ��ʱ�ļ�
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
    @REM ����վ
    rd /s /q "%userprofile%"\RecycleBin
    echo.
    mkdir "%userprofile%"\RecycleBin
    pause
    goto tll
)
if "%tool%" == "2" (
    echo ����¼��鿴����־...
    @REM wevtutil��һ��ϵͳָ��������ȡ���޸ĺ�ɾ���¼���־�����ӡ�
    @REM ʹ��"cl"��������¼���־��Ӧ�ó��򡢰�ȫ��ϵͳ��
    wevtutil.exe cl Application
    wevtutil.exe cl Security
    wevtutil.exe cl System
    echo �¼��鿴����־�ɹ�ɾ����
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
    @REM ɾ��RecentDocs�����������Դ��������������ļ����б�
    REG DELETE "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f
    echo. ���...
    pause
    goto tll
)
else (
    goto tll
)