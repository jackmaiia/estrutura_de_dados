@echo off
SET THEFILE=c:\users\mauro lucio\desktop\programação e estruturação\estrutura de dados 2\funcionando\bubblesort\bubblesort.exe
echo Linking %THEFILE%
c:\dev-pas\bin\ldw.exe      -o "c:\users\mauro lucio\desktop\programação e estruturação\estrutura de dados 2\funcionando\bubblesort\bubblesort.exe" link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
