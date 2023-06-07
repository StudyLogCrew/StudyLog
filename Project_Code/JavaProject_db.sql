DROP SCHEMA IF EXISTS StudyLog;
CREATE SCHEMA StudyLog;
USE StudyLog;

-- Table structure for table `professor`
--
CREATE TABLE professor (
  username VARCHAR(45) NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  passwrd VARCHAR(20) NOT NULL,
  email VARCHAR(45) NOT NULL,
  age INT(10) DEFAULT 0,
  address VARCHAR(50) DEFAULT ' ',
  packet enum('no_packet','silver','golden'),
  votes INT(10) DEFAULT 0,
  PRIMARY KEY  (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- Table structure for table `student`
--
CREATE TABLE student (
  username VARCHAR(45) NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  passwrd VARCHAR(20) NOT NULL,
  email VARCHAR(45) NOT NULL,
  age INT(10) DEFAULT 0,
  address VARCHAR(50) DEFAULT ' ',
  packet enum('no_packet','silver','golden'),
  PRIMARY KEY  (username)
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
CREATE TABLE forgot_pswd_st (
	  qst_id INT NOT NULL auto_increment,
	  username VARCHAR(45),
    quest VARCHAR(250) NOT NULL,
    ans VARCHAR(50) NOT NULL,
    PRIMARY KEY(qst_id),
	CONSTRAINT usernamest FOREIGN KEY (username) REFERENCES student (username) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `frgt_pswd`
--
CREATE TABLE forgot_pswd_pr (
	  qst_id INT NOT NULL auto_increment,
	  username VARCHAR(45),
    quest VARCHAR(250) NOT NULL,
    ans VARCHAR(50) NOT NULL,
    PRIMARY KEY(qst_id),
	CONSTRAINT usernamepr FOREIGN KEY (username) REFERENCES professor (username) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `evaluations`
--
CREATE TABLE evaluations (
  eval_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  username VARCHAR(45) NOT NULL,
  eval VARCHAR(250) NOT NULL,
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


-- INSERT INTO PROFESSOR--
--
INSERT INTO professor (username, first_name, last_name, passwrd, email, age, address, packet, votes) VALUES
('JohnDoe', 'John', 'Doe', 'abcde', 'johndoe@mail.com', 30, '123 Main St', 'no_packet', 3),
('JaneSmith', 'Jane', 'Smith', 'fghij', 'janesmith@mail.com', 35, '456 Elm St', 'silver', 2),
('SamJohnson', 'Sam', 'Johnson', 'klmno', 'samjohnson@mail.com', 40, '789 Oak St', 'golden', 8),
('JohnSmith', 'John', 'Smith', 'pqrst', 'johnsmith@mail.com', 32, '75 Maple Ave', 'no_packet', 0),
('JaneMason', 'Jane', 'Mason', 'uvwxy', 'janemason@mail.com', 38, '4 Pine St', 'silver', -5),
('OliverJohnson', 'Oliver', 'Johnson', 'zabcd', 'oliverjohnson@mail.com', 45, '10 Cedar Rd', 'golden', 7),
('RobertWilliams', 'Robert', 'Williams', 'efghi', 'robertwilliams@mail.com', 41, '23 Birch Ln', 'no_packet', -3),
('EmilyAnderson', 'Emily', 'Anderson', 'jklmn', 'emilyanderson@mail.com', 36, '56 Walnut St', 'silver', 6),
('MichaelBrown', 'Michael', 'Brown', 'opqrs', 'michaelbrown@mail.com', 39, '8 Spruce Ave', 'golden', 4),
('JessicaTaylor', 'Jessica', 'Taylor', 'tuvwx', 'jessicataylor@mail.com', 33, '12 Oak St', 'no_packet', 9),
('DanielDavis', 'Daniel', 'Davis', 'yzabc', 'danieldavis@mail.com', 37, '45 Maple Ave', 'silver', -1),
('OliviaMiller', 'Olivia', 'Miller', 'defgh', 'oliviamiller@mail.com', 42, '16 Pine St', 'golden', 5),
('DavidWilson', 'David', 'Wilson', 'ijklm', 'davidwilson@mail.com', 31, '34 Cedar Rd', 'no_packet', 2),
('SophiaMoore', 'Sophia', 'Moore', 'nopqr', 'sophiamoore@mail.com', 35, '67 Birch Ln', 'silver', 10),
('JosephAnderson', 'Joseph', 'Anderson', 'stuvw', 'josephanderson@mail.com', 40, '90 Walnut St', 'golden', 5),
('EmmaTaylor', 'Emma', 'Taylor', 'xyabc', 'emmataylor@mail.com', 34, '11 Oak St', 'no_packet', 6),
('JamesJohnson', 'James', 'Johnson', 'defgh', 'jamesjohnson@mail.com', 38, '28 Maple Ave', 'silver', 4),
('MiaBrown', 'Mia', 'Brown', 'ijklm', 'miabrown@mail.com', 43, '6 Pine St', 'golden', 8),
('BenjaminSmith', 'Benjamin', 'Smith', 'nopqr', 'benjaminsmith@mail.com', 39, '19 Cedar Rd', 'no_packet', 3),
('AvaDoe', 'Ava', 'Doe', 'stuvw', 'avadoe@mail.com', 35, '32 Walnut St', 'silver', 7),
('PedroMartins', 'Pedro', 'Martins', 'xyabc', 'pedromartins@mail.com', 28, '1 Oak St', 'silver', -2),
('MarcoSilva', 'Marco', 'Silva', 'defgh', 'marcosilva@mail.com', 33, '2 Pine St', 'no_packet', 5),
('OscarCardozo', 'Oscar', 'Cardozo', 'ijklm', 'oscarcardozo@mail.com', 36, '3 Cedar Rd', 'golden', -1),
('NickCage', 'Nick', 'Cage', 'nopqr', 'nickcage@mail.com', 40, '4 Walnut St', 'silver', 9),
('WalterBerry', 'Walter', 'Berry', 'stuvw', 'walterberry@mail.com', 45, '5 Maple Ave', 'no_packet', 5),
('MikeBibby', 'Mike', 'Bibby', 'xyabc', 'mikebibby@mail.com', 38, '6 Pine St', 'golden', 6),
('GaryPayton', 'Gary', 'Payton', 'defgh', 'garypayton@mail.com', 41, '7 Cedar Rd', 'silver', 4),
('VictorHayes', 'Victor', 'Hayes', 'ijklm', 'victorhayes@mail.com', 39, '8 Walnut St', 'no_packet', 8),
('JoeCole', 'Joe', 'Cole', 'nopqr', 'joecole@mail.com', 44, '9 Maple Ave', 'golden', 3),
('RoyMartin', 'Roy', 'Martin', 'stuvw', 'roymartin@mail.com', 37, '10 Pine St', 'silver', 7),
('StefanieBrown', 'Stefanie', 'Brown', 'defgh', 'stefaniebrown@mail.com', 42, '11 Cedar Rd', 'no_packet', 2);

-- INSERT INTO STUDENT--
--
INSERT INTO student (username, first_name, last_name, passwrd, email, age, address, packet) VALUES
('HenryWilliams', 'Henry', 'Williams', 'pass1', 'henrywilliams@mail.com', 12, '111 Elm St', 'golden'),
('AbigailTaylor', 'Abigail', 'Taylor', 'pass2', 'abigailtaylor@mail.com', 13, '222 Oak St', 'no_packet'),
('AlexanderAnderson', 'Alexander', 'Anderson', 'pass3', 'alexanderanderson@mail.com', 14, '333 Pine St', 'silver'),
('EllaJohnson', 'Ella', 'Johnson', 'pass4', 'ellajohnson@mail.com', 15, '444 Cedar Rd', 'golden'),
('ChristopherBrown', 'Christopher', 'Brown', 'pass5', 'christopherbrown@mail.com', 16, '555 Walnut St', 'no_packet'),
('SofiaSmith', 'Sofia', 'Smith', 'pass6', 'sofiasmith@mail.com', 17, '666 Maple Ave', 'silver'),
('LucasDoe', 'Lucas', 'Doe', 'pass7', 'lucasdoe@mail.com', 18, '777 Birch Ln', 'golden'),
('ScarlettWilliams', 'Scarlett', 'Williams', 'pass8', 'scarlettwilliams@mail.com', 19, '888 Spruce Ave', 'no_packet'),
('LiamTaylor', 'Liam', 'Taylor', 'pass9', 'liamtaylor@mail.com', 20, '999 Walnut St', 'silver'),
('GraceBrown', 'Grace', 'Brown', 'pass10', 'gracebrown@mail.com', 21, '1010 Maple Ave', 'golden'),
('DanielJohnson', 'Daniel', 'Johnson', 'pass11', 'danieljohnson@mail.com', 12, '1111 Pine St', 'no_packet'),
('ChloeAnderson', 'Chloe', 'Anderson', 'pass12', 'chloeanderson@mail.com', 13, '1212 Cedar Rd', 'silver'),
('JacksonTaylor', 'Jackson', 'Taylor', 'pass13', 'jacksontaylor@mail.com', 14, '1313 Walnut St', 'golden'),
('MadisonSmith', 'Madison', 'Smith', 'pass14', 'madisonsmith@mail.com', 15, '1414 Maple Ave', 'no_packet'),
('LilyDoe', 'Lily', 'Doe', 'pass15', 'lilydoe@mail.com', 16, '1515 Pine St', 'silver'),
('RyanWilliams', 'Ryan', 'Williams', 'pass16', 'ryanwilliams@mail.com', 17, '1616 Cedar Rd', 'golden'),
('AidenTaylor', 'Aiden', 'Taylor', 'pass17', 'aidentaylor@mail.com', 18, '1717 Walnut St', 'no_packet'),
('ZoeBrown', 'Zoe', 'Brown', 'pass18', 'zoebrown@mail.com', 19, '1818 Maple Ave', 'silver'),
('MasonJohnson', 'Mason', 'Johnson', 'pass19', 'masonjohnson@mail.com', 20, '1919 Pine St', 'golden'),
('PenelopeAnderson', 'Penelope', 'Anderson', 'pass20', 'penelopeanderson@mail.com', 21, '2020 Cedar Rd', 'no_packet'),
('EthanTaylor', 'Ethan', 'Taylor', 'pass21', 'ethantaylor@mail.com', 12, '2121 Walnut St', 'silver'),
('NoraSmith', 'Nora', 'Smith', 'pass22', 'norasmith@mail.com', 13, '2222 Maple Ave', 'golden'),
('LoganDoe', 'Logan', 'Doe', 'pass23', 'logandoe@mail.com', 14, '2323 Pine St', 'no_packet');


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
INSERT INTO forgot_pswd_pr (qst_id, username, quest, ans) VALUES
(1, 'JohnDoe', 'What is your favorite color?', 'Blue'),
(2, 'JaneSmith', 'What is your pets name?', 'Max'),
(3, 'SamJohnson', 'What is your mothers maiden name?', 'Smith'),
(4, 'JohnSmith', 'What is your favorite food?', 'Pizza'),
(5, 'JaneMason', 'What is your birthdate?', 'January 1st'),
(6, 'OliverJohnson', 'What is your favorite book?', 'To Kill a Mockingbird'),
(7, 'RobertWilliams', 'What is your favorite movie?', 'The Shawshank Redemption'),
(8, 'EmilyAnderson', 'What is your favorite hobby?', 'Playing the guitar'),
(9, 'MichaelBrown', 'What is your favorite sports team?', 'New York Yankees'),
(10, 'JessicaTaylor', 'What is your favorite animal?', 'Dolphin'),
(11, 'DanielDavis', 'What is your favorite music genre?', 'Pop'),
(12, 'OliviaMiller', 'What is your favorite season?', 'Summer'),
(13, 'DavidWilson', 'What is your dream job?', 'Travel photographer'),
(14, 'SophiaMoore', 'What is your favorite TV show?', 'Friends'),
(15, 'JosephAnderson', 'What is your favorite sport?', 'Basketball'),
(16, 'EmmaTaylor', 'What is your favorite dessert?', 'Chocolate cake'),
(17, 'JamesJohnson', 'What is your favorite outdoor activity?', 'Hiking'),
(18, 'MiaBrown', 'What is your favorite song?', 'Bohemian Rhapsody'),
(19, 'BenjaminSmith', 'What is your favorite quote?', 'Carpe Diem'),
(20, 'AvaDoe', 'What is your favorite holiday?', 'Christmas'),
(21, 'PedroMartins', 'What is your favorite cuisine?', 'Italian'),
(22, 'MarcoSilva', 'What is your favorite color?', 'Green'),
(23, 'OscarCardozo', 'What is your favorite movie genre?', 'Action'),
(24, 'NickCage', 'What is your favorite musician?', 'Michael Jackson'),
(25, 'WalterBerry', 'What is your favorite city?', 'Paris'),
(26, 'MikeBibby', 'What is your favorite video game?', 'The Legend of Zelda'),
(27, 'GaryPayton', 'What is your favorite TV series?', 'Breaking Bad'),
(28, 'VictorHayes', 'What is your favorite holiday destination?', 'Bali'),
(29, 'JoeCole', 'What is your favorite hobby?', 'Painting'),
(30, 'RoyMartin', 'What is your favorite book genre?', 'Mystery'),
(31, 'StefanieBrown', 'What is your favorite flower?', 'Rose');

-- INSERT INTO FRGT_PSWD --
--
INSERT INTO forgot_pswd_st (qst_id, username, quest, ans) VALUES
(1, 'HenryWilliams', 'What is your favorite sport?', 'Soccer'),
(2, 'AbigailTaylor', 'What is your favorite movie?', 'The Godfather'),
(3, 'AlexanderAnderson', 'What is your favorite animal?', 'Elephant'),
(4, 'EllaJohnson', 'What is your favorite color?', 'Purple'),
(5, 'ChristopherBrown', 'What is your favorite food?', 'Sushi'),
(6, 'SofiaSmith', 'What is your favorite season?', 'Autumn'),
(7, 'LucasDoe', 'What is your favorite hobby?', 'Photography'),
(8, 'ScarlettWilliams', 'What is your favorite TV show?', 'Game of Thrones'),
(9, 'LiamTaylor', 'What is your dream destination?', 'Maldives'),
(10, 'GraceBrown', 'What is your favorite dessert?', 'Ice cream'),
(11, 'DanielJohnson', 'What is your favorite artist?', 'Leonardo da Vinci'),
(12, 'ChloeAnderson', 'What is your favorite color?', 'Pink'),
(13, 'JacksonTaylor', 'What is your favorite movie genre?', 'Comedy'),
(14, 'MadisonSmith', 'What is your favorite book?', 'Pride and Prejudice'),
(15, 'LilyDoe', 'What is your favorite subject?', 'Mathematics'),
(16, 'LoganDoe', 'What is your favorite animal?', 'Dog');


-- INSERT INTO EVALUATIONS --
--
INSERT INTO evaluations (eval_id, username, eval) VALUES
(1, 'JohnDoe', 'Good'),
(2, 'JaneSmith', 'Excellent'),
(3, 'SamJohnson', 'Average'),
(4, 'JohnSmith', 'Good'),
(5, 'JaneMason', 'Excellent'),
(6, 'OliverJohnson', 'Average'),
(7, 'RobertWilliams', 'Good'),
(8, 'EmilyAnderson', 'Excellent'),
(9, 'MichaelBrown', 'Average'),
(10, 'JessicaTaylor', 'Good'),
(11, 'DanielDavis', 'Excellent'),
(12, 'OliviaMiller', 'Average'),
(13, 'DavidWilson', 'Good'),
(14, 'SophiaMoore', 'Excellent'),
(15, 'JosephAnderson', 'Average'),
(16, 'EmmaTaylor', 'Good'),
(17, 'JamesJohnson', 'Excellent'),
(18, 'MiaBrown', 'Average'),
(19, 'BenjaminSmith', 'Good'),
(20, 'AvaDoe', 'Excellent'),
(21, 'PedroMartins', 'Average'),
(22, 'MarcoSilva', 'Good'),
(23, 'OscarCardozo', 'Excellent'),
(24, 'NickCage', 'Average'),
(25, 'WalterBerry', 'Good'),
(26, 'MikeBibby', 'Excellent'),
(27, 'GaryPayton', 'Average'),
(28, 'VictorHayes', 'Good'),
(29, 'JoeCole', 'Excellent'),
(30, 'RoyMartin', 'Average'),
(31, 'StefanieBrown', 'Good');

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