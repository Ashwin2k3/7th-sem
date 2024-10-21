### **Assignment 1 (Unit 1)**  
**Paper Code**: CIE-407T  
**Paper Name**: DSCC (Distributed Systems and Cloud Computing)  
**Branch**: CSE/IT  
**Semester**: 7th  
**Submission Deadline**: On or before 07 Oct 2024  

---

#### **Q1) Locate Distributed System? How it is different from Cloud Computing?**

1. A **Distributed System** consists of multiple computers that work together to achieve a common goal.
2. Each machine in a distributed system operates independently and coordinates with others through network communication.
3. The system appears as a single coherent unit to the user.
4. In **Cloud Computing**, resources are provided as services over the internet by a third-party vendor.
5. **Cloud Computing** involves centralized management of resources and is accessible remotely.
6. **Distributed Systems** are typically confined to specific organizations, while cloud services are publicly available.
7. **Cloud Computing** provides greater elasticity, meaning resources can be scaled easily.
8. Distributed systems offer more control over hardware and software configurations compared to cloud services.
9. **Ownership**: Distributed systems are owned by an organization, while cloud computing services are typically third-party.
10. **Cost**: Cloud services are subscription-based, while distributed systems may require higher upfront costs.

---

#### **Q2) Discuss various issues in designing Distributed Systems.**

1. **Scalability**: The system must handle increased loads as the network grows.
2. **Fault Tolerance**: The system must remain operational despite individual node failures.
3. **Concurrency**: The system should manage multiple operations happening simultaneously without conflicts.
4. **Latency**: Data transmission delays between distributed nodes should be minimized.
5. **Consistency**: Ensuring all nodes reflect the same data after any updates is critical.
6. **Security**: The system must protect data from unauthorized access and maintain confidentiality.
7. **Resource Sharing**: Efficient management of shared resources (e.g., memory, processing power).
8. **Synchronization**: Distributed systems require synchronization between various processes or nodes.
9. **Heterogeneity**: Handling different hardware, software, and network environments.
10. **Transparency**: Users should not be aware of the distributed nature of the system.

---

#### **Q3) Explain with diagram the four types of distributed system architectural styles.**

1. **Client-Server Architecture**: The client requests services, and the server responds.
2. **Peer-to-Peer (P2P)**: Each node acts as both a client and server, directly sharing resources.
3. **Three-Tier Architecture**: Involves a client, an application server, and a database server.
4. **Multi-Tier Architecture**: Extends three-tier with additional layers, like business logic and data access.
5. **Client-Server Example**: Web browser (client) accessing a web server.
6. **P2P Example**: File-sharing systems (e.g., BitTorrent).
7. **Three-Tier Example**: Web application with presentation, application, and data layers.
8. **Multi-Tier Example**: Large enterprise systems, such as banking applications.
9. **Decoupling**: Multi-tier architecture allows for better separation of concerns between different layers.
10. **Scalability**: Multi-tier architecture is more scalable than traditional client-server models.

*(Diagram needed for full points)*

---

#### **Q4) Differentiate between internetworking & networking devices? Explain their types with examples.**

1. **Internetworking**: Refers to the interconnection of multiple networks, typically through devices like routers and gateways.
2. **Networking**: Involves connecting devices within the same network (e.g., LAN).
3. **Internetworking Example**: The Internet, which connects different networks across the globe.
4. **Networking Example**: A local area network (LAN) in an office.
5. **Switch**: A device that connects multiple devices in a network and directs data within the LAN.
6. **Router**: Connects different networks and directs data between them.
7. **Hub**: A basic networking device that broadcasts data to all devices connected to it.
8. **Bridge**: Connects two networks and filters traffic between them.
9. **Gateway**: Converts protocols between different types of networks, allowing them to communicate.
10. **Firewalls**: Can act as both networking and internetworking devices by controlling traffic based on security policies.

---

