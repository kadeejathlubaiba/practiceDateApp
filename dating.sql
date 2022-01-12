create database dating;
 use dating;

create table client( id integer primary key, Fname varchar(20),Lname varchar(20),city varchar(10),state varchar(10),dob date,gender varchar(50));

insert into client values(1,'Lubaiba','Rizwan','Kottayam','Kerala','1998/08/11','female')
insert into client values(2,'rizwan','khader','TVM','Kerala','1994/12/09','male')
insert into client values(3,'rishana','ahmed','KLM','Kerala','1998/02/20','female')
insert into client values(4,'habeeba','ramsheed','ERS','Kerala','2000/11/11','female')
insert into client values(5,'liba','shahul','KSD','Kerala','1995/12/12','female')

select * from client;


create table jobCategory(id integer primary key, jobType varchar(20))


insert into jobCategory values(1,'ENGINEER')
insert into jobCategory values(2,'DOCTOR')
insert into jobCategory values(3,'BUSINESS')
insert into jobCategory values(4,'TEACHING')
insert into jobCategory values(5,'STAFF')

select * from jobCategory;

create table clientJob(id integer primary key, clientId integer references client(id), jobId integer references jobCategory(id))

insert into clientJob values(1,1,1)
insert into clientJob values(2,2,1)
insert into clientJob values(3,3,2)
insert into clientJob values(4,4,3)
insert into clientJob values(5,4,1)

select * from clientJob;



create table foodCategory(id integer primary key, typeName varchar(20))

insert into foodCategory values(1,'Indian')
insert into foodCategory values(2,'Dessert ')
insert into foodCategory values(3,'Chinese')
insert into foodCategory values(4,'South Indian')

select * from foodCategory;



create table clientFood(id integer primary key, clientId integer references client(id), foodId integer references foodCategory(id))

insert into clientFood values(1,1,1)
insert into clientFood values(2,1,2)
insert into clientFood values(3,1,3)
insert into clientFood values(4,2,1)
insert into clientFood values(5,2,2)
insert into clientFood values(6,3,1)
insert into clientFood values(7,4,1)
insert into clientFood values(8,5,1)

select * from clientFood;






create table hobbies(id integer primary key, typeName varchar(20))

insert into hobbies values(1,'swimming')
insert into hobbies values(2,'skating')
insert into hobbies values(3,'watching Movie')
insert into hobbies values(4,'workout')


select * from hobbies;

create table movieCategory(id integer primary key, typeName varchar(20))

insert into movieCategory values(1,'Horror')
insert into movieCategory values(2,'Romantic')
insert into movieCategory values(3,'Comedy')
insert into movieCategory values(4,'action Thriller')

select * from movieCategory;










create table clientMovie(id integer primary key, clientId integer references client(id), foodId integer references movieCategory(id))

insert into clientMovie values(1,1,1)
insert into clientMovie values(2,1,2)
insert into clientMovie values(3,1,3)
insert into clientMovie values(4,2,4)
insert into clientMovie values(5,3,1)
insert into clientMovie values(6,3,2)

select * from clientMovie






















drop table clientHobbies;

create table clientHobbies(id integer primary key, clientId integer references client(id), hobId integer references hobbies(id))

insert into clientHobbies values(1,1,1)
insert into clientHobbies values(2,1,2)
insert into clientHobbies values(3,2,1)
insert into clientHobbies values(4,2,2)
insert into clientHobbies values(5,3,1)
insert into clientHobbies values(6,4,1)
insert into clientHobbies values(7,5,1)

select * from clientHobbies










 select max(typeName) Max_Prefer from clientHobbies 
join hobbies
on hobbies.id = clientHobbies.hobId



















select count(client.id) ID, client.Fname from client
join clientFood
on clientFood.clientId=client.id
group by client.Fname having count(client.id)>1


















select * from client
join clientMovie
on clientMovie.clientId = client.id
join movieCategory
on movieCategory.id=clientMovie.foodId
join clientFood
on client.id=clientFood.id
join foodCategory
on foodCategory.id=clientFood.foodId
where movieCategory.typeName = 'Horror'
and  DATEDIFF(year, client.dob, GETDATE())>23
and  foodCategory.typeName = 'Indian'




Note: Age greater than 23 and likes horror movies and like food type Indian

















