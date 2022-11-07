### ============================= DDL ============================= ###
create database if not exists ifsp;

use ifsp;

create table login(
    email varchar(50) primary key,
    senha varchar(10),
    nome varchar(30),
    foto varchar(30)
);

create table amigos(
    nome varchar(50),
    telefone varchar(20),
    email varchar(50),
    datanasc date,
    login varchar(50),
    foreign key (login)
    references login (email)
);

### ============================= DML ============================= ###

select * from login;
select * from amigos;
