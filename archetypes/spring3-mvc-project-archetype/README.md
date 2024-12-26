# spring3-mvc-project-archetype

> Spring 3 MVC 프로젝트 아키타입
>
> * Java 6 / Spring 3.2.18.RELEASE



## 아키타입 설치

Maven Cenral에다 업로드하는 것을 고려하진 않아서, local 리포지터리에만 설치한다.

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
      -DarchetypeArtifactId=spring3-mvc-project-archetype   \
      -DarchetypeVersion=1.0.0-SNAPSHOT                     \
      -DgroupId=org.fp024.sample                            \
      -DartifactId=spring3-mvc-sample                       \
      -Dpackage=org.fp024.sample
    ```

  * 윈도우의 명령 프롬프트에서 실행한다면 한줄로 입력하는 것이 나은 것 같다.
  
    ```
    mvn archetype:generate -DarchetypeGroupId=org.fp024.archetype -DarchetypeArtifactId=spring3-mvc-project-archetype -DarchetypeVersion=1.0.0-SNAPSHOT -DgroupId=org.fp024.sample -DartifactId=spring3-mvc-sample -Dpackage=org.fp024.sample
    ```
  
    * 줄 끝마다 `^`를 붙이면 bash에서 역슬래시 쓴 것 처럼 구분이 되기는 하는데.. 한줄이 나을 것 같음.. 😅
      * bat 파일 내에서 명령어를 기술할 때는 `^`를 써도 동작에 이상이 없어서, bat 파일 내에서는 가독성이 좋게 하기 위해 `^`로 속성마다 개행으로 구분되게 해두었다.
    * 💡 package 파라미터를 따로 전달하지 않으면 groupId 전달 값 기준으로 패키지를 만든다.



## 바로 실행해볼 수 있는 실행 스크립트 파일

* 리포지토리 루트의 test 디렉토리에 배치 파일을 추가해두었다.
  * 윈도우: [make-spring3-project.bat](../../test/win/make-spring3-project.bat)
  * 리눅스: [make-spring3-project.sh](../../test/linux/make-spring3-project.sh)



## 웹 서버 실행

Cargo Maven Plugin을 사용해서 Tomcat으로 바로 실행시켜볼 수있게 배치파일을 추가했다.

아키타입으로 생성한 프로젝트에서 다음 명령실행으로 실행 시킬 수 있다.

> 💡Cargo를 통해 Java 6 환경으로 실행시키면 좋긴한데...  Cargo의 JDK 최소 지원이 8 버전이여서, 
> JDK 8 환경에서 실행해야한다.

* 윈도우: `tomcat-run.bat`
* 리눅스: `tomcat-run.sh`

