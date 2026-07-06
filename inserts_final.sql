insert into cities(name)
select distinct rx."SupplierCity"  from riwisupply_xlsx rx 

insert into category(name)
select distinct rx."Category"  from riwisupply_xlsx rx

insert into movement_type(name)
select distinct rx."MovementType"  from riwisupply_xlsx rx

insert into orders(code_order, type_movement)
select rx."PurchaseOrder", mt.id
from riwisupply_xlsx rx

join movement_type mt
on rx."MovementType" = mt.name

insert into supplier(name, city_id)
select distinct rx."SupplierName", ct.id as city_id
from riwisupply_xlsx rx

join cities ct
on rx."SupplierCity" = ct.name


insert into warehouse(name, city_id)
select distinct rx."Warehouse", ct.id as city_id
from riwisupply_xlsx rx

join cities ct
on rx."WarehouseCity" = ct.name


insert into products(product_name, category_id, unit_price)
select distinct rx."ProductName", ctg.id as category_id, rx."UnitPrice"
from riwisupply_xlsx rx

join category ctg
on rx."Category" = ctg.name






INSERT INTO tabla_destino (
    campo_1,
    id_fk_1,
    id_fk_2
)
SELECT
    d.campo_origen,
    t1.id,
    t2.id
FROM staging d
JOIN tabla_maestra_1 t1 ON ...
JOIN tabla_maestra_2 t2 ON ...;