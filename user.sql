use dev;
create table USER_INFO(
UI_NUM INT unsigned not null auto_increment primary key,
UI_ID VARCHAR(10) not null UNIQUE,
UI_PWD VARCHAR(64) not null,
UI_NAME VARCHAR(20) not null,
UI_NICK_NAME VARCHAR(30) not null,
UI_ADDR1 VARCHAR(200)not null,
UI_ADDR2 VARCHAR(200),
UI_ZIP CHAR(5) not null,
UI_PHONE CHAR(11),
UI_TRANS CHAR(1) default '1',
UI_EMAIL VARCHAR(100),
UI_DESC VARCHAR(4000),
UI_GRADE CHAR(1) default '1',
CREDAT CHAR(8) default (DATE_FORMAT(NOW(), '%Y%m%d')),
CRETIM CHAR(6) default (DATE_FORMAT(NOW(), '%H%i%s')),
LMODAT CHAR(8) default (DATE_FORMAT(NOW(), '%Y%m%d')),
LMOTIM CHAR(6) default (DATE_FORMAT(NOW(), '%H%i%s')),
ACTIVE CHAR(1) default '1'
);

ALTER TABLE USER_INFO MODIFY UI_ID VARCHAR(30);
ALTER TABLE USER_INFO MODIFY UI_PHONE VARCHAR(20);


ALTER TABLE USER_INFO
ADD COLUMN UI_SCORE INT DEFAULT 0,
ADD COLUMN UI_WINS INT DEFAULT 0;


UPDATE USER_INFO
SET ACTIVE = '1'
WHERE ACTIVE IS NULL OR ACTIVE = '0';
create table BOARD_INFO(
BI_NUM INT not null auto_increment primary key,
BI_TITLE VARCHAR(50) not null,
BI_CONTENT VARCHAR(4000) not null,
UI_NUM INT unsigned not null,
CREDAT CHAR(8) default (DATE_FORMAT(NOW(), '%Y%m%d')),
CRETIM CHAR(6) default (DATE_FORMAT(NOW(), '%H%i%s')),
LMODAT CHAR(8) default (DATE_FORMAT(NOW(), '%Y%m%d')),
LMOTIM CHAR(6) default (DATE_FORMAT(NOW(), '%H%i%s')),
ACTIVE CHAR(1) default '1',
constraint
foreign key (UI_NUM) references USER_INFO(UI_NUM)
);
