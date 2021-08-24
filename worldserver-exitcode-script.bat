@echo off
:start

worldserver.exe

:: For SHUTDOWN_EXIT_CODE
if %errorlevel% == 0 (
    echo Server has Shutdown and will not automatically restart.
    echo Shutdown Code is %errorlevel% SHUTDOWN_EXIT_CODE
    echo Press any key to restart WorldServer, press CTRL + C to exit.
    pause
    goto start
)

:: For RESTART_EXIT_CODE
if %errorlevel% == 2 (
    echo WorldServer will restart.
    echo Shutdown Code is %errorlevel% RESTART_EXIT_CODE
    echo Restarting in 15s.
    timeout /t 15 /nobreak
    goto start
)

:: For a custom shutdown code "15"
:: if %errorlevel% == 15 (
::     echo Shutdown Code is %errorlevel%
::     echo Press any key to restart WorldServer.
::     pause
::     goto start
:: )

:: For ERROR_EXIT_CODE
if %errorlevel% == 1 (
    echo Server has encountered an error.
    echo Shutdown Code is %errorlevel% ERROR_EXIT_CODE
    echo Press any key to restart WorldServer, press CTRL + C to exit.
    pause
    goto start
)

:: As batch doesn't have logical operators...
:: This is what we have to do to not break the script if an
:: unknown errorlevel is provided.
if NOT %errorlevel% == 0 (
    if NOT %errorlevel% == 1 (
        if NOT %errorlevel% == 2 (
            echo Shutdown Code is unknown.
            echo Shutdown Code is %errorlevel%
            echo Maybe this was a misstake? WorldServer will restart in 60s
            echo Press CTRL + C to cancel.
            timeout /t 60
            goto start
        )
    )
)
