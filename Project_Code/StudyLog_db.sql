DROP DATABASE IF EXISTS StudyLog;
CREATE DATABASE StudyLog;
USE StudyLog;

-- Table structure for table `user`
--
CREATE TABLE user (
  username VARCHAR(45) NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  packet enum('no_packet','silver','golden'),
  passwordd VARCHAR(20) NOT NULL,
  PRIMARY KEY  (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- Table structure for table `professor`
--
CREATE TABLE professor (
  username VARCHAR(45) NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  age INT DEFAULT NULL,
  address VARCHAR(50) NOT NULL,
  packet enum('no_packet','silver','golden'),
  votes INT NOT NULL,
  PRIMARY KEY  (username),
  CONSTRAINT prof_key FOREIGN KEY (username) REFERENCES user (username) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- Table structure for table `student`
--
CREATE TABLE student (
  username VARCHAR(45) NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  age INT DEFAULT NULL,
  packet enum('no_packet','silver','golden'),
  PRIMARY KEY  (username),
  CONSTRAINT stud_key FOREIGN KEY (username) REFERENCES user (username) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `subject`
--
CREATE TABLE subject (
  subject_name VARCHAR(45) NOT NULL,
  PRIMARY KEY  (subject_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `profs_subjects`
--
CREATE TABLE profs_subjects (
  username VARCHAR(45) NOT NULL,
  subject_name VARCHAR(45) NOT NULL,
  PRIMARY KEY(username, subject_name),
  CONSTRAINT prof_name FOREIGN KEY (username) REFERENCES professor (username) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT name_subject FOREIGN KEY (subject_name) REFERENCES subject (subject_name) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `frgt_pswd`
--
CREATE TABLE frgt_pswd (
  username VARCHAR(45) NOT NULL,
  quest VARCHAR(250) NOT NULL,
  ans VARCHAR(50) NOT NULL,
  PRIMARY KEY(username),
  CONSTRAINT user_name FOREIGN KEY (username) REFERENCES user (username) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `evaluations`
--
CREATE TABLE evaluations (
  eval_id SMALLINT UNSIGNED AUTO_INCREMENT,
  username VARCHAR(45) NOT NULL,
  eval VARCHAR(250) NOT NULL,
  votes INT NOT NULL,
  PRIMARY KEY(eval_id),
  CONSTRAINT profname FOREIGN KEY (username) REFERENCES professor (username) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `quiz`
--
CREATE TABLE quiz (
	question_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    question VARCHAR(250) NOT NULL,
    ans_a VARCHAR(45) NOT NULL,
    ans_b VARCHAR(45) NOT NULL,
    ans_c VARCHAR(45) NOT NULL,
    correct_ans enum('a','b','c'),
    category enum('History','Science','General'),
	PRIMARY KEY(question_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
-- INSERT INTO USER --
--
INSERT INTO user (username, first_name, last_name, email, packet, passwordd) VALUES
('JohnDoe', 'John', 'Doe', 'johndoe@mail.com', 'no_packet', 'werty'),
('JaneSmith', 'Jane', 'Smith', 'janesmith@mail.com', 'silver', 'fghij'),
('SamJohnson', 'Sam', 'Johnson', 'samjohnson@mail.com', 'golden', 'klmno'),
('JohnSmith', 'John', 'Smith', 'johnsmith@mail.com', 'no_packet', 'pqrst'),
('JaneMason', 'Jane', 'Mason', 'janemason@mail.com', 'silver', 'uvwxy'),
('OliverJohnson', 'Oliver', 'Johnson', 'oliverjohnson@mail.com', 'golden', 'zxcvb'),
('RobertWilliams', 'Robert', 'Williams', 'robertwilliams@mail.com', 'no_packet', '12345'),
('EmilyAnderson', 'Emily', 'Anderson', 'emilyanderson@mail.com', 'silver', '67890'),
('MichaelBrown', 'Michael', 'Brown', 'michaelbrown@mail.com', 'golden', 'aqwzs'),
('JessicaTaylor', 'Jessica', 'Taylor', 'jessicataylor@mail.com', 'no_packet', 'erfdx'),
('DanielDavis', 'Daniel', 'Davis', 'danieldavis@mail.com', 'silver', 'tgvby'),
('OliviaMiller', 'Olivia', 'Miller', 'oliviamiller@mail.com', 'golden', 'uhbgt'),
('DavidWilson', 'David', 'Wilson', 'davidwilson@mail.com', 'no_packet', 'yhnju'),
('SophiaMoore', 'Sophia', 'Moore', 'sophiamoore@mail.com', 'silver', 'plkmn'),
('JosephAnderson', 'Joseph', 'Anderson', 'josephanderson@mail.com', 'golden', 'iklko'),
('EmmaTaylor', 'Emma', 'Taylor', 'emmataylor@mail.com', 'no_packet', 'nbvcx'),
('JamesJohnson', 'James', 'Johnson', 'jamesjohnson@mail.com', 'silver', 'mnbvc'),
('MiaBrown', 'Mia', 'Brown', 'miabrown@mail.com', 'golden', 'vbgfr'),
('BenjaminSmith', 'Benjamin', 'Smith', 'benjaminsmith@mail.com', 'no_packet', 'cfvgy'),
('AvaDoe', 'Ava', 'Doe', 'avadoe@mail.com', 'silver', 'gbhnm'),
('PedroMartins', 'Pedro', 'Martins', 'pedromartins@mail.com', 'silver', 'bvfre'),
('MarcoSilva', 'Marco', 'Silva', 'marcosilva@mail.com', 'no_packet', 'awqzx'),
('OscarCardozo', 'Oscar', 'Cardozo', 'oscarcardozo@mail.com', 'golden', 'edcrf'),
('NickCage', 'Nick', 'Cage', 'nickcage@mail.com', 'silver', 'tgvby'),
('WalterBerry', 'Walter', 'Berry', 'walterberry@mail.com', 'no_packet', 'yhnju'),
('MikeBibby', 'Mike', 'Bibby', 'mikebibby@mail.com', 'golden', 'plkmn'),
('GaryPayton', 'Gary', 'Payton', 'garypayton@mail.com', 'silver', 'iklko'),
('VictorHayes', 'Victor', 'Hayes', 'victorhayes@mail.com', 'no_packet', 'nbvcx'),
('JoeCole', 'Joe', 'Cole', 'joecole@mail.com', 'golden', 'mnbvc'),
('RoyMartin', 'Roy', 'Martin', 'roymartin@mail.com', 'silver', 'vbgfr'),
('StefanieBrown', 'Stefanie', 'Brown', 'stefaniebrown@mail.com', 'no_packet', 'cfvgy'),
('HenryWilliams', 'Henry', 'Williams', 'henrywilliams@mail.com', 'golden', 'gbhnm'),
('AbigailTaylor', 'Abigail', 'Taylor', 'abigailtaylor@mail.com', 'no_packet', 'bvfre'),
('AlexanderAnderson', 'Alexander', 'Anderson', 'alexanderanderson@mail.com', 'silver', 'awqzx'),
('EllaJohnson', 'Ella', 'Johnson', 'ellajohnson@mail.com', 'golden', 'edcrf'),
('ChristopherBrown', 'Christopher', 'Brown', 'christopherbrown@mail.com', 'no_packet', 'tgvby'),
('SofiaSmith', 'Sofia', 'Smith', 'sofiasmith@mail.com', 'silver', 'yhnju'),
('LucasDoe', 'Lucas', 'Doe', 'lucasdoe@mail.com', 'golden', 'plkmn'),
('ScarlettWilliams', 'Scarlett', 'Williams', 'scarlettwilliams@mail.com', 'no_packet', 'iklko'),
('LiamTaylor', 'Liam', 'Taylor', 'liamtaylor@mail.com', 'silver', 'nbvcx'),
('GraceBrown', 'Grace', 'Brown', 'gracebrown@mail.com', 'golden', 'mnbvc'),
('DanielJohnson', 'Daniel', 'Johnson', 'danieljohnson@mail.com', 'no_packet', 'vbgfr'),
('ChloeAnderson', 'Chloe', 'Anderson', 'chloeanderson@mail.com', 'silver', 'cfvgy'),
('JacksonTaylor', 'Jackson', 'Taylor', 'jacksontaylor@mail.com', 'golden', 'gbhnm'),
('MadisonSmith', 'Madison', 'Smith', 'madisonsmith@mail.com', 'no_packet', 'bvfre'),
('LilyDoe', 'Lily', 'Doe', 'lilydoe@mail.com', 'silver', 'awqzx'),
('RyanWilliams', 'Ryan', 'Williams', 'ryanwilliams@mail.com', 'golden', 'edcrf'),
('AidenTaylor', 'Aiden', 'Taylor', 'aidentaylor@mail.com', 'no_packet', 'tgvby'),
('ZoeBrown', 'Zoe', 'Brown', 'zoebrown@mail.com', 'silver', 'yhnju'),
('MasonJohnson', 'Mason', 'Johnson', 'masonjohnson@mail.com', 'golden', 'plkmn'),
('PenelopeAnderson', 'Penelope', 'Anderson', 'penelopeanderson@mail.com', 'no_packet', 'iklko'),
('EthanTaylor', 'Ethan', 'Taylor', 'ethantaylor@mail.com', 'silver', 'nbvcx'),
('NoraSmith', 'Nora', 'Smith', 'norasmith@mail.com', 'golden', 'mnbvc'),
('LoganDoe', 'Logan', 'Doe', 'logandoe@mail.com', 'no_packet', 'vbgfr');


-- INSERT INTO PROFESSOR--
--
INSERT INTO professor (username, first_name, last_name, email, age, address, packet, votes) VALUES
('JohnDoe', 'John', 'Doe', 'johndoe@mail.com', 30, '123 Main St', 'no_packet', 3),
('JaneSmith', 'Jane', 'Smith', 'janesmith@mail.com', 35, '456 Elm St', 'silver', 2),
('SamJohnson', 'Sam', 'Johnson', 'samjohnson@mail.com', 40, '789 Oak St', 'golden', 8),
('JohnSmith', 'John', 'Smith', 'johnsmith@mail.com', 32, '75 Maple Ave', 'no_packet', 0),
('JaneMason', 'Jane', 'Mason', 'janemason@mail.com', 38, '4 Pine St', 'silver', -5),
('OliverJohnson', 'Oliver', 'Johnson', 'oliverjohnson@mail.com', 45, '10 Cedar Rd', 'golden', 7),
('RobertWilliams', 'Robert', 'Williams', 'robertwilliams@mail.com', 41, '23 Birch Ln', 'no_packet', -3),
('EmilyAnderson', 'Emily', 'Anderson', 'emilyanderson@mail.com', 36, '56 Walnut St', 'silver', 6),
('MichaelBrown', 'Michael', 'Brown', 'michaelbrown@mail.com', 39, '8 Spruce Ave', 'golden', 4),
('JessicaTaylor', 'Jessica', 'Taylor', 'jessicataylor@mail.com', 33, '12 Oak St', 'no_packet', 9),
('DanielDavis', 'Daniel', 'Davis', 'danieldavis@mail.com', 37, '45 Maple Ave', 'silver', -1),
('OliviaMiller', 'Olivia', 'Miller', 'oliviamiller@mail.com', 42, '16 Pine St', 'golden', 5),
('DavidWilson', 'David', 'Wilson', 'davidwilson@mail.com', 31, '34 Cedar Rd', 'no_packet', 2),
('SophiaMoore', 'Sophia', 'Moore', 'sophiamoore@mail.com', 35, '67 Birch Ln', 'silver', 10),
('JosephAnderson', 'Joseph', 'Anderson', 'josephanderson@mail.com', 40, '90 Walnut St', 'golden', 5),
('EmmaTaylor', 'Emma', 'Taylor', 'emmataylor@mail.com', 34, '11 Oak St', 'no_packet', 6),
('JamesJohnson', 'James', 'Johnson', 'jamesjohnson@mail.com', 38, '28 Maple Ave', 'silver', 4),
('MiaBrown', 'Mia', 'Brown', 'miabrown@mail.com', 43, '6 Pine St', 'golden', 8),
('BenjaminSmith', 'Benjamin', 'Smith', 'benjaminsmith@mail.com', 39, '19 Cedar Rd', 'no_packet', 3),
('AvaDoe', 'Ava', 'Doe', 'avadoe@mail.com', 35, '32 Walnut St', 'silver', 7),
('PedroMartins', 'Pedro', 'Martins', 'pedromartins@mail.com', 28, '1 Oak St', 'silver', -2),
('MarcoSilva', 'Marco', 'Silva', 'marcosilva@mail.com', 33, '2 Pine St', 'no_packet', 5),
('OscarCardozo', 'Oscar', 'Cardozo', 'oscarcardozo@mail.com', 36, '3 Cedar Rd', 'golden', -1),
('NickCage', 'Nick', 'Cage', 'nickcage@mail.com', 40, '4 Walnut St', 'silver', 9),
('WalterBerry', 'Walter', 'Berry', 'walterberry@mail.com', 45, '5 Maple Ave', 'no_packet', 5),
('MikeBibby', 'Mike', 'Bibby', 'mikebibby@mail.com', 38, '6 Pine St', 'golden', 6),
('GaryPayton', 'Gary', 'Payton', 'garypayton@mail.com', 41, '7 Cedar Rd', 'silver', 4),
('VictorHayes', 'Victor', 'Hayes', 'victorhayes@mail.com', 39, '8 Walnut St', 'no_packet', 8),
('JoeCole', 'Joe', 'Cole', 'joecole@mail.com', 44, '9 Maple Ave', 'golden', 3),
('RoyMartin', 'Roy', 'Martin', 'roymartin@mail.com', 37, '10 Pine St', 'silver', 7),
('StefanieBrown', 'Stefanie', 'Brown', 'stefaniebrown@mail.com', 42, '11 Cedar Rd', 'no_packet', 2);


-- INSERT INTO STUDENT--
--
INSERT INTO student (username, first_name, last_name, email, age, packet) VALUES
('HenryWilliams', 'Henry', 'Williams', 'henrywilliams@mail.com', 12, 'golden'),
('AbigailTaylor', 'Abigail', 'Taylor', 'abigailtaylor@mail.com', 13, 'no_packet'),
('AlexanderAnderson', 'Alexander', 'Anderson', 'alexanderanderson@mail.com', 14, 'silver'),
('EllaJohnson', 'Ella', 'Johnson', 'ellajohnson@mail.com', 15, 'golden'),
('ChristopherBrown', 'Christopher', 'Brown', 'christopherbrown@mail.com', 16, 'no_packet'),
('SofiaSmith', 'Sofia', 'Smith', 'sofiasmith@mail.com', 17, 'silver'),
('LucasDoe', 'Lucas', 'Doe', 'lucasdoe@mail.com', 18, 'golden'),
('ScarlettWilliams', 'Scarlett', 'Williams', 'scarlettwilliams@mail.com', 19, 'no_packet'),
('LiamTaylor', 'Liam', 'Taylor', 'liamtaylor@mail.com', 20, 'silver'),
('GraceBrown', 'Grace', 'Brown', 'gracebrown@mail.com', 21, 'golden'),
('DanielJohnson', 'Daniel', 'Johnson', 'danieljohnson@mail.com', 12, 'no_packet'),
('ChloeAnderson', 'Chloe', 'Anderson', 'chloeanderson@mail.com', 13, 'silver'),
('JacksonTaylor', 'Jackson', 'Taylor', 'jacksontaylor@mail.com', 14, 'golden'),
('MadisonSmith', 'Madison', 'Smith', 'madisonsmith@mail.com', 15, 'no_packet'),
('LilyDoe', 'Lily', 'Doe', 'lilydoe@mail.com', 16, 'silver'),
('RyanWilliams', 'Ryan', 'Williams', 'ryanwilliams@mail.com', 17, 'golden'),
('AidenTaylor', 'Aiden', 'Taylor', 'aidentaylor@mail.com', 18, 'no_packet'),
('ZoeBrown', 'Zoe', 'Brown', 'zoebrown@mail.com', 19, 'silver'),
('MasonJohnson', 'Mason', 'Johnson', 'masonjohnson@mail.com', 20, 'golden'),
('PenelopeAnderson', 'Penelope', 'Anderson', 'penelopeanderson@mail.com', 21, 'no_packet'),
('EthanTaylor', 'Ethan', 'Taylor', 'ethantaylor@mail.com', 12, 'silver'),
('NoraSmith', 'Nora', 'Smith', 'norasmith@mail.com', 13, 'golden'),
('LoganDoe', 'Logan', 'Doe', 'logandoe@mail.com', 14, 'no_packet');


-- INSERT INTO SUBJECT--
--
INSERT INTO subject (subject_name) VALUES
	('Mathematics'),
    ('English Language and Literature'),
    ('Biology'),
    ('Chemistry'),
    ('Physics'),
    ('History'),
    ('Geography'),
    ('Computer Science'),
    ('Economics'),
    ('Psychology'),
    ('Literature'),
    ('Sociology'),
    ('Political Science'),
    ('Algebra'),
    ('Linear Drawing'),
    ('Spanish Language and Literature'),
    ('Ancient Greek'),
    ('Principles of IT applications'),
	('Object Oriented Programming');
    
-- INSERT INTO PROFS_SUBJECTS--
--
INSERT INTO profs_subjects (username, subject_name) VALUES
    ('JohnDoe', 'Mathematics'),
    ('JohnDoe', 'Algebra'),
    ('JaneSmith', 'Mathematics'),
    ('JaneSmith', 'Algebra'),
    ('SamJohnson', 'Mathematics'),
	('SamJohnson', 'Algebra'),
    ('JohnSmith', 'Mathematics'),
    ('JohnSmith', 'Algebra'),
	('JaneMason', 'English Language and Literature'),
    ('OliverJohnson', 'English Language and Literature'),
    ('RobertWilliams', 'English Language and Literature'),
    ('JaneMason', 'Spanish Language and Literature'),
    ('OliverJohnson', 'Spanish Language and Literature'),
    ('EmilyAnderson', 'Biology'),
    ('MichaelBrown', 'Biology'),
    ('JessicaTaylor', 'Biology'),
    ('EmilyAnderson', 'Chemistry'),
    ('DanielDavis', 'Physics'),
    ('DanielDavis', 'Chemistry'),
    ('OliviaMiller', 'Physics'),
    ('OliviaMiller', 'Chemistry'),
    ('DavidWilson', 'Physics'),
    ('DavidWilson', 'Chemistry'),
    ('SophiaMoore', 'Physics'),
    ('SophiaMoore', 'Chemistry'),
    ('JamesJohnson', 'Computer Science'),
    ('JamesJohnson', 'Principles of IT applications'),
    ('JamesJohnson', 'Object Oriented Programming'),
    ('EmmaTaylor', 'Computer Science'),
    ('EmmaTaylor', 'Principles of IT applications'),
    ('EmmaTaylor', 'Object Oriented Programming'),
    ('MiaBrown', 'Computer Science'),
    ('MiaBrown', 'Principles of IT applications'),
	('MiaBrown', 'Object Oriented Programming'),
    ('BenjaminSmith', 'Principles of IT applications'),
    ('BenjaminSmith', 'Object Oriented Programming'),
    ('BenjaminSmith', 'Computer Science'),
	('StefanieBrown', 'Linear Drawing'),
    ('JoeCole', 'Geography'),
    ('RoyMartin', 'Political Science'),
	('AvaDoe', 'History'),
    ('AvaDoe', 'Ancient Greek'),
    ('AvaDoe', 'Literature'),
    ('AvaDoe', 'Sociology'),
    ('PedroMartins', 'History'),
    ('PedroMartins', 'Ancient Greek'),
    ('PedroMartins', 'Literature'),
    ('PedroMartins', 'Sociology'),
    ('OscarCardozo', 'History'),
    ('OscarCardozo', 'Ancient Greek'),
    ('OscarCardozo', 'Literature'),
    ('OscarCardozo', 'Sociology'),
    ('MarcoSilva', 'History'),
    ('MarcoSilva', 'Ancient Greek'),
    ('MarcoSilva', 'Literature'),
    ('MarcoSilva', 'Sociology'),
    ('NickCage', 'History'),
    ('NickCage', 'Ancient Greek'),
    ('NickCage', 'Literature'),
    ('WalterBerry', 'Sociology'),
    ('WalterBerry', 'History'),
    ('WalterBerry', 'Ancient Greek'),
    ('GaryPayton', 'Literature'),
    ('GaryPayton', 'Sociology');
    
    
-- INSERT INTO FRGT_PSWD --
--
INSERT INTO frgt_pswd (username, quest, ans) VALUES
('JohnDoe', 'What is your favorite color?', 'Blue'),
('JaneSmith', 'What is your pets name?', 'Max'),
('SamJohnson', 'What is your mothers maiden name?', 'Smith'),
('JohnSmith', 'What is your favorite food?', 'Pizza'),
('JaneMason', 'What is your birthdate?', 'January 1st'),
('OliverJohnson', 'What is your favorite book?', 'To Kill a Mockingbird'),
('RobertWilliams', 'What is your favorite movie?', 'The Shawshank Redemption'),
('EmilyAnderson', 'What is your favorite hobby?', 'Playing the guitar'),
('MichaelBrown', 'What is your favorite sports team?', 'New York Yankees'),
('JessicaTaylor', 'What is your favorite animal?', 'Dolphin'),
('DanielDavis', 'What is your favorite music genre?', 'Pop'),
('OliviaMiller', 'What is your favorite season?', 'Summer'),
('DavidWilson', 'What is your dream job?', 'Travel photographer'),
('SophiaMoore', 'What is your favorite TV show?', 'Friends'),
('JosephAnderson', 'What is your favorite sport?', 'Basketball'),
('EmmaTaylor', 'What is your favorite dessert?', 'Chocolate cake'),
('JamesJohnson', 'What is your favorite outdoor activity?', 'Hiking'),
('MiaBrown', 'What is your favorite song?', 'Bohemian Rhapsody'),
('BenjaminSmith', 'What is your favorite quote?', 'Carpe Diem'),
('AvaDoe', 'What is your favorite holiday?', 'Christmas'),
('PedroMartins', 'What is your favorite cuisine?', 'Italian'),
('MarcoSilva', 'What is your favorite color?', 'Green'),
('OscarCardozo', 'What is your favorite movie genre?', 'Action'),
('NickCage', 'What is your favorite musician?', 'Michael Jackson'),
('WalterBerry', 'What is your favorite city?', 'Paris'),
('MikeBibby', 'What is your favorite video game?', 'The Legend of Zelda'),
('GaryPayton', 'What is your favorite TV series?', 'Breaking Bad'),
('VictorHayes', 'What is your favorite holiday destination?', 'Bali'),
('JoeCole', 'What is your favorite hobby?', 'Painting'),
('RoyMartin', 'What is your favorite book genre?', 'Mystery'),
('StefanieBrown', 'What is your favorite flower?', 'Rose'),
('HenryWilliams', 'What is your favorite sport?', 'Soccer'),
('AbigailTaylor', 'What is your favorite movie?', 'The Godfather'),
('AlexanderAnderson', 'What is your favorite animal?', 'Elephant'),
('EllaJohnson', 'What is your favorite color?', 'Purple'),
('ChristopherBrown', 'What is your favorite food?', 'Sushi'),
('SofiaSmith', 'What is your favorite season?', 'Autumn'),
('LucasDoe', 'What is your favorite hobby?', 'Photography'),
('ScarlettWilliams', 'What is your favorite TV show?', 'Game of Thrones'),
('LiamTaylor', 'What is your dream destination?', 'Maldives'),
('GraceBrown', 'What is your favorite dessert?', 'Ice cream'),
('DanielJohnson', 'What is your favorite artist?', 'Leonardo da Vinci'),
('ChloeAnderson', 'What is your favorite color?', 'Pink'),
('JacksonTaylor', 'What is your favorite movie genre?', 'Comedy'),
('MadisonSmith', 'What is your favorite book?', 'Pride and Prejudice'),
('LilyDoe', 'What is your favorite sport?', 'Tennis'),
('RyanWilliams', 'What is your favorite food?', 'Burger'),
('AidenTaylor', 'What is your favorite animal?', 'Lion'),
('ZoeBrown', 'What is your favorite season?', 'Spring'),
('MasonJohnson', 'What is your dream job?', 'Astronaut'),
('PenelopeAnderson', 'What is your favorite TV series?', 'Stranger Things'),
('EthanTaylor', 'What is your favorite hobby?', 'Gardening'),
('NoraSmith', 'What is your favorite movie?', 'The Lion King'),
('LoganDoe', 'What is your favorite color?', 'Red');

-- INSERT INTO EVALUATIONS --
--
INSERT INTO evaluations ( username, eval,votes) VALUES
('JohnDoe', 'Good',10),
('JaneSmith', 'Excellent',12),
('SamJohnson', 'Average',15),
('JohnSmith', 'Good',20),
('JaneMason', 'Excellent',7),
('OliverJohnson', 'Average',5),
('RobertWilliams', 'Good',30),
('EmilyAnderson', 'Excellent',40),
('MichaelBrown', 'Average',21),
('JessicaTaylor', 'Good',16),
('DanielDavis', 'Excellent',11),
('OliviaMiller', 'Average',8),
('DavidWilson', 'Good',5),
('SophiaMoore', 'Excellent',30),
('JosephAnderson', 'Average',22),
('EmmaTaylor', 'Good',15),
('JamesJohnson', 'Excellent',38),
('MiaBrown', 'Average',10),
('BenjaminSmith', 'Good',11),
('AvaDoe', 'Excellent',18),
('PedroMartins', 'Average',26),
('MarcoSilva', 'Good',7),
('OscarCardozo', 'Excellent',15),
('NickCage', 'Average',9),
('WalterBerry', 'Good',10),
('MikeBibby', 'Excellent',21),
('GaryPayton', 'Average',26),
('VictorHayes', 'Good',19),
('JoeCole', 'Excellent',50),
('RoyMartin', 'Average',2),
('StefanieBrown', 'Good',27);

-- INSERT INTO QUIZ --
--
INSERT INTO quiz (question, ans_a, ans_b, ans_c, correct_ans, category) VALUES
    ('What year did Christopher Columbus discover America?', '1776', '1500', '1492', 'c', 'History'),
    ('Who was the first president of the United States?', 'George Washington', 'Thomas Jefferson', 'Abraham Lincoln', 'b', 'History'),
    ('Which war was fought between the North and the South in the United States?', 'American Civil War', 'World War II', 'Vietnam War', 'c', 'History'),
    ('In which year did World War I begin?', '1914', '1918', '1939', 'a', 'History'),
    ('Which country was ruled by Adolf Hitler during World War II?', 'Germany', 'Italy', 'Japan', 'a', 'History'),
    ('Who is known for painting the ceiling of the Sistine Chapel?', 'Rafael', 'Leonardo da Vinci', 'Michelangelo', 'c', 'History'),
    ('Who wrote the play Romeo and Juliet?', 'William Shakespeare', 'Arthur Miller', 'George Bernard Shaw', 'a', 'History'),
    ('What year did the Berlin Wall fall?', '1989', '1991', '1995', 'b', 'History'),
    ('Which civilization built the Machu Picchu citadel in Peru?', 'Inca', 'Maya', 'Aztec', 'a', 'History'),
    ('What is the Magna Carta?', 'A charter of rights and freedoms', 'A famous painting', 'A scientific theory', 'c', 'History'),
    ('What is the chemical symbol for hydrogen?', 'H', 'O', 'He', 'c', 'Science'),
    ('Which planet is known as the Red Planet?', 'Mars', 'Venus', 'Jupiter', 'a', 'Science'),
    ('What is the largest organ in the human body?', 'Skin', 'Heart', 'Brain', 'b', 'Science'),
    ('What is the process by which plants convert sunlight into food?', 'Photosynthesis', 'Respiration', 'Fermentation', 'a', 'Science'),
    ('What is the unit of measurement for electric current?', 'Ampere', 'Volt', 'Watt', 'b', 'Science'),
    ('Who developed the theory of relativity?', 'Albert Einstein', 'Isaac Newton', 'Galileo Galilei', 'a', 'Science'),
    ('What is the chemical symbol for gold?', 'Cu', 'Ag', 'Au', 'c', 'Science'),
    ('What is the largest planet in our solar system?', 'Jupiter', 'Saturn', 'Neptune', 'a', 'Science'),
    ('What is the study of fossils called?', 'Archaeology', 'Paleontology', 'Geology', 'b', 'Science'),
    ('What is the process of converting a solid directly into a gas called?', 'Sublimation', 'Evaporation', 'Condensation', 'a', 'Science'),
    ('What is the capital of France?', 'London', 'Paris', 'Rome', 'b', 'General'),
    ('Who painted the Mona Lisa?', 'Leonardo da Vinci', 'Pablo Picasso', 'Vincent van Gogh', 'b', 'General'),
    ('What is the national animal of Australia?', 'Kangaroo', 'Lion', 'Elephant', 'a', 'General'),
    ('What is the currency of Japan?', 'Euro', 'Yen', 'Pound', 'b', 'General'),
    ('Which city is known as the "Big Apple"?', 'New York City', 'Los Angeles', 'Chicago', 'a', 'General'),
    ('What is the worlds largest ocean?', 'Pacific Ocean', 'Atlantic Ocean', 'Indian Ocean', 'a', 'General'),
    ('Who wrote the novel "Pride and Prejudice"?', 'Charles Dickens', 'Jane Austen', 'Mark Twain', 'b', 'General'),
    ('What is the national flower of England?', 'Rose', 'Tulip', 'Lotus', 'a', 'General'),
    ('Which instrument has 88 keys?', 'Piano', 'Guitar', 'Violin', 'a', 'General'),
    ('What is the largest country by land area?', 'China', 'Canada', 'Russia', 'c', 'General'),
    ('Who wrote the Declaration of Independence?', 'Thomas Jefferson', 'George Washington', 'Benjamin Franklin', 'c', 'History'),
    ('In which year did World War II end?', '1945', '1939', '1950', 'b', 'History'),
    ('What is the capital of Canada?', 'Ottawa', 'Toronto', 'Vancouver', 'c', 'History'),
    ('Who was the first man to walk on the moon?', 'Neil Armstrong', 'Buzz Aldrin', 'Yuri Gagarin', 'b', 'History'),
    ('Which famous scientist developed the theory of general relativity?', 'Albert Einstein', 'Isaac Newton', 'Stephen Hawking', 'c', 'History'),
    ('Which country was the first to develop nuclear weapons?', 'United States', 'Russia', 'Germany', 'a', 'History'),
    ('Who is often credited with inventing the telephone?', 'Alexander Graham Bell', 'Thomas Edison', 'Nikola Tesla', 'c', 'History'),
    ('Which famous battle was fought in 1066 and had a significant impact on English history?', 'Battle of Hastings', 'Battle of Waterloo', 'Battle of Gettysburg', 'b', 'History'),
    ('Who painted the famous artwork "The Starry Night"?', 'Vincent van Gogh', 'Pablo Picasso', 'Leonardo da Vinci', 'a', 'History'),
    ('What year did the United States gain independence from Great Britain?', '1776', '1789', '1812', 'c', 'History'),
    ('What is the largest planet in our solar system?', 'Jupiter', 'Saturn', 'Neptune', 'b', 'Science'),
    ('What is the chemical symbol for silver?', 'Ag', 'Au', 'Cu', 'c', 'Science'),
    ('What is the process by which plants release water vapor through their leaves?', 'Transpiration', 'Evaporation', 'Condensation', 'a', 'Science'),
    ('What is the study of living organisms called?', 'Biology', 'Chemistry', 'Physics', 'c', 'Science'),
    ('What is the smallest unit of matter?', 'Atom', 'Molecule', 'Cell', 'a', 'Science'),
    ('Who discovered penicillin?', 'Alexander Fleming', 'Louis Pasteur', 'Marie Curie', 'b', 'Science'),
    ('What is the largest organ in the human body?', 'Skin', 'Heart', 'Liver', 'c', 'Science'),
    ('What is the process by which solid ice changes directly into water vapor called?', 'Sublimation', 'Evaporation', 'Condensation', 'b', 'Science'),
    ('What is the chemical symbol for iron?', 'Fe', 'Ir', 'In', 'c', 'Science'),
    ('What is the study of the Earth\s atmosphere called?', 'Meteorology', 'Geology', 'Astronomy', 'a', 'Science'),
    ('What is the currency of Brazil?', 'Real', 'Peso', 'Euro', 'b', 'General'),
    ('What is the tallest mountain in the world?', 'Mount Everest', 'K2', 'Makalu', 'c', 'General'),
    ('Who is the author of the Harry Potter book series?', 'J.K. Rowling', 'Stephen King', 'George R.R. Martin', 'a', 'General'),
    ('What is the national bird of the United States?', 'Bald Eagle', 'Blue Jay', 'Red-tailed Hawk', 'b', 'General'),
    ('What is the largest ocean on Earth?', 'Pacific Ocean', 'Atlantic Ocean', 'Indian Ocean', 'c', 'General'),
    ('Which country is known as the Land of the Rising Sun?', 'Japan', 'China', 'India', 'a', 'General'),
    ('What is the largest hot desert in the world?', 'Sahara Desert', 'Arabian Desert', 'Gobi Desert', 'b', 'General'),
    ('Who is the main protagonist in the novel The Great Gatsby?', 'Jay Gatsby', 'Nick Carraway', 'Daisy Buchanan', 'c', 'General'),
    ('What is the national animal of Canada?', 'Beaver', 'Moose', 'Polar Bear', 'a', 'General'),
    ('What is the largest city in the world by population?', 'Tokyo', 'Delhi', 'Shanghai', 'b', 'General');
