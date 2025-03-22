#!/bin/sh
# 속성 파일 읽기
grep -Ev '^#|^$' cargo.properties | while IFS='=' read -r key value; do
  export "$key=$value"
done

echo "### Tomcat ${cargo_tomcat_version} Run ... ###"

export MAVEN_OPTS="-Dfile.encoding=UTF-8"

# Maven 명령어 실행
mvn clean verify org.codehaus.cargo:cargo-maven3-plugin:run \
  -DskipTests \
  -DcargoContextPath=${cargo_context_path} \
  -Dcargo.jvmargs="${cargo_jvmargs}" \
  -Dcargo.maven.containerId=${cargo_maven_containerId} \
  -Dcargo.maven.containerUrl=https://repo.maven.apache.org/maven2/org/apache/tomcat/tomcat/${cargo_tomcat_version}/tomcat-${cargo_tomcat_version}.zip \
  -Dcargo.servlet.port=${cargo_servlet_port} 
