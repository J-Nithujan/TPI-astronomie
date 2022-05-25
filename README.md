# TPI-astronomie

## Key features

- A home page with the website's main goals
- A page containing all the objects of the catalog of Messier where you can search for an element of filter them according to an order
-  A page with a list of outings added by the website's admin
- An admin can log in and adds outings
- The whole website is responsive

## Requirements

- Python 3.9.11
- An IDE, PyCharm was used for this project
- a PostgreSQL server and a client, for example PgAdmin 4

## Installation

The project is under /astronomy_app/.  All the requirements are listed in the file /astronomy_app/requirements.txt. You can use this with command prompt:

> pip install requirements.txt

## Database

Import the database with the file /data/db_astronomy.sql

> createdb db_astronomy
>
> psql -U <username> -d db_astronomy <  <path>\db_astronomy.sql

- username: the default username for PostgreSQL is postgres
- path: the complete file path of the file db_astronomy.sql



Change the credentials under /astronomy_app/config.py

![](C:\TPI\img\db-credentials.png)



