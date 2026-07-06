CREATE TABLE Cities (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL
   
);


CREATE TABLE Category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL
   
);

CREATE TABLE Movement_Type (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
   
);


CREATE TABLE Supplier (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) not null,
    City_Id INTEGER NOT NULL,
    CONSTRAINT fk_supplier
        FOREIGN KEY (City_Id)
        REFERENCES Cities(id)
);


CREATE TABLE Products (
    id SERIAL PRIMARY KEY,
    Product_Name VARCHAR(200) not null,
    Category_Id INTEGER NOT NULL,
    Unit_Price DECIMAL not null,
    CONSTRAINT fk_products
        FOREIGN KEY (Category_Id)
        REFERENCES Category(id)
);


CREATE TABLE Warehouse (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) not null,
    City_Id INTEGER NOT NULL,
    CONSTRAINT fk_warehouse
        FOREIGN KEY (City_Id)
        REFERENCES Cities(id)
);

CREATE table Movement (
    id SERIAL PRIMARY KEY,
    Movement_date date not null,
    Type_Id INTEGER NOT NULL,
    Warehouse_Id INTEGER not null,
    CONSTRAINT fk_movement_type
        FOREIGN KEY (Type_Id)
        REFERENCES movement_type(id),
    constraint fk_movement_warehouse
    	foreign key (Warehouse_Id)
    	references warehouse(id)
);












