/* myHours Application Database */
/* ----- Version: v2.0 ----- */

/* ----- Database Creation ----- */
/* Create Database */
CREATE DATABASE myHoursDB;

/* Create <User> Table */
CREATE TABLE User (
    id int auto_increment,
    firstName varchar(15),
    surname varchar(15),
    email varchar(45),
    password varchar(30),
    PRIMARY KEY (id)
);

/* Create <Store> Table */
CREATE TABLE Store (
    id int auto_increment,
    name varchar(45),
    address varchar(45),
    PRIMARY KEY (id)
);

/* Create <Job> Table */
CREATE TABLE Job (
    id int auto_increment,
    role varchar(15),
    storeID int,
    hourlyWage decimal(7,2),
    PRIMARY KEY (Job),
    CONSTRAINT FOREIGN KEY (storeID) REFERENCES Store(id)
);

/* Create <Shift> Table */
CREATE TABLE Shift (
    id int auto_increment,
    startTime datetime,
    endTime datetime,
    job_id int,
    PRIMARY KEY (id),
    CONSTRAINT FOREIGN KEY (job_id) REFERENCES Job(id)
);

/* Create <Clock> Table */
CREATE TABLE Clock (
    id int auto_increment,
    time datetime,
    user_id int,
    PRIMARY KEY (id),
    CONSTRAINT FOREIGN KEY (user_id) REFERENCES User(id)
);

/* Create <ClockedShift> Table */
CREATE TABLE ClockedShift (
    clock_id int,
    shift_id int,
    timeWorked time,
    breakDuration time,
    billableTime time,
    moneyEarned decimal(7,2)
);

/* ----- Database Population ----- */
/* Create Users by Inserting data into Table <User> */
INSERT INTO User (id, firstName, surname, email, password)
VALUES (1, "Liam", "Salter", "liamsaltermail@gmail.com", "Password15324");

/* -------------------------- */
/* ----- Extra Comments ----- */