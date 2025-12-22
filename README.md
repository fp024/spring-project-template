# Spring MVC 프로젝트를 생성하는 Maven 아키타입

> 2024년 9월 시점, 특별한 추가 작업을 하지 않는 이상, STS 3에 포함된 Spring MVC Project 템플릿을 사용할 수가 없어서, 원본 소스를 참고해서 Maven ArcheType 프로젝트로 만들어보기로 했다.



## Spring MVC Project 템플릿 원본

STS에서 인식하는 다음의 원본 내용을 참고해서 만든다.

* [sts3-spring-mvc-project-template](sts3-spring-mvc-project-template)



## 아키타입 생성 가이드

* [Maven – Guide to Creating Archetypes (apache.org)](https://maven.apache.org/guides/mini/guide-creating-archetypes.html)



## 아키타입 템플릿 프로젝트

### [Spring 3 MVC Project Archetype](./archetypes/spring3-mvc-project-archetype)

* 아키타입 프로젝트 이름: `spring3-mvc-project-archetype`
* STS에서 템플릿으로 생성한 것과 거의 동일한 모양이 나오도록 한다.
* 약간의 마이너 버전업은 한다. 
  * Spring 3.2.x의 마지막버전(3.2.18.RELEASE)으로 변경등...
* STS에서 Import 했을 때, 별다른 추가 설정없이 바로 사용가능하게 하도록 함.




### [Spring 5 MVC Project Archetype](./archetypes/spring5-mvc-project-archetype)

* 아키타입 프로젝트 이름: `spring5-mvc-project-archetype`

* STS / Eclipse Tool에 의존적인 파일이나 설정은 제거한다.

  * 💡 STS에서 Import와 관계 없이, 표준 Maven 프로젝트 파일만 포함한다.
  * Eclipse의 메타 파일들이 없는 상태에서라도 STS 3에서 `Import... -> Existing Maven Projects` 메뉴로 불러올때 자동으로 잘 인식됨을 확인했다. 👍

* 라이브러리 버전업
  * Java 6 `->` Java 8
  * Spring 3.2 `->` Spring 5.3의 마지막 버전
  * Logger는 Log4j 1.2.x에서 Logback 1.3.x (JavaEE, Java 8)
  * Servlet 2.5 `->` Servlet 4

* 스프링 설정
  * XML 기반 설정 유지




### [Spring 6 MVC Project Archetype](./archetypes/spring6-mvc-project-archetype)

* 아키타입 프로젝트 이름: `spring6-mvc-project-archetype`
* 라이브러리 버전업
  * Java 11 `->` Java 17
  * Spring 5.3.x `->` Spring 6.x의 마지막 버전
  * Jakarta EE 9+ `->` Servlet 6 기반으로 변경
  * Tomcat 10.1
  
* Spring 설정
  * Java 기반 설정으로 변경


### [Spring 7 MVC Project Archetype](./archetypes/spring7-mvc-project-archetype)

* 아키타입 프로젝트 이름: `spring7-mvc-project-archetype`
* 라이브러리 버전업
  * Java 17 `->` Java 21
  * Spring 6.x `->` Spring 7.0.x의 마지막 버전
    * 따로 Snapshot 리포지토리를 추가할 필요는 없었다.
  * Jakarta EE 11+ `->` Servlet 6.1로 디펜던시 변경
  * Tomcat 11



### [Spring 0 MVC Project Archetype](./archetypes/spring0-mvc-project-archetype)

* 아키타입 프로젝트 이름: `spring0-mvc-project-archetype`
* 💡실험적인 아키타입
  * 템플릿에 좀 더 여러가지 기능 추가
    * 뷰 템플릿을 JSP 대신, Thymeleaf 등을 사용시도
    * WebJars 추가 (Bootstrap, jQuery)
    * 나중에 필요시는 Hibernate + 메모리DB 설정 추가



## Toolchain

템플릿 프로젝트에 toolchain을 적용했기 때문에, ~/.m2 디렉토리에 toolchains.xml 파일을 만들어 둬야한다.

* [Toolchain 설정](docs/toolchain-setting.md)



## Cargo Maven Plugin

* [Cargo 링크 문서 모음](docs/cargo-link-docs.md)
* [JDK 6에 TLS 1.2 지원 설정](docs/configuring-tls1.2-support-in-jdk6.md)




## 생성 테스트

리포지토리 루트의 [test](test) 디렉토리에다 `mvn archetype:generate` 명령을 실행시키는 배치 파일을 미리 만들어 두었다.

* make-spring0-project.bat
* make-spring3-project.bat
* make-spring5-project.bat
* make-spring6-project.bat
* make-spring7-project.bat
