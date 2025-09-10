#!/bin/sh

# Start frontend (dev-server) in background
npm run dev-server &

# Wait for dev-server to be ready
echo "Waiting for dev-server to start on http://localhost:2992 ..."
while ! nc -z localhost 2992; do
  sleep 1
done

echo "Dev-server is up. Starting backend..."
node src/server/server-dev.js

