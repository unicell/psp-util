NAME = psp-util
VERSION = v1.0.1
build:
	go build -o bin/${NAME} main.go

multi-build:
	mkdir -p bin/darwin_amd64 bin/linux_amd64
	GOOS=darwin GOARCH=amd64 go build -o bin/darwin_amd64/${NAME} main.go
	GOOS=linux GOARCH=amd64 go build -o bin/linux_amd64/${NAME} main.go
	GOOS=windows GOARCH=amd64 go build -o bin/windows_amd64/${NAME} main.go

update-version:
	sed -i.bak -e "s/v[0-9].[0-9].[0-9][-alpha]*[-beta]*/${VERSION}/g" ./cmd/version.go
	sed -i.bak -e "s/v[0-9].[0-9].[0-9][-alpha]*[-beta]*/${VERSION}/g" ./psp-util.yaml
