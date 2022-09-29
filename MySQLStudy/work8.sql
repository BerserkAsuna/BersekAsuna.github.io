CREATE TABLE department(
	departmentid INT PRIMARY KEY,
	deptname VARCHAR(32) UNIQUE NOT NULL
);
CREATE TABLE class(
	classid INT PRIMARY KEY,
	`subject` VARCHAR(32) NOT NULL DEFAULT '',
	deptname VARCHAR(32) ,
	enrolltime YEAR NOT NULL DEFAULT 2022,  
	num INT NOT NULL DEFAULT 0,
	FOREIGN KEY (deptname) REFERENCES department(deptname)
);
CREATE TABLE student(
	studentid INT PRIMARY KEY,
	`name` VARCHAR(32) NOT NULL,
	age INT,
	classid INT,
	FOREIGN KEY (classid) REFERENCES class(classid)
);
INSERT INTO department VALUES(001,'数学'),(002,'计算机'),(003,'化学'),(004,'中文'),(005,'经济');
INSERT INTO class VALUES(101,'软件','计算机',1995,20),
			(102,'微电子','计算机',1996,30),
			(111,'无机化学','化学',1995,29),
			(112,'高分子化学','化学',1996,25),
			(121,'统计数学','数学',1995,20),
			(131,'现代语言','中文',1996,20),
			(141,'国际贸易','经济',1997,30),
			(142,'国际金融','经济',1996,14);
			
INSERT INTO student VALUES(8101,'张三',18,101),
			  (8102,'钱四',16,121),
			  (8103,'王玲',17,131),
			  (8105,'李飞',19,102),
			  (8109,'赵四',18,141),
			  (8110,'李可',20,142),
			  (8201,'张飞',18,111),
			  (8302,'周瑜',16,112),
			  (8203,'王亮',17,111),
			  (8305,'董庆',19,102),
			  (8409,'赵龙',18,101),
			  (8510,'李丽',20,142);
			  
SELECT * 
	FROM student
	WHERE `name`LIKE'%李%'

SELECT department.deptname
	FROM department , (SELECT COUNT(deptname) 专业数,deptname
					    FROM class
					    GROUP BY deptname) a
	WHERE  a.deptname=department.`deptname` AND 专业数>1
	
SELECT 系人数,a.deptname,departmentid,department.deptname
	FROM department,(SELECT SUM(num) 系人数,deptname
			FROM class
			GROUP BY deptname
			HAVING 系人数>=30 ) a
	WHERE department.`deptname`=a.`deptname`
