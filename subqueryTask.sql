create database LMS_DB;
use LMS_DB;
create table students(
student_id int primary key,
first_name varchar (50),
last_name varchar (50),
email varchar (100),
registration_date date,
country varchar (50));

create table instructors (
  instructor_id int primary key,
  instructor_name varchar(50),
  specialization varchar(50),
  joining_date date
);

create table courses (
  course_id int primary key,
  course_name varchar(50),
  category varchar(50),
  course_fee decimal(10,2),
  instructor_id int,
  foreign key (instructor_id) references instructors(instructor_id)
);

create table enrollments (
 enrollment_id INT PRIMARY KEY,
 student_id INT,
 course_id INT,
 enrollment_date DATE,
 completion_status VARCHAR(20),
 FOREIGN KEY (student_id)
 REFERENCES Students(student_id),
 FOREIGN KEY (course_id)
 REFERENCES Courses(course_id)
);

CREATE TABLE assignments (
 assignment_id INT PRIMARY KEY,
 course_id INT,
 assignment_title VARCHAR(100),
 max_marks INT,
 due_date DATE,
 FOREIGN KEY (course_id)
 REFERENCES Courses(course_id)
);

CREATE TABLE assignment_Submissions (
 submission_id INT PRIMARY KEY,
 assignment_id INT,
 student_id INT,
 marks_obtained INT,
 submission_date DATE,
 FOREIGN KEY (assignment_id)
 REFERENCES Assignments(assignment_id),
 FOREIGN KEY (student_id)
 REFERENCES Students(student_id)
);

create TABLE payments (
 payment_id INT PRIMARY KEY,
 student_id INT,
 amount_paid DECIMAL(10,2),
 payment_date DATE,
 payment_method VARCHAR(20),
 FOREIGN KEY (student_id)
 REFERENCES Students(student_id)
);

insert into instructors (instructor_id, instructor_name, specialization, joining_date) values
(1, 'dr. angela yu', 'web development', '2023-01-15'),
(2, 'prof. andrew ng', 'artificial intelligence', '2023-03-10'),
(3, 'jose portilla', 'data science', '2023-05-22'),
(4, 'colt steele', 'javascript', '2023-08-01'),
(5, 'brad traversy', 'frontend frameworks', '2024-01-10'),
(6, 'maximilian schwarzmüller', 'mobile development', '2024-02-18'),
(7, 'mosh hamedani', 'software architecture', '2024-04-05'),
(8, 'tim buchalka', 'java & backend', '2024-05-12');

insert into courses (course_id, course_name, category, course_fee, instructor_id) values
(101, 'complete web development bootcamp', 'web development', 199.99, 1),
(102, 'machine learning specialization', 'data science', 299.99, 2),
(103, 'deep learning prerequisites', 'data science', 149.99, 2),
(104, 'python for data science masterclass', 'data science', 99.99, 3),
(105, 'the modern javascript bootcamp', 'web development', 89.99, 4),
(106, 'react - the complete guide', 'web development', 129.99, 5),
(107, 'next.js & tailwind css fundamentals', 'web development', 79.99, 5),
(108, 'flutter & dart development mega course', 'mobile development', 179.99, 6),
(109, 'react native bootcamp', 'mobile development', 159.99, 6),
(110, 'design patterns for software engineers', 'software architecture', 249.99, 7),
(111, 'clean code & refactoring practices', 'software architecture', 119.99, 7),
(112, 'java programming masterclass', 'backend development', 139.99, 8),
(113, 'spring boot & microservices ultimate', 'backend development', 189.99, 8),
(114, 'sql & relational databases 101', 'data science', 49.99, 3),
(115, 'css & responsive design tricks', 'web development', 39.99, 4);

