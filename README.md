# Olympic SQL Challenge
A SQL Portfolio challenge, setup a database, upload and optimise a dataset, analyse and create a visualisation. 

<img src='https://images.unsplash.com/photo-1569517282132-25d22f4573e6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1932&q=80' width="70%">

## Task Overview
- [Part 1: Setup a mySQL database :inbox_tray:]( )
- [Part 2: Upload a dataset :crystal_ball:]( )
- [Part 3: Optimise the data :chart_with_upwards_trend:]( )
- [Part 4: Analysis and visulisation :chart_with_upwards_trend:]( )
- [Part 5: Record the project on GitHub :white_check_mark:]( )


## Part 1: Setup a mySQL database :inbox_tray:

Before we write any SQL we're going to need a database. For this challenge we'll be using mySQL

### Key Steps:

- Install mySQL locally: [https://dev.mysql.com/doc/mysql-getting-started/en/#mysql-getting-started-installing](https://dev.mysql.com/doc/mysql-getting-started/en/#mysql-getting-started-installing)
- In the installer select the "Full" version, you will need the SQL Server and mySQL Workbench
- Set yourself up as a database admin and enter a password - you will need this when you log in
- Open mySQL Workbench, login, familarise yourself with the mySQL interface and find the databases on the server

- If you have any issues there's a quick walkthrough here:
[https://www.youtube.com/watch?v=YSOY_NyOg40](https://www.youtube.com/watch?v=YSOY_NyOg40)


## Part 2: Upload a dataset :inbox_tray:

In this challenge we'll be working with data from the Summer Olympic Games, you can find the [data here](https://github.com/wjsutton/SQL_olympics/blob/main/olympics_data.csv). <br>Originally sourced from: [Kaggle](https://www.kaggle.com/datasets/bhanupratapbiswas/olympic-data?select=dataset_olympics.csv)

### Key Steps

#### 1. Create Your Database/Schema

In mySQL there is no visual difference between a schema and a database.

For the full path of a table you make be used to the convention of:
- database.schema.table 

but here you can use either:
- database.table
- schema.table

Hint: Use the CREATE SCHEMA command to create a schema, or CREATE DATABASE for a database.

```
CREATE DATABASE olympics;
-- Or use CREATE SCHEMA olympics;
USE olympics;
```
Note the USE will set our path to be a given database or schema.

#### 2. Create a Staging Table

At this point we just want the data on our SQL Server, and we'll improve it later.

Using details of our [data](https://github.com/wjsutton/SQL_olympics/blob/main/olympics_data.csv) create a table for this data to fit into.

Hint: In your created database/schema use the CREATE TABLE command to build a table, e.g.

```
CREATE TABLE mytable (
  col1 INT,
  col2 INT,
  col3 VARCHAR(10),
  col4 VARCHAR(200)
);
```
Note here the datatypes are import to label correctly identify numerical data vs text data, however the specific accuracy of the datatypes is less important, e.g. VARCHAR(255) vs VARCHAR(50) - we will fix this later. 

Tools like  [konbert.com/convert/csv/to/sql](https://konbert.com/convert/csv/to/sql?) can help you structure this create table statement.

#### 3. Insert Data

To put our data on mySQL we will be uploading the raw values via an INSERT VALUES statement. i.e.

```
INSERT INTO mytable VALUES
(1,2,'a','b'),
(....)
```

To get the data into this type of format, you can use a tool that converts CSV to SQL, personally I recommend [konbert.com/convert/csv/to/sql](https://konbert.com/convert/csv/to/sql?) due to the file size of this challenge.

### Deliverable

1. A database or schema containing a table with the [data found here](https://github.com/wjsutton/SQL_olympics/blob/main/olympics_data.csv)

### My Solution

- [Create Database and Staging Table](https://raw.githubusercontent.com/wjsutton/SQL_olympics/main/sql/create_database.sql)
- [Insert Data](https://raw.githubusercontent.com/wjsutton/SQL_olympics/main/sql/insert_raw_data.sql)

## Part 3: Optimise the data :chart_with_upwards_trend:

Looking at our data, it can be stored in a more efficient way. In this section we'll look to take data from our staging table from part 2 and convert it to smaller tables on specific themes. 

Doing this will reduce storage costs, increase query performance and reduce any bottleneck from querying a single table.   

### Key Steps

#### 1. Plan Your Tables

Looking at the data there are a few common themes we can see:
- Details about the athletes, their ages, height, weight
- Details about the teams, the NOC and region
- Details about the games, when and where the games were held
- Details about the results, the event, the competitors and the medals

For this dataset we'll look to implement a Star Schema design with:
- Our Fact Table: results
- Our Dimension Tables: athletes, teams, games
- More details on Star Schemas https://learn.microsoft.com/en-us/power-bi/guidance/star-schema

#### 2. Create Your Tables



#### 3. Insert Data

#### 4. Set Primary and Foreign Keys

#### 5. Set Indexes

### Deliverable



### My Solution

Of note, Database/Schema design does have a reasonable amount of subjectivity to it, the solution I have will improve upon having just one table but there may be a more optimised solution depending on how your data will be used. 

## Part 4: Analysis and visulisation :chart_with_upwards_trend:

### Key Steps

#### 1. 
#### 2. 
#### 3. 

#### 4. Download your data and save it locally as a csv.

...

### My Solution
Here is my solution if you get stuck
...

Add titles and interactions to the visualisation. 

Save the results as a Tableau dashboard. 
Record a screenshot of the visualisation.

You can add this to your Tableau Public portfolio by replacing the datasource with the csvfrom part 2, opening the .twbx file in Tableau Public and saving the workbook.

## Part 5: Record the project on GitHub :white_check_mark:

If you haven't already please sign up to GitHub first at [https://github.com/join](https://github.com/join) and watch this intro video [Git, GitHub, & GitHub Desktop for beginners](https://www.youtube.com/watch?v=8Dd7KRpKeaE)

Create a repository: 
- Create a New repository for this analysis (something like "Olympic-SQL-Analysis")
- Select the visibility as 'Public'
- Initialize the repository with a README

Add files to your repository

Please ensure any files, notes, in fact, anything you put on GitHub does not have any passwords or login information. If you do this view the login as compromised, please delete the repo and create a new password/login.

On Github.com on your repository click on 'Add file' > 'Upload files' and upload your:
- SQL scripts,
- Schema Diagram,
- solution csv

Edit your README.md

GitHub provides a readme file which is rendered when a user views your repository, it's a great way to document your project and looks great for a portfolio project, like this one. 

Please copy and paste the [template_readme.md](https://github.com/wjsutton/lego_analysis_challenge/blob/main/template_readme.md) and update the links and details about your project.

Note the readme file must be called "README.md" to appear on rendered on the repository home page.
