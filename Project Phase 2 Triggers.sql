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

END // 
delimiter ; 
delimiter //
DROP TRIGGER IF EXISTS project_bef_del //
CREATE TRIGGER project_bef_del BEFORE DELETE ON project
FOR EACH ROW
BEGIN 
            DELETE FROM project WHERE project_id = OLD.project_ID;

END // 
delimiter ; 

END // 
delimiter ; 
delimiter //
DROP TRIGGER IF EXISTS preprint_bef_del //
CREATE TRIGGER preprint_bef_del BEFORE DELETE ON preprint
FOR EACH ROW
BEGIN 
            DELETE FROM preprint WHERE preprint_id = OLD.preprint_ID;

END // 
delimiter ;

DELETE FROM customer WHERE cust_id = 9;

delimiter //
DROP TRIGGER IF EXISTS file_bef_ins //
CREATE TRIGGER file_bef_ins BEFORE INSERT ON project_file
FOR EACH ROW
BEGIN
        IF EXISTS (SELECT * FROM file WHERE file_id = NEW.file_id) THEN 
            SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'This file ID already exists in project files.'; 
            END IF;
        
--         IF NEW.cust_id <= 0 THEN
--             SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'This customer ID must be greater than zero.'; 
--             END IF;
--             
--         IF EXISTS (SELECT * FROM individual WHERE cust_id = NEW.cust_id) THEN 
--             SIGNAL SQLSTATE '45002' SET MESSAGE_TEXT = 'This customer ID already exists in individual.'; 
--             END IF;
-- 
--        IF NOT EXISTS (SELECT * FROM customer WHERE cust_id = NEW.cust_id) THEN 
--             SIGNAL SQLSTATE '45003' SET MESSAGE_TEXT = 'This customer ID does not exists in customer.'; 
--             END IF;
--         
END // 
delimiter ; 

delimiter //
DROP TRIGGER IF EXISTS fil_bef_ins //
CREATE TRIGGER fil_bef_ins BEFORE INSERT ON filament
FOR EACH ROW
BEGIN
        IF EXISTS (SELECT * FROM file WHERE filament_id = NEW.filament_id) THEN 
            SIGNAL SQLSTATE '45002' SET MESSAGE_TEXT = 'This filament ID already exists in filament.'; 
            END IF;

END // 
delimiter ; 

delimiter //
DROP TRIGGER IF EXISTS project_bef_ins //
CREATE TRIGGER project_bef_ins BEFORE INSERT ON project
FOR EACH ROW
BEGIN
        IF EXISTS (SELECT * FROM file WHERE project_id = NEW.project_id) THEN 
            SIGNAL SQLSTATE '45003' SET MESSAGE_TEXT = 'This project ID already exists in project.'; 
            END IF;

END // 
delimiter ; 

delimiter //
DROP TRIGGER IF EXISTS preprint_bef_ins //
CREATE TRIGGER preprint_bef_ins BEFORE INSERT ON pre_printing
FOR EACH ROW
BEGIN
        IF EXISTS (SELECT * FROM file WHERE preprint_id = NEW.preprint_id) THEN 
            SIGNAL SQLSTATE '45004' SET MESSAGE_TEXT = 'This preprint ID already exists in pre_printing.'; 
            END IF;

END // 
delimiter ; 
