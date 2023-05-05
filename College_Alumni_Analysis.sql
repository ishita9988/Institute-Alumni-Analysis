USE alumni;


#1 Run SQL command to see the structure of six tables
DESC college_a_hs;
DESC college_a_se;
DESC college_a_sj;
DESC college_b_hs;
DESC college_b_se;
DESC college_b_sj;


#2 Perform data cleaning on table College_A_HS and store cleaned data in view College_A_HS_V, 
# and Remove null values. 

CREATE OR REPLACE VIEW College_A_HS_V AS
    SELECT 
        *
    FROM
        college_a_hs
    WHERE
        RollNo IS NOT NULL AND Name IS NOT NULL
            AND LastUpdate IS NOT NULL
            AND FatherName IS NOT NULL
            AND MotherName IS NOT NULL
            AND Batch IS NOT NULL
            AND Degree IS NOT NULL
            AND PresentStatus IS NOT NULL
            AND HSDegree IS NOT NULL
            AND EntranceExam IS NOT NULL
            AND Institute IS NOT NULL
            AND Location IS NOT NULL;

SELECT 
    *
FROM
    College_A_HS_V;
    
    
#3 Perform data cleaning on table College_A_SE and store cleaned data in view College_A_SE_V, 
# and Remove null values.

CREATE OR REPLACE VIEW College_A_SE_V AS
    SELECT 
        *
    FROM
        college_a_se
    WHERE
        RollNo IS NOT NULL
            AND LastUpdate IS NOT NULL
            AND Name IS NOT NULL
            AND FatherName IS NOT NULL
            AND MotherName IS NOT NULL
            AND Batch IS NOT NULL
            AND Degree IS NOT NULL
            AND PresentStatus IS NOT NULL
            AND Organization IS NOT NULL
            AND Location IS NOT NULL;

SELECT 
    *
FROM
    College_A_SE_V;
    
    
#4 Perform data cleaning on table College_A_SJ and store cleaned data in view College_A_SJ_V,
#and Remove null values

CREATE OR REPLACE VIEW College_A_SJ_V AS
    SELECT 
        *
    FROM
        college_a_sj
    WHERE
        RollNo IS NOT NULL
            AND LastUpdate IS NOT NULL
            AND Name IS NOT NULL
            AND FatherName IS NOT NULL
            AND MotherName IS NOT NULL
            AND Batch IS NOT NULL
            AND Degree IS NOT NULL
            AND PresentStatus IS NOT NULL
            AND Organization IS NOT NULL
            AND Designation IS NOT NULL
            AND Location IS NOT NULL;

SELECT 
    *
FROM
    College_A_SJ_V;
    
    
#5 Perform data cleaning on table College_B_HS and store cleaned data in view College_B_HS_V,
# and Remove null values.

CREATE OR REPLACE VIEW College_B_HS_V AS
    SELECT 
        *
    FROM
        college_b_hs
    WHERE
        RollNo IS NOT NULL
            AND LastUpdate IS NOT NULL
            AND Name IS NOT NULL
            AND FatherName IS NOT NULL
            AND MotherName IS NOT NULL
            AND Branch IS NOT NULL
            AND Batch IS NOT NULL
            AND Degree IS NOT NULL
            AND PresentStatus IS NOT NULL
            AND HSDegree IS NOT NULL
            AND EntranceExam IS NOT NULL
            AND Institute IS NOT NULL
            AND Location IS NOT NULL;

SELECT 
    *
FROM
    College_B_HS_V;
    

#6 Perform data cleaning on table College_B_SE and store cleaned data in view College_B_SE_V,
# and Remove null values.

CREATE OR REPLACE VIEW College_B_SE_V AS
    SELECT 
        *
    FROM
        college_b_se
    WHERE
        RollNo IS NOT NULL
            AND LastUpdate IS NOT NULL
            AND Name IS NOT NULL
            AND FatherName IS NOT NULL
            AND MotherName IS NOT NULL
            AND Branch IS NOT NULL
            AND Batch IS NOT NULL
            AND Degree IS NOT NULL
            AND PresentStatus IS NOT NULL
            AND Organization IS NOT NULL
            AND Location IS NOT NULL;

SELECT 
    *
FROM
    College_B_SE_V;
    

#7 Perform data cleaning on table College_B_SJ and store cleaned data in view College_B_SJ_V, Remove null values.
# and remove null values.

CREATE OR REPLACE VIEW College_B_SJ_V AS
    SELECT 
        *
    FROM
        college_b_sj
    WHERE
        RollNo IS NOT NULL
            AND LastUpdate IS NOT NULL
            AND Name IS NOT NULL
            AND FatherName IS NOT NULL
            AND MotherName IS NOT NULL
            AND Branch IS NOT NULL
            AND Batch IS NOT NULL
            AND Degree IS NOT NULL
            AND PresentStatus IS NOT NULL
            AND Organization IS NOT NULL
            AND Designation IS NOT NULL
            AND Location IS NOT NULL;

SELECT 
    *
FROM
    College_B_SJ_V;


#8 Make procedure to use string function/s for converting record of Name, FatherName,
# MotherName into lower case for views (College_A_HS_V, College_A_SE_V, College_A_SJ_V,
# College_B_HS_V, College_B_SE_V, College_B_SJ_V) 

# College_A_HS_V
DELIMITER //
CREATE procedure getintolower_case_a_hs()
BEGIN
SELECT 
    LOWER(Name) Name,
    LOWER(FatherName) FatherName,
    LOWER(MotherName) MotherName
FROM
    College_A_HS_V;
END //
DELIMITER ;

CALL getintolower_case_a_hs()


