@echo off
@REM ��� "%1" ����������еĽ��̣�����һ���µ���С�����̲���������󻯵Ľ���
if not "%1" == "max" start /MAX cmd /c %0 max & exit/b
color 17
title FixIt V1.14.6
:check_Permissions
@REM ����Ự�������ԱȨ��
@REM �������ӵ����ЩȨ�ޣ����᷵�ش��󲢼���ִ�� (%errorLevel% == 0)
echo ��Ҫ����ԱȨ�ޡ����ڼ��Ȩ��...
net session >nul 2>&1
if %errorLevel% == 0 (
    echo �ɹ�����ȷ�Ϲ���ԱȨ�ޡ�
    goto ini
) else (
    color 4f
    echo ʧ�ܣ���ǰȨ�޲��㡣
    echo        ����Ҫ����ԱȨ��
    pause >nul
)
:ini
cls
echo.
echo.       ===================================================================================
echo.       =                                      �޸�����                                    =
echo.       ===================================================================================
echo.       =                                                                                 =
echo.       =        ��ģʽ                                                                  =
echo.       =        s]     �����޸�                                                           =
echo.       =                                                                                 =
echo.       =        c]     ������                                                           =
echo.       =                                                                                 =
echo.       =        �߼�ģʽ                                                                  =
echo.       =        1]     ����ϵͳ����                                                        =
echo.       =                                                                                 =
echo.       =        2]     ���繤��                                                           =
echo.       =                                                                                 =
echo.       =        3]     ϵͳ���߿�ݷ�ʽ                                                    =
echo.       =                                                                                 =
echo.       =        �ⲿ����                                                                  =
echo.       =        4]     ���⹤��                                                           =
echo.       =                                                                                 =
echo.       =        5]     ����������                                                          =
echo.       =                                                                                 =
echo.       =        �˳�                                                                      =
echo.       =        0]     �˳�                                                               =
echo.       =                                                                                 =
echo.       ===================================================================================
echo.                                    ���ߣ�����    ���㣺����awa
echo.
set /p tool=ѡ�� =   
@REM ���ⲿ��ȷ��Ҫ��ʾ���²˵���
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
