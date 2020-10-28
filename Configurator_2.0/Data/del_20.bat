@echo 2.0 del
attrib -h -s "C:\Users\%USERNAME%\AppData\Local\Apps\2.0" /S /d
attrib -h -s "C:\Documents and Settings\%USERNAME%\Local Settings\Apps\2.0" /S /d
rd  /S / Q  "C:\Users\%USERNAME%\AppData\Local\Apps\2.0"
rd  /S / Q  "C:\Documents and Settings\%USERNAME%\Local Settings\Apps\2.0"
pause

