@echo off

SET VSWHERE="C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere"

:: See https://github.com/microsoft/vswhere/wiki/Find-VC
for /f "usebackq delims=*" %%i in (`%VSWHERE% -latest -property installationPath`) do (
  call "%%i"\Common7\Tools\vsdevcmd.bat %*
)

:: Loop over all environment variables and make them global by using environment files.
:: See: https://docs.github.com/en/free-pro-team@latest/actions/reference/workflow-commands-for-github-actions#environment-files
:: See: https://stackoverflow.com/questions/39183272/loop-through-all-environmental-variables-and-take-actions-depending-on-prefix
setlocal
for /f "delims== tokens=1,2" %%a in ('set') do (
  echo %%a=%%b >> $GITHUB_ENV
)
endlocal