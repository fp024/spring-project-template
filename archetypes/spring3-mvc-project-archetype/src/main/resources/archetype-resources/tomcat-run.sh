#!/bin/sh
# 속성 파일 읽기 (주석(#)과 빈 줄 제외)
export $(awk -F= '!/^#/ && NF==2 {print $1 "=" $2}' cargo.properties)

echo "### Tomcat ${cargo_tomcat_version} Run ... ###"

export MAVEN_OPTS="-Dfile.encoding=UTF-8"

# Maven 명령어 실행
mvn clean verify org.codehaus.cargo:cargo-maven2-plugin:run \
  -DskipTests \
  -DcargoContextPath=${cargo_context_path} \
  -Dcargo.jvmargs="${cargo_jvmargs}" \
  -Dcargo.maven.containerId=${cargo_maven_containerId} \
  -Dcargo.maven.containerUrl=https://archive.apache.org/dist/tomcat/tomcat-6/v${cargo_tomcat_version}/bin/apache-tomcat-${cargo_tomcat_version}.zip \
  -Dcargo.servlet.port=${cargo_servlet_port} 
