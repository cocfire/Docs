
::@echo off
set service_name=Postgresql
set service_name1=postgresql
::(��װ��)�ļ�����
set zip_file=postgresql-10.7-1-windows-binaries.zip
set curr_path=%~dp0
set exe_path=%1
set exe_path=%exe_path:"=%
set temp_path = %PGHOME%

::��װ·��
cd %exe_path%
cd ../
set install_path=%cd%
cd %curr_path%

set _PGHOME=%install_path%\pgsql
::������ʼ��
::·������1024�ַ�

::��ѯ�Ƿ����
sc query type= all state= all | findstr %service_name% && goto pgsqlExist || goto pgsqlNotExist
::>> C:\Users\i7-6700\Desktop\temp.txt
::find  "%service_name%" && goto pgsqlNotExist || goto pgsqlExist
::>nul 2>nul
::
::if not errorlevel 1 (goto pgsqlNotExist) else goto pgsqlExist


:pgsqlNotExist
sc query type= all state= all | findstr %service_name1% && goto pgsqlExist1 || goto pgsqlNotExist1
:pgsqlNotExist1
set _PGHOME=%install_path%\pgsql
::������ʼ��
setx PGHOME "%_PGHOME%" /m
::·������1024�ַ�
::setx PATH "%_PGHOME%\\bin;%path%">> err.txt 2>&1 /m
setx PGLIB "%_PGHOME%\\lib" /m
setx PGDATA "%_PGHOME%\\data" /m
setx PGHOST localhost /m
setx PGPORT 5432 /m
setx PGDATABASE postgres /m
setx PGUSER postgres /m
::��ѹ�ļ���ָ��Ŀ¼
if exist "%_PGHOME%" (
	taskkill /IM postgres.exe /F /T
	rmdir /s /Q "%_PGHOME%"
	)
cd %exe_path%\setup
winrar x -y "%zip_file%" "%install_path%" >> ..\err.txt 2>&1
if errorlevel 1 (
	echo WSH.Echo MsgBox("���ݿⰲװ�ļ���ȡʧ��", 48, "����"^)>%temp%\msgbox.vbs
	cscript /nologo %temp%\msgbox.vbs
	del /q %temp%\msgbox.vbs
	exit -1
	)
cd %install_path%\pgsql
::���������ļ���
md data
::net user postgres e2000jl /add
::��dataĿ¼��Ȩ�޸���postgres
::cacls data /e /t /r administrator
::cacls data /e /t /g postgres:F
cacls data /e /t /g %username%:F
cd %_PGHOME%\bin\
set _PGDATA=%_PGHOME%\\data
::��ʼ�����ݿ�
initdb -D "%_PGDATA%" -E UTF8 --locale=C -U postgres >> err.txt 2>&1
if errorlevel 1 (
	echo WSH.Echo MsgBox("���ݿ��ʼ��ʧ��", 48, "����"^)>%temp%\msgbox.vbs
	cscript /nologo %temp%\msgbox.vbs
	del /q %temp%\msgbox.vbs
	exit -1
	)
::�������ݿ������
pg_ctl -D "%_PGDATA%" -w start >> err.txt 2>&1
if errorlevel 1 (
	echo WSH.Echo MsgBox("���ݿ����������ʧ��", 48, "����"^)>%temp%\msgbox.vbs
	cscript /nologo %temp%\msgbox.vbs
	del /q %temp%\msgbox.vbs
	exit -1
	)
call :createDB
::�ر����ݿ������
pg_ctl -D "%_PGDATA%" -w stop
::ע�����
::runas /user:administrator "pg_ctl register -D \"%PGDATA%\" -N %service_name%"
pg_ctl register -D "%_PGDATA%" -N %service_name% >> err.txt 2>&1
if errorlevel 1 (
	echo WSH.Echo MsgBox("���ݿ����ע��ʧ��", 48, "����"^)>%temp%\msgbox.vbs
	cscript /nologo %temp%\msgbox.vbs
	del /q %temp%\msgbox.vbs
	exit -1
	)
::��������
net start %service_name% >> err.txt 2>&1
if errorlevel 1 (
	echo WSH.Echo MsgBox("���ݿ��������ʧ��", 48, "����"^)>%temp%\msgbox.vbs
	cscript /nologo %temp%\msgbox.vbs
	del /q %temp%\msgbox.vbs
	exit -1
	)
exit


:pgsqlExist
REM echo pgsqlExist11 >> d:\setup.txt
REM ����plsy����û�������ѯ���Ƿ���װ������ֱ�Ӵ����û������ݿ�
::cd  "%PGHOME%\bin\"
cd  pgsql\bin
REM psql -U postgres -w -c "\du" | findstr plsy && call :reInstall || call :createDB	
psql -U postgres -w -c "\du" | findstr plsy && goto reInstall || goto createDB
::echo ttt >> d:\setup.txt
exit

:pgsqlExist1
echo WSH.Echo MsgBox("���ֶ���װ��PostgreSQL���ݿ⣬�������°�װ�����ֶ�ɾ��ԭPostgreSQL���ݿ�", 0, "��ʾ")>%temp%\msgbox.vbs
	cscript /nologo %temp%\msgbox.vbs
	del /q %temp%\msgbox.vbs
	exit

