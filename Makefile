
all:
	docker build . -t temp
	docker run --rm -it -v $$PWD/out:/out temp
