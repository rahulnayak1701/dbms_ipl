CREATE TABLE AUCTION(teamname varchar(30) primary key,purse int not null,money_spent int,tol_play int, overseas int);
CREATE TABLE PLAYERS(player_id int primary key,name varchar(30) not null,matches int,innings int,country varchar(30),SR int,role varchar(30) not null,runs int, wickets int,HS int, AVG int,Hundereds int,Fifties int,Overs int, Eco float,BBF varchar(10), Runs_conc int,fours int,sixes int, Dots int,amount int,mvp_points int,team varchar(30));
CREATE TABLE RECORDS(record_id int primary key,p_id int,fast_balls float,HS_In int,wickets_In int); 
CREATE TABLE TEAMS(name varchar(30),edition int,Owned_by varchar(30),pos int,Home_Ground varchar(50),titles_won int,coach varchar(30),won int, lost int, NR int,primary key(name,edition));
CREATE TABLE SPONSORS(teamname varchar(30),sponsor_name varchar(30),type varchar(30),primary key(teamname,sponsor_name));
CREATE TABLE IPL(edition int primary key,winner varchar(30),Runners_Up varchar(30),Matches int);
CREATE TABLE OWNER(teamname varchar(30) primary key,company_or_group varchar(30));  
ALTER TABLE RECORDS ADD CONSTRAINT FK_records FOREIGN KEY(p_id) REFERENCES PLayers(player_id);
alter table teams add constraint names unique(name);
ALTER TABLE PLAYERS ADD CONSTRAINT FK_PLAYERS FOREIGN KEY(TEAM) REFERENCES TEAMS(name);
alter table owner add constraint o_name unique(company_or_group);
ALTER TABLE TEAMS ADD CONSTRAINT FK_TEAM FOREIGN KEY(owned_by) REFERENCES OWNER(company_or_group);
ALTER TABLE PLAYERS ADD CONSTRAINT FK_Playerteam FOREIGN KEY(team) REFERENCES Auction(teamname);
ALTER TABLE SPONSORS ADD COLUMN edition int;
alter table sponsors add constraint fk_Edition foreign key(edition) references ipl(edition);
ALTER TABLE Auction ADD COLUMN edition int;
alter table auction add constraint fk_Auc_Edition foreign key(edition) references ipl(edition);