insert into students (student_id, first_name, last_name, email, registration_date, country) values
(1, 'john', 'doe', 'john.doe@gmail.com', '2025-01-10', 'united states'),
(2, 'jane', 'smith', 'jane.smith@yahoo.com', '2025-01-12', 'canada'),
(3, 'carlos', 'santana', 'carlos.s@gmail.com', '2025-01-15', 'mexico'),
(4, 'yuki', 'tanaka', 'tanaka.yuki@outlook.com', '2025-01-18', 'japan'),
(5, 'amara', 'okonkwo', 'amara.o@gmail.com', '2025-01-20', 'nigeria'),
(6, 'liam', 'davies', 'liam.d@hotmail.com', '2025-01-22', 'united kingdom'),
(7, 'emma', 'mueller', 'emma.m@gmx.de', '2025-01-25', 'germany'),
(8, 'ahmed', 'mansoor', 'ahmed.m@gmail.com', '2025-01-28', 'egypt'),
(9, 'rahul', 'sharma', 'rahul.sharma@gmail.com', '2025-02-01', 'india'),
(10, 'chloe', 'dubois', 'chloe.d@orange.fr', '2025-02-03', 'france'),
(11, 'oliver', 'wilson', 'oliver.w@gmail.com', '2025-02-05', 'australia'),
(12, 'sofia', 'rossi', 'sofia.rossi@libero.it', '2025-02-08', 'italy'),
(13, 'lucas', 'silva', 'lucas.silva@uol.com.br', '2025-02-10', 'brazil'),
(14, 'fatima', 'zahra', 'fatima.z@gmail.com', '2025-02-12', 'morocco'),
(15, 'min-jun', 'kim', 'kim.mj@naver.com', '2025-02-15', 'south korea'),
(16, 'elena', 'petrova', 'elena.p@mail.ru', '2025-02-18', 'russia'),
(17, 'santiago', 'gomez', 'santi.g@gmail.com', '2025-02-20', 'colombia'),
(18, 'zoe', 'lin', 'zoe.lin@gmail.com', '2025-02-22', 'taiwan'),
(19, 'david', 'van dijk', 'david.vd@gmail.com', '2025-02-25', 'netherlands'),
(20, 'aisha', 'khan', 'aisha.k@gmail.com', '2025-02-28', 'pakistan');


insert into enrollments (enrollment_id, student_id, course_id, enrollment_date, completion_status) values
(1, 1, 101, '2025-01-11', 'completed'),
(2, 1, 105, '2025-01-15', 'in progress'),
(3, 1, 106, '2025-02-01', 'in progress'),
(4, 2, 101, '2025-01-13', 'completed'),
(5, 2, 115, '2025-01-20', 'completed'),
(6, 3, 104, '2025-01-16', 'completed'),
(7, 3, 102, '2025-02-01', 'in progress'),
(8, 4, 102, '2025-01-19', 'completed'),
(9, 4, 103, '2025-02-05', 'in progress'),
(10, 5, 112, '2025-01-21', 'completed'),
(11, 5, 113, '2025-02-10', 'in progress'),
(12, 6, 101, '2025-01-23', 'completed'),
(13, 6, 107, '2025-02-02', 'in progress'),
(14, 7, 110, '2025-01-26', 'completed'),
(15, 7, 111, '2025-02-12', 'in progress'),
(16, 8, 108, '2025-01-29', 'in progress'),
(17, 9, 102, '2025-02-02', 'completed'),
(18, 9, 104, '2025-02-05', 'completed'),
(19, 9, 114, '2025-02-20', 'in progress'),
(20, 10, 105, '2025-02-04', 'completed'),
(21, 10, 106, '2025-02-18', 'in progress'),
(22, 11, 101, '2025-02-06', 'completed'),
(23, 11, 108, '2025-02-20', 'in progress'),
(24, 12, 110, '2025-02-09', 'completed'),
(25, 12, 111, '2025-02-25', 'in progress'),
(26, 13, 104, '2025-02-11', 'completed'),
(27, 13, 102, '2025-03-01', 'in progress'),
(28, 14, 112, '2025-02-13', 'completed'),
(29, 14, 113, '2025-03-05', 'in progress'),
(30, 15, 106, '2025-02-16', 'completed'),
(31, 15, 107, '2025-03-01', 'in progress'),
(32, 16, 101, '2025-02-19', 'completed'),
(33, 17, 105, '2025-02-21', 'completed'),
(34, 17, 106, '2025-03-10', 'in progress'),
(35, 18, 102, '2025-02-23', 'completed'),
(36, 18, 103, '2025-03-12', 'in progress'),
(37, 19, 112, '2025-02-26', 'completed'),
(38, 19, 114, '2025-03-15', 'in progress'),
(39, 20, 101, '2025-03-01', 'completed'),
(40, 20, 115, '2025-03-18', 'in progress'),
(41, 1, 114, '2025-03-05', 'in progress'),
(42, 2, 106, '2025-03-07', 'in progress'),
(43, 4, 104, '2025-03-10', 'completed'),
(44, 6, 106, '2025-03-12', 'in progress'),
(45, 8, 109, '2025-03-15', 'in progress'),
(46, 10, 107, '2025-03-17', 'in progress'),
(47, 13, 114, '2025-03-20', 'completed'),
(48, 15, 109, '2025-03-22', 'in progress'),
(49, 16, 105, '2025-03-25', 'in progress'),
(50, 18, 104, '2025-03-27', 'completed');

