@ECHO create spring3-mvc-project
@ECHO OFF
@CALL .\set-env.bat
SET REPO_ROOT_DIR=%~dp0
SET PROJECT_NAME=spring3-mvc-sample

IF EXIST "%REPO_ROOT_DIR%%PROJECT_NAME%" (
    @rmdir /S /Q "%REPO_ROOT_DIR%%PROJECT_NAME%"
)

@%MAVEN_HOME%\bin\mvn archetype:generate -DarchetypeGroupId=org.fp024.archetype -DarchetypeArtifactId=spring3-mvc-project-archetype -DarchetypeVersion=1.0.0-SNAPSHOT -DgroupId=org.fp024.sample -DprojectName=%PROJECT_NAME% -DartifactId=%PROJECT_NAME%

@ECHO "%PROJECT_NAME% project is created."
PAUSE
