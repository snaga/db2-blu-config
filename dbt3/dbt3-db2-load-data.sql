--
-- This file is released under the terms of the Artistic License.
-- Please see the file LICENSE, included in this package, for details.
--
-- Copyright (C) 2002-2008 Mark Wong & Open Source Development Labss, Inc.
-- Copyright (C) 2013 Uptime Technologies, LLC.
--
LOAD FROM /tmp/data/supplier.csv OF DEL REPLACE INTO supplier;
LOAD FROM /tmp/data/part.csv OF DEL REPLACE INTO part;
LOAD FROM /tmp/data/partsupp.csv OF DEL REPLACE INTO partsupp;
LOAD FROM /tmp/data/customer.csv OF DEL REPLACE INTO customer;
LOAD FROM /tmp/data/orders.csv OF DEL REPLACE INTO orders;
LOAD FROM /tmp/data/lineitem.csv OF DEL REPLACE INTO lineitem;
LOAD FROM /tmp/data/nation.csv OF DEL REPLACE INTO nation;
LOAD FROM /tmp/data/region.csv OF DEL REPLACE INTO region;

-- SELECT count(*) FROM supplier;
-- SELECT count(*) FROM part;
-- SELECT count(*) FROM partsupp;
-- SELECT count(*) FROM customer;
-- SELECT count(*) FROM orders;
-- SELECT count(*) FROM lineitem;
-- SELECT count(*) FROM nation;
-- SELECT count(*) FROM region;

