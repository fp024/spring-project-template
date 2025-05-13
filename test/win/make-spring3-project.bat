@ECHO OFF
IF EXIST set-env.bat (
  CALL set-env.bat
) else (
  ECHO set-env.bat file does not exist, loading default settings.
  CALL set-env-default.bat
)

SET JAVA_HOME=%JAVA_8_HOME%
@ECHO JAVA_HOME=%JAVA_HOME%

SET GROUP_ID=org.fp024.sample
SET ARTIFACT_ID=spring3-mvc-sample
SET PACKAGE=org.fp024.sample

@ECHO ### Create %ARTIFACT_ID% Project ###

SET REPO_ROOT_DIR=%~dp0
IF EXIST "%REPO_ROOT_DIR%%ARTIFACT_ID%" (
    @rmdir /S /Q "%REPO_ROOT_DIR%%ARTIFACT_ID%"
)

@%MAVEN_HOME%\bin\mvn archetype:generate ^
  -DarchetypeGroupId=org.fp024.archetype ^
  -DarchetypeArtifactId=spring3-mvc-project-archetype ^
  -DarchetypeVersion=1.0.0-SNAPSHOT ^
  -DgroupId=%GROUP_ID% ^
  -DartifactId=%ARTIFACT_ID% ^
  -Dpackage=%PACKAGE%

@ECHO "%ARTIFACT_ID% Project is created."
PAUSE
