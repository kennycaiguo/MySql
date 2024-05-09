drop database if exists qd22;
create database qd22 charset=utf8;
use qd22;
create table if not exists students(
    id int unsigned primary key auto_increment not null,
    name varchar(20) default '',
    age tinyint unsigned default 0,
    height decimal(5,2),
    gender enum('��','Ů','�м�','����') default '����',
    cls_id int unsigned default 0,
    is_deleted bit default 0
);

insert into students values(0,'С��',18,170.22,1,1,0);
insert into students values(0,'Mary',18,160.30,2,2,0);
insert into students values(0,'СӢ',16,170.00,4,1,0);
insert into students values(0,'Lucy',18,164.00,4,2,0);
insert into students values(0,'�ֿ���',20,170.00,1,3,0);
insert into students values(0,'����ӱ',19,165.00,2,2,0);
insert into students values(0,'����',17,173.00,2,3,0);
insert into students values(0,'����',17,171.22,3,1,0);
insert into students values(0,'������',20,167.00,2,2,0);
insert into students values(0,'չ��',19,175.00,1,1,0);
insert into students values(0,'�����޼�',17,182.00,1,1,0);
insert into students values(0,'��СС',17,179.22,4,2,0);
insert into students values(0,'�����',15,177.00,1,3,0);
insert into students values(0,'����',14,null,2,2,0);
insert into students values(0,'�����',16,182.00,1,1,0);
insert into students values(0,'Ҷ���',17,170.22,2,2,0);
insert into students values(0,'Linda',14,155.22,2,2,0);
insert into students values(0,'Tracy',13,158.22,2,2,0);
insert into students values(0,'������',12,170.22,2,2,0);


