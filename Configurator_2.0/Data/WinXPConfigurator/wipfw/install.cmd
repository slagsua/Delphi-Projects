@echo off

set d=%systemroot%\system32

copy /Y C:\wipfw\bin\ipfw.exe "%d%"\ipfw.exe > NUL
copy /Y C:\wipfw\bin\ip_fw.sys "%d%\DRIVERS\ip_fw.sys" > NUL

echo.
C:\wipfw\bin\ipfw install_drv %d%\DRIVERS\ip_fw.sys
net start ip_fw
if not %errorlevel%==0 goto END

C:\wipfw\bin\ipfw install C:\wipfw\config.cmd"
echo.
net start ipfw

echo Current rules:
ipfw -d list

echo.
if %errorlevel%==0 goto OK
echo ERROR!
uninstall.cmd
goto END

:OK
echo SUCCESS. Default action is ALLOW.
echo Log files are located in %systemroot%\security\logs
echo Change config.cmd file for your taste.

:END
pause
exit /b
