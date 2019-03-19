@ECHO OFF
IF EXIST c:\dif.txt (
   DEL c:\dif.txt )  
c:\diferencialOracle2.exe "c:\dif.txt"
IF EXIST c:\dif.txt GOTO ERRO
:SUCESSO
echo "Rotina processada com sucesso !!!"
EXIT 0
:ERRO
TYPE c:\dif.txt
EXIT 1


