USE printing;

create table project_file
 (file_id smallint unsigned not null auto_increment,
  file_name varchar(30) not null,
  file_type varchar(10) not null, 
  file_author varchar(100) null, 
  date_created  date null, 
  generate_support boolean not null,  
  primary key (file_id)
 );

create table filament
 (filament_id smallint unsigned not null auto_increment,
  filament_upc_code varchar(10) not null,
  cost double(10, 2) not null,
  type_of_plastic varchar(30) not null, 
  weight double(10, 2) not null, 
  diameter double(10, 2) not null,
  brand varchar(30) not null,
  date_bought date not null, 
  last_used date null,
  amount double(10,2) not null,
  primary key (filament_id)
 );

create table print_surface
 (print_surface_id smallint unsigned not null auto_increment,
  length double(10, 2) not null,
  width double(10, 2) not null,
  height double(10, 2) not null,
  material varchar(30) null,
  primary key (print_surface_id)
 );

create table pre_printing
 (preprint_id smallint unsigned not null auto_increment,
  est_time_to_heat varchar(8) not null, 
  est_time_extruder_to_heat varchar(8) not null, 
  estimated_total_time varchar(8) not null,
  primary key (preprint_id)
);

create table post_printing
 (postprint_id smallint unsigned not null auto_increment,
  est_time_to_cool varchar(8) not null, 
  est_time_extruder_to_cool varchar(8) not null, 
  actual_total_time varchar(8) not null,
  primary key (postprint_id)
);


create table filament_extruder
 (filament_extruder_id smallint unsigned not null auto_increment,
  print_surface_id smallint unsigned not null, 
  x double(10, 2) not null,
  y double(10, 2) not null,
  z double(10, 2) not null,
  fe_temperature double(10,2) not null,
  fe_speed int(10) not null,
  amount_extruded int(10) not null,
  constraint fk_print_surface_id foreign key(print_surface_id)
    references print_surface(print_surface_id),
  primary key (filament_extruder_id)
 );

create table project
 (project_id smallint unsigned not null auto_increment,
  project_name varchar(30) not null,
  file_id smallint unsigned not null, 
  filament_id smallint unsigned not null,
  items_to_print int(10) not null, 
  weight double(10, 2) not null, 
  constraint fk_file_id foreign key(file_id)
    references project_file(file_id),
  constraint fk_filament_id foreign key(filament_id)
    references filament(filament_id),
  primary key (project_id)
 );

create table printing
 (print_id smallint unsigned not null auto_increment,
  project_id smallint unsigned not null,
  preprint_id smallint unsigned not null,
  postprint_id smallint unsigned not null,
  filament_extruder_id smallint unsigned not null, 
  hot_end double(10,2) not null,
  build_plate double(10,2) not null,
  start_print_time varchar(8) not null, 
  estimated_time_left varchar(8) not null,
  final_print_time varchar(8) not null, 
  constraint fk_project_id foreign key(project_id)
    references project(project_id),
  constraint fk_preprint_id foreign key(preprint_id)
    references pre_printing(preprint_id),
  constraint fk_postprint_id foreign key(postprint_id)
    references post_printing(postprint_id),
  constraint fk_filament_extruder_id foreign key(filament_extruder_id)
    references filament_extruder(filament_extruder_id),
  primary key (print_id)
);









  

