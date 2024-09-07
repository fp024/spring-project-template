# spring5-mvc-project-archetype

> Spring 5 MVC 프로젝트 아키타입
>
> * Java 11
> * Spring 5.3
> * Logback Classic
> * JUnit 5



## 아키타입 설치

Nexus에다 올리는 것을 고려하진 않아서, local 리포지터리에만 설치한다.

```sh
mvn install
```



## 프로젝트 생성

프로젝트를 만들 적당한 디렉토리로 이동한 후에,

다음과 같이 입력한다.

* Bash환경이라면 `\`으로 줄을 나눌 수 있다.

  ```bash
  mvn archetype:generate                                  \
    -DarchetypeGroupId=<archetype-groupId>                \
    -DarchetypeArtifactId=<archetype-artifactId>          \
    -DarchetypeVersion=<archetype-version>                \
    -DgroupId=<my.groupid>                                \
    -DartifactId=<my-artifactId>                          \
    -DprojectName=<이름은 입력하지 않으면 artifactId가 되도록함>
  ```

  * 예시

    ```bash
    mvn archetype:generate                                  \
      -DarchetypeGroupId=org.fp024.archetype                \
      -DarchetypeArtifactId=spring5-mvc-project-archetype   \
      -DarchetypeVersion=1.0.0-SNAPSHOT                     \
      -DgroupId=org.fp024.sample                            \
      -DartifactId=spring5-mvc-sample                       \
      -DprojectName=spring5-mvc-sample
    ```

  * 윈도우의 명령 프롬프트에서 실행한다면 한줄로 입력하는 것이 나은 것 같다.

    ```
    mvn archetype:generate -DarchetypeGroupId=org.fp024.archetype -DarchetypeArtifactId=spring5-mvc-project-archetype -DarchetypeVersion=1.0.0-SNAPSHOT -DgroupId=org.fp024.sample -DartifactId=spring5-mvc-sample -DprojectName=spring5-mvc-sample 
    ```

    * 줄 끝마다 `^`를 붙이면 bash에서 역슬래시 쓴 것 처럼 구분이 되기는 하는데.. 한줄이 나을 것 같음.. 😅





## 변경 내용

### maven-eclipse-plugin 제거

sts 3에서 `Import... -> Existing Maven Projects` 메뉴에서 프로젝트를 불러오더라도 pom.xml에 설정된 Java 버전을 잘 인식한다.

그외 사항들도 자동으로 잘 인식되어서, maven-eclipse-plugin 플러그인 설정은 이제 필요가 없다. 이 플러그인은 현재 유지보수되고 있지도 않음.



### Log4j 1.2.x 제거

보안 문제가 있는 Log4j 구 버전을 제거하고, Logback Classic으로 변경했다. 로그 규칙은 그대로 따랐다.



### 서블릿 4로 버전업

서블릿 관련 라이브러리와 web.xml의 선언 구문을 서블릿 4.0에 맞게 변경.



### 직접 적으로 사용되는 Maven Plugin 버전 명시

먼저 3버전의 아키타입 프로젝트에서도 적용했었는데, 여기에는 maven-war-plugin 버전도 정의를 해두었다.





## 기타

### STS 3의 마지막 버전은 Java 16까지가 공식 지원인 것을 알게됨. 😅

**STS 3.9.18.RELEASE**는 **Eclipse 4.21.0** 기반인데, Java 17로 정의된 Maven 프로젝트를 Import하더라도 런타임 Java 16으로 환경이 낮춰서 실행됨. 😅



## 바로 실행해볼 수 있는 배치파일

* 리포지토리 루트의 test 디렉토리에 배치 파일을 추가해두었다.
  * make-spring5-project.bat
