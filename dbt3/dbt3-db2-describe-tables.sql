--
-- This file is released under the terms of the Artistic License.
-- Please see the file LICENSE, included in this package, for details.
--
-- Copyright (C) 2002-2008 Mark Wong & Open Source Development Labss, Inc.
-- Copyright (C) 2013 Uptime Technologies, LLC.
--
DESCRIBE TABLE supplier;
DESCRIBE TABLE part;
DESCRIBE TABLE partsupp;
DESCRIBE TABLE customer;
DESCRIBE TABLE orders;
DESCRIBE TABLE lineitem;
DESCRIBE TABLE nation;
DESCRIBE TABLE region;

SELECT varchar(tabschema,16) tabschema,
       varchar(tabname,16) tabname,
       tableorg
  FROM syscat.tables
 WHERE tabschema = 'DB2INST1'
 ORDER BY tabschema,tabname;

SELECT varchar(tabname,16) tabname,
       data_object_p_size,
       index_object_p_size,
       col_object_p_size,
       data_object_p_size + index_object_p_size + col_object_p_size allsize
  FROM sysibmadm.admintabinfo
 WHERE tabschema = 'DB2INST1'
 ORDER BY tabname;
