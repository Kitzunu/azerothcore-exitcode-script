# azerothcore-exitcode-script

Windows Batch Script to read Exitcodes from AzerothCore

## How to use

The script is initially setup so that it should be placed within the same folder your Worldserver.exe file is located.

It is recommended that you run the file through the commandprompt.

You can easily do this by:

* openining Command Prompt (cmd) 

* Change your directory to the same one your script and worldserver is located. For example `cd E:\azerothcore\bin\RelWithDebInfo\`

* Start the script by typing the name of time file within cmd. For example `worldserver-exitcode-script.bat`

This will fire up the worldserver and whenever it gives any exit code the script will act accordingly.

## Adding custom exit codes

By default I have added a custom exit code "15", if you want to add your own custom exit codes and change what should happen you only need to make a new `if %errorlevel% == your_exit_code` and then add what should happen within.

## Exit Codes

By default these are the exit codes:

| Code | Name               |
| :--- | :----------------- |
| 0    | SHUTDOWN_EXIT_CODE |
| 1    | ERROR_EXIT_CODE    |
| 2    | RESTART_EXIT_CODE  |

To use your own custom codes you just have to specify them within the core to trigger at different points, or by using the [\#exit_code] argument of all restart and shutdown commands.
