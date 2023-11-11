# olympicsgames-project-sql
120 years of Olympic history: athletes and results basic bio data on athletes and medal results from Athens 1896 to Rio 2016. In this dataset we have two tables one is athletes_event with 13551 row and 15 columns and the other table noc_region with 3 column and 231 rows. 

Data
You can download it by clicking on the below download button “Download Olympics Dataset”. https://www.kaggle.com/datasets/heesoo37/120-years-of-olympic-history-athletes-and-results

## Table of Contents

1. [Introduction](#introduction)
2. [Features](#features)
3. [Database Schema](#database-schema)
4. [Setup](#setup)
5. [Queries](#queries)
   
## Introduction

Welcome to the Olympic Database SQL Project! This project aims to provide a comprehensive database solution for managing information related to the Olympic Games. The database is designed to store data about athletes, sports, events, countries, and medals, allowing users to retrieve meaningful insights and statistics.

## Features

- **Athlete Information:** Store details about athletes, including their names, nationalities, birthdates, and genders.
- **Country Information:** Manage information about countries participating in the Olympics, including country codes and names.
- **Sports and Events:** Store data on various sports and the events within those sports that are part of the Olympic Games.
- **Medal Records:** Keep track of medal records for each athlete, country, and event.
- **Powerful Queries:** Retrieve valuable insights by running SQL queries to analyze the data.

## Database Schema

The database schema is designed to maintain relationships between different entities. Here is an overview of the main tables:

- CREATE TABLE ahletes-event (
  -  ID INT PRIMARY KEY,
  - Name VARCHAR(255),
  - Sex CHAR(1),
  -  Age INT,
  - Height INT,
  -  Weight INT,
  - Team VARCHAR(255),
  - NOC CHAR(3),
  - Games VARCHAR(255),
  - Year INT,
  - Season VARCHAR(10),
  - City VARCHAR(255),
  - Sport VARCHAR(255),
  - Event VARCHAR(255),
  - Medal VARCHAR(255) 
);
CREATE TABLE non_region (
   - NOC CHAR(3) PRIMARY KEY,
   - Region VARCHAR(255),
   - Notes TEXT
);


## Setup

1. **Database Setup:** Create a new database using your preferred SQL database management system (e.g., MySQL, PostgreSQL).

2. **Schema Creation:** Execute the SQL commands from the [schema.sql](./schema.sql) file to create the necessary tables and relationships.

3. **Data Import (Optional):** If you have sample data, you can populate the tables with relevant information. Refer to [data.sql](./data.sql) for an example dataset.

4. **Connect Application:** Configure your application to connect to the newly created database.

## Queries

Explore the power of the Olympic Database by running SQL queries. Some example queries are provided in the [queries](./queries) directory. 
- (1)	Write an SQL query to fetch the details of the all the countries which have won most number of medals.
- (2) Write an SQL query to find in which sport or event india won the highest medals?
- (3)	Write an SQL query to find in best player who got maximum medals ?
- (4)	Write an SQL query to find out which sports event held maximum time? 
- (5) Write an SQL query to find out the event which was played in all the summer Olympics games?
- (6)Write an SQL query  to find total count of countries which are  took part in Olympics ?-
- (7) Write an SQL query to find out on which year the participation is minimum and maximum?
- (8) Write an sql query to find sports were just played only once in the Olympics?	
- (9)  Write query to find the oldest athletes to win a medal?
- (10) Write an SQL query to find the oldest athletes who win medal ?  
- (11) Write an sql query to find out the ratio of male and female athletes participated in all Olympics games?
- (12)  Write an SQL query to find out male and female ratio region wise who participate in Olympics?
- (13) Write an SQL query to find which country has won the highest number of medals and in which year?
- (14) Write an SQL query to find no of athletes in summer season and winter season?






