# STS 3 Spring MVC Project 템플릿 - 원본

> STS 3에서 더 이상 Spring MVC Project 템플릿으로 프로젝트 생성을 할 수가 없어서,
>
> Maven ArcheType 프로젝트로 전환해서 편하게 사용하려고하는데...
>
> 원본 내용이 어떻게 되었는지? 확인을 위해서, 다음 압축을 해제한 내용을 보관한다.

* org.springframework.templates.mvc-3.2.2.zip
  * template.zip

* 디렉토리 구조

  ```
  ROOT
    │  template.xml
    │  wizard.json
    │
    └─template
        │  .classpath
        │  .project
        │  .springBeans
        │  pom.xml
        │
        ├─.settings
        │      org.eclipse.jdt.core.prefs
        │      org.eclipse.m2e.core.prefs
        │      org.eclipse.wst.common.component
        │      org.eclipse.wst.common.project.facet.core.xml
        │      org.eclipse.wst.validation.prefs
        │      org.springframework.ide.eclipse.beans.core.prefs
        │      org.springframework.ide.eclipse.core.prefs
        │
        └─src
            ├─main
            │  ├─java
            │  │  └─mytld
            │  │      └─mycompany
            │  │          └─myapp
            │  │               HomeController.java
            │  │
            │  ├─resources
            │  │  │  log4j.xml
            │  │  │
            │  │  └─META-INF
            │  └─webapp
            │      ├─resources
            │      └─WEB-INF
            │          │  web.xml
            │          │
            │          ├─classes
            │          ├─spring
            │          │  │  root-context.xml
            │          │  │
            │          │  └─appServlet
            │          │          servlet-context.xml
            │          │
            │          └─views
            │               home.jsp
            │
            └─test
                ├─java
                │  └─mytld
                │      └─mycompany
                │          └─myapp
                └─resources
                        log4j.xml
  ```

  



