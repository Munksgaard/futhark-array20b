.PHONY: all clean

all: mapscan1-1.in mapscan1-2.in mapscan1-3.in mapscan1-4.in mapscan2-1.in mapscan2-2.in mapscan2-3.in mapscan2-4.in

clean:
	rm *.in

mapscan1-1.in:
	(echo '1024i32'; futhark dataset -b -g [1024]i32) > $@

mapscan1-2.in:
	(echo '1024i32'; futhark dataset -b -g [8192]i32) > $@

mapscan1-3.in:
	(echo '1024i32'; futhark dataset -b -g [65536]i32) > $@

mapscan1-4.in:
	(echo '1024i32'; futhark dataset -b -g [524288]i32) > $@

mapscan2-1.in:
	(echo '[1i32, 1i32, 1i32, 1i32, 1i32, 64i32, 128i32, 256i32, 512i32, 1024i32]'; futhark dataset -b -g [4194304]i32) > $@

mapscan2-2.in:
	(echo '[64i32, 128i32, 256i32, 512i32, 1024i32, 2048i32, 4096i32, 8192i32, 16384i32, 32768i32]'; futhark dataset -b -g [4194304]i32) > $@

mapscan2-3.in:
	(echo '[1i32, 1i32, 1i32, 1i32, 1i32, 2048i32, 4096i32, 8192i32, 16384i32, 32768i32]'; futhark dataset -b -g [4194304]i32) > $@

mapscan2-4.in:
	(echo '[1i32, 1i32, 1i32, 1i32, 1i32, 32768i32, 65536i32, 131072i32, 262144i32, 524288i32]'; futhark dataset -b -g [4194304]i32) > $@
