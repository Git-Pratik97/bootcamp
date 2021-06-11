create table character(
	id integer primary key,
	name text NOT NULL,
	gender varchar(1),
	nickname text,
	aff_id integer
	
);

insert into character(name, gender, aff_id) values ("Eddard Stark" , "m", 4);
insert into character (name, gender, aff_id) values( "Jaime", "m", 1);
insert into character (name , gender, aff_id) values ("Cersei", "f", 1);
insert into character (name, gender, nickname, aff_id) values ("Sandor Clegane" ,"m", "The Hound", 1);
insert into character (name, gender, nickname, aff_id) values ("Peter Baelish","m", "Littlefinger", 4);

/* Update entry */
update character set name = "cersei" where id = "3";

/*printing data */ 	
select * from character;

create table affiliation (
	id integer primary key,
	name text not null,
	location text not null
);

insert into affiliation(name,  location) values ("Stark", "Winterfell");
insert into affiliation(name, location) values ("Lannister", "Kings Landing");
insert into affiliation(name, location) values ("Nights Watch", "The Wall");
insert into affiliation(name, location) values ("Targaryen", "Dragonstone");

select * from affiliation;

select c.id, c.name, c.gender, a.name, a.location from character c, affiliation a where c.aff_id = a.id;

