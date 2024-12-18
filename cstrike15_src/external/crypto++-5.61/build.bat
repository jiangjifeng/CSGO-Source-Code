@setlocal

@if "%1"=="2013" goto 2013
@if "%1"=="2010" goto 2010
@if "%1"=="2015" goto 2015

@echo Specify 2010, 2013, or 2015 as a command line argument.
@exit /b

@:2010
set VARSBAT="%VS100COMNTOOLS%vsvars32.bat"
set SLN=cryptest2010
set PROJECT=cryptlib
@goto make

@:2013
set VARSBAT="%VS120COMNTOOLS%vsvars32.bat"
set SLN=cryptest2013
set PROJECT=cryptlib2013
@goto make

@:2015
set VARSBAT="%VS140COMNTOOLS%vsvars32.bat"
set SLN=cryptest2015
set PROJECT=cryptlib2015
@goto make

:make
if not defined VSINSTALLDIR (
    call %VARSBAT%
)

del *.lib /s

devenv %SLN%.sln /rebuild "release|win32" /project %PROJECT%
devenv %SLN%.sln /rebuild "debug|win32" /project %PROJECT%
devenv %SLN%.sln /rebuild "release|x64" /project %PROJECT%
devenv %SLN%.sln /rebuild "debug|x64" /project %PROJECT%

@echo The post-build steps in the .vcxproj file copy the .libs to the destinations.