
postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_PASSWORD=meccu -d postgres:12-alpine

createdb:
	docker exec -it postgres12 createdb -U postgres --owner=postgres simple_bank

dropdb:
	docker exec -it postgres12 dropdb -U postgres simple_bank

migrateup:
	migrate -path ./migration/ -database "postgresql://postgres:meccu@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path ./migration/ -database "postgresql://postgres:meccu@localhost:5432/simple_bank?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdb migrateup migratedown


