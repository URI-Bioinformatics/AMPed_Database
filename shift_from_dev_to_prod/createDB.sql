CREATE DATABASE AMPed_prod; -- Replace AMPed_prod with desired producation name ensure you update in the website ( dbconnect.php, country-table.php, dbInfo.php were the ones in 5/6/2025)
USE AMPed2_dev; -- Replace AMPed2_dev with current dev name

-- Copy all tables
SET @old_db = 'AMPed2_dev';
SET @new_db = 'AMPed_prod';

-- This generates the SQL to copy each table it includes the views which will break. 
SELECT CONCAT('CREATE TABLE ', @new_db, '.', table_name, ' LIKE ', @old_db, '.', table_name, ';')
FROM information_schema.tables
WHERE table_schema = @old_db;

SELECT CONCAT('INSERT INTO ', @new_db, '.', table_name, ' SELECT * FROM ', @old_db, '.', table_name, ';')
FROM information_schema.tables
WHERE table_schema = @old_db;


--Then you will want to copy any that are missing from the below and make sure you don't add views
--Create Section
CREATE TABLE AMPed_prod.3D_Structure LIKE AMPed2_dev.3D_Structure;
CREATE TABLE AMPed_prod.Access_Level LIKE AMPed2_dev.Access_Level;
CREATE TABLE AMPed_prod.Amino_Acid_Address LIKE AMPed2_dev.Amino_Acid_Address;
CREATE TABLE AMPed_prod.Article LIKE AMPed2_dev.Article;
CREATE TABLE AMPed_prod.Atom_coord_Source LIKE AMPed2_dev.Atom_coord_Source;
CREATE TABLE AMPed_prod.Atomic_Coordinates LIKE AMPed2_dev.Atomic_Coordinates;
CREATE TABLE AMPed_prod.Country LIKE AMPed2_dev.Country;
CREATE TABLE AMPed_prod.Fight_Against LIKE AMPed2_dev.Fight_Against;
CREATE TABLE AMPed_prod.Gene LIKE AMPed2_dev.Gene;
CREATE TABLE AMPed_prod.Inserted_By LIKE AMPed2_dev.Inserted_By;
CREATE TABLE AMPed_prod.Method LIKE AMPed2_dev.Method;
CREATE TABLE AMPed_prod.Microbe LIKE AMPed2_dev.Microbe;
CREATE TABLE AMPed_prod.Microbe_Test LIKE AMPed2_dev.Microbe_Test;
CREATE TABLE AMPed_prod.Test_Results LIKE AMPed2_dev.Test_Results;
CREATE TABLE AMPed_prod.Used_Method LIKE AMPed2_dev.Used_Method;
CREATE TABLE AMPed_prod.User LIKE AMPed2_dev.User;
CREATE TABLE AMPed_prod.accession_no LIKE AMPed2_dev.accession_no;
CREATE TABLE AMPed_prod.accession_no_source_database LIKE AMPed2_dev.accession_no_source_database;
CREATE TABLE AMPed_prod.mic_input_metadata LIKE AMPed2_dev.mic_input_metadata;
CREATE TABLE AMPed_prod.micextracteddata LIKE AMPed2_dev.micextracteddata;
CREATE TABLE AMPed_prod.micgraphs LIKE AMPed2_dev.micgraphs;
CREATE TABLE AMPed_prod.micinputfile LIKE AMPed2_dev.micinputfile;
CREATE TABLE AMPed_prod.micmeandata LIKE AMPed2_dev.micmeandata;
CREATE TABLE AMPed_prod.micrun LIKE AMPed2_dev.micrun;
CREATE TABLE AMPed_prod.molecular_weight_table LIKE AMPed2_dev.molecular_weight_table;
CREATE TABLE AMPed_prod.peptide_tbl LIKE AMPed2_dev.peptide_tbl;
CREATE TABLE AMPed_prod.user_tbl LIKE AMPed2_dev.user_tbl;

--Transfer Data
INSERT INTO AMPed_prod.3D_Structure SELECT * FROM AMPed2_dev.3D_Structure;
INSERT INTO AMPed_prod.Access_Level SELECT * FROM AMPed2_dev.Access_Level;
INSERT INTO AMPed_prod.Amino_Acid_Address SELECT * FROM AMPed2_dev.Amino_Acid_Address;
INSERT INTO AMPed_prod.Article SELECT * FROM AMPed2_dev.Article;
INSERT INTO AMPed_prod.Atom_coord_Source SELECT * FROM AMPed2_dev.Atom_coord_Source;
INSERT INTO AMPed_prod.Atomic_Coordinates SELECT * FROM AMPed2_dev.Atomic_Coordinates;
INSERT INTO AMPed_prod.Country SELECT * FROM AMPed2_dev.Country;
INSERT INTO AMPed_prod.Fight_Against SELECT * FROM AMPed2_dev.Fight_Against;
INSERT INTO AMPed_prod.Gene SELECT * FROM AMPed2_dev.Gene;
INSERT INTO AMPed_prod.Inserted_By SELECT * FROM AMPed2_dev.Inserted_By;
INSERT INTO AMPed_prod.Method SELECT * FROM AMPed2_dev.Method;
INSERT INTO AMPed_prod.Microbe SELECT * FROM AMPed2_dev.Microbe;
INSERT INTO AMPed_prod.Microbe_Test SELECT * FROM AMPed2_dev.Microbe_Test;
INSERT INTO AMPed_prod.Test_Results SELECT * FROM AMPed2_dev.Test_Results;
INSERT INTO AMPed_prod.Used_Method SELECT * FROM AMPed2_dev.Used_Method;
INSERT INTO AMPed_prod.User SELECT * FROM AMPed2_dev.User;
INSERT INTO AMPed_prod.accession_no SELECT * FROM AMPed2_dev.accession_no;
INSERT INTO AMPed_prod.accession_no_source_database SELECT * FROM AMPed2_dev.accession_no_source_database;
INSERT INTO AMPed_prod.mic_input_metadata SELECT * FROM AMPed2_dev.mic_input_metadata;
INSERT INTO AMPed_prod.micextracteddata SELECT * FROM AMPed2_dev.micextracteddata;
INSERT INTO AMPed_prod.micgraphs SELECT * FROM AMPed2_dev.micgraphs;
INSERT INTO AMPed_prod.micinputfile SELECT * FROM AMPed2_dev.micinputfile;
INSERT INTO AMPed_prod.micmeandata SELECT * FROM AMPed2_dev.micmeandata;
INSERT INTO AMPed_prod.micrun SELECT * FROM AMPed2_dev.micrun;
INSERT INTO AMPed_prod.molecular_weight_table SELECT * FROM AMPed2_dev.molecular_weight_table;
INSERT INTO AMPed_prod.peptide_tbl SELECT * FROM AMPed2_dev.peptide_tbl;
INSERT INTO AMPed_prod.user_tbl SELECT * FROM AMPed2_dev.user_tbl;