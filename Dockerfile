FROM eclipse-temurin:17
EXPOSE 5004
EXPOSE 8009
COPY target/campaign-1.1.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]