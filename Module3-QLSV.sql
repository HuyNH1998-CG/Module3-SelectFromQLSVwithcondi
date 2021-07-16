create database quanlysinhvien;
use quanlysinhvien;
create table class(
classid int not null auto_increment primary key,
classname nvarchar(60) not null,
startdate date not null,
status bit
);
create table student(
studentid int not null auto_increment primary key,
studentname nvarchar(30) not null,
address nvarchar(50),
phone nvarchar(20),
status bit,
classid int not null,
foreign key (classid) references class (classid)
);
create table subject(
subid int not null auto_increment primary key,
subname nvarchar(30) not null,
credit tinyint not null default 1 check (credit >= 1),
Status bit default 1
);
create table mark(
markid int not null auto_increment primary key,
subid int not null,
studentid int not null,
mark float default 0 check (mark between 0 and 100),
examtimes tinyint default 1,
foreign key (subid) references subject(subid),
foreign key (studentid) references student(studentid)
);

insert into class
value (1,'A1','2008-12-20',1),
(2,'A2','2008-12-22',1),
(3,'B3',current_date,0);

insert into student (studentname,address,phone,status,classid)
value ('Hung','Ha Noi','0912113113',1,1);
insert into student (studentname, address, status ,classid)
value ('Hoa','Hai Phong',1,1);
insert into student (studentname,address,phone,status,classid)
value('Manh','HCM','0123123123',0,2);
insert into student (studentname,address,phone,status,classid)
value('An','HCM','0123123123',0,2);


insert into subject
value(1,'CF',5,1),
(2,'C',6,1),
(3,'HDJ',5,1),
(4,'RDBMS',10,1);

insert into mark (subid,studentid,mark,examtimes)
value(1,1,8,1),
(1,2,10,2),
(2,1,12,1);
insert into mark (subid,studentid,mark,examtimes)
value(1,4,8,1);
select studentname from student where studentname like 'h%';
select * from class where month(startdate) = 12;
select * from subject where credit between 3 and 5;
UPDATE `quanlysinhvien`.`student` SET `classid` = '2' WHERE (`studentid` = '1');
select * from student;
select studentname, subname, mark from student s join mark m on s.studentid = m.studentid join subject sub on m.subid = sub.subid
order by
m.mark desc,
case when m.mark = m.mark then s.studentname end asc;
