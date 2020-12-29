NAME=docker-kaggle-jupyterlab

run:
	docker-compose build
	docker-compose up -d

gpurun:
	docker-compose build
	docker-compose -f docker-compose-gpu.yml up -d

stop:
	docker stop ${NAME}
	docker rm -f ${NAME}

log:
	docker-compose logs

in:
	docker exec -it ${NAME} /bin/bash
