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
