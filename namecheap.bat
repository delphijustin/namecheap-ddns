@echo off
if "%1"=="" goto help
if "%2"=="" goto missing1
if "%3"=="" goto missing2
echo Updating %2 on domain %1...
if not "%4"=="" goto sendIP
http-ping.exe -t "https://dynamicdns.park-your-domain.com/update?host=%2&domain=%1&password=%3"
echo HTTP-Ping returned %errorlevel%
goto end
:sendIP
http-ping.exe -n 1 "https://dynamicdns.park-your-domain.com/update?host=%2&domain=%1&password=%3&ip=%4"
echo IP Address manually changed
goto end
:missing1
echo record_name is missing
goto help
:missing2
echo password is missing
:help
echo Usage: namecheap.bat [domain] [record_name] [password] [ip]
pause
:end