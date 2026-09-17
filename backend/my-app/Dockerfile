# ---------- Build stage ----------
FROM golang:1.26-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go build -o market-server .

# ---------- Runtime stage ----------
FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/market-server .

EXPOSE 8080

CMD ["./market-server"]