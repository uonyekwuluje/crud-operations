# Crud Application Operation
The commands below can be used to compile, build and test this application

## Create Project
Create Maven Project
```
https://start.spring.io/
```

## Build Project
Build the project:
```
mvn dependency:tree
mvn spring-boot:run
```

## Maven Compile
```
mvn compile install package
```

## Create Docker Image
```
docker build -t springcrudapp .
```

## Test App
Run the command below:
```
docker run -p 5000:8080 springcrudapp 
```
Open your browser and type
```
http://localhost:5000
```
