FROM openjdk:8-jdk-alpine as build-env
WORKDIR /building/
COPY ./ ./
RUN ./mvnw clean package

FROM openjdk:8-jre-alpine
RUN apk --no-cache add ca-certificates
RUN mkdir /root/.aws

ADD credentials /root/.aws/credentials

WORKDIR /running/
COPY --from=build-env /building/target/target/authorization_server-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT java -jar app.jar