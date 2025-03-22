@ECHO OFF
:: 속성 파일 읽기 (주석(#)과 빈 줄 제외)
FOR /F "tokens=1,* delims==" %%A IN ('findstr /V /R "^[#]" cargo.properties ^| findstr /R /V "^$"') DO (
  SET %%A=%%B
)

@ECHO ### Tomcat %cargo_tomcat_version% Run ... ###

SET MAVEN_OPTS="-Dfile.encoding=UTF-8"

:: Maven 명령어 실행
mvn clean verify org.codehaus.cargo:cargo-maven2-plugin:run ^
  -DskipTests ^
  -DcargoContextPath=%cargo_context_path% ^
  -Dcargo.jvmargs="%cargo_jvmargs%" ^
  -Dcargo.maven.containerId=%cargo_maven_containerId% ^
  -Dcargo.maven.containerUrl=https://archive.apache.org/dist/tomcat/tomcat-6/v%cargo_tomcat_version%/bin/apache-tomcat-%cargo_tomcat_version%.zip ^
  -Dcargo.servlet.port=%cargo_servlet_port%
