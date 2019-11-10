NAME=jupyter_kaggle

run:
	docker-compose build
	docker-compose run -u "$(id -u $USER):$(id -g $USER)" -d lab

gpurun:
	docker-compose build docker-compose-gpu.yml
	docker-compose run -u "$(id -u $USER):$(id -g $USER)" -d lab

stop:
	docker stop ${NAME}_lab_1
	docker rm -f ${NAME}_lab_1

log:
	docker-compose logs

in:
	docker exec -it ${NAME}_lab_1 /bin/sh
