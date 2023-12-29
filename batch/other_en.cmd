:tl4
cls
echo.
echo.
echo.       ===================================================================================
echo.       =                                    额外工具                                      =
echo.       ===================================================================================
echo.       =       0]  返回                                                                  =
echo.       =                                                                                 =
echo.       =   _应用程序_                                                                    =
echo.       =       1]  卸载第三方应用程序                                                    =
echo.       =                                                                                 =
echo.       =       2]  卸载Windows应用程序                                                   =
echo.       =                                                                                 =
echo.       =       3]  卸载Microsoft Office                                                  =
echo.       =                                                                                 =
echo.       =       4]  安装所有Windows应用程序                                               =
echo.       =                                                                                 =
echo.       =       5]  安装选定的Windows应用程序                                             =
echo.       =                                                                                 =
echo.       =       6]  安装HEVC (H.265) 视频编解码器                                         =
echo.       =                                                                                 =
echo.       =       7]  安装Office 2021（无许可证）                                           =
echo.       =                                                                                 =
echo.       =       8]  更新所有应用程序                                                      =
echo.       =                                                                                 =
echo.       =       9]  安装PowerToys                                                         =
echo.       =                                                                                 =
echo.       =   _进程和服务_                                                                  =
echo.       =      10]  停止不必要的服务                                                      =
echo.       =                                                                                 =
echo.       =      11]  恢复已删除的文件                                                      =
echo.       =                                                                                 =
echo.       =      12]  禁用遥测数据收集                                                      =
echo.       =                                                                                 =
echo.       =      13]  禁用自动更新（Windows更新）                                           =
echo.       =                                                                                 =
echo.       =      14]  启用自动更新（Windows更新）                                           =
echo.       =                                                                                 =
echo.       =   _设置_                                                                        =
echo.       =      15]  启用旧版照片查看器                                                    =
echo.       =                                                                                 =
echo.       =      16]  为系统添加防止恶意软件执行的安全层                                    =
echo.       =                                                                                 =
echo.       =      17]  移除系统防止恶意软件执行的安全层                                      =
echo.       =                                                                                 =
echo.       =      18]  移除Windows 11的新菜单设计                                            =
echo.       =                                                                                 =
echo.       =      19]  恢复Windows 11的新菜单设计                                            =
echo.       =                                                                                 =
echo.       =      20]  禁用所有网络浏览器扩展（Chrome和Edge）                                =
echo.       =                                                                                 =
echo.       =      21]  禁用未签名的PowerShell脚本的执行                                      =
echo.       =                                                                                 =
echo.       =      22]  额外设置                                                              =
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
    @REM 使用所有必要的权限自动卸载指定的应用程序。
    echo.
    WMIC product get name
    echo.
    echo. 复制并粘贴顶部列表中显示的应用程序名称以卸载它
    echo.
    echo. 警告
    echo. 
    echo. 您将要删除指定的应用程序。此操作不可逆转。您确定要继续吗？
    set /p ans.4op3="您同意吗？ [Y/N]"
    echo.
    if "%ans.4op3%" == "S" goto 4op3.next
    if "%ans.4op3%" == "s" goto 4op3.next
    if "%ans.4op3%" == "N" goto tl4
    if "%ans.4op3%" == "n" goto tl4
    if not "%ans.4op3%" == "S, s, N or n" goto salir
    @REM 为了能够卸载，程序必须包含卸载程序在其数据文件夹中 && 有些程序无法完全集成它，因此无法通过此方式卸载它们
    :4op3.next
    set /p produn=AppUni=
    WMIC product where name="%produn%" call uninstall
    echo.
    pause
    goto tl4
)
if "%tool%" == "2" (
    @REM 使用所有必要的权限自动卸载指定的系统拥有的应用程序。
    echo.
    POWERSHELL "Get-AppxPackage | Select Name, PackageFullName"
    echo.
    echo. "复制并粘贴顶部（右侧）列表中显示的应用程序名称以卸载它"
    echo.
    echo. 警告
    echo. 
    echo. 您将要删除指定的应用程序。此操作不可逆转。您确定要继续吗？
    set /p ans.4op4="您同意吗？ [Y/N]"
    echo.
    if "%ans.4op4%" == "S" goto 4op4.next
    if "%ans.4op4%" == "s" goto 4op4.next
    if "%ans.4op4%" == "N" goto tl4
    if "%ans.4op4%" == "n" goto tl4
    goto tl4
    :4op4.next
    @REM 将执行策略设置为不受限制，以便您可以在不受干扰的情况下操纵系统应用程序
    PowerShell Set-ExecutionPolicy Unrestricted
    echo.
    set /p appak=APPID=
    @REM 最后，将执行限制再次放置，否则将是不受限制的，因为否则可能会在不知情的情况下在计算机上安装任何内容
    POWERSHELL Remove-AppxPackage "%appak%"
    echo.
    PowerShell Set-ExecutionPolicy Restricted
    set /p opt="继续还是返回菜单？ [C/M]"
    if "%opt%" == "c" goto 4op4.next
    if "%opt%" == "C" goto 4op4.next
    pause
    goto tl4
)
if "%tool%" == "3" (
    @REM 下载并运行Office卸载工具，因为很多时候它的内部卸载程序会留下阻止安装新实例的残余文件和键。
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
    @REM 注册具有Windows Installer的新应用程序安装
    POWERSHELL "Get-AppxPackage -allusers | foreach {Add-AppxPackage -register ""$($_.InstallLocation)\appxmanifest.xml"" -DisableDevelopmentMode}"
    @REM Add-AppxPackage : 部署错误，HRESULT：0x80073D02，无法安装包，因为当前正在使用它修改的资源。
    @REM 如果上述消息出现，则命令成功执行
    PowerShell Set-ExecutionPolicy Restricted
    echo.
    echo. 安装成功
    pause
    goto tl4
)
if "%tool%" == "5" (
    echo.
    POWERSHELL Set-ExecutionPolicy Unrestricted
    echo.
    @REM 显示您可以安装的应用程序列表
    POWERSHELL "Get-AppxPackage -AllUsers | Select Name, PackageFullName"
    echo.
    echo "从列表中选择要安装的应用程序，并复制并粘贴产品识别代码（右列）"
    echo 在某些情况下，需要重新启动才能生效。
    set /p appname=APPID=
    POWERSHELL "Add-AppxPackage -Register 'C:\Program Files\WindowsApps\%appname%\appxmanifest.xml' -DisableDevelopmentMode"
    POWERSHELL Set-ExecutionPolicy Restricted
    pause
    goto tl4
)
if "%tool%" == "6" (
    @REM 使用Web提示下载并安装最新的视频驱动程序，因为许多人使用系统原生不识别的格式，以简化其安装过程
    POWERSHELL Invoke-WebRequest -Uri "https://free-codecs.com/download_soft.php?d=0c6f463b2b5ba2af6c8e5f8c55ed5243&s=1024&r=&f=hevc_video_extension.htm" -OutFile "C:\Users\%username%\Downloads\Microsoft.HEVCVideoExtensionx64.Appx"
    timeout 5
    MOVE "C:\Users\%username%\Downloads\Microsoft.HEVCVideoExtensionx64.Appx" "%~p0"
    cd "%~p0"
    start Microsoft.HEVCVideoExtensionx64.Appx
    echo 完成，运行Setup.exe，您的程序已安装。
    pause
    goto tl4
)
if "%tool%" == "7" (
    @REM 从Microsoft服务器下载带有试用版本的Office ISO，如果用户有有效许可证，则具有所有功能
    POWERSHELL Invoke-WebRequest -Uri "https://officecdn.microsoft.com/db/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/en-us/ProPlus2021Retail.img" -OutFile "C:\Users\%username%\Downloads\ProPlus2021Retail.img"
    timeout 5
    MOVE "C:\Users\%username%\Downloads\ProPlus2021Retail.img" "%~p0"
    cd "%~p0"
    start ProPlus2021Retail.img
    echo 完成，运行Setup.exe，您的程序已安装。
    pause
    goto tl4
)
if "%tool%" == "8" (
    echo.
    @REM winget搜索已安装应用程序的可用更新列表，如果找到更新，它会自动安装它们
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
    @REM 没有策略限制，创建系统还原点，以便出现问题时计算机不受影响
    echo 创建还原点
    powershell -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description "FixItRestorePoint" -RestorePointType "MODIFY_SETTINGS""&powershell exit
    echo.
    @REM sc stop "服务名称"
    @REM sc config "服务名称" start= disabled
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
    set /p inst="您是否已安装'Windows文件恢复'？ [Y/n]"
    if "%inst%" == "s" goto continue
    if "%inst%" == "S" goto continue
    if "%inst%" == "" goto continue
    :install
    start https://apps.microsoft.com/store/detail/windows-file-recovery/9N26S50LN705
    pause
    :continue
    echo.
    set /p search="搜索位置：[C://...] "
    set /p save="存储已找到的位置：[C://...] "
    set /p filters="过滤器[/n ''user\<username>\download'' /n ''*.pdf''] "
    @REM 在用户指定的位置扫描已删除的文件
    winfr "%search%" "%save%" /regular %filters%
    echo.
    pause
    goto tl4
)
if "%tool%" == "12" (
    @REM 通过系统注册表禁用Windows遥测
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
    @REM 重新启动遥测服务
    net stop DiagTrack
    net stop dmwappushservice
    echo.
    echo 成功禁用遥测。
    echo.
    pause
    goto tl4
)
if "%tool%" == "13" (
    @REM 停止Windows更新服务
    net stop wuauserv
    @REM 通过注册表禁用自动更新
    @REM NoAutoUpdate = 1 : 激活了阻止更新
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f
    echo.
    echo 成功禁用自动更新。
    echo.
    pause
    goto tl4
)
if "%tool%" == "14" (
    @REM 通过注册表激活自动更新
    @REM NoAutoUpdate = 0 : 禁用锁定
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 0 /f
    @REM 激活Windows更新服务
    net start wuauserv
    echo.
    echo 成功启用自动更新。
    echo.
    pause
    goto tl4
)
if "%tool%" == "15" (
    @REM 启用所有运行旧Windows查看器所需的注册表键，该查看器性能出色
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
    echo. 安全层已启用
    @REM 将执行隐私日志设置为已启用
    REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 1 /f
    echo. 完成...
    pause
    goto tl4
)
if "%tool%" == "17" (
    echo. 安全层已禁用
    @REM 将运行时隐私部分的注册表设置为已禁用
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 5 /f
    echo. 完成...
    pause
    goto tl4
)
if "%tool%" == "18" (
    @REM 在注册表中创建模块以启用旧菜单。
    echo. 旧菜单已启用
    reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
    taskkill /f /im explorer.exe
    start explorer.exe
    echo.
    pause
    goto tl4
)
if "%tool%" == "19" (
    @REM 删除菜单模块
    echo. 旧菜单已禁用
    reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
    taskkill /f /im explorer.exe
    start explorer.exe
    echo.
    pause
    goto tl4
)
if "%tool%" == "20" (
    echo.
    @REM 运行内部浏览器命令以禁用扩展，以防止崩溃、错误或冲突
    "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --disable-extensions
    "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --disable-extensions
    echo.
    pause
    goto tl4
)
if "%tool%" == "21" (
    @REM 禁用未签名的PowerShell脚本的执行
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell" /v ExecutionPolicy /t REG_SZ /d "RemoteSigned" /f
    echo. 已成功禁用未签名的PowerShell脚本的执行。
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