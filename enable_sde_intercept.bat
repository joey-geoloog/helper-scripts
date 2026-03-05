@echo off
goto prompt
:priv
echo Checking prompt elevation status
net session >nul 2>&1
if %errorLevel% == 0 (
    goto prompt
) else (
    echo ERROR - Run this script as administrator
	goto end
)
:prompt
echo ArcSDE INTERCEPT (De)activation script
set /p t="Would you like to (E)nable or (D)isable SDE Intercept (E/D): "
goto %t%
:E
echo Enabling SDEINTERCEPT...
setx SDEINTERCEPTLOC E:\SDEINTERCEPT
setx SDEINTERCEPT "crwTf"
goto end
:D
echo Disabling SDEINTERCEPT...
setx SDEINTERCEPT ""
setx SDEINTERCEPTLOC ""
goto end
:end
echo End of program!
pause
