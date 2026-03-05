@echo off
goto priv
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
echo Oracle client 32/64 bit switching script
set /p bits="Enter 32 or 64 to confirm which config you wish to change to: (32/64) "
goto %bits%
:32
echo 32-bit selected
echo Setting PATH variable...
setx Path "C:\Program Files (x86)\Common Files\Oracle\Java\java8path;C:\Program Files (x86)\Common Files\Oracle\Java\javapath;C:\Program Files\Microsoft\jdk-11.0.24.8-hotspot\bin;C:\Apps\oracle_64\product\11.2.0\client_32bit\BIN;C:\Apps\oracle_64\product\11.2.0\client_64bit\BIN;%SystemRoot%\system32;%SystemRoot%;%SystemRoot%\System32\Wbem;%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\;%SYSTEMROOT%\System32\OpenSSH\;C:\Program Files\dotnet\;C:\Program Files\Git\cmd;C:\ProgramData\chocolatey\bin;" /m
echo Setting ORACLE_HOME variable...
setx ORACLE_HOME "C:\Apps\oracle_64\product\11.2.0\client_32bit" /m
goto end
:64
echo Switching PATH variable...
setx Path "C:\Program Files (x86)\Common Files\Oracle\Java\java8path;C:\Program Files (x86)\Common Files\Oracle\Java\javapath;C:\Program Files\Microsoft\jdk-11.0.24.8-hotspot\bin;C:\Apps\oracle_64\product\11.2.0\client_64bit\BIN;C:\Apps\oracle_64\product\11.2.0\client_32bit\BIN;%SystemRoot%\system32;%SystemRoot%;%SystemRoot%\System32\Wbem;%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\;%SYSTEMROOT%\System32\OpenSSH\;C:\Program Files\dotnet\;C:\Program Files\Git\cmd;C:\ProgramData\chocolatey\bin;" /m
echo Setting ORACLE_HOME variable...
setx ORACLE_HOME "C:\Apps\oracle_64\product\11.2.0\client_64bit" /m
goto end
:end
echo End of program!
pause
