@echo off
echo.
echo Stopping the service
net stop /y ip_fw > NUL
echo Removing driver...
bin\ipfw remove_drv
echo Removing helper service...
bin\ipfw remove

del  /F /Q %systemroot%\system32\ipfw.exe > NUL
del  /F /Q %systemroot%\system32\DRIVERS\ip_fw.sys > NUL

echo.
echo Done.

:END
pause
exit /b
