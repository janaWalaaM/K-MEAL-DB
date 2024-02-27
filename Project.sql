create schema `K-restaurant`;

CREATE TABLE Branches (
     ContactNo INT(10) NOT NULL,
    Address VARCHAR(30),
    iDNo INT(10) NOT NULL,
    CONSTRAINT IDNo_PK PRIMARY KEY (ContactNo , iDNo)
);
    
    create index BM_ID ON Branches (iDNo);
    
CREATE TABLE BrancheManger (
    iDNo INT(10) NOT NULL,
    Name VARCHAR(10) NOT NULL,
    CONSTRAINT DNo_FK FOREIGN KEY (iDNo)REFERENCES  Branches (iDNo)ON DELETE CASCADE
    ON UPDATE CASCADE
);

drop table branches;
drop table branchemanger;


	
CREATE TABLE EmployeeRole (
    IDNo INT(10) NOT NULL,
    ERole VARCHAR(20),
    CONSTRAINT IDNo_PK PRIMARY KEY (IDNo) 
);

CREATE TABLE Employee (
    IDNo INT(10) NOT NULL,
    fName VARCHAR(20) NOT NULL,
    gender CHAR(1) CHECK (gender IN ('F' , 'M')),
    CONSTRAINT IDNo_FK FOREIGN KEY (IDNo)REFERENCES EmployeeRole (IDNo)ON DELETE CASCADE
        ON UPDATE CASCADE
);


        create index EM_ID  ON Employee (fName); 
     
CREATE TABLE EmployeeName (
    fName VARCHAR(20) NOT NULL,
    lName VARCHAR(20),
    CONSTRAINT fName_FK FOREIGN KEY (fName)REFERENCES Employee (fName)ON DELETE CASCADE
        ON UPDATE CASCADE
);
 

     
CREATE TABLE Prepare (
    BillNo INT(10) NOT NULL UNIQUE,
    IDNo INT(10) NOT NULL UNIQUE,
    
    CONSTRAINT BillNo_PK FOREIGN KEY (BillNo)REFERENCES MealPrice (BillNo)ON DELETE CASCADE,
        
    CONSTRAINT IDNo_PK FOREIGN KEY (IDNo)REFERENCES employee (IDNo)ON DELETE CASCADE
);
        
        
        
CREATE TABLE IngredientDetails (
    Kind VARCHAR(20) UNIQUE NOT NULL,
    Quantity INT(100) NOT NULL,
    calories INT(255) NOT NULL,
    CONSTRAINT Kind_PK PRIMARY KEY (Kind)
);



CREATE TABLE Ingredient (
    Kind VARCHAR(20) NOT NULL,
    MealID INT(10) NOT NULL,
    CONSTRAINT MealID_PK FOREIGN KEY (MealID)REFERENCES MealPrice (MealID)ON DELETE CASCADE  ON UPDATE CASCADE,
    CONSTRAINT Kind_PK FOREIGN KEY (Kind)REFERENCES IngredientDetails (Kind)ON DELETE CASCADE  ON UPDATE CASCADE
);


    
CREATE TABLE Orders (
    OrderNo INT(10) NOT NULL,
    OrderDetails VARCHAR(100) ,
    billNo INT(10) NOT NULL,
    idNo INT(10) NOT NULL,
    NoItems INT(10) NOT NULL,
    dateOForder date,
   CONSTRAINT Or_PK  PRIMARY KEY (OrderNo, idNo , billNo),
   CONSTRAINT OR_FK FOREIGN KEY (OrderNo)REFERENCES CUSTOMER (CustomerNo)ON DELETE CASCADE
   ON UPDATE CASCADE ,
   CONSTRAINT OR2_FK FOREIGN KEY (idno)REFERENCES Employee (IDNo)ON DELETE CASCADE
   ON UPDATE CASCADE
);




CREATE TABLE OrderDetails (
    OrderDetails VARCHAR(100),
    NoOfItems INT(10),
	OrderNo INT(10) NOT NULL,
   CONSTRAINT ord_FK FOREIGN KEY (OrderNo)REFERENCES Orders (OrderNo)ON DELETE CASCADE 
   ON UPDATE CASCADE
);




CREATE TABLE CUSTOMER (
    CustomerNo INT(10) UNIQUE NOT NULL,
     OrderDetails VARCHAR(100),
	Price INT(10),
    CONSTRAINT CU_PK PRIMARY KEY (CustomerNo)
);



CREATE TABLE MealPrice (
    MealID INT(10) NOT NULL,
    Price DECIMAL(4 , 2 ) NOT NULL,
    BillNo INT(10) NOT NULL,
    CONSTRAINT MealID_PK PRIMARY KEY (BillNo , MealID)
);

    create index ME_ID  ON MealPrice (MealID);


CREATE TABLE Meal (
    MealID INT(10) NOT NULL,
    Dishes VARCHAR(30) NOT NULL,
    CONSTRAINT MealID_FK FOREIGN KEY (MealID)REFERENCES MealPrice (MealID)ON DELETE CASCADE
); 

create index Bill_No ON orders (billNo);
        
CREATE TABLE FeedBack (
    BillNo INT(10) NOT NULL UNIQUE,
    FoodQuality INT(5),
    Service INT(5),
    Suggestion VARCHAR(500),
    CONSTRAINT BillNo_FK FOREIGN KEY (BillNo)REFERENCES orders (billNo)ON DELETE CASCADE
	ON UPDATE CASCADE
);
        
