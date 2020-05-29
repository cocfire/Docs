
set serviceName=%1
if '%serviceName%'=='' (
	set serviceName=Postgresql
	)
set installPath=%PGHOME%
	::%cd%
::pg_ctl unregister -N %serviceName%
taskkill /IM postgres.exe /F /T
sc delete %serviceName%
@if "%ERRORLEVEL%" == "0" echo Unregister PostgreSQL successfully
::net start %service_name%
rmdir /S /Q "%installPath%"
::setlocal enabledelayedexpansion
::set _path=!path:%PGHOME%\\bin;=!
::setlocal disabledelayedexpansion
::setx path "%_path%" /m
::echo %path%


 