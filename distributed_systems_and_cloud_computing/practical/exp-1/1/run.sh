#!/bin/bash

# Define the source directories
SRC_DIR="rpc:server:client"

# Compile Java files
echo "Compiling Java files..."
echo "Command: javac -d . \$(find rpc server client -name '*.java')"
javac -d . $(find rpc server client -name "*.java") 2>/dev/null

if [ $? -ne 0 ]; then
    echo "Compilation failed. Please check your code."
    exit 1
fi

# Start the server in the background
echo "Starting RMI registry..."
echo "Command: rmiregistry 8080 &"
rmiregistry 8080 &

echo "Starting RPCServer..."
echo "Command: java server.RPCServer &"
java server.RPCServer 2>/dev/null &

# Wait for the server to start
sleep 2

# Start the client
echo "Running RPCClient..."
echo "Command: java client.RPCClient"
java client.RPCClient 2>/dev/null

# Wait for user input before closing
read -p "Press any key to exit..."

