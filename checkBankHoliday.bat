:: Check Bank Holiday Script.bat

@ECHO OFF
PowerShell.exe -NoProfile -NonInteractive -ExecutionPolicy unrestricted -Command "& {Invoke-Command -ComputerName SDC-SVN -FilePath "\\sdc-svn\c$\jenkins\psscripts\checkBankHoliday.ps1"}" %*
EXIT /B %errorlevel%