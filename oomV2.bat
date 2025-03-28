@echo off
setlocal

@echo off
chcp 65001 >nul
cls
echo. 
echo                        //////////////////////////////////////////////////////////////////////
echo                        ////////////////////////////////////////////////////////////////////// 
echo                        //////////  ████████    ████████   ███    ███  ██       ██  //////////   
echo                        ////////// ██      ██  ██      ██  ██ █  █ ██   ██     ██   ////////// 
echo                        ////////// ██      ██  ██      ██  ██  ██  ██    ██   ██    //////////
echo                        ////////// ██      ██  ██      ██  ██      ██     ██ ██     ////////// 
echo                        //////////  ████████    ████████   ██      ██      ███      ////////// 
echo                        //////////////////////////////////////////////////////////////////////
echo                        //////////////////////////////////////////////////////////////////////
echo.


:: Ensure that the script runs from its own folder
cd /d "%~dp0"

:: Defining paths
set "fichier=%CD%\d3d11.dll"
set "fichierDeux=%CD%\BorderlandsMods"
set "Borderlands3=%CD%\Borderlands3.exe"

:: Checking the actual path
echo Path of script : %CD% > log.txt
echo Path of game : %Borderlands3% >> log.txt

:: Check if the executable exists
if not exist "%Borderlands3%" (
    echo ERROR: The Borderlands3.exe file cannot be found! >> log.txt
    echo ERROR: Borderlands3.exe cannot be found
    pause
    exit /b
)

:: Ask the user to enable or disable mods
set /p reponse="Would you want Activate(1) or Desactivate(2) the mods (1/2)? "

:: Check if the folder exists, if not create it
if not exist "%fichierDeux%" (
    mkdir "%fichierDeux%"
)

:: Activate mods (1)
if /i "%reponse%"=="1" (
    if exist "%fichier%" (
        echo The mods are already enabled!
        echo The mods are already enabled! >> log.txt
    ) else (
        move /Y "%fichierDeux%\d3d11.dll" "%fichier%"
        echo The mods are now enabled!
        echo The mods are now enabled! >> log.txt
    )
    echo Launching the game...
    echo Launching the game... >> log.txt
    start "" "%Borderlands3%" >> log.txt 2>&1
    timeout /t 5 >nul
    exit
)

:: Deactivating mods (2)
if /i "%reponse%"=="2" (
    if exist "%fichier%" (
        move /Y "%fichier%" "%fichierDeux%"
        echo The mods are now disabled!
        echo The mods are now disabled! >> log.txt
    ) else (
        echo The mods are already disabled!
        echo The mods are already disabled! >> log.txt
    )
    echo Launching the game...
    echo Lanching the game... >> log.txt
    start "" "%Borderlands3%" >> log.txt 2>&1
    timeout /t 5 >nul
    exit
)

:: If the user has entered an invalid response
echo Invalid entry. Please enter 1 to enable or 2 to disable.
echo Invalid entry >> log.txt
pause

:: Close the terminal automatically after 5 seconds
timeout /t 5 >nul
exit
