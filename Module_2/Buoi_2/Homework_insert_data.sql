INSERT INTO `Department`(`DepartmentName`)
VALUES                  (N'Lễ tân'),
                        (N'Bảo vệ'),
                        (N'Kế toán'),
                        (N'Nhân sự'),
                        (N'Kinh doanh'),
                        (N'Kỹ thuật');

INSERT INTO `Position`(`PositionName`)
VALUES                ('Dev'),
                      ('Dev'),
                      ('Test'),
                      ('Test'),
                      ('Scrum master'),
                      ('PM');

INSERT INTO `Account`(`Email`, `Username`, `FullName`, `DepartmentID`)
VALUES               ('account01@gmail.com', 'account01', 'Nguyễn Văn A', 1),
                     ('account02@gmail.com', 'account02', 'Lê Thị B', 2),
                     ('account03@gmail.com', 'account03', 'Phạm Hoàng C', 3),
                     ('account04@gmail.com', 'account04', 'Đặng Văn D', 4),
                     ('account05@gmail.com', 'account05', 'Huỳnh Thị E', 3);

INSERT INTO `Group`(`GroupName`, `CreatorID`)
VALUES             ('Nhóm Dẫn đầu', 1),
                   ('Nhóm Bứt phá', 2),
                   ('Nhóm Bền bỉ', 3),
                   ('Nhóm Cẩn thận', 4),
                   ('Nhóm Tốc độ', 5);

INSERT INTO `GroupAccount`(`GroupID`, `AccountID`)
VALUES                    (1, 1),
                          (1, 3),
                          (2, 2),
                          (2, 5),
                          (4, 4),
                          (4, 1),
                          (3, 5);

INSERT INTO `TypeQuestion`(`TypeName`)
VALUES                    ('Single choice'),
                          ('Multiple choice'),
                          ('True/False'),
                          ('Short answer');

INSERT INTO `CategoryQuestion`(`CategoryName`)
VALUES                        ('Kiến thức chung'),
                              ('Ngôn ngữ lập trình'),
                              ('CSDL'),
                              ('Thuật toán');

INSERT INTO `Question`(`Content`, `CategoryID`, `TypeID`, `CreatorID`)
VALUES                ('Câu hỏi số 1 là', 1, 1, 1),
                      ('Câu hỏi số 2 là', 3, 2, 2),
                      ('Câu hỏi số 3 là', 4, 3, 2),
                      ('Câu hỏi số 4 là', 2, 4, 1),
                      ('Câu hỏi số 5 là', 1, 2, 1),
                      ('Câu hỏi số 6 là', 4, 1, 1),
                      ('Câu hỏi số 7 là', 3, 4, 3),
                      ('Câu hỏi số 8 là', 2, 3, 4),
                      ('Câu hỏi số 9 là', 2, 1, 5),
                      ('Câu hỏi số 10 là', 1, 1, 2),
                      ('Câu hỏi số 11 là', 4, 2, 3),
                      ('Câu hỏi số 12 là', 3, 3, 1);

INSERT INTO `Answer`(`Content`, `QuestionID`)
VALUES              ('Đáp án 1 là', 1),
                    ('Đáp án 2 là', 2),
                    ('Đáp án 3 là', 3),
                    ('Đáp án 4 là', 4),
                    ('Đáp án 5 là', 5),
                    ('Đáp án 6 là', 6),
                    ('Đáp án 7 là', 7),
                    ('Đáp án 8 là', 8),
                    ('Đáp án 9 là', 9),
                    ('Đáp án 10 là', 10),
                    ('Đáp án 11 là', 11),
                    ('Đáp án 12 là', 12);

INSERT INTO `Exam`(`Code`, `Title`, `CategoryID`, `Duration`, `CreatorID`)
VALUES            ('E001', 'Entrance exam', 1, 60, 1),
                  ('E002', 'Short Entrance exam', 1, 30, 1),
                  ('E003', 'Evaluation exam', 2, 120, 2),
                  ('E004', 'Short Evaluation exam', 3, 90, 1),
                  ('E005', 'Regular exam', 4, 30, 1);

INSERT INTO `ExamQuestion`(`ExamID`, `QuestionID`)
VALUES                    (1, 4),
                          (2, 5),
                          (3, 7),
                          (4, 9),
                          (5, 1),
                          (6, 12);
                  
                        