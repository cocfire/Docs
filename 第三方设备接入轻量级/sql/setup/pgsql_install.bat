
::@echo off
set service_name=Postgresql
set service_name1=postgresql
::(安装包)文件名称
set zip_file=postgresql-10.7-1-windows-binaries.zip
set curr_path=%~dp0
set exe_path=%1
set exe_path=%exe_path:"=%
set temp_path = %PGHOME%

::安装路径
cd %exe_path%
cd ../
set install_path=%cd%
cd %curr_path%

set _PGHOME=%install_path%\pgsql
::环境初始化
::路径长度1024字符

::查询是否存在
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
::环境初始化
setx PGHOME "%_PGHOME%" /m
::路径长度1024字符
::setx PATH "%_PGHOME%\\bin;%path%">> err.txt 2>&1 /m
setx PGLIB "%_PGHOME%\\lib" /m
setx PGDATA "%_PGHOME%\\data" /m
setx PGHOST localhost /m
setx PGPORT 5432 /m
setx PGDATABASE postgres /m
setx PGUSER postgres /m
::解压文件到指定目录
if exist "%_PGHOME%" (
	taskkill /IM postgres.exe /F /T
	rmdir /s /Q "%_PGHOME%"
	)
cd %exe_path%\setup
winrar x -y "%zip_file%" "%install_path%" >> ..\err.txt 2>&1
if errorlevel 1 (
	echo WSH.Echo MsgBox("数据库安装文件提取失败", 48, "错误"^)>%temp%\msgbox.vbs
	cscript /nologo %temp%\msgbox.vbs
	del /q %temp%\msgbox.vbs
	exit -1
	)
cd %install_path%\pgsql
::创建数据文件夹
md data
::net user postgres e2000jl /add
::将data目录的权限赋给postgres
::cacls data /e /t /r administrator
::cacls data /e /t /g postgres:F
cacls data /e /t /g %username%:F
cd %_PGHOME%\bin\
set _PGDATA=%_PGHOME%\\data
::初始化数据库
initdb -D "%_PGDATA%" -E UTF8 --locale=C -U postgres >> err.txt 2>&1
if errorlevel 1 (
	echo WSH.Echo MsgBox("数据库初始化失败", 48, "错误"^)>%temp%\msgbox.vbs
	cscript /nologo %temp%\msgbox.vbs
	del /q %temp%\msgbox.vbs
	exit -1
	)
::运行数据库服务器
pg_ctl -D "%_PGDATA%" -w start >> err.txt 2>&1
if errorlevel 1 (
	echo WSH.Echo MsgBox("数据库服务器启动失败", 48, "错误"^)>%temp%\msgbox.vbs
	cscript /nologo %temp%\msgbox.vbs
	del /q %temp%\msgbox.vbs
	exit -1
	)
call :createDB
::关闭数据库服务器
pg_ctl -D "%_PGDATA%" -w stop
::注册服务
::runas /user:administrator "pg_ctl register -D \"%PGDATA%\" -N %service_name%"
pg_ctl register -D "%_PGDATA%" -N %service_name% >> err.txt 2>&1
if errorlevel 1 (
	echo WSH.Echo MsgBox("数据库服务注册失败", 48, "错误"^)>%temp%\msgbox.vbs
	cscript /nologo %temp%\msgbox.vbs
	del /q %temp%\msgbox.vbs
	exit -1
	)
::启动服务
net start %service_name% >> err.txt 2>&1
if errorlevel 1 (
	echo WSH.Echo MsgBox("数据库服务启动失败", 48, "错误"^)>%temp%\msgbox.vbs
	cscript /nologo %temp%\msgbox.vbs
	del /q %temp%\msgbox.vbs
	exit -1
	)
exit


:pgsqlExist
REM echo pgsqlExist11 >> d:\setup.txt
REM 若有plsy这个用户，进行询问是否重装，否则直接创建用户和数据库
::cd  "%PGHOME%\bin\"
cd  pgsql\bin
REM psql -U postgres -w -c "\du" | findstr plsy && call :reInstall || call :createDB	
psql -U postgres -w -c "\du" | findstr plsy && goto reInstall || goto createDB
::echo ttt >> d:\setup.txt
exit

:pgsqlExist1
echo WSH.Echo MsgBox("已手动安装过PostgreSQL数据库，如需重新安装请先手动删除原PostgreSQL数据库", 0, "提示")>%temp%\msgbox.vbs
	cscript /nologo %temp%\msgbox.vbs
	del /q %temp%\msgbox.vbs
	exit

