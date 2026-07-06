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