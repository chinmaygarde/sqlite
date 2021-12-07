# Checks out the latest sqlite3 sources from the official mirror and build the
# amalgamation files. These file are updated in place along with the VERSION
# file. License has been verified as being in the "unencumbered" list.
selfupdate: checkout
	cd checkout && ./configure
	cd checkout && make sqlite3.c
	git -C checkout rev-parse HEAD > GIT_REVISION
	date > LAST_UPDATE
	cp -f checkout/VERSION .
	cp -f checkout/sqlite3.h .
	cp -f checkout/sqlite3.c .

checkout: clean
	git clone --depth=1 https://github.com/sqlite/sqlite checkout

clean:
	rm -rf checkout
