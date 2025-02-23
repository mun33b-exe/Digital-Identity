create database final;
use final;
create table student(snum varchar (255) primary key, sname varchar(255), major varchar(255) , standing varchar(255) , age varchar(255));
create table faculty(fid varchar(255) primary key, fname varchar(255), deptid varchar(255));
create table course(cname varchar(255) primary key, meet_at varchar(255), room varchar(255), fid varchar(255),foreign key (fid) references faculty (fid));
create table enrolled(snum varchar(255), cname varchar(255), foreign key (snum) references student (snum), foreign key (cname) references course (cname) );
show tables;
drop table course;

insert into student values('01', 'Muneeb', 'Computer Science', 'SR', '19' );
insert into student values('02', 'Saif', 'Computer Science', 'SR', '21' ),
('03', 'Usman', 'Software Engineer', 'JR', '20' ),
('04', 'Zain', 'Mathematics', 'SR', '24' ),
('05', 'Hassan', 'Civil Engineering', 'JR', '19' ),
('06', 'Talha', 'IT', 'JR', '18' ),
('07', 'Ahsan', 'Computer Science', 'JR', '19' ),
('08', 'Irtaza', 'Physics', 'SR', '23' ),
('09', 'Zahid', 'Biology', 'JR', '22' );

insert into faculty values('01', 'RIchard Jackson', '101' ),
('02', 'Ayesha Naeem', '100' ),
('03', 'Maha Rasheed', '101' ),
('04', 'Yusra Banaras', '103' );

-- (cname varchar(255) primary key, meet_at varchar(255), room varchar(255), fid varchar(255),foreign key (fid) references faculty (fid))

insert into course values('Programming Fundamental', '10 AM', 'LH 401', '01'),
('Database Systems', '9:30 AM', 'Lab 6', '02'),
('Operating Systems', '10:30 AM', 'LH 411', '04');

insert into enrolled values('06', 'Operating Systems');

select * from enrolled;

select * from student;

-- Task 

select sname from student where standing in ('SR','JR') and major='Computer Science';

-- Task 

select course.cname, course.room from course join faculty ON course.fid = faculty.fid
where faculty.fname = 'Richard Jackson';

-- Task 
-- R15=Lab 6 deptid 68=100
select distinct student.snum, student.sname from student join enrolled on student.snum = enrolled.snum join course on enrolled.cname = course.cname
join faculty on course.fid = faculty.fid
where course.room = 'Lab 6' and faculty.deptid = '100' and student.standing = 'SR';

-- Task 
-- Data=Systems
select cname from course where cname like '%Systems%' order by cname;

-- Task 
select faculty.deptid, count(course.cname) as CoursesOffered from faculty left join course on faculty.fid = course.fid group by faculty.deptid order by CoursesOffered desc;

-- Task 
select student.snum, student.sname, count(enrolled.cname) as CoursesEnrolled from student left join enrolled on student.snum = enrolled.snum
group by student.snum, student.sname;
 
 -- Task
 select max(age) from student;
 
 -- Task
 select sname, age from student where age=(select max(age) from student);
 
 -- Task
 select sname, age from student where age>(select avg(age) from student); 
