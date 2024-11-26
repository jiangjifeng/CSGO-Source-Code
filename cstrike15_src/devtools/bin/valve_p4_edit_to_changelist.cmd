@echo off

:: // This will make all new env variables local to this script 
setlocal

:: // Make sure we have 2 args
if .%2.==.. (
    echo *** Error calling command! No file or description specified for checkout! Usage: script.cmd file "Description"
    endlocal
    exit /b 1
)

:: // Get file info
set valveTmpFullFilePath="%~f1"

if "%valveTmpFullFilePath%"=="" (
    echo *** Error! Can't parse filename "%1"!
    endlocal
    exit /b 1
)

:: // Here you can add your own logic to handle the file without p4
echo Editing file: %valveTmpFullFilePath%

:: // Perform your desired operations on the file here

goto End

:End
endlocal
exit /b 0