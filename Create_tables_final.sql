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
    Order_Code varchar(50) PRIMARY KEY,
    Movement_date date not null,
    Warehouse_Id INTEGER not null,
    quantity integer not null,
    CONSTRAINT fk_movement_type
        FOREIGN KEY (Type_Id)
        REFERENCES movement_type(id),
    constraint fk_movement_warehouse
    	foreign key (Warehouse_Id)
    	references warehouse(id)
);

CREATE TABLE Purchases (
    Order_Code VARCHAR(50) PRIMARY KEY,
    Purchase_Date date not null,
    Supplier_Id INTEGER NOT NULL,
    Warehouse_Id INTEGER NOT NULL,
    Total_Price DECIMAL not null,
    CONSTRAINT fk_purchase_supplier
        FOREIGN KEY (Supplier_Id)
        REFERENCES supplier(id),
    CONSTRAINT fk_purchase_warehouse
        FOREIGN KEY (Warehouse_Id)
        REFERENCES warehouse(id),
    CONSTRAINT fk_purchase_movement_type_id
        FOREIGN KEY (Movement_Type_Id)
        REFERENCES movement_type(id)
        
);


CREATE TABLE Purchases_Products (
    Purchase_Order VARCHAR(50) PRIMARY KEY,
    Product_Id integer not null,
    Quantity INTEGER NOT NULL,
    Purchase_Price DECIMAL not null,
    subtotal decimal not null,
    CONSTRAINT fk_purchase_products_1
        FOREIGN KEY (Purchase_Order)
        REFERENCES purchases(Order_Code),
    CONSTRAINT fk_purchase_products_2
        FOREIGN KEY (Product_Id)
        REFERENCES products(id)
        
);


CREATE TABLE Orders (
    Code_Order VARCHAR(50) PRIMARY KEY,
    type_movement integer not null,
    CONSTRAINT fk_orders
        FOREIGN KEY (type_movement)
        REFERENCES movement(id)
);





















