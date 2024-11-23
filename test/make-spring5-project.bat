@ECHO OFF
SET GROUP_ID=org.fp024.sample
SET ARTIFACT_ID=spring5-mvc-sample
SET PACKAGE=org.fp024.sample

@ECHO ### Create %ARTIFACT_ID% Project ###
IF EXIST set-env.bat (
  CALL set-env.bat
) else (
  ECHO set-env.bat file does not exist, loading default settings.
  CALL set-env-default.bat
)

SET REPO_ROOT_DIR=%~dp0
IF EXIST "%REPO_ROOT_DIR%%ARTIFACT_ID%" (
    @rmdir /S /Q "%REPO_ROOT_DIR%%ARTIFACT_ID%"
)

@%MAVEN_HOME%\bin\mvn archetype:generate ^
  -DarchetypeGroupId=org.fp024.archetype ^
  -DarchetypeArtifactId=spring5-mvc-project-archetype ^
  -DarchetypeVersion=1.0.0-SNAPSHOT ^
  -DgroupId=%GROUP_ID% ^
  -DartifactId=%ARTIFACT_ID% ^
  -Dpackage=%PACKAGE%

@ECHO "%ARTIFACT_ID% Project is created."
PAUSE
