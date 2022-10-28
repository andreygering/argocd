FROM maven:3.8-ibmjava-8 as builder
COPY ./mvnw /package


FROM openjdk:8 as deploy 
COPY --from=builder /package /code
CMD [ "java", "-jar" ,"code/*.ja" ]
