--
-- This file is released under the terms of the Artistic License.
-- Please see the file LICENSE, included in this package, for details.
--
-- Copyright (C) 2002-2008 Mark Wong & Open Source Development Labss, Inc.
-- Copyright (C) 2013 Uptime Technologies, LLC.
--
TRUNCATE TABLE supplier IMMEDIATE;
TRUNCATE TABLE part IMMEDIATE;
TRUNCATE TABLE partsupp IMMEDIATE;
TRUNCATE TABLE customer IMMEDIATE;
TRUNCATE TABLE orders IMMEDIATE;
TRUNCATE TABLE lineitem IMMEDIATE;
TRUNCATE TABLE nation IMMEDIATE;
TRUNCATE TABLE region IMMEDIATE;

LOAD FROM ./data/supplier.csv OF DEL REPLACE INTO supplier;
LOAD FROM ./data/part.csv OF DEL REPLACE INTO part;
LOAD FROM ./data/partsupp.csv OF DEL REPLACE INTO partsupp;
LOAD FROM ./data/customer.csv OF DEL REPLACE INTO customer;
LOAD FROM ./data/orders.csv OF DEL REPLACE INTO orders;
LOAD FROM ./data/lineitem.csv OF DEL REPLACE INTO lineitem;
LOAD FROM ./data/nation.csv OF DEL REPLACE INTO nation;
LOAD FROM ./data/region.csv OF DEL REPLACE INTO region;

SELECT count(*) FROM supplier;
SELECT count(*) FROM part;
SELECT count(*) FROM partsupp;
SELECT count(*) FROM customer;
SELECT count(*) FROM orders;
SELECT count(*) FROM lineitem;
SELECT count(*) FROM nation;
SELECT count(*) FROM region;
