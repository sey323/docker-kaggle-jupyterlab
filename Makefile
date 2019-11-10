NAME=jupyter_kaggle

run:
	docker-compose build
	docker-compose up -d

gpurun:
	docker-compose build
	docker-compose -f docker-compose-gpu.yml up -d

stop:
	docker stop ${NAME}_lab_1
	docker rm -f ${NAME}_lab_1

log:
	docker-compose logs

in:
	docker exec -it ${NAME}_lab_1 /bin/sh