# College_A_SE_V
DELIMITER //
CREATE procedure getintolower_case_a_se()
BEGIN
SELECT 
    LOWER(Name) Name,
    LOWER(FatherName) FatherName,
    LOWER(MotherName) MotherName
FROM
    College_A_SE_V;
END //
DELIMITER ;

CALL getintolower_case_a_se()


#College_A_SJ_V
DELIMITER //
CREATE procedure getintolower_case_a_sj()
BEGIN
SELECT 
    LOWER(Name) Name,
    LOWER(FatherName) FatherName,
    LOWER(MotherName) MotherName
FROM
    College_A_SJ_V;
END //
DELIMITER ;

CALL getintolower_case_a_sj()


# College_B_HS_V
DELIMITER //
CREATE procedure getintolower_case_b_hs()
BEGIN
SELECT 
    LOWER(Name) Name,
    LOWER(FatherName) FatherName,
    LOWER(MotherName) MotherName
FROM
    College_B_HS_V;
END //
DELIMITER ;

CALL getintolower_case_b_hs()


# College_B_SE_V
DELIMITER //
CREATE procedure getintolower_case_b_se()
BEGIN
SELECT 
    LOWER(Name) Name,
    LOWER(FatherName) FatherName,
    LOWER(MotherName) MotherName
FROM
    College_B_SE_V;
END //
DELIMITER ;

CALL getintolower_case_b_se()


# College_B_SJ_V
DELIMITER //
CREATE procedure getintolower_case_b_sj()
BEGIN
SELECT 
    LOWER(Name) Name,
    LOWER(FatherName) FatherName,
    LOWER(MotherName) MotherName
FROM
    College_B_SJ_V;
END //
DELIMITER ;

CALL getintolower_case_b_sj()


#9 Write a query to create procedure get_name_collegeA using the cursor to 
# fetch names of all students from college A.

DELIMITER $$
CREATE PROCEDURE get_name_collegeA
(
    INOUT name1 MEDIUMTEXT
)
BEGIN
	DECLARE finished INT DEFAULT 0;
    DECLARE namelist VARCHAR(400) DEFAULT "";
    
    DECLARE namedetail
         CURSOR FOR
             SELECT name from College_A_HS_V UNION SELECT name from College_A_SE_V
             UNION SELECT name from College_A_SJ_V;
	DECLARE CONTINUE HANDLER
		 FOR NOT FOUND SET finished = 1;

	OPEN namedetail;
    
    getname1:
    LOOP
         FETCH namedetail INTO namelist;
         IF finished=1 THEN
             LEAVE getname1;
		 END IF;
            
		 SET name1=CONCAT(namelist,";",name1);
	END LOOP getname1;
    CLOSE namedetail;
END $$
DELIMITER ;
            
SET @name1="";
CALL get_name_collegeA(@name1);
SELECT @name1 name;            


#10 Write a query to create procedure get_name_collegeB using the cursor to fetch names of all
# students from college B.

DELIMITER $$
CREATE PROCEDURE get_name_collegeB
(
    INOUT name1 MEDIUMTEXT
)
BEGIN
	DECLARE finished INT DEFAULT 0;
    DECLARE namelist VARCHAR(400) DEFAULT "";
    
    DECLARE namedetail
         CURSOR FOR
             SELECT name from College_B_HS_V UNION SELECT name from College_B_SE_V
             UNION SELECT name from College_B_SJ_V;
	DECLARE CONTINUE HANDLER
		 FOR NOT FOUND SET finished = 1;

	OPEN namedetail;
    
    getname1:
    LOOP
         FETCH namedetail INTO namelist;
         IF finished=1 THEN
             LEAVE getname1;
		 END IF;
            
		 SET name1=CONCAT(namelist,";",name1);
	END LOOP getname1;
    CLOSE namedetail;
END $$
DELIMITER ;
            
SET @name1="";
CALL get_name_collegeB(@name1);
SELECT @name1 name;            


#11 Calculate the percentage of career choice of College A and College B Alumni
# (w.r.t Higher Studies, Self Employed and Service/Job)

SELECT "Higher studies", (SELECT COUNT(*) FROM college_a_hs)/
((SELECT COUNT(*) FROM college_a_hs)+(SELECT COUNT(*) FROM college_a_se)+
(SELECT COUNT(*) FROM college_a_sj))*100 "College A",
(SELECT COUNT(*) FROM college_b_hs)/
((SELECT COUNT(*) FROM college_b_hs)+
(SELECT COUNT(*) FROM college_b_se)+(SELECT COUNT(*) FROM college_b_sj))*100 "College B"
 UNION 
SELECT "Self Employed", (SELECT COUNT(*) FROM college_a_se)/
((SELECT COUNT(*) FROM college_a_hs)+(SELECT COUNT(*) FROM college_a_se)+
(SELECT COUNT(*) FROM college_a_sj))*100 "College A",
(SELECT COUNT(*) FROM college_b_se)/((SELECT COUNT(*) FROM college_b_hs)+
(SELECT COUNT(*) FROM college_b_se)+(SELECT COUNT(*) FROM college_b_sj))*100 "College B"
 UNION 
SELECT "Service Job", (SELECT COUNT(*) FROM college_a_sj)/
((SELECT COUNT(*) FROM college_a_hs)+(SELECT COUNT(*) FROM college_a_se)+
(SELECT COUNT(*) FROM college_a_sj))*100 "College A",
(SELECT COUNT(*) FROM college_b_sj)/((SELECT COUNT(*) FROM college_b_hs)+
(SELECT COUNT(*) FROM college_b_se)+(SELECT COUNT(*) FROM college_b_sj))*100 "College B";



