CREATE DATABASE Testing_System_Db;

USE Testing_System_Db;

CREATE TABLE Department(
   DepartmentID         INT PRIMARY KEY AUTO_INCREMENT,
   DepartmentName       VARCHAR(15)
);

CREATE TABLE Position_(
    PositionID          INT PRIMARY KEY AUTO_INCREMENT,
    PositionName        VARCHAR(15)
);

CREATE TABLE Account(
    AccountID           INT PRIMARY KEY AUTO_INCREMENT,
    Email               VARCHAR(50),
    Username            VARCHAR(20),
    FullName            VARCHAR(30),
    DepartmentID        INT,
    CreateDate          DATE
);

CREATE TABLE Group_(
    GroupID             INT PRIMARY KEY AUTO_INCREMENT,
    GroupName           VARCHAR(20),
    CreatorID           INT,
    CreateDate          DATE
);

CREATE TABLE GroupAccount(
    GroupID             INT,
    AccountID           INT,
    JoinDate            DATE
);

CREATE TABLE TypeQuestion(
    TypeID              INT PRIMARY KEY AUTO_INCREMENT,
    TypeName            VARCHAR(20)
);

CREATE TABLE CategoryQuestion(
    CategoryID          INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName        VARCHAR(20)
);

CREATE TABLE Question(
    QuestionID          INT PRIMARY KEY AUTO_INCREMENT,
    Content             VARCHAR(200),
    CategoryID          INT,
    TypeID              INT,
    CreatorID           INT,
    CreateDate          DATE
);

CREATE TABLE Answer(
    AnswerID            INT PRIMARY KEY AUTO_INCREMENT,
    Content             VARCHAR(200),
    QuestionID          INT,
    isCorrect           BOOLEAN
);

CREATE TABLE Exam(
    ExamID              INT PRIMARY KEY AUTO_INCREMENT,
    Code                VARCHAR(10),
    Title               VARCHAR(30),
    CategoryID          INT,
    Duration            TIME,
    CreatorID           INT,
    CreateDate          DATE
);

CREATE TABLE ExamQuestion(
    ExamID              INT,
    QuestionID          INT
);