#----------------------
#Array Datatype
#----------------------
select array<string> ['Indra', 'Raj', 'Abdul'] as Names;
select ['Indra', 'Raj', 'Abdul'] as Names;

#----------------------
with fruits as (select ['apple','mango', 'orange'] as fruits_array)
select fruits_array[offset(0)] as offset
, fruits_array[ordinal(1)] as ordinal
, array_Length(fruits_array) as array_size
,fruits_array
from fruits;

#---------------------
#use unnest with the array column
#---------------------
select index1, items
from unnest(['indra','Raj']) as items
with offset as index1
order by index1;

#---------------------
select array(
  select 'indra' as friend union all
  select 'raj' as friend union all
  #select ['abdul','rashmi'] as friend #array of array is not possible
  select 'abdul' as friend 
  order by friend
) as Friends;

#-------------------
with groceries as
(select ['apple', 'orange'] as list union all
select ['apple', 'pineapple'] as list union all
select ['mango', 'orange'] as list)

select array(
  select list_item
  from unnest(list) as list_item
  where 'apple' in unnest(list) #filter array items
)
from groceries;

#----------------------------------
#Struct as container
#-----------------------------------
select struct<int, string>(27, 'indra');
select struct(27 as age, 'indra' as name) as customer;

#array and struct - together container
select struct(27 as age, 'indra' as name, ['apple','orange'] as items) as customer;

#array and struct - together container
Select array(
select as struct 27 as age, 'indra' as name, ['apple','orange'] as items
union all select as struct 30 as age, 'raj' as name, ['lichi','orange'] as items
union all select as struct 31 as age, 'abdul' as name, ['mango','pineapple'] as items
) as customer


--====================
--Record: Struct
--Repeat: Array
--====================

