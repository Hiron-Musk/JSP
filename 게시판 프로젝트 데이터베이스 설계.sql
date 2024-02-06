#날짜 : 2024/02/05
#이름 : 남가희
#내용 : 게시판 프로젝트 데이터베이스 설계

CREATE DATABASE jboard;
USE `jboard`;

GRANT ALL PRIVILEGES ON `jboard`.* TO 'jsa7868'@'%';
FLUSH PRIVILEGES; 


CREATE TABLE `User`(
	`uid`	VARCHAR(20) PRIMARY KEY,
	`pass` VARCHAR(255) NOT NULL,
	`name` VARCHAR(20) NOT NULL,
	`nick`VARCHAR(20) UNIQUE NOT NULL,
	`email`VARCHAR(30) UNIQUE NOT NULL,
	`hp`CHAR(13) UNIQUE NOT NULL,
	`role`VARCHAR(20) DEFAULT 'USER',
	`zip`CHAR(5),
	`addr1`VARCHAR(100),
	`addr2`VARCHAR(100),
	`regip`VARCHAR(50) NOT NULL,
	`rdate` DATETIME,
	`leaveDate`DATETIME

);

articleCREATE TABLE `Article`(
	`no` INT PRIMARY KEY AUTO_INCREMENT,
	`parent` INT DEFAULT 0,
	`comment` INT DEFAULT 0,
	`cate` VARCHAR(20) DEFAULT 'free',
	`title` VARCHAR(100),
	`content` TEXT NOT NULL,
	`file` TINYINT DEFAULT 0,
	`hit` INT DEFAULT 0,
	`writer` VARCHAR(20) NOT NULL,
	`regip` VARCHAR(50) NOT NULL,
	`rdate` DATETIME NOT NULL,
	FOREIGN KEY(`writer`) REFERENCES `User`(`uid`)
	
);

CREATE TABLE `File`(
	`fno` INT AUTO_INCREMENT PRIMARY KEY,
	`ano` INT NOT NULL,
	`oName` VARCHAR(100) NOT NULL,
	`sName` VARCHAR(100) NOT NULL,
	`download` INT DEFAULT 0,
	`rdate` DATETIME NOT NULL,
	FOREIGN KEY(`ano`) REFERENCES `Article`(`no`)_
);

CREATE TABLE `Terms`(
	`terms` TEXT,
	`privacy` TEXT
	);