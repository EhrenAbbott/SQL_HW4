create table salesperson (
	salesperson_id serial primary key
); 


create table car (
	serial_number serial primary key,
	salesperson_id integer,
	foreign key (salesperson_id) references salesperson(salesperson_id),
	new_or_used VARCHAR(10)
);


create table service_ticket (
	ticket_id serial primary key, 
	serial_number integer, 
	foreign key (serial_number) references car(serial_number)
);

create table car_parts (
	part_id serial primary key, 
	ticket_id integer, 
	foreign key (ticket_id) references service_ticket(ticket_id)
);

create table invoice (
	invoice_id serial primary key, 
	serial_number integer, 
	foreign key (serial_number) references car(serial_number)
);

create table customer (
	customer_id serial primary key, 
	serial_number integer, 
	foreign key (serial_number) references car(serial_number)
);

create table mecanic (
	mecanic_id serial primary key, 
	serial_number integer, 
	foreign key (serial_number) references car(serial_number)
);

 
