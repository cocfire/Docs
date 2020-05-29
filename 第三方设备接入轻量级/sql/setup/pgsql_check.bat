
::@echo off
set service_name=Postgresql
set service_name1=postgresql

::≤È—Ø «∑Ò¥Ê‘⁄
sc query type= all state= all | findstr %service_name% && goto pgsqlExist || goto pgsqlNotExist

:pgsqlNotExist
sc query type= all state= all | findstr %service_name1% && goto pgsqlExist || goto pgsqlNotExist1
:pgsqlNotExist1
exit -1

:pgsqlExist
exit