:reInstall
::psql -U postgres -w -c "\l"
::psql -U plsy -d facebase -w -c "\dt"
echo WSH.Echo MsgBox("�����Ѱ�װPostgresql���ݿ⣬�Ƿ����°�װ�����°�װ������ԭ�����ݣ�", 4, "��ʾ")>%temp%\msgbox.vbs
for /f %%i in ('cscript /nologo %temp%\msgbox.vbs') do (
	if %%i == 6 (
del /q %temp%\msgbox.vbs
cd   "%exe_path%\setup"
		call pgsql_uninstall.bat %service_name% 
		goto pgsqlNotExist
		)
	else (
del /q %temp%\msgbox.vbs
		psql -h localhost -p 5432 -U plsy -d facegate -w -f "%exe_path%\setup\facegate_update.sql" 
		exit 0
		)
	)

:createDB
::echo createDB11 >> d:\setup.txt
cd /d %PGHOME%\bin\
::echo WSH.Echo MsgBox("��ʼ�����û������ݿ�", 0, "��ʾ")>%temp%\msgbox.vbs
::cscript /nologo %temp%\msgbox.vbs
::del /q %temp%\msgbox.vbs
::������ͨ�û�
psql -h localhost -p 5432 -U postgres -w -c "create user plsy password 'e2000jl' CREATEDB;" | findstr "CREATE ROLE"
if errorlevel 1 (
	echo WSH.Echo MsgBox("�������ݿ��û�ʧ��", 48, "����"^)>%temp%\msgbox.vbs
	cscript /nologo %temp%\msgbox.vbs
	del /q %temp%\msgbox.vbs
	exit -1
	)
::�������ݿ�
::echo %username%r
psql -h localhost -p 5432 -U postgres -w -c "create database facedata owner plsy;" | findstr "CREATE DATABASE"
if errorlevel 1 (
	echo WSH.Echo MsgBox("�������ݿ�facedataʧ��", 48, "����"^)>%temp%\msgbox.vbs
	cscript /nologo %temp%\msgbox.vbs
	del /q %temp%\msgbox.vbs
	exit -1
	)
rem psql -h localhost -p 5432 -U postgres -w -c "create database facegate owner plsy;" | findstr "CREATE DATABASE"
rem if errorlevel 1 (
rem 	echo WSH.Echo MsgBox("�������ݿ�facegateʧ��", 48, "����"^)>%temp%\msgbox.vbs
rem 	cscript /nologo %temp%\msgbox.vbs
rem 	del /q %temp%\msgbox.vbs
rem 	exit -1
rem 	)
::�������ݱ�
psql -h localhost -p 5432 -U plsy -d facedata -w -f "%exe_path%\setup\facedata_create_table.sql" 
if errorlevel 1 (
	echo WSH.Echo MsgBox("���ݿ�facedata���ݱ���ʧ��", 48, "����"^)>%temp%\msgbox.vbs
	cscript /nologo %temp%\msgbox.vbs
	del /q %temp%\msgbox.vbs
	exit -1
	)
rem psql -h localhost -p 5432 -U plsy -d facegate -w -f "%exe_path%\setup\facegate_create_table.sql" 
rem if errorlevel 1 (
rem 	echo WSH.Echo MsgBox("���ݿ�facegate���ݱ���ʧ��", 48, "����"^)>%temp%\msgbox.vbs
rem 	cscript /nologo %temp%\msgbox.vbs
rem 	del /q %temp%\msgbox.vbs
rem 	exit -1
rem 	)

psql -h localhost -p 5432 -U postgres -w -c "create database facegate owner plsy;" | findstr "CREATE DATABASE"
if errorlevel 1 (
	echo WSH.Echo MsgBox("�������ݿ�facegateʧ��", 48, "����"^)>%temp%\msgbox.vbs
	cscript /nologo %temp%\msgbox.vbs
	del /q %temp%\msgbox.vbs
	exit -1
	)
rem psql -h localhost -p 5432 -U postgres -w -c "create database facegate owner plsy;" | findstr "CREATE DATABASE"
rem if errorlevel 1 (
rem 	echo WSH.Echo MsgBox("�������ݿ�facegateʧ��", 48, "����"^)>%temp%\msgbox.vbs
rem 	cscript /nologo %temp%\msgbox.vbs
rem 	del /q %temp%\msgbox.vbs
rem 	exit -1
rem 	)
::�������ݱ�
psql -h localhost -p 5432 -U plsy -d facegate -w -f "%exe_path%\setup\facegate_create_table.sql" 
if errorlevel 1 (
	echo WSH.Echo MsgBox("���ݿ�facegate���ݱ���ʧ��", 48, "����"^)>%temp%\msgbox.vbs
	cscript /nologo %temp%\msgbox.vbs
	del /q %temp%\msgbox.vbs
	exit -1
	)

psql -h localhost -p 5432 -U plsy -d facegate -w -f "%exe_path%\setup\facegate_insert.sql" 
if errorlevel 1 (
	echo WSH.Echo MsgBox("����ͨ�ŷ���IP����ʧ��", 48, "����"^)>%temp%\msgbox.vbs
	cscript /nologo %temp%\msgbox.vbs
	del /q %temp%\msgbox.vbs
	exit -1
	)
rem psql -h localhost -p 5432 -U plsy -d facegate -w -f "%exe_path%\setup\facegate_create_table.sql" 
rem if errorlevel 1 (
rem 	echo WSH.Echo MsgBox("���ݿ�facegate���ݱ���ʧ��", 48, "����"^)>%temp%\msgbox.vbs
rem 	cscript /nologo %temp%\msgbox.vbs
rem 	del /q %temp%\msgbox.vbs
rem 	exit -1
rem 	)
rem copy "%exe_path%\setup\postgresql.conf" "/y" "%_PGDATA%"  "/y"
rem copy "%exe_path%\setup\pg_hba.conf" "/y" "%_PGDATA%"  "/y"
rem pg_ctl restart -m fast>> restart.txt 2>&1
