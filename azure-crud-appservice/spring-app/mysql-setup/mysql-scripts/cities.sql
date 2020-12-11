--  Sample Cities Database 
DROP DATABASE IF EXISTS testdb;
CREATE DATABASE IF NOT EXISTS testdb;

USE testdb;
CREATE TABLE cities(id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(100), population INT);

INSERT INTO cities(name, population) VALUES('Bratislava', 432000);
INSERT INTO cities(name, population) VALUES('Budapest', 1759000);
INSERT INTO cities(name, population) VALUES('Prague', 1280000);
INSERT INTO cities(name, population) VALUES('Warsaw', 1748000);
INSERT INTO cities(name, population) VALUES('Los Angeles', 3971000);
INSERT INTO cities(name, population) VALUES('New York', 8550000);
INSERT INTO cities(name, population) VALUES('Edinburgh', 464000);
INSERT INTO cities(name, population) VALUES('Berlin', 3671000);
INSERT INTO cities(name, population) VALUES('Nigeria', 300);

ALTER USER 'root'@'localhost' IDENTIFIED BY 'mysqlpassword';
CREATE USER 'appadmin'@'%' IDENTIFIED BY 'mysqlpassword';
GRANT ALL PRIVILEGES ON *.* TO 'appadmin'@'%';
