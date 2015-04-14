@echo off
set domainsDir=C:\xampp\htdocs\
set apacheExecutable=C:\xampp\apache\bin\httpd.exe
set vhostsFile=C:/xampp/apache/conf/extra/httpd-vhosts.conf
set vhostsPort=80
set /p domain="Enter domain: "

mkdir %domainsDir%%domain%
mkdir %domainsDir%%domain%\www
echo ^<VirtualHost %domain%:%vhostsPort%^> >> %vhostsFile%
echo DocumentRoot "C:/xampp/htdocs/%domain%/www" >> %vhostsFile%
echo ServerName %domain% >> %vhostsFile%
echo ServerAlias "%domain%" >> %vhostsFile%
echo ErrorLog "logs/%domain%-error.log" >> %vhostsFile%
echo CustomLog "logs/%domain%-access.log" common >> %vhostsFile%
echo ^<Directory "C:/xampp/htdocs/%domain%"^> >> %vhostsFile%
echo Allow From all >> %vhostsFile%
echo AllowOverride All >> %vhostsFile%
echo ^</Directory^> >> %vhostsFile%
echo ^</VirtualHost^> >> %vhostsFile%
echo 127.0.0.1 %domain% >> C:/Windows/System32/drivers/etc/hosts

%apacheExecutable% -k  restart
pause