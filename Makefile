TAG?=docker-bloodhound:latest

all: build

build:
	docker build -t "${TAG}" .

run: build
	docker run -it -p 7474:7474 -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --device=/dev/dri:/dev/dri -v $(pwd)/bh-data:/data --name bloodhound bloodhound

clean:
	docker rmi "${TAG}"
