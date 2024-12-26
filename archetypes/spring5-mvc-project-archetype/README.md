# spring5-mvc-project-archetype

> Spring 5 MVC 프로젝트 아키타입
>
> * Java 1.8
> * Spring 5.3
> * Logback Classic
> * JUnit 5



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
      -DarchetypeArtifactId=spring5-mvc-project-archetype   \
      -DarchetypeVersion=1.0.0-SNAPSHOT                     \
      -DgroupId=org.fp024.sample                            \
      -DartifactId=spring5-mvc-sample                       \
      -Dpackage=org.fp024.sample
    ```

  * 윈도우의 명령 프롬프트에서 실행한다면 한줄로 입력하는 것이 나은 것 같다.
  
    ```
    mvn archetype:generate -DarchetypeGroupId=org.fp024.archetype -DarchetypeArtifactId=spring5-mvc-project-archetype -DarchetypeVersion=1.0.0-SNAPSHOT -DgroupId=org.fp024.sample -DartifactId=spring5-mvc-sample -Dpackage=org.fp024.sample
    ```
  
    * 줄 끝마다 `^`를 붙이면 bash에서 역슬래시 쓴 것 처럼 구분이 되기는 하는데.. 한줄이 나을 것 같음.. 😅
      * bat 파일 내에서 명령어를 기술할 때는 `^`를 써도 동작에 이상이 없어서, bat 파일 내에서는 가독성이 좋게 하기 위해 `^`로 속성마다 개행으로 구분되게 해두었다.
    * 💡 package 파라미터를 따로 전달하지 않으면 groupId 전달 값 기준으로 패키지를 만든다.





## 변경 내용

### maven-eclipse-plugin 제거

sts 3에서 `Import... -> Existing Maven Projects` 메뉴에서 프로젝트를 불러오더라도 pom.xml에 설정된 Java 버전을 잘 인식한다.

그외 사항들도 자동으로 잘 인식되어서, maven-eclipse-plugin 플러그인 설정은 이제 필요가 없다. 이 플러그인은 현재 유지보수되고 있지도 않음.



### Log4j 1.2.x 제거

보안 문제가 있는 Log4j 구 버전을 제거하고, Logback Classic으로 변경했다. 로그 설정 규칙은 그대로 따랐다.



### 서블릿 4로 버전업

서블릿 관련 라이브러리와 web.xml의 선언 구문을 서블릿 4.0에 맞게 변경.



### 직접 적으로 사용되는 Maven Plugin 버전 명시

먼저 3버전의 아키타입 프로젝트에서도 적용했었는데, 여기에는 maven-war-plugin 버전도 정의를 해두었다.



## JDK 1.8에 맞게 라이브러리 호환성 확인

* logback
  * logback-classic: 1.3.14
  * slf4j: 2.0.7
  * JavaEE, Java 8 지원을 위해서는 1.3.x버전을 사용하는 것이 맞다.
  * [GitHub - qos-ch/logback: The reliable, generic, fast and flexible logging framework for Java.](https://github.com/qos-ch/logback?tab=readme-ov-file#java-ee-and-jakarta-ee-versions)

* maven-compiler-plugin
  * 3.11.0 버전 부터 1.8 지원안할 것이라고 deprecated 경고가 나온다. 직전 버전인 3.10.1 버전을 쓰도록 하자!
* hamcrest
  * 3.0
    * https://github.com/hamcrest/JavaHamcrest/releases/tag/v3.0
    * 최소 요구사항이 Java 1.8이 되었다.  이전 버전의 Java를 사용한다면 2.2 버전을 사용해야한다.




## 기타

### STS 3의 마지막 버전은 Java 16까지가 공식 지원인 것을 알게됨. 😅

**STS 3.9.18.RELEASE**는 **Eclipse 4.21.0** 기반인데, Java 17로 정의된 Maven 프로젝트를 Import하더라도 런타임 Java 16으로 환경이 낮춰서 실행됨. 😅



## 바로 실행해볼 수 있는 실행 스크립트 파일

* 리포지토리 루트의 test 디렉토리에 배치 파일을 추가해두었다.
  * 윈도우: [make-spring5-project.bat](../../test/win/make-spring5-project.bat)
  * 리눅스: [make-spring5-project.sh](../../test/linux/make-spring5-project.sh)



## 웹 서버 실행

Cargo Maven Plugin을 사용해서 Tomcat으로 바로 실행시켜볼 수있게 배치파일을 추가했다.

아키타입으로 생성한 프로젝트에서 다음 명령실행으로 실행 시킬 수 있다.

* 윈도우: `tomcat-run.bat`
* 리눅스: `tomcat-run.sh`

