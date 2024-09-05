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
      -DarchetypeArtifactId=spring3-mvc-project-archetype   \
      -DarchetypeVersion=1.0.0-SNAPSHOT                     \
      -DgroupId=org.fp024.sample                            \
      -DartifactId=spring3-mvc-sample                       \
      -DprojectName=spring3-mvc-sample
    ```

  * 윈도우의 명령 프롬프트에서 실행한다면 한줄로 입력하는 것이 나은 것 같다.

    ```
    mvn archetype:generate -DarchetypeGroupId=org.fp024.archetype -DarchetypeArtifactId=spring3-mvc-project-archetype -DarchetypeVersion=1.0.0-SNAPSHOT -DgroupId=org.fp024.sample -DartifactId=spring3-mvc-sample -DprojectName=spring3-mvc-sample 
    ```

    * 줄 끝마다 `^`를 붙이면 bash에서 역슬래시 쓴 것 처럼 구분이 되기는 하는데.. 한줄이 나을 것 같음.. 😅



## 바로 실행해볼 수 있는 배치파일

* 리포지토리 루트의 test 디렉토리에 배치 파일을 추가해두었다.
  * make-spring3-project.bat
