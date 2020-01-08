FROM golang:alpine

# add dependencies
RUN apk --no-cache add ca-certificates cmake make g++ openssl-dev git pkgconfig curl libressl-dev

# clone seabolt-1.7.4 source code
RUN git clone -b v1.7.4 https://github.com/neo4j-drivers/seabolt.git /seabolt

WORKDIR /seabolt/build

RUN cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_LIBDIR=lib .. && cmake --build . --target install

RUN go get github.com/neo4j/neo4j-go-driver/neo4j
EXPOSE 7687 7474 7473