insert into assignments (assignment_id, course_id, assignment_title, max_marks, due_date) values
(1, 101, 'build your first html/css landing page', 100, '2025-02-01'),
(2, 101, 'javascript interactive quiz application', 100, '2025-02-20'),
(3, 102, 'linear regression implementation from scratch', 100, '2025-02-15'),
(4, 102, 'neural network training on mnist', 100, '2025-03-05'),
(5, 103, 'matrix calculus and derivatives exercise', 50, '2025-02-25'),
(6, 104, 'data cleaning project with pandas', 100, '2025-02-10'),
(7, 104, 'exploratory data analysis dashboard', 100, '2025-03-01'),
(8, 105, 'asynchronous js & api integration challenge', 100, '2025-02-18'),
(9, 106, 'state management with redux toolkit', 100, '2025-03-01'),
(10, 107, 'server-side rendering blog with next.js', 100, '2025-03-15'),
(11, 108, 'multi-screen navigation in flutter', 100, '2025-03-01'),
(12, 109, 'cross-platform authentication app', 100, '2025-04-01'),
(13, 110, 'refactoring with factory and strategy patterns', 100, '2025-02-15'),
(14, 111, 'code review & clean code refactoring lab', 50, '2025-03-01'),
(15, 112, 'object-oriented banking application', 100, '2025-02-15'),
(16, 112, 'multi-threaded file parser in java', 100, '2025-03-01'),
(17, 113, 'building rest apis with spring boot', 100, '2025-03-20'),
(18, 114, 'complex sql joins & subqueries lab', 100, '2025-03-05'),
(19, 115, 'css grid and flexbox layout challenge', 50, '2025-02-10'),
(20, 101, 'backend api integration with node/express', 100, '2025-03-10'),
(21, 102, 'support vector machines classification', 100, '2025-03-25'),
(22, 104, 'web scraping using beautiful soup', 100, '2025-03-15'),
(23, 105, 'dom manipulation and event handling', 100, '2025-03-05'),
(24, 106, 'custom react hooks implementation', 100, '2025-03-20'),
(25, 108, 'state management using provider', 100, '2025-03-20'),
(26, 110, 'singleton and observer pattern lab', 50, '2025-03-05'),
(27, 112, 'java collections framework exercises', 100, '2025-03-10'),
(28, 113, 'spring data jpa mapping practice', 100, '2025-04-05'),
(29, 114, 'database indexing & optimization task', 100, '2025-03-25'),
(30, 115, 'creating advanced css keyframe animations', 50, '2025-03-01');


