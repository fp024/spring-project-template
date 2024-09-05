# Spring MVC 프로젝트를 생성하는 Maven 아키타입

> 2024년 9월 시점, 특별한 추가 작업을 하지 않는 이상, STS 3에 포함된 Spring MVC Project 템플릿을 사용할 수가 없어서, 원본 소스를 참고해서 Maven ArcheType 프로젝트로 만들어보기로 했다.



## Spring MVC Project 템플릿 원본

STS에서 인식하는 다음의 원본 내용을 참고해서 만든다.

* [sts3-spring-mvc-project-template](sts3-spring-mvc-project-template)



## 아키타입 생성 가이드

* [Maven – Guide to Creating Archetypes (apache.org)](https://maven.apache.org/guides/mini/guide-creating-archetypes.html)



## 진행

### [첫번째 개발 목표](./archetypes/spring3-mvc-project-archetype)

* 아키타입 프로젝트 이름: `spring3-mvc-project-archetype`
* STS에서 템플릿으로 생성한 것과 거의 동일한 모양이 나오도록 한다.
* 약간의 마이너 버전업은 한다. 
  * Spring 3.2.x의 마지막버전(3.2.18.RELEASE)으로 변경등...
* STS에서 Import 했을 때, 별다른 추가 설정없이 바로 사용가능하게 하도록 함.




### 두번째 개선 목표

* 아키타입 프로젝트 이름: `spring5-mvc-project-archetype`

* STS / Eclipse Tool에 의존적인 파일이나 설정은 제거한다.

  * 💡 STS에서 Import와 관계 없이, 표준 Maven 프로젝트 파일만 포함한다.

* 라이브러리 버전변경
  * Spring 5의 마지막 버전 기준으로 변경
  * Logger는 Logback 또는 Log4j2로 변경

  
  

### 세번째 개선 목표

* 아키타입 프로젝트 이름: `spring6-mvc-project-archetype`
* Spring 6 기반의 버전으로 별도 아키타입 프로젝트를 만든다.
  * Servlet 6 기반으로 변경





## 생성 테스트

리포지토리 루트의 [test](test) 디렉토리에다 `mvn archetype:generate` 명령을 실행시키는 배치 파일을 미리 만들어 두었다.

* make-spring3-project.bat
* make-spring5-project.bat
* make-spring6-project.bat
