@echo off

echo --------------------------------------------------------------------------------
echo                             rAthenaCN �����Ŷӳ�Ʒ
echo                     _               ____ _ _            _
echo                    ^| ^|    ___  ___ / ___^| (_) ___ _ __ ^| ^|_
echo                    ^| ^|   / _ \/ _ \ ^|   ^| ^| ^|/ _ \ '_ \^| __^|
echo                    ^| ^|__^|  __/  __/ ^|___^| ^| ^|  __/ ^| ^| ^| ^|_
echo                    ^|_____\___^|\___^|\____^|_^|_^|\___^|_^| ^|_^|\__^|
echo.
echo                               http://rathena.cn/
echo.
echo              rAthenaCN ģ���������о�ѧϰʹ�ã���Ī������ҵ��;��
echo          ��ʹ�� rAthenaCN �����ķ������Σ�rAthenaCN �����ŶӸŲ�����
echo.
echo --------------------------------------------------------------------------------
:main
	echo [��Ϣ] �Ƿ����� LeeClient ��Ŀ¼, ʹ��ص�������ʱ��״̬?
	echo.
	echo [ע��] �˽ű�����������¹���:
	echo.
	echo        - �Ƴ���Ŀ¼�µ� _tmpEmblem ^| memo ^| Replay ^| savedata �ļ���
	echo        - �Ƴ� data/luafiles514 �ļ���
	echo        - �Ƴ� data/msgstringtable.txt �ļ�
	echo        - �Ƴ���Ŀ¼�³��� setup.exe ֮���һ�� exe �ļ�
	echo.
	set /p input=[ѡ��] ȷ��Ҫ����������?(y/n)
	if /i "%input%"=="n" exit
	if /i "%input%"=="y" goto clean
	echo. & goto main
:clean
	echo.
	if exist "..\_tmpEmblem" (
		rd /q /s "..\_tmpEmblem"
	)
	if exist "..\memo" (
		rd /q /s "..\memo"
	)
	if exist "..\Replay" (
		rd /q /s "..\Replay"
	)
	if exist "..\savedata" (
		rd /q /s "..\savedata"
	)
	if exist "..\data\luafiles514" (
		rd /q /s "..\data\luafiles514"
	)
	if exist "..\data\msgstringtable.txt" (
		del /q "..\data\msgstringtable.txt"
	)
	
	rem =================================================
	rem �Ƴ���Ŀ¼�³��� setup.exe ֮���һ�� exe �ļ�
	rem =================================================
	for %%i in (..\*.exe) do (
		if  /i not "%%i"=="..\setup.exe" (
			del /q "%%i"
		)
	)
	
	echo [��Ϣ] �������...
pause