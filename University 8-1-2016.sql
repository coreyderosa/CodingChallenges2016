USE master
GO

--Run only if dB exists
IF EXISTS (SELECT * FROM sys.databases WHERE [name] = 'University')
DROP DATABASE University
GO

CREATE DATABASE University
GO

USE University
GO

CREATE TABLE Instructor
(
Instructor_ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
First_Name varchar(50) NOT NULL,
Last_Name varchar(50) NOT NULL,
Office_Number varchar(50) NOT NULL,
Phone varchar(50) NOT NULL,
Email varchar(max) NOT NULL
)

CREATE TABLE Course
(
Course_ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
Course_Name varchar(50) NOT NULL,
Course_Description varchar(500) NOT NULL,
Course_Credits int NOT NULL,
)

CREATE TABLE Schedule
(
Schedule_ID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
Term varchar(50) NOT NULL,
[Year] varchar(50) NOT NULL,
Course_ID varchar(50) NOT NULL,
Begin_Date varchar(50) NOT NULL,
End_Date varchar(50)  NULL,
Start_Time varchar(50) NOT NULL,
End_Time varchar(50) NULL,
Room_Number varchar(50),
Instructor_ID varchar(50) NOT NULL
)

declare @i int
set @i = 1

while @i < 100
begin
	declare @fname varchar(50) = 'Fname' + cast(@i as varchar(10))
	declare @lname varchar(50) = 'Lname' + cast(@i as varchar(10))
	declare @Onum varchar(50) = 'Office' +  cast(@i as varchar(10))
	declare @Pnum varchar(50) = '555-555-5' + cast(@i as varchar(10))
	declare @Email varchar(50) = 'Instructor' + cast(@i as varchar(10)) + '@email.com'
	insert into Instructor values(@fname, @lname, @Onum, @Pnum, @Email)
	set @i = @i + 1
end

set @i = 1

while @i < 1000
begin 
	declare @Cname varchar(50) = 'Course' + cast(rand()*1000+100 as varchar(10))
	declare @Cdes varchar(500) = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vel magna ac nisi efficitur commodo. Ut eget scelerisque ante. Sed euismod libero a augue mattis egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis posuere sapien nec libero malesuada, eget sagittis nibh pharetra. Etiam egestas turpis nisl, id interdum.'
	declare @Credits int = rand()*4+1
	insert into Course values (@Cname, @Cdes, @Credits)
	set @i = @i + 1
end


set @i = 1

while @i < 1000
begin 
	if @i < 500
		insert into Schedule values('Fall', '2016', cast(rand()*900+1 as int), '8/20/2016', '12/13/2016', '8:00', '9:00', 'R-' + cast(cast(rand()*100+1 as int) as varchar(10)), cast(rand()*90+1 as int))
	else
		insert into Schedule values('Spring', '2017', cast(rand()*900+1 as int), '1/30/2017', '5/14/2017', '8:00', '9:00', 'R-' + cast(cast(rand()*100+1 as int) as varchar(10)), cast(rand()*90+1 as int))
	set @i = @i + 1
end


select * from Instructor
select c.Course_Name, i.First_Name, i.Last_Name from Course as c inner join Schedule as s on c.Course_Id = s.Schedule_ID inner join Instructor as i on i.Instructor_Id = s.Instructor_Id

SELECT *
FROM Course
