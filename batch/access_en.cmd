:tl7
cls

echo.
echo.
echo.       ===================================================================================
echo.       =                               ��ݷ�ʽ                                          =
echo.       ===================================================================================
echo.       =                                                                                 =
echo.       =      1]   ����Windows                                                           =
echo.       =                                                                                 =
echo.       =      2]   ����UAC����                                                           =
echo.       =                                                                                 =
echo.       =      3]   ��ȫ��ά��                                                            =
echo.       =                                                                                 =
echo.       =      4]   Windows�����ų�                                                       =
echo.       =                                                                                 =
echo.       =      5]   ���������                                                            =
echo.       =                                                                                 =
echo.       =      6]   ϵͳ��Ϣ                                                              =
echo.       =                                                                                 =
echo.       =      7]   �¼��鿴��                                                            =
echo.       =                                                                                 =
echo.       =      8]   ����                                                                  =
echo.       =                                                                                 =
echo.       =      9]   ϵͳ����                                                              =
echo.       =                                                                                 =
echo.       =     10]   ������ѡ��                                                            =
echo.       =                                                                                 =
echo.       =     11]   ������Э������                                                        =
echo.       =                                                                                 =
echo.       =     12]   ���ܼ�����                                                            =
echo.       =                                                                                 =
echo.       =     13]   ��Դ������                                                            =
echo.       =                                                                                 =
echo.       =     14]   ���������                                                            =
echo.       =                                                                                 =
echo.       =     15]   ע���༭��                                                          =
echo.       =                                                                                 =
echo.       =     16]   ϵͳ��ԭ                                                              =
echo.       =                                                                                 =
echo.       =     17]   ϵͳ����                                                              =
echo.       =                                                                                 =
echo.       =     18]   DirectX��Ϲ���                                                      =
echo.       =                                                                                 =
echo.       =     19]   ΢���������Ƴ�����                                                  =
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