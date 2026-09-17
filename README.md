# Stock Market Simulator

A real-time stock market simulator built with Go, WebSockets, queues, heaps, and a simple matching engine.

The project simulates a basic electronic market where traders can submit buy and sell orders. The matching engine continuously checks the best available buy and sell orders and executes trades when their prices cross.

## Features

- Real-time communication using WebSockets
- Buy and sell order handling
- Price-time priority
- FIFO queue for incoming orders
- Max Heap for buy orders
- Min Heap for sell orders
- Automatic order matching
- Partial order fills
- Real-time trade broadcasting
- Docker support
- Simple and modular Go architecture

## Architecture

```text
                    Client
                      |
                      | WebSocket
                      v
              +----------------+
              |  Go WebSocket  |
              |     Server     |
              +----------------+
                      |
                      v
              +----------------+
              |    Matching    |
              |     Engine     |
              +----------------+
                  /         \
                 /           \
                v             v
          +----------+   +----------+
          | Max Heap |   | Min Heap |
          |   BUY    |   |   SELL   |
          +----------+   +----------+
                 \           /
                  \         /
                   v       v
                  Trades
