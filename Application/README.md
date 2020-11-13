# Crud Application Operation
The commands below can be used to compile, build and test this application

## Create Project
Create Maven Project
```
mvn archetype:generate -DgroupId=com.crudwebapp -DartifactId=CrudWebApplication -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false
```
Tree structure:
```
CrudWebApplication/
├── pom.xml
└── src
    └── main
        ├── resources
        └── webapp
            ├── index.jsp
            └── WEB-INF
                └── web.xml
```

## Build Project
Build the project:
```
mvn clean package
```

## Test Application
Test application
```
mvn tomcat7:run
```
When tomcat is up, open your browser and type ```http://localhost:8080```
