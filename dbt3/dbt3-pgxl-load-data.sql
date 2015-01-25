--
-- This file is released under the terms of the Artistic License.
-- Please see the file LICENSE, included in this package, for details.
--
-- Copyright (C) 2002-2008 Mark Wong & Open Source Development Labss, Inc.
-- Copyright (C) 2013 Uptime Technologies, LLC.
--
\COPY supplier FROM '/tmp/dbt3/supplier.tbl' WITH ( FORMAT CSV, DELIMITER '|' );
\COPY part FROM '/tmp/dbt3/part.tbl' WITH ( FORMAT CSV, DELIMITER '|' );
\COPY partsupp FROM '/tmp/dbt3/partsupp.tbl' WITH ( FORMAT CSV, DELIMITER '|' );
\COPY customer FROM '/tmp/dbt3/customer.tbl' WITH ( FORMAT CSV, DELIMITER '|' );
\COPY orders FROM '/tmp/dbt3/orders.tbl' WITH ( FORMAT CSV, DELIMITER '|' );
\COPY lineitem FROM '/tmp/dbt3/lineitem.tbl' WITH ( FORMAT CSV, DELIMITER '|' );
\COPY nation FROM '/tmp/dbt3/nation.tbl' WITH ( FORMAT CSV, DELIMITER '|' );
\COPY region FROM '/tmp/dbt3/region.tbl' WITH ( FORMAT CSV, DELIMITER '|' );
