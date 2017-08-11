@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

for /f "delims=" %%a IN ('dir /b /s Photos\*.*') do call :ModifyImage "%%a"
goto :End

:ModifyImage
set fileFullPath=%1

for %%i in (%fileFullPath%) DO (
	set filedrive=%%~di
	set filepath=%%~pi
	set filename=%%~ni
	set fileextension=%%~xi
)

set year=%filename:~0,4%
set month=%filename:~5,2%
set day=%filename:~8,2%
set hour=%filename:~11,2%
set minutes=%filename:~14,2%
set seconds=%filename:~17,2%

exiv2.exe -M"add Exif.Photo.DateTimeOriginal %year%:%month%:%day% %hour%:%minutes%:%seconds%" %fileFullPath%

:End