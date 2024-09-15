# spring6-mvc-project-archetype

> Spring 6 MVC 프로젝트 아키타입
>
> * Java 17
> * Spring 6
> * Logback Classic
> * JUnit 5



## 참고 대상

### 버전 참조

버전이나 속성 이름 규칙은 Spring Boot dependencies를 참고했다.

* https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies
* https://repo1.maven.org/maven2/org/springframework/boot/spring-boot-dependencies/3.3.3/spring-boot-dependencies-3.3.3.pom



### Java 설정 스타일 참조

#### Spring MVC Showcase

* https://github.com/spring-attic/spring-mvc-showcase

* Spring Security 설정 내용은 제외



## 아키타입 설치

Maven Central에다 업로드하는 것을 고려하진 않아서, local 리포지터리에만 설치한다.

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
    -Dpackage=<my.package>
  ```
  
  * 예시
  
    ```bash
    mvn archetype:generate                                  \
      -DarchetypeGroupId=org.fp024.archetype                \
      -DarchetypeArtifactId=spring6-mvc-project-archetype   \
      -DarchetypeVersion=1.0.0-SNAPSHOT                     \
      -DgroupId=org.fp024.sample                            \
      -DartifactId=spring6-mvc-sample                       \
      -Dpackage=org.fp024.sample
    ```

  * 윈도우의 명령 프롬프트에서 실행한다면 한줄로 입력하는 것이 나은 것 같다.
  
    ```
    mvn archetype:generate -DarchetypeGroupId=org.fp024.archetype -DarchetypeArtifactId=spring6-mvc-project-archetype -DarchetypeVersion=1.0.0-SNAPSHOT -DgroupId=org.fp024.sample -DartifactId=spring6-mvc-sample -Dpackage=org.fp024.sample
    ```
  
    * 줄 끝마다 `^`를 붙이면 bash에서 역슬래시 쓴 것 처럼 구분이 되기는 하는데.. 한줄이 나을 것 같음.. 😅
    * 💡 package 파라미터를 따로 전달하지 않으면 groupId 전달 값 기준으로 패키지를 만든다.





## 변경 내용

### 서블릿 6으로 버전업

* 서블릿 관련 라이브러리들을 서블릿 6에 맞게 변경.
* web.xml 제거, Java 설정으로 변경



### Spring XML 설정을 Java 설정으로 변경

* Spring 설정을 Java 설정으로 변경



### toolchain 설정 추가

* 프로젝트 빌드시 설정된 JDK 버전으로 정확하게 빌드되도록 maven-toolchain-plugin 설정을 추가했다.



## 기타

### Logback의 초기화 로깅이 노출된다. 🤔

못보던 내용인데,  Test를 돌려보니... Logback 자체의 초기화 작업 로깅이 노출되었다.

```
[INFO] Running org.fp024.sample.HomeControllerTests
01:31:01,554 |-INFO in ch.qos.logback.classic.LoggerContext[default] - This is logback-classic version 1.5.7
...
01:31:01,683 |-INFO in ch.qos.logback.core.model.processor.DefaultProcessor@3eb91815 - End of configuration.
01:31:01,684 |-INFO in ch.qos.logback.classic.joran.JoranConfigurator@56dc1551 - Registering current configuration as safe fallback point
01:31:01,684 |-INFO in ch.qos.logback.classic.util.ContextInitializer@3b5fad2d - ch.qos.logback.classic.util.DefaultJoranConfigurator.configure() call lasted 119 milliseconds. ExecutionStatus=DO_NOT_INVOKE_NEXT_IF_ANY

01:31:02.381 [main] INFO  org.fp024.sample.HomeController - Welcome home! The client locale is en.

```

초기화 작업 로깅이 노출되고나서, 내가 `logback.xml`에 설정한대로 노출이 되었다.



```xml
<configuration>
  <statusListener class="ch.qos.logback.core.status.NopStatusListener" />
  <!-- Your appenders and loggers here -->
</configuration>
```

그래서 설정에 `NopStatusListener`를 추가해주었을 때, 노출이되지 않았다.

원래 따로 설정을 해주지 않아도 다른 Gradle 프로젝트에서는 이 내용을 보지 못했던 것 같은데...?





## 바로 실행해볼 수 있는 배치파일

* 리포지토리 루트의 test 디렉토리에 배치 파일을 추가해두었다.
  * [make-spring6-project.bat](../../test/make-spring6-project.bat)
