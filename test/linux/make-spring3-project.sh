#!/bin/bash

GROUP_ID=org.fp024.sample
ARTIFACT_ID=spring3-mvc-sample
PACKAGE=org.fp024.sample

echo ### Create ${ARTIFACT_ID} Project ###
if [ -f "set-env.properties" ]; then
  source set-env.properties
else
  echo "set-env.properties file does not exist, loading default settings."
  source set-env-default.properties
fi

# 환경변수 설정
export JAVA_HOME=${JAVA_HOME}
export MAVEN_HOME=${MAVEN_HOME}

REPO_ROOT_DIR=$(dirname "$(realpath "$0")")

# ARTIFACT_ID에 해당하는 디렉토리가 존재하는지 확인하고 삭제
if [ -d "${REPO_ROOT_DIR}/${ARTIFACT_ID}" ]; then
  echo "Deleting directory: ${REPO_ROOT_DIR}/${ARTIFACT_ID}"
  rm -rf "${REPO_ROOT_DIR}/${ARTIFACT_ID}"
fi

${MAVEN_HOME}/bin/mvn archetype:generate \
  -DarchetypeGroupId=org.fp024.archetype \
  -DarchetypeArtifactId=spring3-mvc-project-archetype \
  -DarchetypeVersion=1.0.0-SNAPSHOT \
  -DgroupId=${GROUP_ID} \
  -DartifactId=${ARTIFACT_ID} \
  -Dpackage=${PACKAGE}

echo "${ARTIFACT_ID} Project is created."
echo "Press any key to continue..."
read -n 1


