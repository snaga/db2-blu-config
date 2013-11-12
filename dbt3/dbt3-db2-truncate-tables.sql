--
-- This file is released under the terms of the Artistic License.
-- Please see the file LICENSE, included in this package, for details.
--
-- Copyright (C) 2002-2008 Mark Wong & Open Source Development Labss, Inc.
-- Copyright (C) 2013 Uptime Technologies, LLC.
--
REORG TABLE supplier;
REORG TABLE part;
REORG TABLE partsupp;
REORG TABLE customer;
REORG TABLE orders;
REORG TABLE lineitem;
REORG TABLE nation;
REORG TABLE region;

TRUNCATE TABLE supplier IMMEDIATE;
TRUNCATE TABLE part IMMEDIATE;
TRUNCATE TABLE partsupp IMMEDIATE;
TRUNCATE TABLE customer IMMEDIATE;
TRUNCATE TABLE orders IMMEDIATE;
TRUNCATE TABLE lineitem IMMEDIATE;
TRUNCATE TABLE nation IMMEDIATE;
TRUNCATE TABLE region IMMEDIATE;

REORG TABLE supplier;
REORG TABLE part;
REORG TABLE partsupp;
REORG TABLE customer;
REORG TABLE orders;
REORG TABLE lineitem;
REORG TABLE nation;
REORG TABLE region;
