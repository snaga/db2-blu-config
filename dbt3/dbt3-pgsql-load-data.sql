--
-- This file is released under the terms of the Artistic License.
-- Please see the file LICENSE, included in this package, for details.
--
-- Copyright (C) 2002-2008 Mark Wong & Open Source Development Labss, Inc.
-- Copyright (C) 2013 Uptime Technologies, LLC.
--
\COPY supplier FROM '/tmp/data/supplier.csv' ( FORMAT CSV )
\COPY part FROM '/tmp/data/part.csv' ( FORMAT CSV )
\COPY partsupp FROM '/tmp/data/partsupp.csv' ( FORMAT CSV )
\COPY customer FROM '/tmp/data/customer.csv' ( FORMAT CSV )
\COPY orders FROM '/tmp/data/orders.csv' ( FORMAT CSV )
\COPY lineitem FROM '/tmp/data/lineitem.csv' ( FORMAT CSV )
\COPY nation FROM '/tmp/data/nation.csv' ( FORMAT CSV )
\COPY region FROM '/tmp/data/region.csv' ( FORMAT CSV )
