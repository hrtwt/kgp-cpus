docker build -t kgp-exp .

for /f "usebackq" %%A in (`@cd`) do set PWD=%%A

for /l %%i in (1,1,12) do ^
docker run ^
       --rm ^
       --cpus %%i ^
       -v %PWD%\out:/root/out ^
       -e CPUS=%%i ^
       kgp-exp ^
       /bin/bash /root/scripts/exec.sh
