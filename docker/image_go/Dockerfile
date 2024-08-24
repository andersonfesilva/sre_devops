FROM golang:1.23.0-bookworm AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download && go mod verify

COPY . .
# -ldflags="-s -w"
RUN CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build \
   -o server -a -ldflags="-s -w" -installsuffix cgo
# upx used to compress image
RUN upx --ultra-brute -qq server && upx -t server
# Scratch instead of distroless
FROM scratch


COPY --from=build /app/server /server

ENTRYPOINT [ "/server" ]