#### **Q5) State IPC & explain its characteristics.**

1. **IPC (Inter-Process Communication)**: A set of mechanisms that allows processes to communicate and synchronize with each other.
2. **Message Passing**: Processes exchange information via message transmission (e.g., sockets).
3. **Shared Memory**: Processes share a region of memory to communicate.
4. **Synchronization**: Processes use IPC to coordinate their actions to prevent race conditions.
5. **Pipes**: A form of IPC that allows data to flow in one direction between two processes.
6. **Semaphores**: Used to control access to a shared resource by multiple processes.
7. **Message Queues**: Messages are stored in a queue and retrieved by processes.
8. **Signals**: A form of IPC where processes send asynchronous notifications to each other.
9. **Characteristics**: Processes may be on the same machine or on different machines in a network.
10. **Deadlock Prevention**: IPC mechanisms need to handle situations where processes wait indefinitely for resources.

---

#### **Q6) Distinguish between Remote Method Invocation (RMI) & Local Invocation.**

1. **Local Invocation**: A method call within the same machine, typically within the same process or memory space.
2. **RMI (Remote Method Invocation)**: Invoking a method on an object located on a different machine or JVM.
3. **Network Dependency**: RMI relies on a network connection, while local invocation does not.
4. **Stub and Skeleton**: In RMI, a stub acts as a proxy for the remote object on the client side, and the skeleton acts on the server side.
5. **Latency**: RMI involves network delays, while local invocation is faster.
6. **Security**: RMI must ensure secure communication across the network, often using encryption.
7. **Serialization**: RMI requires serializing method arguments and return values to transfer over the network.
8. **Transparency**: RMI tries to make remote calls appear as if they were local, but network issues can affect this transparency.
9. **Example (Local)**: A method call within a Java program.
10. **Example (RMI)**: A Java program invoking a method on a remote server for database access.

---

#### **Q7) Reorganize the principle of Java RMI? Explain with diagram.**

1. **Java RMI (Remote Method Invocation)**: Allows Java objects to invoke methods on an object running on another machine.
2. **Stub and Skeleton**: The stub is a proxy for the remote object on the client side, while the skeleton handles the request on the server side.
3. **Remote Interface**: Defines the methods that can be invoked remotely by clients.
4. **RMI Registry**: A directory where remote objects are registered and can be looked up by clients.
5. **Object Serialization**: Method arguments and return values are serialized to transfer over the network.
6. **Marshalling/Unmarshalling**: The process of packaging and unpacking data to send over the network.
7. **RMI Runtime**: Handles communication between the stub and skeleton and manages connections and exceptions.
8. **Network Transparency**: RMI hides the complexity of networking from the developer, making remote calls look like local calls.
9. **Distributed Computing**: Java RMI facilitates distributed applications where objects on different machines can interact seamlessly.
10. **Security**: RMI includes security features to ensure secure communication between clients and servers.

*(Diagram needed for full points)*

---

#### **Q8) Differentiate between Event & Notification with examples.**

1. **Event**: An action or occurrence detected by the system, such as a user click.
2. **Notification**: A message that informs users or systems about an event.
3. **Asynchronous**: Events are usually asynchronous, meaning they can happen at any time.
4. **Example of Event**: A mouse click or keyboard input in a graphical user interface.
5. **Example of Notification**: A push notification on a mobile phone informing the user about a new message.
6. **Event-Driven Programming**: Systems that react to events, such as GUIs, are based on event-driven programming.
7. **Observers**: Notifications often follow an observer pattern, where objects subscribe to receive updates.
8. **Usage in Distributed Systems**: Events and notifications are common in systems that monitor resource states or alert users of changes.
9. **Real-Time Applications**: Notifications are essential in real-time systems (e.g., stock price alerts).
10. **Differentiation**: Events trigger notifications, and notifications provide feedback about events.

---

Let me know if you'd like similar points for **Assignment 2** as well!
