# Toolchain 설정

spring3-mvc-sample 에는 toolchain 설정을 하지 않았지만,

spring5-mvc-sample와 spring6-mvc-sample은 설정을 적용한 상태이기 때문에,

~/.m2 경로에 toolchains.xml 파일을 만들어주고, JDK 1.8, 17에 대한 설정을 해줘야한다.

* 윈도우: `%USERPROFILE%\.m2`
* 리눅스: `~/.m2`

### 예시

```xml
<?xml version="1.0" encoding="UTF-8"?>
<toolchains>
  <!-- JDK toolchains -->
  <toolchain>
    <type>jdk</type>
    <provides>
      <version>1.6</version>
      <vendor>oracle</vendor>
    </provides>
    <configuration>
      <jdkHome>C:/JDK/6-oracle</jdkHome>
    </configuration>
  </toolchain>
  <toolchain>
    <type>jdk</type>
    <provides>
      <version>1.8</version>
      <vendor>temurin</vendor>
    </provides>
    <configuration>
      <jdkHome>C:/JDK/8</jdkHome>
    </configuration>
  </toolchain>
  <toolchain>
    <type>jdk</type>
    <provides>
      <version>17</version>
      <vendor>temurin</vendor>
    </provides>
    <configuration>
      <jdkHome>C:/JDK/17</jdkHome>
    </configuration>
  </toolchain>
</toolchains>
```

