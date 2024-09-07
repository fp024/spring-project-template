@ECHO OFF
SET GROUP_ID=org.fp024.sample
SET ARTIFACT_ID=spring3-mvc-sample

@ECHO ### Create %ARTIFACT_ID% Project ###
@CALL .\set-env.bat

SET REPO_ROOT_DIR=%~dp0
IF EXIST "%REPO_ROOT_DIR%%ARTIFACT_ID%" (
    @rmdir /S /Q "%REPO_ROOT_DIR%%ARTIFACT_ID%"
)

@%MAVEN_HOME%\bin\mvn archetype:generate -DarchetypeGroupId=org.fp024.archetype -DarchetypeArtifactId=spring3-mvc-project-archetype -DarchetypeVersion=1.0.0-SNAPSHOT -DgroupId=org.fp024.sample -DartifactId=%ARTIFACT_ID%

@ECHO "%ARTIFACT_ID% Project is created."
PAUSE
