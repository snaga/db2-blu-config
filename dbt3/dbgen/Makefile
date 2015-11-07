# Makfile

CFLAGS=-DPACKAGE_NAME=\"dbt3\" -DPACKAGE_TARNAME=\"dbt3\" -DPACKAGE_VERSION=\"1.10-pre2\" -DPACKAGE_STRING=\"dbt3\ 1.10-pre2\" -DPACKAGE_BUGREPORT=\"osdldbt-general@lists.sourceforge.net\" -DPACKAGE=\"dbt3\" -DVERSION=\"1.10-pre2\" -DSTDC_HEADERS=1 -DHAVE_SYS_WAIT_H=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DHAVE_STRINGS_H=1 -DHAVE_SYS_TIME_H=1 -DTIME_WITH_SYS_TIME=1 -DHAVE_LIBM=1 -DWORKLOAD=\"TPCH\" -DTPCH=1 -DPGSQL=1 -I.    -DDBNAME=\"dss\" -DSTDLIB_HAS_GETOPT -DEOL_HANDLING -D_FILE_OFFSET_BITS=64  -Wall -g -O2

all: dbgen qgen

dbgen:
	gcc $(CFLAGS) -c -o build.o build.c
	gcc $(CFLAGS) -c -o driver.o driver.c
	gcc $(CFLAGS) -c -o bm_utils.o bm_utils.c
	gcc $(CFLAGS) -c -o rnd.o rnd.c
	gcc $(CFLAGS) -c -o print.o print.c
	gcc $(CFLAGS) -c -o load_stub.o load_stub.c
	gcc $(CFLAGS) -c -o bcd2.o bcd2.c
	gcc $(CFLAGS) -c -o speed_seed.o speed_seed.c
	gcc $(CFLAGS) -c -o text.o text.c
	gcc $(CFLAGS) -c -o permute.o permute.c
	gcc -DDBNAME=\"dss\" -DSTDLIB_HAS_GETOPT -DEOL_HANDLING -D_FILE_OFFSET_BITS=64  -Wall -g -O2 -O  -o dbgen build.o driver.o bm_utils.o rnd.o print.o load_stub.o bcd2.o speed_seed.o text.o permute.o  -lm

qgen:
	gcc $(CFLAGS) -c -o qgen.o qgen.c
	gcc $(CFLAGS) -c -o varsub.o varsub.c
	gcc -DDBNAME=\"dss\" -DSTDLIB_HAS_GETOPT -DEOL_HANDLING -D_FILE_OFFSET_BITS=64  -Wall -g -O2 -O  -o qgen qgen.o varsub.o build.o bm_utils.o rnd.o text.o bcd2.o permute.o speed_seed.o  -lm

clean:
	test -z "dbgen qgen" || rm -f dbgen qgen
	rm -f *.o
