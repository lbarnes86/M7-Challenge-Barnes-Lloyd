drop database if exists music_store_catalog;
create database music_store_catalog;
use music_store_catalog;

create table label (
    label_id int primary key auto_increment,
    `name` varchar(50) not null,
    website varchar(255) null
);

create table artist (
    artist_id int primary key auto_increment,
    `name` varchar(50) not null,
    instagram varchar(255) null,
    twitter varchar(255) null
);

create table album (
    album_id int primary key auto_increment,
    title varchar(50) not null,
    artist_id int not null,
    release_date date not null,
    label_id int not null,
    list_price decimal(5, 2) not null,
    index fk_artist_id (album_id),
    foreign key (artist_id)
        references artist(artist_id),
    index fk_label_id (label_id),
    foreign key (label_id)
        references label(label_id)
);

create table track (
    track_id int primary key auto_increment,
    album_id int not null,
    title varchar(50) not null,
    run_time int not null,
    index fk_album_id (album_id),
    foreign key (album_id)
        references album(album_id)
);
insert into label(`name`, website)
	values ('Interscope Records', 'wwww.interscope.com');

insert into artist (`name`, instagram, twitter)
	values ('Summer Walker', '@summerwalker', '@summerwalker');

insert into album (title, artist_id, release_date, label_id, list_price)
	values ('Still Over It', 1, "2021-10-15", 1, 9.99);

insert into track(album_id, title, run_time)
	values (1, 'Unloyal', 3);