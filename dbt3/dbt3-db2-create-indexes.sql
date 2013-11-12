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

ALTER TABLE supplier ALTER COLUMN s_suppkey SET NOT NULL;
ALTER TABLE part ALTER COLUMN p_partkey SET NOT NULL;
ALTER TABLE partsupp ALTER COLUMN ps_partkey SET NOT NULL;
ALTER TABLE partsupp ALTER COLUMN ps_suppkey SET NOT NULL;
ALTER TABLE customer ALTER COLUMN c_custkey SET NOT NULL;
ALTER TABLE orders ALTER COLUMN o_orderkey SET NOT NULL;
ALTER TABLE lineitem ALTER COLUMN l_orderkey SET NOT NULL;
ALTER TABLE lineitem ALTER COLUMN l_linenumber SET NOT NULL;
ALTER TABLE nation ALTER COLUMN n_nationkey SET NOT NULL;
ALTER TABLE region ALTER COLUMN r_regionkey SET NOT NULL;

REORG TABLE supplier;
REORG TABLE part;
REORG TABLE partsupp;
REORG TABLE customer;
REORG TABLE orders;
REORG TABLE lineitem;
REORG TABLE nation;
REORG TABLE region;

ALTER TABLE supplier ADD PRIMARY KEY (s_suppkey);
ALTER TABLE part ADD PRIMARY KEY (p_partkey);
ALTER TABLE partsupp ADD PRIMARY KEY (ps_partkey, ps_suppkey);
ALTER TABLE customer ADD PRIMARY KEY (c_custkey);
ALTER TABLE orders ADD PRIMARY KEY (o_orderkey);
ALTER TABLE lineitem ADD PRIMARY KEY (l_orderkey, l_linenumber);
ALTER TABLE nation ADD PRIMARY KEY (n_nationkey);
ALTER TABLE region ADD PRIMARY KEY (r_regionkey);

CREATE INDEX i_l_shipdate ON lineitem (l_shipdate);
CREATE INDEX i_l_suppkey_partkey ON lineitem (l_partkey, l_suppkey);
CREATE INDEX i_l_partkey ON lineitem (l_partkey);
CREATE INDEX i_l_suppkey ON lineitem (l_suppkey);
CREATE INDEX i_l_receiptdate ON lineitem (l_receiptdate);
CREATE INDEX i_l_orderkey ON lineitem (l_orderkey);
CREATE INDEX i_l_orderkey_quantity ON lineitem (l_orderkey, l_quantity);
CREATE INDEX i_c_nationkey ON customer (c_nationkey);
CREATE INDEX i_o_orderdate ON orders (o_orderdate);
CREATE INDEX i_o_custkey ON orders (o_custkey);
CREATE INDEX i_s_nationkey ON supplier (s_nationkey);
CREATE INDEX i_ps_partkey ON partsupp (ps_partkey);
CREATE INDEX i_ps_suppkey ON partsupp (ps_suppkey);
CREATE INDEX i_n_regionkey ON nation (n_regionkey);
CREATE INDEX i_l_commitdate ON lineitem (l_commitdate);

RUNSTATS ON TABLE supplier;
RUNSTATS ON TABLE part;
RUNSTATS ON TABLE partsupp;
RUNSTATS ON TABLE customer;
RUNSTATS ON TABLE orders;
RUNSTATS ON TABLE lineitem;
RUNSTATS ON TABLE nation;
RUNSTATS ON TABLE region;
