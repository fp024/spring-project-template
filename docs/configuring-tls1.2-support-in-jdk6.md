# JDK 6에 TLS 1.2 지원 설정

> JDK 6 환경에서 Cargo Maven Plugin 을 실행시키려니 tls연결 문제로...
>
> Maven 레포지토리에서 플러그인 관련 디펜던시가 다운로드가 안된다. 😂
>
> 그래서 JDK 6에서도 TLS 1.2가 지원되도록 bouncycastle 라이브러리를 사용해보았다.
>
> * Oracle Java 1.6.0_45 환경에서 정상 동작함을 확인했다.



1. **Bouncy Castle 라이브러리 복사**:

   * 최신 버전 경로
     * https://www.bouncycastle.org/download/bouncy-castle-java/#latest
     * 다운로드 링크가 깨져있어서, mvn repo에서 직접 다운로드 받으면 된다.

   * 다음 경로에 필요한 JAR 파일 복사: `${JAVA_HOME}/jre/lib/ext`

     - **bcprov-jdk15to18-1.81.jar**
       - https://repo1.maven.org/maven2/org/bouncycastle/bcprov-jdk15to18/1.81/bcprov-jdk15to18-1.81.jar
     
     - **bctls-jdk15to18-1.81.jar**
       - https://repo1.maven.org/maven2/org/bouncycastle/bctls-jdk15to18/1.81/bctls-jdk15to18-1.81.jar
     
     - **bcutil-jdk15to18-1.81.jar**
       - https://repo1.maven.org/maven2/org/bouncycastle/bcutil-jdk15to18/1.81/bcutil-jdk15to18-1.81.jar

   

2. **`java.security` 파일 수정**:

   - `java.security` 파일의 `security.provider` 목록에 Bouncy Castle 프로바이더 추가:
     ```properties
     security.provider.1=sun.security.provider.Sun
     security.provider.2=sun.security.rsa.SunRsaSign
     security.provider.3=com.sun.net.ssl.internal.ssl.Provider
     security.provider.4=com.sun.crypto.provider.SunJCE
     security.provider.5=sun.security.jgss.SunProvider
     security.provider.6=com.sun.security.sasl.Provider
     security.provider.7=org.jcp.xml.dsig.internal.dom.XMLDSigRI
     security.provider.8=sun.security.smartcardio.SunPCSC
     security.provider.9=sun.security.mscapi.SunMSCAPI
     security.provider.10=org.bouncycastle.jce.provider.BouncyCastleProvider // 💡 추가
     security.provider.11=org.bouncycastle.jsse.provider.BouncyCastleJsseProvider // 💡 추가
     ```
   - SSL 소켓 팩토리 프로바이더 설정:
     ```properties
     ssl.SocketFactory.provider=org.bouncycastle.jsse.provider.SSLSocketFactoryImpl // 💡 추가
     ```

3. **JCE 파일 복사**:
   - JCE 무제한 강도 정책 파일을 `${JAVA_HOME}/jre/lib/security`에 복사:
     - Oracle 계정으로 로그인하여 다운로드
     - [JCE 다운로드 링크](https://www.oracle.com/java/technologies/jce-6-download.html)

4. **Maven 빌드시 TLS 1.2를 명시적으로 사용하도록 다음 옵션을 추가**:

   ```sh
   # Windows
   SET MAVEN_OPTS=-Dhttps.protocols=TLSv1.2
   # Linux
   export MAVEN_OPTS=-Dhttps.protocols=TLSv1.2
   ```


---

### **💡 위의 방법이 잘 적용되지 않을 때...**

비공식적인 방법이라, 나중에 얼마든지 중단 될 수 있을 것 같다. 그런 상황이 되면...

잠시 JDK 8, 17등을 사용해서 라이브러리 / 플러그인들을... 

로컬 컴퓨터의 로컬리포지토리(.m2)에 받아지도록 실행하고, 다시 JDK 6 환경에서 실행하면 정상 실행된다.
