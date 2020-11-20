USE printing;


INSERT INTO project_file(file_id,file_name,file_type,file_author,date_created, generate_support)
    VALUES(NULL,'iphone_case_se','SWE','smmamaniromero2022','2020-10-19',TRUE);
SELECT * FROM printing.project_file 

INSERT INTO filament(filament_id, filament_upc_code, cost, type_of_plastic, weight, diameter, brand , date_bought, last_used, amount )
VALUES (NULL,'JN19T',36.50,'Polymaker',1000,2.85,'PolyLite','2019-10-19','2020-10-19',200);
SELECT * FROM filament

INSERT INTO print_surface (print_surface_id, length , width ,  height ,  material)
VALUES (NULL,280,280,250,'PEI');
SELECT * FROM print_surface

INSERT INTO pre_printing
 (preprint_id , est_time_to_heat, est_time_extruder_to_heat , estimated_total_time )
VALUES (1,48,10,100);
SELECT * FROM pre_printing


INSERT INTO post_printing
 (postprint_id , est_time_to_cool , est_time_extruder_to_cool , actual_total_time)
VALUES (1,35,15,100);
SELECT * FROM post_printing


INSERT INTO filament_extruder (filament_extruder_id,print_surface_id, x , y , z , fe_temperature , fe_speed ,amount_extruded )
VALUES (NULL,1,155,155,158,200,6,220);
SELECT * FROM filament_extruder


INSERT INTO project (project_id, project_name, file_id, filament_id, items_to_print, weight)
VALUES (1,'iphone_project',1,1, 1, 1000.00);
SELECT * FROM project 


INSERT INTO printing
 (print_id ,project_id , preprint_id, postprint_id, filament_extruder_id, hot_end, build_plate , start_print_time, estimated_time_left , final_print_time)
VALUES (NULL,1,1,1,1,200,22.73,48,48, 48);
SELECT * FROM printing



