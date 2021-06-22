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

select * from subscriber
insert into subscriber(subscriber,subaccount)
values(18,11);

insert into kullanici(username,useremail,user_password,user_bof)
values('Mirac Yüksel','miracpy10@gmail.com','12345','1999-6-10')



select * from kullanici

select * from story


select * from post

insert into post(posttype,post_content,post_url,postdate,kullaniciid)
values('IMAGE','cODİNG Post','codingpost.jpg',CURRENT_DATE,11);

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
