
for %%i in (debug release) do (
    copy Win32\output\%%i\cryptlib.lib   ..\..\lib\win32\%%i\cryptlib.lib ..\..
    copy  x64\output\%%i\cryptlib.lib    ..\..\lib\win64\%%i\cryptlib.lib ..\..
)
