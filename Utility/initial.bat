@echo off
setlocal EnableDelayedExpansion

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
	rem �г�RagexeClientĿ¼�µ������ļ������ƣ����浽 ClientArray ����
	set index=0
	for /D %%i in (.\RagexeClient\*) do (
		set _DirectoryPath=%%i
		set _ClientVersion=!_DirectoryPath:~-10!
		set /a index=index+1
		set ClientArray[!index!]=!_ClientVersion!
	)
	
	echo [��Ϣ] ����ΪĿǰ LeeClient ֧�ֵĿͻ��˰汾:
	echo.
	for /l %%n in (1,1,!index!) do (
		echo        [%%n] - !ClientArray[%%n]!
	)
	echo.
	rem ���û�ѡ������һ��
	set /p input=[ѡ��] �����ĸ��ͻ��˰汾Ϊ���������г�ʼ��, ����д���������������[1-!index!]:
	if %input% lss 1 (
		echo [����] ��д����Ų���С��1, ����������...
		echo.
		goto main
	)
	if %input% gtr !index! (
		echo [����] ��д����Ų��ܴ���!index!, ����������...
		echo.
		goto main
	)
	
	echo [��Ϣ] ѡ���� !ClientArray[%input%]! Ϊ����...
	echo.
	echo [ע��] ȷ��ִ�к�, �˽ű�����������¹���:
	echo.
	echo        - �� RagexeClient/!ClientArray[%input%]!/Basic �е��ļ����ǵ� LeeClient ��Ŀ¼
	echo.
:confirm
	set /p confirm=[ѡ��] ȷ��Ҫִ�����ϳ�ʼ��������?(y/n)
	
	if /i "%confirm%"=="n" exit
	if /i "%confirm%"=="y" goto initial
	echo [����] ֻ��ѡ�� y ���� n ����������
	echo. & goto confirm
:initial
	rem ��ѡ�е� RagexeClient/{date}/Basic Ŀ¼�е�ȫ�������ǵ� LeeClient ��Ŀ¼
	echo.
	echo [��Ϣ] ���ڸ����ļ�, �����ĵȺ�...
	xcopy ".\RagexeClient\!ClientArray[%input%]!\Basic" "..\" /s /e /h /q /y
	echo [��Ϣ] �ļ��������, ��ʼ�������!...
	echo.
	echo [��Ϣ] �������³�ʼ��, ����ִ�� clean.bat ��������...
	echo.
pause