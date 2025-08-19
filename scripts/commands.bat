@echo off
REM =========================
REM Set path of the .bat file
REM =========================
set SCRIPT_PATH=%~dp0
echo Script folder: %SCRIPT_PATH%

REM =========================
REM Deploy MySQL
REM =========================
echo ====================================
echo Deploying MySQL...
echo ====================================
oc apply -f infrastructure/k8s/mysql-deployment.yaml
echo MySQL deployment applied.
echo.

REM =========================
REM Build and Push Docker
REM =========================
echo ====================================
echo Building Docker image...
echo ====================================
docker build -t shuki/data .
echo Docker image built.
docker tag shuki/data shuki120/data
docker push shuki120/data
echo Docker image pushed.
echo.

REM =========================
REM Deploy FastAPI (data-loader)
REM =========================
echo ====================================
echo Deploying FastAPI (data-loader)...
echo ====================================
oc apply -f infrastructure/k8s/data-loader-deployment.yaml
echo FastAPI deployment applied.
echo.

REM =========================
REM Wait for pods to be Ready
REM =========================
echo ====================================
echo Waiting for pods to be ready...
echo ====================================
:waitloop
oc get pods | findstr /R /C:"Running" >nul
if errorlevel 1 (
    echo Pods not ready yet, waiting 5 seconds...
    timeout /t 5 >nul
    goto waitloop
)
echo All pods are running.
echo.

REM =========================
REM Run SQL scripts
REM =========================
echo ====================================
echo Running SQL scripts...
echo ====================================
oc exec -i deployment/mysql -- mysql -u shukiDB -p1234 mydb < "%SCRIPT_PATH%create_table.sql"
echo create_table.sql executed.
oc exec -i deployment/mysql -- mysql -u shukiDB -p1234 mydb < "%SCRIPT_PATH%insert_data.sql"
echo insert_data.sql executed.
echo.

REM =========================
REM Get FastAPI URL from Route
REM =========================
echo ====================================
echo Fetching FastAPI URL from Route...
echo ====================================
for /f "tokens=*" %%i in ('oc get route data-loader -o jsonpath^="{.spec.host}"') do set FASTAPI_HOST=%%i
set FASTAPI_URL=http://%FASTAPI_HOST%/data
echo FastAPI URL is: %FASTAPI_URL%
echo.

REM =========================
REM Open FastAPI in browser
REM =========================
echo ====================================
echo Opening FastAPI in browser...
echo ====================================
start "" %FASTAPI_URL%
echo Done!
pause
