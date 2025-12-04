/*
Create the Database and Schemas

Script Purpose:
  This script creates a new database named 'DataWarehouse' after checking if it already exists.
  If it exists, it is dropped and recreated.
  The script also sets up the schemas of 'bronze', 'silver', and 'gold'.

WARNING:
  IF THE DATABASE 'DataWarehouse' EXISTS RUNNING THIS SCRIPT WILL PERMANENTLY DELETE THE DATABASE AND ALL DATA WITHIN.
  RUN WITH CAUTION AND ENSURE YOU HAVE BACKUPS BEFORE RUNNING THIS SCRIPT.
*/

--Can use the go command to string commands together in one execution
USE master;
GO

--Drop and recreate the 'DataWarehouse' database
IF EXISTS(SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO
USE DataWarehouse;
GO

--Create Schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
