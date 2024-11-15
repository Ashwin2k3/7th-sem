#!/bin/bash

# Define project structure
mkdir -p rpc server client

# Create RPCInterface.java
cat <<EOL > rpc/RPCInterface.java
package rpc;

import java.io.Serializable;

public interface RPCInterface extends Serializable {
    int add(int a, int b);
}
EOL

# Create RPCServer.java
cat <<EOL > server/RPCServer.java
package server;

import rpc.RPCInterface;
import java.io.*;
import java.net.*;

public class RPCServer implements RPCInterface {
    private ServerSocket serverSocket;

    @Override
    public int add(int a, int b) {
        return a + b;
    }

    public void start(int port) {
        try {
            serverSocket = new ServerSocket(port);
            System.out.println("Server started on port " + port);
            while (true) {
                new ClientHandler(serverSocket.accept(), this).start();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static class ClientHandler extends Thread {
        private Socket clientSocket;
        private RPCServer server;

        public ClientHandler(Socket socket, RPCServer server) {
            this.clientSocket = socket;
            this.server = server;
        }

        public void run() {
            try (ObjectInputStream input = new ObjectInputStream(clientSocket.getInputStream());
                 ObjectOutputStream output = new ObjectOutputStream(clientSocket.getOutputStream())) {

                String methodName = (String) input.readObject();
                int a = input.readInt();
                int b = input.readInt();

                if (methodName.equals("add")) {
                    int result = server.add(a, b);
                    output.writeInt(result);
                    output.flush();
                }
            } catch (IOException | ClassNotFoundException e) {
                e.printStackTrace();
            } finally {
                try {
                    clientSocket.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static void main(String[] args) {
        RPCServer server = new RPCServer();
        server.start(8080); // Server will listen on port 8080
    }
}
EOL

# Create RPCClient.java
cat <<EOL > client/RPCClient.java
package client;

import java.io.*;
import java.net.*;

public class RPCClient {
    private Socket clientSocket;
    private ObjectOutputStream output;
    private ObjectInputStream input;

    public void connect(String ip, int port) throws IOException {
        clientSocket = new Socket(ip, port);
        output = new ObjectOutputStream(clientSocket.getOutputStream());
        input = new ObjectInputStream(clientSocket.getInputStream());
        System.out.println("Connected to server at " + ip + ":" + port);
    }

    public int callAdd(int a, int b) throws IOException, ClassNotFoundException {
        output.writeObject("add");
        output.writeInt(a);
        output.writeInt(b);
        output.flush();
        return input.readInt();
    }

    public void disconnect() throws IOException {
        input.close();
        output.close();
        clientSocket.close();
    }

    public static void main(String[] args) {
        RPCClient client = new RPCClient();
        try {
            System.out.println("Name: Yant Sansanwal");
            System.out.println("Roll no: 00320803121");
            client.connect("localhost", 8080);
            int result = client.callAdd(35, 15);
            System.out.println("Result of 35 + 15 = " + result);
            client.disconnect();
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
EOL

echo "Project files created successfully!"

