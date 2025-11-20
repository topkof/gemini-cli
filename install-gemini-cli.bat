@echo off
echo ============================================
echo   Gemini CLI 安装脚本
echo ============================================

:: 检查 Node.js 是否安装
node -v >nul 2>&1
if %errorlevel% neq 0 (
    echo 未检测到 Node.js，正在下载安装...
    set TEMP_NODE=%TEMP%\nodejs.msi
    powershell -Command "Invoke-WebRequest -Uri 'https://nodejs.org/dist/v20.18.0/node-v20.18.0-x64.msi' -OutFile '%TEMP_NODE%'"
    msiexec /i "%TEMP_NODE%" /quiet /norestart
    echo Node.js 安装完成，请重新运行此脚本。
    exit /b
)

:: 安装 Gemini CLI
echo 正在安装 Gemini CLI...
npm install -g @google/gemini-cli

:: 设置 API Key（替换 YOUR_API_KEY 为你自己的）
setx GEMINI_API_KEY "YOUR_API_KEY"

echo ============================================
echo Gemini CLI 安装完成！
echo 请重新打开终端并运行 gemini 命令。
echo 示例： gemini -p "写一个Python脚本"
echo ============================================

pause
