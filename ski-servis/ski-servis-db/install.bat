@echo off
echo You are about to reinstall the local database, all data will be lost.
echo[
echo Would you like to continue? 
echo[  

set mysql_home=C:\Program Files\MySQL\MySQL Server 5.7\bin
set db_home=D:\projects\SkiServis\ski-servis\ski-servis-db\releases
set /P input="(Y/N)"

if /I "%input%" equ "y" (

    rem set local_server login path
    if not exist %APPDATA%\MySQL\.mylogin.cnf "%mysql_home%\mysql_config_editor" set --login-path=local_server --host=localhost --user=root --password

    rem print settings
    echo[
    "%mysql_home%\mysql_config_editor" print --login-path=local_server
    echo[

    rem position to db installation folder
    d:
    cd %db_home%

    rem iterate over sub-folders (sorted by name)
    for /f "tokens=*" %%a in ('dir /b /o') do (
      echo Installing %%a . . .

      rem execute install.sql
      echo %db_home%\%%a\scripts\install.sql
      "%mysql_home%\mysql" --login-path=local_server < "%db_home%\%%a\scripts\install.sql"

      rem execute test_data.sql
      echo %db_home%\%%a\scripts\test_data.sql
      "%mysql_home%\mysql" --login-path=local_server < "%db_home%\%%a\scripts\test_data.sql"

      echo[
    )

    echo Installation DONE.
    echo[
    pause
) else (	
    exit
)
