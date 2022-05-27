# TPI-astronomie

## Key features

- A home page with the website's main goals
- A page containing all the objects of the catalog of Messier where you can search for an element or filter them according to an order depending on the data type: numerical or alphabetical
-  A page with a list of outings added by the website's admins
- An admin can log in and adds outings
- The whole website is responsive



## Requirements

- Python 3.9.11 or above
- An IDE, PyCharm was used for this project
- a PostgreSQL server and a client, e.g. PgAdmin 4



## Installation

The project is under /astronomy_app/.  All the requirements are listed in the file /astronomy_app/requirements.txt. You can install them with Windows command prompt:

> pip install -r requirements.txt



## Database

Import the database with the file /data/db_astronomy.sql. 

In Windows command prompt:

> createdb -U <username> db_astronomy
>
> psql -U <username> -d db_astronomy <  <path>\db_astronomy.sql

- username: the default username for PostgreSQL is postgres
- path: the complete file path of the script db_astronomy.sql

To change the PostgreSQL URI used by the web app, open the file /astronomy_app/config.py :

![](/img/db-credentials.png)
