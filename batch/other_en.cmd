:tl4
cls
echo.
echo.
echo.       ===================================================================================
echo.       =                                    ���⹤��                                      =
echo.       ===================================================================================
echo.       =       0]  ����                                                                  =
echo.       =                                                                                 =
echo.       =   _Ӧ�ó���_                                                                    =
echo.       =       1]  ж�ص�����Ӧ�ó���                                                    =
echo.       =                                                                                 =
echo.       =       2]  ж��WindowsӦ�ó���                                                   =
echo.       =                                                                                 =
echo.       =       3]  ж��Microsoft Office                                                  =
echo.       =                                                                                 =
echo.       =       4]  ��װ����WindowsӦ�ó���                                               =
echo.       =                                                                                 =
echo.       =       5]  ��װѡ����WindowsӦ�ó���                                             =
echo.       =                                                                                 =
echo.       =       6]  ��װHEVC (H.265) ��Ƶ�������                                         =
echo.       =                                                                                 =
echo.       =       7]  ��װOffice 2021�������֤��                                           =
echo.       =                                                                                 =
echo.       =       8]  ��������Ӧ�ó���                                                      =
echo.       =                                                                                 =
echo.       =       9]  ��װPowerToys                                                         =
echo.       =                                                                                 =
echo.       =   _���̺ͷ���_                                                                  =
echo.       =      10]  ֹͣ����Ҫ�ķ���                                                      =
echo.       =                                                                                 =
echo.       =      11]  �ָ���ɾ�����ļ�                                                      =
echo.       =                                                                                 =
echo.       =      12]  ����ң�������ռ�                                                      =
echo.       =                                                                                 =
echo.       =      13]  �����Զ����£�Windows���£�                                           =
echo.       =                                                                                 =
echo.       =      14]  �����Զ����£�Windows���£�                                           =
echo.       =                                                                                 =
echo.       =   _����_                                                                        =
echo.       =      15]  ���þɰ���Ƭ�鿴��                                                    =
echo.       =                                                                                 =
echo.       =      16]  Ϊϵͳ��ӷ�ֹ�������ִ�еİ�ȫ��                                    =
echo.       =                                                                                 =
echo.       =      17]  �Ƴ�ϵͳ��ֹ�������ִ�еİ�ȫ��                                      =
echo.       =                                                                                 =
echo.       =      18]  �Ƴ�Windows 11���²˵����                                            =
echo.       =                                                                                 =
echo.       =      19]  �ָ�Windows 11���²˵����                                            =
echo.       =                                                                                 =
echo.       =      20]  �������������������չ��Chrome��Edge��                                =
echo.       =                                                                                 =
echo.       =      21]  ����δǩ����PowerShell�ű���ִ��                                      =
echo.       =                                                                                 =
echo.       =      22]  ��������                                                              =
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
    @REM ʹ�����б�Ҫ��Ȩ���Զ�ж��ָ����Ӧ�ó���
    echo.
    WMIC product get name
    echo.
    echo. ���Ʋ�ճ�������б�����ʾ��Ӧ�ó���������ж����
    echo.
    echo. ����
    echo. 
    echo. ����Ҫɾ��ָ����Ӧ�ó��򡣴˲���������ת����ȷ��Ҫ������
    set /p ans.4op3="��ͬ���� [Y/N]"
    echo.
    if "%ans.4op3%" == "S" goto 4op3.next
    if "%ans.4op3%" == "s" goto 4op3.next
    if "%ans.4op3%" == "N" goto tl4
    if "%ans.4op3%" == "n" goto tl4
    if not "%ans.4op3%" == "S, s, N or n" goto salir
    @REM Ϊ���ܹ�ж�أ�����������ж�س������������ļ����� && ��Щ�����޷���ȫ������������޷�ͨ���˷�ʽж������
    :4op3.next
    set /p produn=AppUni=
    WMIC product where name="%produn%" call uninstall
    echo.
    pause
    goto tl4
)
if "%tool%" == "2" (
    @REM ʹ�����б�Ҫ��Ȩ���Զ�ж��ָ����ϵͳӵ�е�Ӧ�ó���
    echo.
    POWERSHELL "Get-AppxPackage | Select Name, PackageFullName"
    echo.
    echo. "���Ʋ�ճ���������Ҳࣩ�б�����ʾ��Ӧ�ó���������ж����"
    echo.
    echo. ����
    echo. 
    echo. ����Ҫɾ��ָ����Ӧ�ó��򡣴˲���������ת����ȷ��Ҫ������
    set /p ans.4op4="��ͬ���� [Y/N]"
    echo.
    if "%ans.4op4%" == "S" goto 4op4.next
    if "%ans.4op4%" == "s" goto 4op4.next
    if "%ans.4op4%" == "N" goto tl4
    if "%ans.4op4%" == "n" goto tl4
    goto tl4
    :4op4.next
    @REM ��ִ�в�������Ϊ�������ƣ��Ա��������ڲ��ܸ��ŵ�����²���ϵͳӦ�ó���
    PowerShell Set-ExecutionPolicy Unrestricted
    echo.
    set /p appak=APPID=
    @REM ��󣬽�ִ�������ٴη��ã������ǲ������Ƶģ���Ϊ������ܻ��ڲ�֪���������ڼ�����ϰ�װ�κ�����
    POWERSHELL Remove-AppxPackage "%appak%"
    echo.
    PowerShell Set-ExecutionPolicy Restricted
    set /p opt="�������Ƿ��ز˵��� [C/M]"
    if "%opt%" == "c" goto 4op4.next
    if "%opt%" == "C" goto 4op4.next
    pause
    goto tl4
)
if "%tool%" == "3" (
    @REM ���ز�����Officeж�ع��ߣ���Ϊ�ܶ�ʱ�������ڲ�ж�س����������ֹ��װ��ʵ���Ĳ����ļ��ͼ���
    POWERSHELL Invoke-WebRequest -Uri "https://aka.ms/SaRA-officeUninstallFromPC" -OutFile "C:\Users\%username%\Downloads\SetupProd_OffScrub.exe"
    timeout 5
    move C:\Users\%username%\Downloads\SetupProd_OffScrub.exe "%~p0"
    cd "%~p0"
    start SetupProd_OffScrub.exe
    pause
    del SetupProd_OffScrub.exe /f /s /q
    echo.
    pause
    goto tl4
)
if "%tool%" == "4" (
    echo.
    PowerShell Set-ExecutionPolicy Unrestricted
    @REM ע�����Windows Installer����Ӧ�ó���װ
    POWERSHELL "Get-AppxPackage -allusers | foreach {Add-AppxPackage -register ""$($_.InstallLocation)\appxmanifest.xml"" -DisableDevelopmentMode}"
    @REM Add-AppxPackage : �������HRESULT��0x80073D02���޷���װ������Ϊ��ǰ����ʹ�����޸ĵ���Դ��
    @REM ���������Ϣ���֣�������ɹ�ִ��
    PowerShell Set-ExecutionPolicy Restricted
    echo.
    echo. ��װ�ɹ�
    pause
    goto tl4
)
if "%tool%" == "5" (
    echo.
    POWERSHELL Set-ExecutionPolicy Unrestricted
    echo.
    @REM ��ʾ�����԰�װ��Ӧ�ó����б�
    POWERSHELL "Get-AppxPackage -AllUsers | Select Name, PackageFullName"
    echo.
    echo "���б���ѡ��Ҫ��װ��Ӧ�ó��򣬲����Ʋ�ճ����Ʒʶ����루���У�"
    echo ��ĳЩ����£���Ҫ��������������Ч��
    set /p appname=APPID=
    POWERSHELL "Add-AppxPackage -Register 'C:\Program Files\WindowsApps\%appname%\appxmanifest.xml' -DisableDevelopmentMode"
    POWERSHELL Set-ExecutionPolicy Restricted
    pause
    goto tl4
)
if "%tool%" == "6" (
    @REM ʹ��Web��ʾ���ز���װ���µ���Ƶ����������Ϊ�����ʹ��ϵͳԭ����ʶ��ĸ�ʽ���Լ��䰲װ����
    POWERSHELL Invoke-WebRequest -Uri "https://free-codecs.com/download_soft.php?d=0c6f463b2b5ba2af6c8e5f8c55ed5243&s=1024&r=&f=hevc_video_extension.htm" -OutFile "C:\Users\%username%\Downloads\Microsoft.HEVCVideoExtensionx64.Appx"
    timeout 5
    MOVE "C:\Users\%username%\Downloads\Microsoft.HEVCVideoExtensionx64.Appx" "%~p0"
    cd "%~p0"
    start Microsoft.HEVCVideoExtensionx64.Appx
    echo ��ɣ�����Setup.exe�����ĳ����Ѱ�װ��
    pause
    goto tl4
)
if "%tool%" == "7" (
    @REM ��Microsoft���������ش������ð汾��Office ISO������û�����Ч���֤����������й���
    POWERSHELL Invoke-WebRequest -Uri "https://officecdn.microsoft.com/db/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/en-us/ProPlus2021Retail.img" -OutFile "C:\Users\%username%\Downloads\ProPlus2021Retail.img"
    timeout 5
    MOVE "C:\Users\%username%\Downloads\ProPlus2021Retail.img" "%~p0"
    cd "%~p0"
    start ProPlus2021Retail.img
    echo ��ɣ�����Setup.exe�����ĳ����Ѱ�װ��
    pause
    goto tl4
)
if "%tool%" == "8" (
    echo.
    @REM winget�����Ѱ�װӦ�ó���Ŀ��ø����б�����ҵ����£������Զ���װ����
    POWERSHELL winget upgrade --all
    echo.
    pause
    goto tl4
)
if "%tool%" == "9" (
    echo.
    POWERSHELL winget install --id Microsoft.PowerToys
    echo.
    pause
    goto tl4
)
if "%tool%" == "10" (
    echo.
    @REM û�в������ƣ�����ϵͳ��ԭ�㣬�Ա��������ʱ���������Ӱ��
    echo ������ԭ��
    powershell -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description "FixItRestorePoint" -RestorePointType "MODIFY_SETTINGS""&powershell exit
    echo.
    @REM sc stop "��������"
    @REM sc config "��������" start= disabled
    sc stop defragsvc& sc config defragsvc start= disabled
    sc stop XblGameSave& sc config XblGameSave start= disabled
    sc stop SysMain& sc config SysMain start= disabled
    sc stop Fax& sc config Fax start= disabled
    sc stop RemoteRegistry& sc config RemoteRegistry start= disable
    sc stop TapiSrv& sc config TapiSrv start= disabled
    sc stop MapsBroker& sc config MapsBroker start= disabled
    sc stop SNMPTRAP& sc config SNMPTRAP start= disabled
    sc stop PcaSvc& sc config PcaSvc start= demand& REM demand = manual
    sc stop BDESVC& sc config BDESVC start= demand
    sc stop CertPropSvc& sc config CertPropSvc start= disabled
    sc stop DiagTrack& sc config DiagTrack start= disabled
    sc stop dmwappushservice& sc config dmwappushservice start= disabled
    sc stop BITS& sc config BITS start= disabled
    sc stop Netlogon& sc config Netlogon start= disabled
    sc stop XboxNetApiSvc& sc config XboxNetApiSvc start= disabled
    sc stop XboxGipSvc& sc config XboxGipSvc start= disabled
    sc stop RmSvc& sc config RmSvc start= disabled
    pause
    goto tl4
)
if "%tool%" == "11" (
    echo.
    set /p inst="���Ƿ��Ѱ�װ'Windows�ļ��ָ�'�� [Y/n]"
    if "%inst%" == "s" goto continue
    if "%inst%" == "S" goto continue
    if "%inst%" == "" goto continue
    :install
    start https://apps.microsoft.com/store/detail/windows-file-recovery/9N26S50LN705
    pause
    :continue
    echo.
    set /p search="����λ�ã�[C://...] "
    set /p save="�洢���ҵ���λ�ã�[C://...] "
    set /p filters="������[/n ''user\<username>\download'' /n ''*.pdf''] "
    @REM ���û�ָ����λ��ɨ����ɾ�����ļ�
    winfr "%search%" "%save%" /regular %filters%
    echo.
    pause
    goto tl4
)
if "%tool%" == "12" (
    @REM ͨ��ϵͳע������Windowsң��
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
    @REM ��������ң�����
    net stop DiagTrack
    net stop dmwappushservice
    echo.
    echo �ɹ�����ң�⡣
    echo.
    pause
    goto tl4
)
if "%tool%" == "13" (
    @REM ֹͣWindows���·���
    net stop wuauserv
    @REM ͨ��ע�������Զ�����
    @REM NoAutoUpdate = 1 : ��������ֹ����
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f
    echo.
    echo �ɹ������Զ����¡�
    echo.
    pause
    goto tl4
)
if "%tool%" == "14" (
    @REM ͨ��ע������Զ�����
    @REM NoAutoUpdate = 0 : ��������
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 0 /f
    @REM ����Windows���·���
    net start wuauserv
    echo.
    echo �ɹ������Զ����¡�
    echo.
    pause
    goto tl4
)
if "%tool%" == "15" (
    @REM �����������о�Windows�鿴�������ע�������ò鿴�����ܳ�ɫ
    reg add "HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Bitmap" /v "ImageOptionFlags" /t REG_DWORD /d 00000001 /f
    reg add "HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Bitmap" /v "FriendlyTypeName" /t REG_EXPAND_SZ /d "@%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll,-3056" /f
    reg add "HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Bitmap\DefaultIcon" /ve /t REG_EXPAND_SZ /d "%SystemRoot%\System32\imageres.dll,-70" /f
    reg add "HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Bitmap\shell\open\command" /ve /t REG_EXPAND_SZ /d "\"%SystemRoot%\System32\cmd.exe\" /c \"\"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll\" \"%1\"\"" /f
    reg add "HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.Bitmap\shell\open\DropTarget" /v "Clsid" /t REG_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f
    reg add "HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.JFIF" /v "EditFlags" /t REG_DWORD /d 00010000 /f
    reg add "HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.JFIF" /v "ImageOptionFlags" /t REG_DWORD /d 00000001 /f
    reg add "HKEY_CLASSES_ROOT\PhotoViewer.FileAssoc.JFIF" /v "FriendlyTypeName" /t REG_EXPAND_SZ /d "@%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll,-3056" /f
    pause
    goto tl4
)
if "%tool%" == "16" (
    echo. ��ȫ��������
    @REM ��ִ����˽��־����Ϊ������
    REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 1 /f
    echo. ���...
    pause
    goto tl4
)
if "%tool%" == "17" (
    echo. ��ȫ���ѽ���
    @REM ������ʱ��˽���ֵ�ע�������Ϊ�ѽ���
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 5 /f
    echo. ���...
    pause
    goto tl4
)
if "%tool%" == "18" (
    @REM ��ע����д���ģ�������þɲ˵���
    echo. �ɲ˵�������
    reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
    taskkill /f /im explorer.exe
    start explorer.exe
    echo.
    pause
    goto tl4
)
if "%tool%" == "19" (
    @REM ɾ���˵�ģ��
    echo. �ɲ˵��ѽ���
    reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
    taskkill /f /im explorer.exe
    start explorer.exe
    echo.
    pause
    goto tl4
)
if "%tool%" == "20" (
    echo.
    @REM �����ڲ�����������Խ�����չ���Է�ֹ������������ͻ
    "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --disable-extensions
    "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --disable-extensions
    echo.
    pause
    goto tl4
)
if "%tool%" == "21" (
    @REM ����δǩ����PowerShell�ű���ִ��
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell" /v ExecutionPolicy /t REG_SZ /d "RemoteSigned" /f
    echo. �ѳɹ�����δǩ����PowerShell�ű���ִ�С�
    pause
    goto tl4
)
if "%tool%" == "22" (
    if exist "GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}" (
        start explorer.exe "GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}" 
    ) else (
        mkdir "GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}" 
    )
    pause
    goto tl4
) else (
    goto tl4
)