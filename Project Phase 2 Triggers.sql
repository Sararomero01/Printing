USE printing;


delimiter //
DROP TRIGGER IF EXISTS file_bef_del //
CREATE TRIGGER file_bef_del BEFORE DELETE ON project_file
FOR EACH ROW
BEGIN  
            DELETE FROM project WHERE file_id = OLD.file_ID;

END // 
delimiter ; 

DELETE FROM project_file WHERE file_id = 1;


delimiter //
DROP TRIGGER IF EXISTS fil_bef_del //
CREATE TRIGGER fil_bef_del BEFORE DELETE ON filament
FOR EACH ROW
BEGIN  
            DELETE FROM project WHERE filament_id = OLD.filament_ID;

END // 
delimiter ; 

DELETE FROM filament WHERE filament_id = 1;

 
delimiter //
DROP TRIGGER IF EXISTS project_bef_del //
CREATE TRIGGER project_bef_del BEFORE DELETE ON project
FOR EACH ROW
BEGIN 
            DELETE FROM printing WHERE project_id = OLD.project_ID;

END // 
delimiter ; 

DELETE FROM project WHERE project_id = 1;

 
delimiter //
DROP TRIGGER IF EXISTS preprint_bef_del //
CREATE TRIGGER preprint_bef_del BEFORE DELETE ON pre_printing
FOR EACH ROW
BEGIN 
            DELETE FROM printing WHERE preprint_id = OLD.preprint_ID;

END // 
delimiter ;


DELETE FROM pre_printing WHERE preprint_id = 1;



delimiter //
DROP TRIGGER IF EXISTS file_bef_ins //
CREATE TRIGGER file_bef_ins BEFORE INSERT ON project_file
FOR EACH ROW
BEGIN
        IF EXISTS (SELECT * FROM project_file WHERE file_id = NEW.file_ID) THEN 
            SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'This file ID already exists in project files.'; 
            END IF;
        
        IF NEW.file_ID <= 0 THEN
            SIGNAL SQLSTATE '45002' SET MESSAGE_TEXT = 'This customer ID must be greater than zero.'; 
            END IF;

END // 
delimiter ; 

INSERT INTO project_file(file_id,file_name,file_type,file_author,date_created, generate_support)
    VALUES(3,'iphone_case_se','SWE','ealynch2023','2020-10-19',TRUE);

INSERT INTO project_file(file_id,file_name,file_type,file_author,date_created, generate_support)
    VALUES(0,'iphone_case_se','SWE','ealynch2023','2020-10-19',TRUE);



delimiter //
DROP TRIGGER IF EXISTS fil_bef_ins //
CREATE TRIGGER fil_bef_ins BEFORE INSERT ON filament
FOR EACH ROW
BEGIN
        IF EXISTS (SELECT * FROM filament WHERE filament_id = NEW.filament_ID) THEN 
            SIGNAL SQLSTATE '45003' SET MESSAGE_TEXT = 'This filament ID already exists in filament.'; 
            END IF;
        
        IF NEW.filament_ID <= 0 THEN
            SIGNAL SQLSTATE '45004' SET MESSAGE_TEXT = 'This filament ID must be greater than zero.'; 
            END IF;

END // 
delimiter ; 

INSERT INTO filament(filament_id, filament_upc_code, cost, type_of_plastic, weight, diameter, brand , date_bought, last_used, amount )
VALUES (5,'JN20T',36.50,'Polymaker',1000,2.85,'PolyLite','2019-10-19','2020-10-19',200);

INSERT INTO filament(filament_id, filament_upc_code, cost, type_of_plastic, weight, diameter, brand , date_bought, last_used, amount )
VALUES (-5,'JN20T',36.50,'Polymaker',1000,2.85,'PolyLite','2019-10-19','2020-10-19',200);

INSERT INTO filament(filament_id, filament_upc_code, cost, type_of_plastic, weight, diameter, brand , date_bought, last_used, amount )
VALUES (1,'JN20T',36.50,'Polymaker',1000,2.85,'PolyLite','2019-10-19','2020-10-19',200);


delimiter //
DROP TRIGGER IF EXISTS project_bef_ins //
CREATE TRIGGER project_bef_ins BEFORE INSERT ON project
FOR EACH ROW
BEGIN
        IF EXISTS (SELECT * FROM project WHERE project_id = NEW.project_ID) THEN 
            SIGNAL SQLSTATE '45006' SET MESSAGE_TEXT = 'This project ID already exists in project.'; 
            END IF;
        IF NEW.project_ID <= 0 THEN
            SIGNAL SQLSTATE '45002' SET MESSAGE_TEXT = 'This filament ID must be greater than zero.'; 
            END IF;
END // 
delimiter ; 

INSERT INTO project (project_id, project_name, file_id, filament_id, items_to_print, weight)
VALUES (1,'iphone_project',1,1, 1, 1000.00);

INSERT INTO project (project_id, project_name, file_id, filament_id, items_to_print, weight)
VALUES (2,'iphone_project',1,1, 1, 1000.00);
SELECT * FROM project 

INSERT INTO project (project_id, project_name, file_id, filament_id, items_to_print, weight)
VALUES (-1,'iphone_project',1,1, 1, 1000.00);
SELECT * FROM project 



delimiter //
DROP TRIGGER IF EXISTS preprint_bef_ins //
CREATE TRIGGER preprint_bef_ins BEFORE INSERT ON pre_printing
FOR EACH ROW
BEGIN
        IF EXISTS (SELECT * FROM pre_printing WHERE preprint_id = NEW.preprint_ID) THEN 
            SIGNAL SQLSTATE '45008' SET MESSAGE_TEXT = 'This preprint ID already exists in preprinting.'; 
            END IF;
        IF NEW.preprint_ID <= 0 THEN
            SIGNAL SQLSTATE '45009' SET MESSAGE_TEXT = 'This filament ID must be greater than zero.'; 
            END IF;

END // 
delimiter ; 


INSERT INTO pre_printing
 (preprint_id , est_time_to_heat, est_time_extruder_to_heat , estimated_total_time )
VALUES (1,48,10,100);

INSERT INTO pre_printing
 (preprint_id , est_time_to_heat, est_time_extruder_to_heat , estimated_total_time )
VALUES (2,48,10,100);

INSERT INTO pre_printing
 (preprint_id , est_time_to_heat, est_time_extruder_to_heat , estimated_total_time )
VALUES (-1,48,10,100);