CREATE TABLE FeedbackWriter (
    BillNo INT(10) NOT NULL UNIQUE,
    iDNo INT(10) NOT NULL UNIQUE,
    CONSTRAINT BillNo_FK2 FOREIGN KEY (BillNo)REFERENCES feedback (BillNo)ON DELETE CASCADE 
    ON UPDATE CASCADE,
    CONSTRAINT IDNo_FK2 FOREIGN KEY (iDNo)REFERENCES employee (IDNo)ON DELETE CASCADE
       ON UPDATE CASCADE
);

 


insert into mealprice values
(1,55.5,0),
(2,36,1),
(3,60.99,2),
(4,30.2,3),
(5,20.19,4);
select*from mealprice;



insert into meal values
(1,'Shrimp dumplings'),
(2,'Rice noodle rolls'),
(3,'Chow mein'),
(4,' Sushi'),
(5,'Kimchi');
select*from meal;


insert into employeerole 
values
(0501346834,'waiter'),
(0533789325,'chef'),
(0981265338,'General Manager'),
(0433096119,'Executive Chef'),
(0501266452,'Barista');
select * from employeerole;





insert into employee 
values
(0501346834,'Ahmed','M'),
(0533789325,'Ali','M'),
(0981265338,'Heba','F'),
(0433096119,'Tariq','M'),
(0501266452,'Ashraf','M');
select * from employee;

 
 
insert into employeename 
values
('Ahmed','Yasser'),
('Ali','Basm'),
('Heba','Amir'),
('Tariq','Adam'),
('Ashraf','Khaled');
select * from employeename;


insert into branchemanger 
values
(01,'Ahmad'),
(02,'Lan'),
(03,'Khald'),
(04,'Sara'),
(05,'Muna');
select * from branchemanger;



INSERT INTO CUSTOMER 
VALUES (312,'Tuna Sandwich',15),
  (311,'Suchi',17),
  (310,'Ispagity',20),
  (309,'kimchi',35),
  (308,'bulgogi',25);   
   select *FROM CUSTOMER;
   



INSERT INTO Orders
values(312,'Tuna Sandwich',10,51,2,'23/12/30'),
(311,'Suchi',11,51,3,'23/1/29'),
(310,'Ispagity',12,51,1,'23/5/1'),
(308,'bulgogi',13,51,4,'23/4/1'),
(309,'kimchi',14,51,4,'23/12/25');

select *FROM Orders;

INSERT INTO orderdetails
values('bulgogi',4,308),
('kimchi',4,309),
('Ispagity',1,310),
('Suchi',3,311),
('Tuna Sandwich',2,312);
SELECT *FROM OrderDetails;

insert into Ingredient values 
('Shrimp',1),
('Rice Noodles',2),
('Noodle',3),
('Nori and Rice',4),
('Scallions and Sauce',5);
select * from Ingredient;


insert into ingredientdetails values
('Shrimp', 5 , 250 ),
('Rice Noodles', 50 , 250),
('Noodle' , 47 , 241),
('Nori and Rice' , 6 , 197),
('Scallions and Sauce' , 5 , 86);
SELECT * FROM IngredientDetails;


insert into feedback 
values(10, 5 , 4, 'Add more tables'),
(11,4, 3,'slow service due to lack of staff'),
(12,5, 5,'perfict'),
 (13,3, 4,null),
 (14,3, null, null);
 
 insert into feedbackwriter 
values(10, 0501346834),
(11,0533789325),
(12,0981265338),
 (13,0433096119),
 (14,0501266452);
 
 
#Calculates calories that are less than 243
SELECT calories, COUNT(*) AS number
FROM IngredientDetails
WHERE (calories)<243
GROUP BY calories;

# Calculates prices that are less than 50
SELECT Price, COUNT(*) AS number
FROM mealprice
WHERE (Price)<50
GROUP BY Price;

 
 #Subqueries
  SELECT *
FROM Meal
WHERE MealID IN (SELECT MealID 
   FROM MealPrice
   WHERE Price<40);

 #Subqueries
 SELECT *
FROM IngredientDetails
WHERE calories= (SELECT MIN(calories)
FROM IngredientDetails);

#only table information containing the number Quantity=5 is shown
SELECT * FROM IngredientDetails
WHERE Quantity= 5;

# sort by calories
SELECT * FROM IngredientDetails
ORDER BY calories;

# sort by dates
 select *
 from orders
 order by dateOForder;
 

                   
# sort by Price                   
 SELECT *
FROM MealPrice
ORDER BY Price;
 
#only table information containing the number billNo=11 is shown
SELECT *
FROM Orders
 where  billNo=11 ;
 
#Join
 select* from employee where gender = 'M' and IDNo =(select role from employeerole where role = 'waiter') ;
 
 
 
 # delete IDNo to Ahmed is 0501346834
delete from employee
where IDNo=0501346834;
select*from employee;

  # (update) change orderdetails Tuna Sandwich to 'KOREAN CANDIED SWEET POTATO'
 SELECT * FROM customer;
 UPDATE customer
 SET orderdetails = 'KOREAN CANDIED SWEET POTATO'
 WHERE orderdetails='Tuna Sandwich';
                        
                        