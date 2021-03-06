create table kullanici(
	
	kullaniciid Serial ,
	username character varying(50) not null,
	useremail character varying(60) not null unique,
	user_password character varying(100) not null,
	user_photo character varying(255) default 'avatar.png',
	user_bof DATE not null ,
	Primary Key(kullaniciid)
);

create table admin(
	adminid Serial,
	kullaniciid int not null,
	name character varying(60) not null,
	surname character varying(70) not null,
	Primary Key(adminid),
	foreign key(kullaniciid) references kullanici(kullaniciid)
);

create table story(
	storyid Serial,
	story_date Date default current_date,
	userid int,
	story_content character varying(255),
	primary key(storyid),
	foreign key(userid) references kullanici(kullaniciid)
);


create table post(
	postid Serial,
	posttype character varying(50) not null,
	post_content character varying(255) not null,
	primary key(postid)
);

create table user_post(
	userpostid Serial,
	userid int,
	postid int,
	postdate date default current_date,
	primary key(userpostid),
	foreign key(userid) references kullanici(kullaniciid),
	foreign key(postid) references post(postid)
);


create table comment(
	commentid Serial,
	userid int,
	postid int,
	comment_content character varying(150) not null,
	comment_date Date default current_date,
	primary key(commentid),
	foreign key(userid) references kullanici(kullaniciid),
	foreign key(postid) references post(postid)
);


create table live(
	liveid Serial,
	live_owner int ,
	live_guest int,
	primary key(liveid),
	foreign key(live_owner) references kullanici(kullaniciid),
	foreign key(live_guest) references kullanici(kullaniciid)
);

create table begeni(
	
	likeid Serial,
	userid int,
	postid int,
	primary key(likeid),
	foreign key(userid) references kullanici(kullaniciid),
	foreign key(postid) references post(postid)
);	


create table subscriber(
	subscriberid Serial,
	subscriber int,
	subaccount int,
	Primary Key(subscriberid),
	Foreign Key(subscriber) references kullanici(kullaniciid),
	Foreign Key(subaccount) references kullanici(kullaniciid)
);


create table header(
	headerid Serial,
	brand character varying(255) not null,
	primary key(headerid)
);


create table footer(
	id Serial,
	facebook character varying(150),
	gismap character varying(150),
	primary key(id)
);

select * from footer
select * from subscriber
insert into subscriber(subscriber,subaccount)
values(19,20);


insert into subscriber(subscriber,subaccount)
values(21,22);

insert into subscriber(subscriber,subaccount)
values(22,21);

insert into kullanici(username,useremail,user_password,user_bof)
values('Java Developer','udemymirac23@gmail.com','12345','1999-6-10')



select * from kullanici

insert into kullanici(username,useremail,user_password,user_photo,user_bof)
values('javadev23','miracpy10@gmail.com','12345','bezos.jpg','1999-6-10');

select * from story
select * from kullanici
select * from begeni

select * from post
insert into post(posttype,post_content,post_url,postdate,kullaniciid)
values('IMAGE','new Post','kahve.jpg',current_date,21);


insert into post(posttype,post_content,post_url,postdate,kullaniciid)
values('IMAGE','cOD??NG Post','codingpost.jpg',CURRENT_DATE,21);

insert into post(posttype,post_content,post_url,postdate,kullaniciid)
values('IMAGE','Coffee','kahve.jpg',CURRENT_DATE,11);
 
delete from subscriber where subscriberid=4;

select * from subscriber

delete from post

alter table post add column kullaniciid int

alter table post add constraint fk_kullaniciid
Foreign Key(kullaniciid) references kullanici(kullaniciid);

insert into post(posttype,post_content,post_url,postdate,kullaniciid)
values('IMAGE','Linux wow!','linux.jpg',current_date,18);



select * from admin

insert into admin(kullaniciid,name,surname)
values(23,'Jeff','Bezos');

select * from kullanici;

insert into kullanici(username,useremail,user_password,user_photo,user_bof)
values('jeff bezos','miracpy10@gmail.com','12345','bezos.jpg','2000-6-21');


select * from header

select * from footer



