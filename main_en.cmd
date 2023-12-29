@echo off
@REM 如果 "%1" 不是最大化运行的进程，启动一个新的最小化进程并结束非最大化的进程
if not "%1" == "max" start /MAX cmd /c %0 max & exit/b
color 17
title FixIt V1.14.6
:check_Permissions
@REM 网络会话请求管理员权限
@REM 如果进程拥有这些权限，不会返回错误并继续执行 (%errorLevel% == 0)
echo 需要管理员权限。正在检测权限...
net session >nul 2>&1
if %errorLevel% == 0 (
    echo 成功：已确认管理员权限。
    goto ini
) else (
    color 4f
    echo 失败：当前权限不足。
    echo        你需要管理员权限
    pause >nul
)
:ini
cls
echo.
echo.       ===================================================================================
echo.       =                                      修复工具                                    =
echo.       ===================================================================================
echo.       =                                                                                 =
echo.       =        简单模式                                                                  =
echo.       =        s]     快速修复                                                           =
echo.       =                                                                                 =
echo.       =        c]     清理工具                                                           =
echo.       =                                                                                 =
echo.       =        高级模式                                                                  =
echo.       =        1]     操作系统工具                                                        =
echo.       =                                                                                 =
echo.       =        2]     网络工具                                                           =
echo.       =                                                                                 =
echo.       =        3]     系统工具快捷方式                                                    =
echo.       =                                                                                 =
echo.       =        外部工具                                                                  =
echo.       =        4]     额外工具                                                           =
echo.       =                                                                                 =
echo.       =        5]     第三方工具                                                          =
echo.       =                                                                                 =
echo.       =        退出                                                                      =
echo.       =        0]     退出                                                               =
echo.       =                                                                                 =
echo.       ===================================================================================
echo.                                    作者：白桃    咸鱼：软糖awa
echo.
set /p tool=选项 =   
@REM 在这部分确定要显示的新菜单。
if "%tool%" == "0" (
    exit
)
if "%tool%" == "s" (
    cd "%~p0\batch"
    flash.cmd
)
if "%tool%" == "c" (
    cd "%~p0\batch"
    clean_en.cmd
)
if "%tool%" == "1" (
    cd "%~p0\batch"
    repair-so_en.cmd
)
if "%tool%" == "2" (
    cd "%~p0\batch"
    lan_en.cmd
)
if "%tool%" == "3" (
    cd "%~p0\batch"
    access_en.cmd
)
if "%tool%" == "4" (
    cd "%~p0\batch"
    other_en.cmd
)
if "%tool%" == "5" (
    cd "%~p0\batch"
    external_en.cmd
)
else (
    goto ini
)