insert into assignment_submissions (submission_id, assignment_id, student_id, marks_obtained, submission_date) values
(1, 1, 1, 95, '2025-01-28'), (2, 1, 2, 88, '2025-01-29'), (3, 1, 6, 92, '2025-01-30'),
(4, 1, 11, 85, '2025-02-01'), (5, 1, 16, 90, '2025-01-31'), (6, 1, 20, 78, '2025-02-01'),
(7, 2, 1, 98, '2025-02-18'), (8, 2, 2, 91, '2025-02-19'), (9, 2, 6, 89, '2025-02-20'),
(10, 2, 11, 93, '2025-02-17'), (11, 2, 16, 84, '2025-02-20'), (12, 2, 20, 80, '2025-02-19'),
(13, 3, 4, 100, '2025-02-12'), (14, 3, 9, 95, '2025-02-14'), (15, 3, 18, 87, '2025-02-15'),
(16, 4, 4, 94, '2025-03-03'), (17, 4, 9, 92, '2025-03-04'), (18, 4, 18, 89, '2025-03-05'),
(19, 6, 3, 85, '2025-02-08'), (20, 6, 9, 98, '2025-02-09'), (21, 6, 13, 76, '2025-02-10'),
(22, 6, 4, 90, '2025-03-08'), (23, 6, 20, 88, '2025-03-14'), (24, 7, 3, 89, '2025-02-27'),
(25, 7, 9, 96, '2025-02-28'), (26, 7, 13, 82, '2025-03-01'), (27, 8, 1, 90, '2025-02-15'),
(28, 8, 10, 84, '2025-02-16'), (29, 8, 17, 79, '2025-02-17'), (30, 9, 15, 93, '2025-02-26'),
(31, 13, 7, 48, '2025-02-14'), (32, 13, 12, 45, '2025-02-13'), (33, 15, 5, 92, '2025-02-12'),
(34, 15, 14, 86, '2025-02-14'), (35, 15, 19, 90, '2025-02-15'), (36, 16, 5, 88, '2025-02-27'),
(37, 16, 14, 81, '2025-02-28'), (38, 16, 19, 94, '2025-03-01'), (39, 19, 2, 48, '2025-02-08'),
(40, 19, 20, 42, '2025-02-09'), (41, 20, 1, 91, '2025-03-08'), (42, 20, 2, 85, '2025-03-09'),
(43, 20, 6, 88, '2025-03-09'), (44, 20, 11, 82, '2025-03-10'), (45, 20, 16, 89, '2025-03-10'),
(46, 20, 20, 77, '2025-03-07'), (47, 22, 3, 93, '2025-03-13'), (48, 22, 9, 97, '2025-03-14'),
(49, 22, 13, 85, '2025-03-15'), (50, 22, 4, 91, '2025-03-12'), (51, 22, 18, 86, '2025-03-15'),
(52, 23, 1, 89, '2025-03-03'), (53, 23, 10, 92, '2025-03-04'), (54, 23, 17, 80, '2025-03-05'),
(55, 23, 16, 87, '2025-03-04'), (56, 24, 15, 95, '2025-03-18'), (57, 26, 7, 46, '2025-03-04'),
(58, 26, 12, 49, '2025-03-05'), (59, 27, 5, 90, '2025-03-08'), (60, 27, 14, 84, '2025-03-09'),
(61, 27, 19, 93, '2025-03-10'), (62, 18, 13, 90, '2025-03-24'), (63, 1, 3, 88, '2025-01-30'),
(64, 1, 8, 81, '2025-02-01'), (65, 3, 13, 84, '2025-02-14'), (66, 6, 18, 92, '2025-02-09'),
(67, 8, 16, 85, '2025-02-17'), (68, 13, 4, 91, '2025-02-14'), (69, 15, 1, 89, '2025-02-13'),
(70, 15, 9, 96, '2025-02-14'), (71, 19, 5, 45, '2025-02-09'), (72, 23, 2, 87, '2025-03-04'),
(73, 23, 6, 91, '2025-03-05'), (74, 27, 2, 83, '2025-03-09'), (75, 27, 11, 88, '2025-03-10'),
(76, 3, 3, 79, '2025-02-13'), (77, 6, 20, 87, '2025-03-12'), (78, 18, 9, 94, '2025-03-04'),
(79, 18, 19, 89, '2025-03-03'), (80, 29, 13, 91, '2025-03-24');


