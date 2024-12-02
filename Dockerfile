FROM maven

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

FROM openjdk

WORKDIR /app

COPY --from=0 /app/target/*.jar app.jar

CMD ["java", "-jar", "app.jar"]
