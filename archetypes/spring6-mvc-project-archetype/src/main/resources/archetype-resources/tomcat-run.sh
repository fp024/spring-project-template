#!/bin/bash
# 속성 파일 읽기
source cargo.properties

echo "### Tomcat ${cargo.tomcat.version} Run ... ###"

# Maven 명령어 실행
mvn clean verify org.codehaus.cargo:cargo-maven3-plugin:run \
  -DskipTests \
  -Dcargo.maven.containerId=${cargo.maven.containerId} \
  -Dcargo.maven.containerUrl=https://repo.maven.apache.org/maven2/org/apache/tomcat/tomcat/${cargo.tomcat.version}/tomcat-${cargo.tomcat.version}.zip \
  -Dcargo.servlet.port=${cargo.servlet.port} 