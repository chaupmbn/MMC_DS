-- Active: 1714487807212@@127.0.0.1@3306@Testing_System_Db
USE Testing_System_Db;
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
   DepartmentID         TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
   DepartmentName       NVARCHAR(50)
);

DROP TABLE IF EXISTS `Positon`;
CREATE TABLE `Position`(
    PositionID          TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName        ENUM('Dev', 'Test', 'Scrum Master', 'PM') NOT NULL
);

DROP TABLE IF EXISTS Account;
CREATE TABLE Account(
    AccountID           TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email               VARCHAR(50),
    Username            VARCHAR(20) NOT NULL,
    FullName            VARCHAR(30) NOT NULL,
    DepartmentID        TINYINT UNSIGNED,
    CreateDate          DATETIME DEFAULT NOW(),
    FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID)
);
ALTER TABLE `Account` 
MODIFY Fullname NVARCHAR(30);

DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
    GroupID             TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName           NVARCHAR(20),
    CreatorID           TINYINT UNSIGNED,
    CreateDate          DATETIME DEFAULT NOW(),
    FOREIGN KEY(CreatorID) REFERENCES Account(AccountID)
);

DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
    GroupID             TINYINT UNSIGNED,
    AccountID           TINYINT UNSIGNED NOT NULL,
    JoinDate            DATETIME DEFAULT NOW(),
    FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID),
    FOREIGN KEY(AccountID) REFERENCES `Account`(AccountID)
);

DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion(
    TypeID              TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName            VARCHAR(20)
);
ALTER TABLE `TypeQuestion`
MODIFY TypeName ENUM('Single choice', 'Multiple choice', 'True/False', 'Short answer') NOT NULL UNIQUE;

DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
    CategoryID          TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName        VARCHAR(20)
);
ALTER TABLE `CategoryQuestion`
MODIFY CategoryName ENUM('Kiến thức chung', 'Ngôn ngữ lập trình', 'CSDL', 'Thuật toán') NOT NULL UNIQUE;

DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
    QuestionID          TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content             NVARCHAR(200),
    CategoryID          TINYINT UNSIGNED,
    TypeID              TINYINT UNSIGNED,
    CreatorID           TINYINT UNSIGNED,
    CreateDate          DATETIME DEFAULT NOW(),
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY(CreatorID) REFERENCES Account(AccountID)
);

DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
    AnswerID            TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content             NVARCHAR(200),
    QuestionID          TINYINT UNSIGNED,
    isCorrect           BOOLEAN,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);
ALTER TABLE `Answer`
MODIFY isCorrect BIT DEFAULT 1;

DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
    ExamID              TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Code                VARCHAR(10),
    Title               NVARCHAR(30),
    CategoryID          TINYINT UNSIGNED NOT NULL,
    Duration            TINYINT UNSIGNED NOT NULL,
    CreatorID           TINYINT UNSIGNED NOT NULL,
    CreateDate          DATETIME DEFAULT NOW(),
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(CreatorID) REFERENCES Account(AccountID)
);


DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
    ExamID              TINYINT UNSIGNED AUTO_INCREMENT,
    QuestionID          TINYINT UNSIGNED,
    PRIMARY KEY(ExamID, QuestionID),
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);