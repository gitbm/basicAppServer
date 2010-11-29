@rem 
@rem Licensed to the Apache Software Foundation (ASF) under one
@rem or more contributor license agreements.  See the NOTICE file
@rem distributed with this work for additional information
@rem regarding copyright ownership.  The ASF licenses this file
@rem to you under the Apache License, Version 2.0 (the
@rem "License"); you may not use this file except in compliance
@rem with the License.  You may obtain a copy of the License at
@rem 
@rem  http://www.apache.org/licenses/LICENSE-2.0
@rem 
@rem Unless required by applicable law or agreed to in writing,
@rem software distributed under the License is distributed on an
@rem "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
@rem KIND, either express or implied.  See the License for the
@rem specific language governing permissions and limitations
@rem under the License.
@rem 

@rem 
@rem $Rev: 899562 $ $Date: 2010-01-15 03:38:04 -0500 (Fri, 15 Jan 2010) $
@rem 

@rem --------------------------------------------------------------------
@rem start-server batch file for Geronimo that starts Geronimo in foreground.
@rem
@rem This batch file calls the gsh.bat script passing "geronimo/start-server
@rem followed by the arguments supplied by the caller.
@rem
@rem Alternatively you can use the more comprehensive gsh.bat file directly.
@rem
@rem Invocation Syntax:
@rem
@rem   start-server [geronimo_args ...]
@rem
@rem Environment Variable Prequisites:
@rem
@rem   Refer to the GShell documentation for information on environment
@rem   variables etc.
@rem
@rem --------------------------------------------------------------------

@if "%GERONIMO_BATCH_ECHO%" == "on"  echo on
@if not "%GERONIMO_BATCH_ECHO%" == "on"  echo off

@setlocal enableextensions

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.\
cd /d %DIRNAME%

set EXECUTABLE=%DIRNAME%\gsh.bat

@REM Check that target executable exists
if exist "%EXECUTABLE%" goto okExec
echo ERROR - Cannot find required script %EXECUTABLE%
cmd /c exit /b 1
goto end

:okExec
@REM Get remaining unshifted command line arguments and save them in the
set CMD_LINE_ARGS=
:setArgs
if ""%1""=="""" goto doneSetArgs
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto setArgs
:doneSetArgs

call "%EXECUTABLE%" -c "geronimo/start-server %CMD_LINE_ARGS%"

:end
@REM pause the batch file if GERONIMO_BATCH_PAUSE is set to 'on'
if "%GERONIMO_BATCH_PAUSE%" == "on" pause
@endlocal
cmd /c exit /b %errorlevel%
