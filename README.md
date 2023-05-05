# Institute-Alumni-Analysis

## Introduction

The objective of this project is to analyze the career development of alumni from two universities using MySQL. The dataset includes information about the career paths of these alumni, and our aim is to provide insights based on their graduation year and the courses they completed.

## Dataset

Six .csv file (Alumni record of College A and College B) Higher Studies, Self Employed and Service/Job record 
* College_A_HS ~ Higher Studies Record of College A
* College_A_SE ~ Self Employed Record of College A
* College_A_SJ ~ Service/Job Record of College A
* College_B_HS ~ Higher Studies Record of College B
* College_B_SE ~ Higher Studies Record of College B
* College_B_SJ ~ Higher Studies Record of College B

## Tools

* MySQL
* Jupyter Notebook
* Ms Excel

## Problem Statement

* Create new schema as alumni
* Import all .csv files into MySQL
* Run SQL command to see the structure of six tables
* Display first 1000 rows of tables (College_A_HS, College_A_SE, College_A_SJ, College_B_HS, College_B_SE, College_B_SJ) with Python.
* Import first 1500 rows of tables (College_A_HS, College_A_SE, College_A_SJ, College_B_HS, College_B_SE, College_B_SJ) into MS Excel.
* Perform data cleaning on table College_A_HS and store cleaned data in view College_A_HS_V, Remove null values. 
* Perform data cleaning on table College_A_SE and store cleaned data in view College_A_SE_V, Remove null values.
* Perform data cleaning on table College_A_SJ and store cleaned data in view College_A_SJ_V, Remove null values.
* Perform data cleaning on table College_B_HS and store cleaned data in view College_B_HS_V, Remove null values.
* Perform data cleaning on table College_B_SE and store cleaned data in view College_B_SE_V, Remove null values.
* Perform data cleaning on table College_B_SJ and store cleaned data in view College_B_SJ_V, Remove null values.
* Make procedure to use string function/s for converting record of Name, FatherName, MotherName into lower case for views 
  (College_A_HS_V, College_A_SE_V,college_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V) 
* Import the created views (College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V) into MS Excel and make pivot chart for     location of alumni 
* Write a query to create procedure get_name_collegeA using the cursor to fetch names of all students from college A.
* Write a query to create procedure get_name_collegeB using the cursor to fetch names of all students from college B.
  Calculate the percentage of career choice of College A and College B Alumni (w.r.t Higher Studies, Self Employed and Service/Job)
   


