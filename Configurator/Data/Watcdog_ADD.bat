@echo off
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "cmd.exe /c \"%WATCHDOG%\"" /f 
pause
exit /b
 