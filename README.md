# Desafio Docker Full Cycle

## Descrição do Desafio:
Desafio do curso fullcycle em que consiste em criar uma imagem da linguagem golang, e retornar a mensagem `Full Cycle Rocks!!`, e como segundo requisito do desafio, a imagem deveria conter no maximo 2MB.

## Dockerfile

```
# Iniciando a imagem golang utilizando o alpine 
FROM golang:alpine as build

# Informando diretorio de trabalho
WORKDIR /usr/src/app

# Copiando os arquivos 
ADD . .

# Iniciando o go.mod informando o caminho correto do arquivo .go
RUN go mod init pwd/main

# Buildando o arquivo main.go
RUN go build -ldflags '-s -w' main.go

# Segundo stage utilizando o scratch
FROM scratch

# Informando diretorio de trabalho
WORKDIR /

# Copiando os arquivos do build
COPY --from=build /usr/src/app/main /

# Comando utilizado.
CMD ["./main"]
```

# Scratch

Utilização do Scratch para construir uma imagem minimalista com apenas os binarios assim reduzindo o tamanho da imagem.

## Docker Build Image
```
docker build -t thf4/fullcycle .
```
## Docker Run

```
docker run --rm thf4/fullcycle
```
## Docker Login
```
docker login
```
## Docker Push Image

```
docker pull thf4/fullcycle
```
## Docker Pull Image
```
docker pull thf4/fullcycle
```

## Docker hub link Image
```
https://hub.docker.com/r/thf4/fullcycle
```

### Referências
- https://go.dev/doc/
- https://docs.docker.com/build/building/multi-stage/
- https://hub.docker.com/_/scratch