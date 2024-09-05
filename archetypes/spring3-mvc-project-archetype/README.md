# spring3-mvc-project-archetype

> Spring 3 MVC 프로젝트 아키타입
>
> * Java 6 / Spring 3.2.18.RELEASE



## 아키타입 설치

Nexus에다 올리는 것을 고려하진 않아서, local 리포지터리에만 설치한다.

```sh
mvn install
```





## 프로젝트 생성

프로젝트를 만들 적당한 디렉토리 루트로 이동후에,

다음과 같이 입력한다.

```sh
mvn archetype:generate                                  \
  -DarchetypeGroupId=<archetype-groupId>                \
  -DarchetypeArtifactId=<archetype-artifactId>          \
  -DarchetypeVersion=<archetype-version>                \
  -DgroupId=<my.groupid>                                \
  -DartifactId=<my-artifactId>
```

* Bash환경이라면 `\`으로 줄을 나눌 수 있기 때문에 다음과 같이 아키 타입을 생성할 수 있다.



## 바로 실행해볼 수 있는 배치파일

* 리포지토리 루트의 test 디렉토리에 배치 파일을 추가해두었다.
  * make-spring3-project.bat
