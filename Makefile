build:
	go build -o testapp

start: build
	./testapp