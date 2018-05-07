# Makefile

all: docker-build

docker-build:
	if ! echo "$(shell docker images overware/lxde-vnc)" | grep -q "overware/lxde-vnc"; then docker build -t overware/lxde-vnc .; fi

run:
	docker run -d -p 5901:5901/tcp -h lxdevnc --name lxdevnc overware/lxde-vnc

clean:
	if echo "$(shell docker ps -a)" | grep -q "lxdevnc"; then docker rm -f lxdevnc; fi
	if echo "$(shell docker images overware/lxde-vnc)" | grep -q "overware/lxde-vnc"; then docker rmi -f overware/lxde-vnc; fi


# End of Makefile
