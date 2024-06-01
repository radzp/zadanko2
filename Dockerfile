# Zaczynam od obrazu bazowego Go
FROM golang:1.22.3 AS builder

# Ustawiam katalog roboczy
WORKDIR /app

# Instaluję curl
RUN apt-get update && apt-get install -y curl

# Kopiuję plik go.mod
COPY go.mod ./

# Pobieram zaleznosci
RUN go mod download

# Kopiuję resztę kodu źródłowego
COPY . .

# Buduję aplikację
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -a -installsuffix cgo -o main .

# Rozpoczynam od pustego obrazu
FROM scratch

# Moje metadane
LABEL maintainer="Anna Paczesna"

# Kopiuję plik wykonywalny z obrazu budującego
COPY --from=builder /app/main /main

# Kopiuję curl z obrazu budującego
COPY --from=builder /usr/bin/curl /usr/bin/curl

# Ustawiam port
EXPOSE 8000

# Healthcheck
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 CMD curl --fail http://localhost:8000/ || exit 1

# Ustawiam plik wykonywalny jako punkt wejścia
ENTRYPOINT ["/main"]