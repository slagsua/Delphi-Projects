@echo 2.0 del
attrib -h -s "C:\Dispatcher\Database" /S /d
rename "C:\Dispatcher\Database" "Database%date%"
pause
