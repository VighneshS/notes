#Versioning SQL scripts in Flyway DB

In Flyway database all the migration activities are carried out based on the versioning of the file. Flyway database can process many types of versioning types but for our application we are going with a timestamp based versioning.
The SQL files should be named only based on time stamp and it should be placed in the `/resources/db/migration` directory.

The SQL file can contain more than one sql scripts and all the scripts should be separated by `;`. Even the alter and update statements has to be scripted and versioned.

###Versioning Format



- The SQL file should be named in the following format
	

	 `V{version number}__{file_name}.sql`
	
	Example :` V20160705124200__default_country_assigned.sql`
- The file name consists of
	
	- prefix : `V`
	- version :`20160705124200`
	- separator : `__`
	- description : `actual sql file name`
	- suffix : `.sql` 

- SQL query for getting time stamp.


    `SELECT DATE_FORMAT(CURRENT_TIMESTAMP(), '%Y%m%d%H%i%s')`
 
