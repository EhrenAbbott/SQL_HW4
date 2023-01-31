insert into salesperson (salesperson_id)
values (999);

insert into salesperson (salesperson_id)
values (324);

insert into salesperson (salesperson_id)
values (891);

insert into car (serial_number, salesperson_id, new_or_used)
values (1234556, 999, 'new');

insert into car (serial_number, salesperson_id, new_or_used)
values (2224356, 999, 'used'); 

insert into car (serial_number, salesperson_id, new_or_used)
values (0907721, 891, 'used');

insert into service_ticket (ticket_id, serial_number)
values (21, 0907721);

insert into service_ticket (ticket_id, serial_number)
values (10, 1234556);

insert into service_ticket (ticket_id, serial_number)
values (86, 2224356);

insert into car_parts (part_id, ticket_id)
values (66, 86);

insert into car_parts (part_id, ticket_id)
values (33, 10);

insert into car_parts (part_id, ticket_id)
values (99, 21);

insert into invoice (invoice_id, serial_number) 
values (1111, 0907721);

insert into invoice (invoice_id, serial_number)
values (222, 1234556);

insert into invoice (invoice_id, serial_number)
values (333, 2224356);

insert into customer (customer_id, serial_number)
values (34343, 1234556); 

insert into customer (customer_id, serial_number)
values (78787, 2224356); 

insert into customer (customer_id, serial_number)
values (45454, 0907721); 


insert into mecanic (mecanic_id, serial_number)
values (999888, 0907721);

insert into mecanic (mecanic_id, serial_number)
values (444333, 0907721);

insert into mecanic (mecanic_id, serial_number)
values (666555, 0907721);

create or replace procedure change_inventory(
	serial_number integer
)
language plpgsql
as $$ 
begin 
	update car
	set new_or_used = 'new'
	where new_or_used = 'used';
	commit;
end; 
$$

call change_inventory(2224356);

create or replace procedure aged_inventory(
	serial_number integer
)
language plpgsql
as $$ 
begin 
	update car
	set new_or_used = 'used'
	where new_or_used = 'new';
	commit;
end; 
$$

call aged_inventory (0907721);

create or replace function add_mecanic(_mecanic_id integer, _serial_number integer)
returns void 
as $MAIN$ 
begin 
	insert into mecanic(mecanic_id, serial_number)
	values(_mecanic_id, _serial_number); 
end; 
$MAIN$ 
language plpgsql;

select add_mecanic(111222, 0907721);

create or replace function add_car(_serial_number integer, _salesperson_id integer, _new_or_used VARCHAR(10))
returns void 
as $MAIN$ 
begin 
	insert into car(serial_number, salesperson_id, new_or_used)
	values(_serial_number, _salesperson_id, _new_or_used);
end; 
$MAIN$ 
language plpgsql;

select add_car(5045045, 999, 'used');
