@if "%SCM_TRACE_LEVEL%" NEQ "4" @echo off

:: ----------------------
:: KUDU Deployment Script
:: Version: 1.0.2
:: ----------------------

:: Prerequisites
:: -------------

:: Verify node.js installed
where node 2>nul >nul
IF %ERRORLEVEL% NEQ 0 (
  echo Missing node.js executable, please install node.js, if already installed make sure it can be reached from current environment.
  goto error
)

:: Setup
:: -----

setlocal enabledelayedexpansion

SET ARTIFACTS=%~dp0%..\artifacts

IF NOT DEFINED DEPLOYMENT_SOURCE (
  SET DEPLOYMENT_SOURCE=%~dp0%.
)

IF NOT DEFINED DEPLOYMENT_TARGET (
  SET DEPLOYMENT_TARGET=%ARTIFACTS%\wwwroot
)

IF NOT DEFINED NEXT_MANIFEST_PATH (
  SET NEXT_MANIFEST_PATH=%ARTIFACTS%\manifest

  IF NOT DEFINED PREVIOUS_MANIFEST_PATH (
    SET PREVIOUS_MANIFEST_PATH=%ARTIFACTS%\manifest
  )
)

IF NOT DEFINED KUDU_SYNC_CMD (
  :: Install kudu sync
  echo Installing Kudu Sync
  call npm install kudusync -g --silent
  IF !ERRORLEVEL! NEQ 0 goto error

  :: Locally just running "kuduSync" would also work
  SET KUDU_SYNC_CMD=%appdata%\npm\kuduSync.cmd
)

IF NOT DEFINED DEPLOYMENT_TEMP (
  SET DEPLOYMENT_TEMP=%DEPLOYMENT_SOURCE%\..\TEMP
)

IF NOT DEFINED BIN_PATH (
  SET BIN_PATH=%ARTIFACTS%\..\bin
)

IF NOT EXIST %BIN_PATH% (
  echo create bin dir
  call mkdir %BIN_PATH%
) 

IF NOT DEFINED WYAM_PATH (
  SET WYAM_PATH=%BIN_PATH%\Wyam
)

IF NOT DEFINED WYAM_SOURCE (
  SET WYAM_SOURCE=%BIN_PATH%\WyamSource
)

IF EXIST %WYAM_PATH%\wyam.exe (
  SET WYAM_CMD=%BIN_PATH%\Wyam\Wyam\bin\Debug\wyam.exe
)

IF NOT DEFINED WYAM_CMD (
  :: Install wyam
  echo Installing Wyam

  IF EXIST %WYAM_SOURCE% (
    echo Deleting old Source
    call del %WYAM_SOURCE%
    IF !ERRORLEVEL! NEQ 0 goto error
  )

  echo Clone Reposetory
  call git clone https://github.com/Wyamio/Wyam.git %WYAM_SOURCE%
  IF !ERRORLEVEL! NEQ 0 goto error

  echo Runing Nuget Restore
  call nuget restore %WYAM_SOURCE%
  IF !ERRORLEVEL! NEQ 0 goto error

  echo Buld Wyam
  call msbuild %WYAM_SOURCE%\wyam.sln
  IF !ERRORLEVEL! NEQ 0 goto error

  IF NOT EXIST %WYAM_PATH% (
    echo Creating Wyam Folder
    call mkdir %WYAM_PATH%
    IF !ERRORLEVEL! NEQ 0 goto error
  )

  echo Move Wyam to execution folder
  call move %WYAM_SOURCE%\Wyam\bin\Debug\* %WYAM_PATH%
  IF !ERRORLEVEL! NEQ 0 goto error

  echo Delete Source
  call del %WYAM_SOURCE%
  IF !ERRORLEVEL! NEQ 0 goto error


  SET WYAM_CMD=%WYAM_PATH%\wyam.exe
)

IF NOT EXIST %DEPLOYMENT_TEMP% (
  call mkdir %DEPLOYMENT_TEMP%
) 

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Deployment
:: ----------

echo Building Website.

call %WYAM_CMD% %DEPLOYMENT_SOURCE% --output %DEPLOYMENT_TEMP%
IF !ERRORLEVEL! NEQ 0 goto error

:: 1. KuduSync
IF /I "%IN_PLACE_DEPLOYMENT%" NEQ "1" (
  call :ExecuteCmd "%KUDU_SYNC_CMD%" -v 50 -f "%DEPLOYMENT_TEMP%" -t "%DEPLOYMENT_TARGET%" -n "%NEXT_MANIFEST_PATH%" -p "%PREVIOUS_MANIFEST_PATH%" -i ".git;.hg;.deployment;deploy.cmd"
  IF !ERRORLEVEL! NEQ 0 goto error
)

  echo Delete Build Artefacts
  call del %DEPLOYMENT_TEMP%
  IF !ERRORLEVEL! NEQ 0 goto error

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Post deployment stub
IF DEFINED POST_DEPLOYMENT_ACTION call "%POST_DEPLOYMENT_ACTION%"
IF !ERRORLEVEL! NEQ 0 goto error

goto end

:: Execute command routine that will echo out when error
:ExecuteCmd
setlocal
set _CMD_=%*
call %_CMD_%
if "%ERRORLEVEL%" NEQ "0" echo Failed exitCode=%ERRORLEVEL%, command=%_CMD_%
exit /b %ERRORLEVEL%

:error
endlocal
echo An error has occurred during web site deployment.
call :exitSetErrorLevel
call :exitFromFunction 2>nul

:exitSetErrorLevel
exit /b 1

:exitFromFunction
()

:end
endlocal
echo Finished successfully.
