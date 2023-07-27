TAG?=dockerbloodhound

all: build

build:
	docker build -t "${TAG}" .

run: build
	docker run --rm -it -p 7474:7474 -p7687:7687 -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --device=/dev/dri:/dev/dri -v $(pwd)/bh-data:/data --name "${TAG}" "${TAG}"

clean:
	docker rmi "${TAG}"
