@echo off
:start

authserver.exe

:: As authserver cannot manually be restarted it can only be shutdown
:: so we only check for SHUTDOWN_EXIT_CODE and ERROR_EXIT_CODE just incase.

:: By default we do not automatically restart the server.

:: For SHUTDOWN_EXIT_CODE
if %errorlevel% == 0 (
    echo Server has Shutdown and will not automatically restart.
    echo Shutdown Code is %errorlevel% SHUTDOWN_EXIT_CODE
    echo Press any key to restart AuthServer, press CTRL + C to exit.
    pause
    goto start
)

:: For ERROR_EXIT_CODE
if %errorlevel% == 1 (
    echo Server has encountered an error.
    echo Shutdown Code is %errorlevel% ERROR_EXIT_CODE
    echo Press any key to restart AuthServer, press CTRL + C to exit.
    pause
    goto start
)

:: As batch doesn't have logical operators...
:: This is what we have to do to not break the script if an
:: unknown errorlevel is provided.
if NOT %errorlevel% == 0 (
    if NOT %errorlevel% == 1 (
        echo Shutdown Code is unknown.
        echo Shutdown Code is %errorlevel%
        echo Maybe this was a misstake? AuthServer will not automatically restart
        echo Press any key to restart AuthServer, press CTRL + C to exit.
        pause
        goto start
    )
)