insert into payments (payment_id, student_id, amount_paid, payment_date, payment_method) values
(1, 1, 199.99, '2025-01-11', 'credit card'),
(2, 1, 89.99, '2025-01-15', 'paypal'),
(3, 1, 129.99, '2025-02-01', 'credit card'),
(4, 2, 199.99, '2025-01-13', 'credit card'),
(5, 2, 39.99, '2025-01-20', 'stripe'),
(6, 3, 99.99, '2025-01-16', 'paypal'),
(7, 3, 299.99, '2025-02-01', 'credit card'),
(8, 4, 299.99, '2025-01-19', 'crypto'),
(9, 4, 149.99, '2025-02-05', 'paypal'),
(10, 5, 139.99, '2025-01-21', 'credit card'),
(11, 5, 189.99, '2025-02-10', 'stripe'),
(12, 6, 199.99, '2025-01-23', 'credit card'),
(13, 6, 79.99, '2025-02-02', 'paypal'),
(14, 7, 249.99, '2025-01-26', 'bank transfer'),
(15, 7, 119.99, '2025-02-12', 'credit card'),
(16, 8, 179.99, '2025-01-29', 'stripe'),
(17, 9, 299.99, '2025-02-02', 'credit card'),
(18, 9, 99.99, '2025-02-05', 'paypal'),
(19, 9, 49.99, '2025-02-20', 'credit card'),
(20, 10, 89.99, '2025-02-04', 'stripe'),
(21, 10, 129.99, '2025-02-18', 'credit card'),
(22, 11, 199.99, '2025-02-06', 'paypal'),
(23, 11, 179.99, '2025-02-20', 'credit card'),
(24, 12, 249.99, '2025-02-09', 'bank transfer'),
(25, 12, 119.99, '2025-02-25', 'credit card'),
(26, 13, 99.99, '2025-02-11', 'paypal'),
(27, 13, 299.99, '2025-03-01', 'credit card'),
(28, 14, 139.99, '2025-02-13', 'stripe'),
(29, 14, 189.99, '2025-03-05', 'credit card'),
(30, 15, 129.99, '2025-02-16', 'paypal'),
(31, 15, 79.99, '2025-03-01', 'credit card'),
(32, 16, 199.99, '2025-02-19', 'crypto'),
(33, 17, 89.99, '2025-02-21', 'stripe'),
(34, 17, 129.99, '2025-03-10', 'credit card'),
(35, 18, 299.99, '2025-02-23', 'paypal'),
(36, 18, 149.99, '2025-03-12', 'credit card'),
(37, 19, 139.99, '2025-02-26', 'bank transfer'),
(38, 19, 49.99, '2025-03-15', 'credit card'),
(39, 20, 199.99, '2025-03-01', 'stripe'),
(40, 20, 39.99, '2025-03-18', 'paypal');

select concat(s.first_name, ' ', s.last_name) as student_name, p.amount_paid from students s
join payments p on s.student_id = p.student_id where p.amount_paid > (select avg(amount_paid) from payments);

select course_name, course_fee from courses
where course_fee > (select avg(course_fee) from courses);

select i.instructor_name, c.course_name,c.course_fee from instructors i join courses c on i.instructor_id = c.instructor_id
where c.course_fee = (select max(course_fee) from courses);

select concat(s.first_name, ' ', s.last_name) as student_name,c.course_name,c.course_fee from students s
join enrollments e on s.student_id = e.student_id join courses c on e.course_id = c.course_id
where c.course_fee = (select max(course_fee) from courses);

select assignment_title,max_marks from assignments where max_marks > (select avg(max_marks) from assignments);

select distinct concat(s.first_name, ' ', s.last_name) as student_name from students s
join assignment_submissions asb on s.student_id = asb.student_id;

select concat(first_name, ' ', last_name) as student_name from students
where student_id not in (select student_id from assignment_submissions);

select course_name from courses where course_id in (select course_id from enrollments);

select course_name from courses where course_id not in (select course_id from enrollments);

select i.instructor_name from instructors i where not exists (select 1 from courses c where c.instructor_id = i.instructor_id);

select concat(s.first_name, ' ', s.last_name) as student_name,sum(p.amount_paid) as total_payment
from students s join payments p on s.student_id = p.student_id group by s.student_id, s.first_name, s.last_name
having sum(p.amount_paid) > (select avg(total_per_student) from (select sum(amount_paid) as total_per_student from payments 
group by student_id) as student_total);