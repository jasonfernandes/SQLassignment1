create database assignment1

use assignment1

create table Clients
(
Client_id numeric(4) primary key,
Cname varchar(40) NOT NULL,
Addres varchar(30),
Email varchar(30) unique,
Phone numeric(10),
Business varchar(20) NOT NULL
)
create table Departments
(
Deptno numeric(2) primary key,
Dname varchar(15) NOT NULL,
Loc varchar(20)
)

create table Employees
(
Empno numeric(4) primary key,
Ename varchar(20) NOT NULL,
Job varchar(15),
Salary numeric(7) constraint positive check(Salary>0),
Deptno numeric(2) references Departments(Deptno)
)

create table Projects
(
Project_ID numeric(3) primary key,
Descr varchar(30) NOT NULL,
Start_Date DATE,
Planned_End_Date DATE,
Actual_End_Date DATE,
Budget numeric(10) constraint positivebug check(Budget>0),
Client_id numeric(4) references Clients(Client_id)
)
alter table Projects
add constraint dateChk check(Actual_End_Date > Planned_End_Date)

create table EmpProjectTasks
(
Project_ID numeric(3) primary key foreign key references Projects(Project_ID),
Empno numeric(4) foreign key references Employees(Empno),
Start_Date Date,
End_Date Date,
Task varchar(25) not null,
Status varchar(15) not null
)

insert into Clients values(1001,'Trackon consultants',' Mumbai','contact@trackon.com',9567880032,'consultant')

insert into Employees values(7002,'Rajesh','Consultant',30000,10)
insert into Departments values(10,'Design','Pune')
insert into Projects values(402,'Inventory','2011-08-01','2011-12-31','2012-01-03',500000,1001)
insert into EmpProjectTasks values(402,7002,'2011-08-22','2011-09-30','System design','Completed')

select * from EmpProjectTasks
select * from clients
select * from Employees
select * from Departments
select * from Projects