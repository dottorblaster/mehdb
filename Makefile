mehdb_version := 0.6

.PHONY: build clean

build :
	CGO_ENABLED=0 go build -o ./mehdb main.go

clean :
	@rm mehdb
