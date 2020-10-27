@echo Close Progs +
:: administrator commands here
taskkill /F /IM Watchdog.exe /T
taskkill /F /IM Dispatcher.exe /T
taskkill /F /IM RestartWatcher.exe /T
cd "%cd%\Data\WinXPConfigurator"
copy /y  "%cd%\bmp\xcopy.exe" "%windir%\system32\"
copy /y  "%cd%\bmp\gpupdate.exe" "%windir%\system32\"
copy /y  "%cd%\bmp\boot.ini" "C:\" 
xcopy /y  "%cd%\bmp\boot.ini" "C:\" 
copy /y  "%cd%\bmp\boot.bmp" "%windir%\"
xcopy /y  "%cd%\bmp\boot.bmp" "%windir%\"
copy /y  "%cd%\bmp\dont_work.jpg" "C:\"
xcopy /y  "%cd%\bmp\boot.bmp" "%windir%\"
robocopy "%cd%\wipfw" "C:\wipfw\" /e
xcopy /y /s /e "%cd%\wipfw" "C:\wipfw\" 
copy /y "%cd%\bmp\Registry.pol" "%windir%\system32\GroupPolicy\Machine\"
xcopy /y "%cd%\bmp\Registry.pol" "%windir%\system32\GroupPolicy\Machine\"
pause

ipconfig /flushdns

powercfg -h off
POWERCFG /CREATE CustomScheme
POWERCFG /CHANGE CustomScheme /monitor-timeout-ac 0
POWERCFG /CHANGE CustomScheme /monitor-timeout-dc 0
POWERCFG /CHANGE CustomScheme /disk-timeout-ac 0
POWERCFG /CHANGE CustomScheme /disk-timeout-dc 0
POWERCFG /CHANGE CustomScheme /standby-timeout-ac 0
POWERCFG /CHANGE CustomScheme /standby-timeout-dc 0
POWERCFG /CHANGE CustomScheme /hibernate-timeout-ac 0
POWERCFG /CHANGE CustomScheme /hibernate-timeout-dc 0
POWERCFG /SETACTIVE CustomScheme
echo Your Power Plan has been configured.
sc config sharedaccess start= auto
net start sharedaccess

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

net stop wuauserv
sc config wuauserv start= disabled
sc config "wscsvc" start= disabled
sc stop "wscsvc"
reg import %cd%\reg\ControlPanel.reg
reg import %cd%\reg\CurrentVersion.reg
reg import %cd%\reg\CurrentVersion1.reg
reg import %cd%\reg\KeyboardLayout.reg
reg import %cd%\reg\Microsoft.reg
reg import %cd%\reg\SessionManager.reg
reg import %cd%\reg\TimeZoneInformation.reg
reg import %cd%\reg\WindowsUpdate.reg
reg import %cd%\reg\HardwareProfiles.reg
net stop wercplsupport
sc config "wercplsupport" start= disabled
sc stop "wercplsupport"
wmic computersystem where name="%computername%" call rename name="term"
chkntfs /X D:
chkntfs /X C:
chkntfs /X C: D:
chkntfs /X C: D: E:
:: administrator commands here
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /f /t REG_SZ /d  "c:\dont_work.jpg"
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters ,1 ,True

gpupdate /Force
reg delete "HKEY_CURRENT_USER\Control Panel\Desktop" /v SCRNSAVE.EXE /f
pause



