:: 
::  Copyright (c) 2021. falseUtopia All rights reserved.
::  Licensed under BSD license
::
::  https://github.com/falseUtopia/basic-operation
::

@ECHO OFF

@REM ֧�ֶ�ѡ��
@REM ����ѹ����
@REM ��ѹѹ����
@REM ���ü��а�

ver|find "Version 6.0" >nul
IF NOT errorlevel 1 GOTO Windows7
ver|find "�汾 6.0" >nul
IF NOT errorlevel 1 GOTO Windows7
ver|find "Version 6.1" >nul
IF NOT errorlevel 1 GOTO Windows7
ver|find "�汾 6.1" >nul
IF NOT errorlevel 1 GOTO Windows7
ver|find "Version 10." >nul
IF NOT errorlevel 1 GOTO Windows10
ver|find "�汾 10." >nul
IF NOT errorlevel 1 GOTO Windows10
(ECHO ��֧�ֵ�ǰ����ϵͳ��)
GOTO :t_eof

:Windows7
SET v_ver=7
GOTO check_download_and_get_jihuoma

:Windows10
:: ECHO ��ǰϵͳWindows10
SET v_ver=10
GOTO get_jihuoma

:get_jihuoma

SET base_url=http://idea.medeming.com/a/jihuoma
CHOICE /C 123 /T 10 /D 1 /N /M "1 idea ,2 pycharm, 3 webstorm Ҫ������һ�������룿"
SET down_url=%base_url%%errorlevel%.zip
ECHO ������ȡ %down_url%

:: bitsadmin /rawreturn /transfer down %down_url% %cd%\jihuoma.zip
curl.exe -k -s %down_url% -o jihuoma.zip
IF EXIST jihuoma.zip ECHO ��ȡjihuoma���
IF NOT EXIST jihuoma.zip ECHO ��ȡjihuomaʧ��
IF NOT EXIST jihuoma.zip (GOTO :t_eof)

IF %v_ver% == 7 (
    7za.exe x jihuoma.zip
) ^
ELSE IF %v_ver% == 10 (
    tar.exe -xf jihuoma.zip
)

type 2018.2֮��İ汾�����.txt
type 2018.2֮��İ汾�����.txt | clip
ECHO.
ECHO ���Ƽ����뵽���а����

del 2018.1֮ǰ�İ汾�����.txt
del 2018.2֮��İ汾�����.txt
del jihuoma.zip
GOTO :t_eof

:check_download_and_get_jihuoma

    IF %v_ver% == 10 (
        GOTO get_jihuoma
    )

    ECHO win7��Ҫ׼��һЩ�������ߣ���ʼ���

    IF EXIST curl.exe (
        ECHO curl.exe ��׼��
    )
    IF EXIST 7za.exe (
        ECHO 7za.exe ��׼��
    )

    IF NOT EXIST curl.exe (
        ECHO curl.exe�����ڣ���ʼ��ȡcurl
        certutil.exe -urlcache -split -f https://raw.fastgit.org/falseUtopia/basic-operation/main/resources/Windows/curl-7.77.0_2-win32-mingw/bin/curl.exe
        :: bitsadmin /rawreturn /transfer down https://raw.fastgit.org/falseUtopia/basic-operation/main/resources/curl-7.77.0_2-win32-mingw/bin/curl.exe %cd%\curl.exe
        IF EXIST curl.exe ECHO ��ȡcurl.exe���
        IF NOT EXIST curl.exe ECHO ��ȡcurl.exeʧ��
        IF NOT EXIST curl.exe (GOTO :t_eof)
    )

    IF NOT EXIST 7za.exe (
        ECHO 7za.exe�����ڣ���ʼ��ȡ7za
        curl.exe -k -s https://raw.fastgit.org/sparanoid/7z/master/extra/7za.exe -O
        IF EXIST 7za.exe ECHO ��ȡ7za.exe���
        IF NOT EXIST 7za.exe ECHO ��ȡ7za.exeʧ��
        IF NOT EXIST 7za.exe (GOTO :t_eof)
    )

    GOTO get_jihuoma

:t_eof
pause & exit ����
