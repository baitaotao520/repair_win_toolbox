:tl1
cls

echo.
echo.
echo.       ===================================================================================
echo.       =                                 WINDOWS ����                                     =
echo.       ===================================================================================
echo.       =                                                                                 =
echo.       =      1]   ϵͳ�ļ����                                                         =
echo.       =                                                                                 =
echo.       =      2]   �����޸��ļ�                                                       =
echo.       =                                                                                 =
echo.       =      3]   ϵͳ����ԭ                                                         =
echo.       =                                                                                 =
echo.       =      4]   ���������ϵ����ݽṹ                                                  =
echo.       =                                                                                 =
echo.       =      5]   ��MBR����ת��ΪGPT�������飩                                         =
echo.       =                                                                                 =
echo.       =      6]   ǿ��ϵͳ���£������飩                                               =
echo.       =                                                                                 =
echo.       =      7]   ��鲢Ӧ��ϵͳ����                                                    =
echo.       =                                                                                 =
echo.       =      0]   �˳�                                                                  =
echo.       =                                                                                 =
echo.       ===================================================================================
echo.                                    ���ߣ�����    ���㣺����awa
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
    echo ��Ҫ�������������ڼ���֮ǰ������������
    pause
    shutdown /r
    pause>NUL
    exit
)
if "%tool%" == "5" (
    cls
    echo.
    echo.   ����...
    echo "�ù������Ϊ��WindowsԤ��װ������Windows PE��������ʾ�������У���Ҳ���ԴӲ���ϵͳ��OS�������С�"
    echo.   ��Ҫ...
    echo. �ڳ���ת��������֮ǰ����ȷ���豸֧��UEFI��
    echo.
    echo. ������ת��ΪGPT������ʽ�󣬱������ù̼�����UEFIģʽ������
    set /p confirm="���Ƿ�Ҫ�������������𣩣� [1-����; 0-�˳�]"
    if "%confirm%" == "1" goto 5op4a 
    if not "%confirm%" == "1" goto salir
    :5op4a
    POWERSHELL DiskPart /s dp.cmd
    cd C:\Windows\System32
    echo.
    set /p disk=ָ��Ҫת��Ϊ��GPT�Ĵ��̺�   
    @REM ���ȣ���֤��ѡ�����Ƿ��ʺ�ת����
    mbr2gpt /validate /disk:"%disk%" /allowFullOS
    echo.
    set /p valid="ֻ�У��������û��ʧ�ܡ����� [1-����; 0-�˳�]��"
    if "%valid%" == "1" goto 5op4b
    if not "%valid%" == "1" goto salir
    :5op4b
    @REM ����ɹ�������ת��ΪGPT��ʹ��fullOs����
    mbr2gpt /convert /disk:"%disk%" /allowFullOS
    echo.
    echo. ����...
    echo. ����BIOS������SecureBoot
    shutdown /r /t 60
    exit
)
if "%tool%" == "6" (
    echo.
    echo ���������͸��¡�
    @REM ����(/detectnow)��ǿ��ϵͳ����(/updatenow)
    wuauclt /detectnow /updatenow
    echo. �˹����ں�̨���У��������Ļ������ٶȿ�����ҪһЩʱ�䡣
    pause
    echo.
    goto tl1
)
if "%tool%" == "7" (
    echo ������Ƭ����������...
    defrag C: /U /V
    pause
    echo.
    goto tl1
)
else (
    goto tl1
)
