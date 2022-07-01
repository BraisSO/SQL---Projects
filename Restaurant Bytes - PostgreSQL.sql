create table restaurant (id integer primary key, name varchar(20), description varchar(100), rating decimal, telephone char(10), hours varchar(100));

create table address (id integer primary key, street_number varchar(10), street_name varchar(20), city varchar (20), state varchar(15), google_map_link varchar(50));

create table category (id char(2) primary key, name varchar(20), description varchar(200));

create table dish (id integer primary key, name varchar (50), description varchar(200), hot_and_spicy boolean);

create table review (id integer primary key, rating decimal, description varchar(100), date date, restaurant_id integer); 

alter table address add constraint fk_address foreign key (id) references restaurant(id);

alter table review add constraint fk_review foreign key (restaurant_id) references restaurant(id);

create table categories_dishes (id_category char(2), id_dish integer, price money,
primary key(id_category,id_dish),
 foreign key (id_category) references category(id),
 foreign key (id_dish) references dish(id));

 /* 
 *--------------------------------------------
 Insert values for restaurant
 *--------------------------------------------
 */
INSERT INTO restaurant VALUES (
  1,
  'Bytes of China',
  'Delectable Chinese Cuisine',
  3.9,
  '6175551212',
  'Mon - Fri 9:00 am to 9:00 pm, Weekends 10:00 am to 11:00 pm'
);

/* 
 *--------------------------------------------
 Insert values for address
 *--------------------------------------------
 */
INSERT INTO address VALUES (
  1,
  '2020',
  'Busy Street',
  'Chinatown',
  'MA',
  'http://bit.ly/BytesOfChina'
);

/* 
 *--------------------------------------------
 Insert values for review
 *--------------------------------------------
 */
INSERT INTO review VALUES (
  1,
  5.0,
  'Would love to host another birthday party at Bytes of China!',
  '05-22-2020',
  1
);

INSERT INTO review VALUES (
  2,
  4.5,
  'Other than a small mix-up, I would give it a 5.0!',
  '04-01-2020',
  1
);

INSERT INTO review VALUES (
  3,
  3.9,
  'A reasonable place to eat for lunch, if you are in a rush!',
  '03-15-2020',
  1
);

/* 
 *--------------------------------------------
 Insert values for category
 *--------------------------------------------
 */
INSERT INTO category VALUES (
  'C',
  'Chicken',
  null
);

INSERT INTO category VALUES (
  'LS',
  'Luncheon Specials',
  'Served with Hot and Sour Soup or Egg Drop Soup and Fried or Steamed Rice  between 11:00 am and 3:00 pm from Monday to Friday.'
);

INSERT INTO category VALUES (
  'HS',
  'House Specials',
  null
);

/* 
 *--------------------------------------------
 Insert values for dish
 *--------------------------------------------
 */
INSERT INTO dish VALUES (
  1,
  'Chicken with Broccoli',
  'Diced chicken stir-fried with succulent broccoli florets',
  false
);

INSERT INTO dish VALUES (
  2,
  'Sweet and Sour Chicken',
  'Marinated chicken with tangy sweet and sour sauce together with pineapples and green peppers',
  false
);

INSERT INTO dish VALUES (
  3,
  'Chicken Wings',
  'Finger-licking mouth-watering entree to spice up any lunch or dinner',
  true
);

INSERT INTO dish VALUES (
  4,
  'Beef with Garlic Sauce',
  'Sliced beef steak marinated in garlic sauce for that tangy flavor',
  true
);

INSERT INTO dish VALUES (
  5,
  'Fresh Mushroom with Snow Peapods and Baby Corns',
  'Colorful entree perfect for vegetarians and mushroom lovers',
  false
);

INSERT INTO dish VALUES (
  6,
  'Sesame Chicken',
  'Crispy chunks of chicken flavored with savory sesame sauce',
  false
);

INSERT INTO dish VALUES (
  7,
  'Special Minced Chicken',
  'Marinated chicken breast sauteed with colorful vegetables topped with pine nuts and shredded lettuce.',
  false
);

INSERT INTO dish VALUES (
  8,
  'Hunan Special Half & Half',
  'Shredded beef in Peking sauce and shredded chicken in garlic sauce',
  true
);

/*
 *--------------------------------------------
 Insert valus for cross-reference table, categories_dishes
 *--------------------------------------------
 */
INSERT INTO categories_dishes VALUES (
  'C',
  1,
  6.95
);

INSERT INTO categories_dishes VALUES (
  'C',
  3,
  6.95
);

INSERT INTO categories_dishes VALUES (
  'LS',
  1,
  8.95
);

INSERT INTO categories_dishes VALUES (
  'LS',
  4,
  8.95
);

INSERT INTO categories_dishes VALUES (
  'LS',
  5,
  8.95
);

INSERT INTO categories_dishes VALUES (
  'HS',
  6,
  15.95
);

INSERT INTO categories_dishes VALUES (
  'HS',
  7,
  16.95
);

INSERT INTO categories_dishes VALUES (
  'HS',
  8,
  17.95
);


select r.name, a.street_number, a.street_name, r.telephone from restaurant r join address a on(r.id=a.id);

select max(rating) as "best rating" from review;

select cat.name, d.name, c.price from dish d join categories_dishes c on (c.id_dish=d.id) join category cat on (cat.id=c.id_category) order by d.name;

select d.name, c.price, cat.name from dish d join categories_dishes c on (c.id_dish=d.id) join category cat on (cat.id=c.id_category) order by cat.name;

select d.name, c.price, cat.name from dish d join categories_dishes c on (c.id_dish=d.id) join category cat on (cat.id=c.id_category) where d.hot_and_spicy=true;

select count(id_dish) from categories_dishes group by id_dish;

select count(id_dish) from categories_dishes group by id_dish having count(id_dish)>1;

select d.name, count(c.id_dish) from categories_dishes c join dish d on (d.id=c.id_dish) group by c.id_dish,d.name having count(c.id_dish)>1;

select * from review where rating=(select max(rating) from review);