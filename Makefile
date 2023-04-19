setup:
	@make build
	@make up 
	@make composer-update
	@make composer-install
build:
	docker-compose build --no-cache --force-rm
stop:
	docker-compose stop
up:
	docker-compose up -d
composer-update:
	docker exec health-insurance bash -c "composer update"
	docker exec health-insurance bash -c "php artisan key:generate"
composer-install:
	docker exec health-insurance bash -c "composer install"
data:
	docker exec health-insurance bash -c "php artisan migrate"
	docker exec health-insurance bash -c "php artisan db:seed"
revise-permissions:
	docker exec health-insurance bash -c "chmod -R 757 public"
key:
	docker exec health-insurance bash -c "php artisan key:generate"

