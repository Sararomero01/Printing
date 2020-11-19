USE printing;


INSERT INTO project_file(file_id,file_name,file_type,file_author,date_created, generate_support)
    VALUES(NULL,'iphone_case_se','SWE','smmamaniromero2022','2020-10-19',TRUE);
SELECT * FROM printing.project_file 

INSERT INTO project (project_id,project_name,file_id, filament_id, items_to_print, weight)
VALUES (NULL,'iphone_project',NULL,19, 1,1000)
SELECT * FROM project 

INSERT INTO filament(filament_id, filament_upc_code, cost, type_of_plastic, weight, diameter, brand , date_bought, last_used, amount )
VALUES (NULL,'JN19T',36.50,'Polymaker',1000,2.85,'PolyLite','2019-10-19','2020-10-19',200)
SELECT * FROM filament

INSERT INTO print_surface (print_surface_id, length , width ,  height ,  material)
VALUES (NULL,280,280,250,'PEI')
SELECT * FROM print_surface

INSERT INTO filament_extruder (filament_extruder_id,print_surface_id, x , y , z , fe_temperature , fe_speed ,amount_extruded )
VALUES (NULL,NULL,155,155,158,200,6,220)
SELECT * FROM filament_extruder

INSERT INTO printing
 (print_id ,project_id , preprint_id, postprint_id, filament_extruder_id, hot_end, build_plate , printing_time , estimated_time_left)
VALUES (NULL,NULL,NULL,NULL,NULL,200,22.73,48,48)
SELECT * FROM printing

INSERT INTO pre_printing
 (preprint_id , est_time_to_heat, est_time_extruder_to_heat , estimated_total_time )
VALUES (NULL,48,10,60)
SELECT * FROM pre_printing

INSERT INTO post_printing
 (postprint_id , est_time_to_cool , est_time_extruder_to_cool , final_total_time)
VALUES (NULL,35,15,60)
SELECT * FROM post_printing