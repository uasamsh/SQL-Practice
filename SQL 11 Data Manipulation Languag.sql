-- SQL 11 Data Manipulation Language(DML), ADD/ Insert, Modify/ Update , and Remove/Delete Data in Database.
/* Analysis Administration
 DML is more commonly used in roles such as database developer and database administrator, roles that oversee the growth, improvement, and management of the company's database.

 Query, Analyze, and Explore Relational data Insert data


# Description: DML | Inserting data
 We're not gonna start the FROM Clause because there is no FROM Clause When it comes to DML. Instead we're gonna start with the INSERT INTO keywords. We can write INSERT INTO  table name--> Artist ()
*/
INSERT INTO 
Artist(Name)
VALUES('Bob Marley')

/* # Description: DML | Updating data
The UPDATE statement is used to change existing data in a table.

The UPDATE statement is usually used with the WHERE clause.

The WHERE clause specifies which particular row of data you want to modify.

Important: Without the WHERE clause, the UPDATE statement will update every single row in the table.

*/

UPDATE
Artist
SET Name =" Damien Marley"
WHERE 
ArtistId = 276

/* # Description: DML | Deleting data
 
DELETE FROM
Artist
WHERE 
ArtistId = 276