:reInstall
::psql -U postgres -w -c "\l"
::psql -U plsy -d facebase -w -c "\dt"
echo WSH.Echo MsgBox("本机已安装Postgresql数据库，是否重新安装，重新安装将覆盖原有数据！", 4, "提示")>%temp%\msgbox.vbs
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
::echo WSH.Echo MsgBox("开始创建用户及数据库", 0, "提示")>%temp%\msgbox.vbs
::cscript /nologo %temp%\msgbox.vbs
::del /q %temp%\msgbox.vbs
::创建普通用户
psql -h localhost -p 5432 -U postgres -w -c "create user plsy password 'e2000jl' CREATEDB;" | findstr "CREATE ROLE"
if errorlevel 1 (
	echo WSH.Echo MsgBox("创建数据库用户失败", 48, "错误"^)>%temp%\msgbox.vbs
	cscript /nologo %temp%\msgbox.vbs
	del /q %temp%\msgbox.vbs
	exit -1
	)
::创建数据库
::echo %username%r
psql -h localhost -p 5432 -U postgres -w -c "create database facedata owner plsy;" | findstr "CREATE DATABASE"
if errorlevel 1 (
	echo WSH.Echo MsgBox("创建数据库facedata失败", 48, "错误"^)>%temp%\msgbox.vbs
	cscript /nologo %temp%\msgbox.vbs
	del /q %temp%\msgbox.vbs
	exit -1
	)
rem psql -h localhost -p 5432 -U postgres -w -c "create database facegate owner plsy;" | findstr "CREATE DATABASE"
rem if errorlevel 1 (
rem 	echo WSH.Echo MsgBox("创建数据库facegate失败", 48, "错误"^)>%temp%\msgbox.vbs
rem 	cscript /nologo %temp%\msgbox.vbs
rem 	del /q %temp%\msgbox.vbs
rem 	exit -1
rem 	)
::创建数据表
psql -h localhost -p 5432 -U plsy -d facedata -w -f "%exe_path%\setup\facedata_create_table.sql" 
if errorlevel 1 (
	echo WSH.Echo MsgBox("数据库facedata数据表创建失败", 48, "错误"^)>%temp%\msgbox.vbs
	cscript /nologo %temp%\msgbox.vbs
	del /q %temp%\msgbox.vbs
	exit -1
	)
rem psql -h localhost -p 5432 -U plsy -d facegate -w -f "%exe_path%\setup\facegate_create_table.sql" 
rem if errorlevel 1 (
rem 	echo WSH.Echo MsgBox("数据库facegate数据表创建失败", 48, "错误"^)>%temp%\msgbox.vbs
rem 	cscript /nologo %temp%\msgbox.vbs
rem 	del /q %temp%\msgbox.vbs
rem 	exit -1
rem 	)

psql -h localhost -p 5432 -U postgres -w -c "create database facegate owner plsy;" | findstr "CREATE DATABASE"
if errorlevel 1 (
	echo WSH.Echo MsgBox("创建数据库facegate失败", 48, "错误"^)>%temp%\msgbox.vbs
	cscript /nologo %temp%\msgbox.vbs
	del /q %temp%\msgbox.vbs
	exit -1
	)
rem psql -h localhost -p 5432 -U postgres -w -c "create database facegate owner plsy;" | findstr "CREATE DATABASE"
rem if errorlevel 1 (
rem 	echo WSH.Echo MsgBox("创建数据库facegate失败", 48, "错误"^)>%temp%\msgbox.vbs
rem 	cscript /nologo %temp%\msgbox.vbs
rem 	del /q %temp%\msgbox.vbs
rem 	exit -1
rem 	)
::创建数据表
psql -h localhost -p 5432 -U plsy -d facegate -w -f "%exe_path%\setup\facegate_create_table.sql" 
if errorlevel 1 (
	echo WSH.Echo MsgBox("数据库facegate数据表创建失败", 48, "错误"^)>%temp%\msgbox.vbs
	cscript /nologo %temp%\msgbox.vbs
	del /q %temp%\msgbox.vbs
	exit -1
	)

psql -h localhost -p 5432 -U plsy -d facegate -w -f "%exe_path%\setup\facegate_insert.sql" 
if errorlevel 1 (
	echo WSH.Echo MsgBox("设置通信服务IP参数失败", 48, "错误"^)>%temp%\msgbox.vbs
	cscript /nologo %temp%\msgbox.vbs
	del /q %temp%\msgbox.vbs
	exit -1
	)
rem psql -h localhost -p 5432 -U plsy -d facegate -w -f "%exe_path%\setup\facegate_create_table.sql" 
rem if errorlevel 1 (
rem 	echo WSH.Echo MsgBox("数据库facegate数据表创建失败", 48, "错误"^)>%temp%\msgbox.vbs
rem 	cscript /nologo %temp%\msgbox.vbs
rem 	del /q %temp%\msgbox.vbs
rem 	exit -1
rem 	)
rem copy "%exe_path%\setup\postgresql.conf" "/y" "%_PGDATA%"  "/y"
rem copy "%exe_path%\setup\pg_hba.conf" "/y" "%_PGDATA%"  "/y"
rem pg_ctl restart -m fast>> restart.txt 2>&1
