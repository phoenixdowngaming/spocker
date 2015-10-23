.PHONY: build run kill enter

build:
	sudo docker build --rm -t spocker .

run: kill
	sudo docker run -d --name spockerd -P \
		--net=host \
		spocker

kill:
	-sudo docker kill spockerd
	-sudo docker rm spockerd

enter:
	sudo docker exec -it spockerd sh -c "export TERM=xterm && bash"
