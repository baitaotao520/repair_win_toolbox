:tl2
cls

echo.
echo.
echo.       ===================================================================================
echo.       =                                 ���繤��                                        =
echo.       ===================================================================================
echo.       =                                                                                 =
echo.       =      1]   �ڲ�DNS����                                                           =
echo.       =                                                                                 =
echo.       =      2]   DNS����                                                               =
echo.       =                                                                                 =
echo.       =      3]   �ڲ�DNSѡ����                                                         =
echo.       =                                                                                 =
echo.       =      4]   �鿴WiFi����                                                          =
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
    @REM ��������Խ������洢���������⣬��ʱ�����д洢̫��Ԫ�ػ����ϵͳ�ٶ�
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
    @REM ping��ͬ��DNS����Կ����ĸ��и��ٵ��ӳٺ����ݶ�ʧ���Ա��Ժ��Զ�����
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
    @REM ָʾ����������dns��������ӣ������������˿�����������
    echo.
    echo.
    echo.
    netsh interface show interface
    echo.
    echo.
    set /p Red= ָ��ҪӦ��DNS���ĵĽӿ����� =   
    echo.
    echo.
    set /p DNS1= ָ������Ӧ�õ����DNS =   
    echo.
    echo.
    set /p DNS2= ָ������Ӧ�õĵڶ���DNS =   
    echo.
    echo.
    @REM netsh�����ڹ�����������������
    netsh interface ipv4 set dnsservers "%Red%" static "%DNS1%" primary
    netsh interface ipv4 add dnsservers "%Red%" "%DNS2%" index=2
    echo.
    echo ��ɣ�
    echo.
    pause
    goto tl2
)
if "%tool%" == "4" (
    goto axw
    :vlt
    echo.
    echo ��ɣ�
    echo.
    pause
    goto tl2
)
else (
    goto tl2
)
@REM �����������з����������Ϊ������û��ִ�б����Ĵ���
:axw
netsh wlan show profile
echo.
set /p wifi= Wifi = 
echo.
pause
echo.
@REM ��ʾ�洢��������������ļ��б�
netsh wlan show profile name="%wifi%" key=clear
pause
goto vlt
