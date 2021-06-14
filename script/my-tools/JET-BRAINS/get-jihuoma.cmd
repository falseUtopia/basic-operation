:: 
::  Copyright (c) 2021. falseUtopia All rights reserved.
::  Licensed under BSD license
::
::  https://github.com/falseUtopia/basic-operation
::

@ECHO OFF

@REM 支持多选项
@REM 下载压缩包
@REM 解压压缩包
@REM 放置剪切板

ver|find "Version 6.0" >nul
IF NOT errorlevel 1 GOTO Windows7
ver|find "版本 6.0" >nul
IF NOT errorlevel 1 GOTO Windows7
ver|find "Version 6.1" >nul
IF NOT errorlevel 1 GOTO Windows7
ver|find "版本 6.1" >nul
IF NOT errorlevel 1 GOTO Windows7
ver|find "Version 10." >nul
IF NOT errorlevel 1 GOTO Windows10
ver|find "版本 10." >nul
IF NOT errorlevel 1 GOTO Windows10
(ECHO 不支持当前操作系统。)
GOTO :t_eof

:Windows7
SET v_ver=7
GOTO check_download_and_get_jihuoma

:Windows10
:: ECHO 当前系统Windows10
SET v_ver=10
GOTO get_jihuoma

:get_jihuoma

SET base_url=http://idea.medeming.com/a/jihuoma
CHOICE /C 123 /T 10 /D 1 /N /M "1 idea ,2 pycharm, 3 webstorm 要下载哪一个激活码？"
SET down_url=%base_url%%errorlevel%.zip
ECHO 即将获取 %down_url%

:: bitsadmin /rawreturn /transfer down %down_url% %cd%\jihuoma.zip
curl.exe -k -s %down_url% -o jihuoma.zip
IF EXIST jihuoma.zip ECHO 获取jihuoma完成
IF NOT EXIST jihuoma.zip ECHO 获取jihuoma失败
IF NOT EXIST jihuoma.zip (GOTO :t_eof)

IF %v_ver% == 7 (
    7za.exe x jihuoma.zip
) ^
ELSE IF %v_ver% == 10 (
    tar.exe -xf jihuoma.zip
)

type 2018.2之后的版本用这个.txt
type 2018.2之后的版本用这个.txt | clip
ECHO.
ECHO 复制激活码到剪切板完成

del 2018.1之前的版本用这个.txt
del 2018.2之后的版本用这个.txt
del jihuoma.zip
GOTO :t_eof

:check_download_and_get_jihuoma

    IF %v_ver% == 10 (
        GOTO get_jihuoma
    )

    ECHO win7需要准备一些依赖工具，开始检查

    IF EXIST curl.exe (
        ECHO curl.exe 已准备
    )
    IF EXIST 7za.exe (
        ECHO 7za.exe 已准备
    )

    IF NOT EXIST curl.exe (
        ECHO curl.exe不存在，开始获取curl
        certutil.exe -urlcache -split -f https://raw.fastgit.org/falseUtopia/basic-operation/main/resources/Windows/curl-7.77.0_2-win32-mingw/bin/curl.exe
        :: bitsadmin /rawreturn /transfer down https://raw.fastgit.org/falseUtopia/basic-operation/main/resources/curl-7.77.0_2-win32-mingw/bin/curl.exe %cd%\curl.exe
        IF EXIST curl.exe ECHO 获取curl.exe完成
        IF NOT EXIST curl.exe ECHO 获取curl.exe失败
        IF NOT EXIST curl.exe (GOTO :t_eof)
    )

    IF NOT EXIST 7za.exe (
        ECHO 7za.exe不存在，开始获取7za
        curl.exe -k -s https://raw.fastgit.org/sparanoid/7z/master/extra/7za.exe -O
        IF EXIST 7za.exe ECHO 获取7za.exe完成
        IF NOT EXIST 7za.exe ECHO 获取7za.exe失败
        IF NOT EXIST 7za.exe (GOTO :t_eof)
    )

    GOTO get_jihuoma

:t_eof
pause & exit 　　
