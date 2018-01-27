all:
	make -s install
clean:
	rm -rf env
install:
	test -d env || pyvenv env
	if [ ! -d env/lib/python3*/site-packages/docker ]; then \
		. env/bin/activate && pip install -r requirements.txt; \
	fi
