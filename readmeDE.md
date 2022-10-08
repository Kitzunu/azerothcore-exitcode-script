# azerothcore-exitcode-script

Windows Batch Script zum Auslesen von Exitcodes aus dem [Azerothcore](https://github.com/azerothcore/azerothcore-wotlk) Worldserver.

## How to use

Das Script ist anfangs so eingestellt, dass es im gleichen Ordner wie worldserver.exe plaziert werden soll.

Das Script sollte vom Command Prompt (cmd) ausgeführt werden.

Dies ist ganz einfach möglich:

* Öffne den Command Prompt (drücke die Windows Taste, tippe cmd) 

* Navigiere zum Ordner in dem sich das Script und worldserver exe befinden. Zum Beispiel `cd E:\azerothcore\bin\RelWithDebInfo\`

* Starte das Script, indem man den Namen der Script-Datei schreibt in cmd. Zum Beispiel `worldserver-exitcode-script.bat`

Dies wird den World Server starten und falls dieser einen Exitcode ausgibt, wird sich das Script entsprechend verhalten.

## Nicht-Standardisierte Exitcodes hinzufügen

Standardmäßig have ich den benutzerdefinierten Exitcode "15" hinzugefügt. Falls du deine eigenen benutzerdefinierten Exitcodes hinzufügen und festlegen möchtest, was passieren soll, wenn sie auftreten, musst du nur eine neue Bedingung hinzufügen: `if %errorlevel% == your_exit_code` und was daraufhin passieren soll.

## Exit Codes

Standardmäßig gibt es die folgenden Exitcodes:

| Code | Name               |
| :--- | :----------------- |
| 0    | SHUTDOWN_EXIT_CODE |
| 1    | ERROR_EXIT_CODE    |
| 2    | RESTART_EXIT_CODE  |

Um benutzerdefinierte Exitcodes zu verwenden, müssen sie innerhalb des cores spezifiziert werden oder indem der [\#exit_code] Parameter aller Restart und Shutdown Befehle genutzt wird.
