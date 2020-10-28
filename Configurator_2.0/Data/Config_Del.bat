@echo  del
attrib -h -s "C:\Dispatcher\Config" /S /d
rename "C:\Dispatcher\Config" "Config%date%"
pause
