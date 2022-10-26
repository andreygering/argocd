FROM maven:3.8-ibmjava-8 as builder
RUN ./mvnw package


FROM java:oraclelinux8 as deploy 
COPY --from=builder /package /code
CMD [ "java", "-jar" ,"code/*.ja" ]