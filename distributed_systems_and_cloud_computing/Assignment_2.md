### **Assignment 2 (Unit 2)**  
**Paper Code**: CIE-407T  
**Paper Name**: DSCC (Distributed Systems and Cloud Computing)  
**Branch**: CSE/IT  
**Semester**: 7th  
**Submission Deadline**: On or before 07 Oct 2024  

---

#### **Q1) Differentiate between Local State & Global State.**

1. **Local State**: Refers to the state of an individual process or node in a distributed system.
2. **Global State**: Represents the combined state of all processes or nodes in a distributed system at a specific point in time.
3. **Local State Visibility**: Only visible to the individual process that holds it.
4. **Global State Visibility**: Visible across the entire distributed system.
5. **Consistency**: Local states can be inconsistent across nodes, while a global state is often used to ensure overall system consistency.
6. **Communication**: Local states don't require network communication, whereas determining a global state requires coordination between nodes.
7. **Snapshots**: Global states can be captured using a snapshot algorithm in distributed systems.
8. **Fault Tolerance**: Global states are crucial for implementing fault tolerance and recovery mechanisms.
9. **Example (Local State)**: The current value of a variable in a process.
10. **Example (Global State)**: The snapshot of the distributed system showing the value of all variables across nodes.

---

#### **Q2) Explain Logical Clocks. Is it different from Physical Clocks?**

1. **Logical Clocks**: A method used to order events in a distributed system without relying on physical time.
2. **Physical Clocks**: Represent real-world time and are synchronized across machines to maintain a consistent time frame.
3. **Lamport’s Logical Clocks**: Logical clocks increment with each event in a system and use timestamps to order events.
4. **Happens-Before Relation**: Logical clocks establish the order of events by maintaining a "happens-before" relationship between events.
5. **Physical Clocks Synchronization**: Require time synchronization protocols (e.g., NTP) to keep clocks consistent across systems.
6. **Drift**: Physical clocks can drift apart due to hardware differences, requiring constant synchronization.
7. **Logical Clocks Utility**: Useful for solving problems like distributed debugging and ensuring event causality.
8. **Example (Logical Clocks)**: In a chat system, logical clocks ensure that messages are displayed in the order they are sent, even if they arrive out of order.
9. **Difference**: Logical clocks are not tied to real-world time, while physical clocks represent real-world time accurately.
10. **Application**: Logical clocks are used in distributed systems, while physical clocks are used in time-critical applications like stock trading systems.

---

#### **Q3) Briefly explain the types of Logical Clocks.**

1. **Lamport Logical Clock**: A simple counter-based clock that increments with each event. It helps in determining the order of events.
2. **Vector Clocks**: A more advanced type of logical clock that tracks the "happens-before" relationship between events in multiple processes.
3. **Causal Clocks**: A refinement of vector clocks that help in determining causal relationships between events.
4. **Hybrid Logical Clocks**: Combines physical and logical clocks to provide partially synchronized time across distributed systems.
5. **Scalar Clocks**: A single integer value that increases with each event, used in Lamport’s clock.
6. **Use in Distributed Systems**: Logical clocks help order events in systems where physical time synchronization is difficult.
7. **Advantages**: Vector clocks provide more accurate causality tracking than Lamport clocks but at a higher computational cost.
8. **Lamport Clock Limitation**: Does not capture causality between all events, which can lead to false concurrency assumptions.
9. **Application of Vector Clocks**: Used in applications requiring fine-grained event causality, such as version control systems.
10. **Causal Ordering**: Ensures that messages or events are delivered in the order of their causal relationships.

---

#### **Q4) State Distributed Debugging.**

1. **Distributed Debugging**: The process of finding and fixing bugs in a distributed system.
2. **Challenges**: Debugging is harder in distributed systems due to concurrency, as events occur simultaneously in different locations.
3. **Event Ordering**: Logical clocks or vector clocks are used to determine the correct order of events in the system.
4. **Breakpoint Setting**: Debugging tools allow setting breakpoints on different nodes to investigate the state of the system.
5. **Message Logging**: All inter-process communications are logged to trace the flow of messages and identify faults.
6. **Global State Tracking**: Snapshots are taken to analyze the system's global state during an error or failure.
7. **Race Conditions**: Distributed debugging tools help in detecting race conditions by tracking event order and resource access.
8. **Distributed Deadlocks**: Debugging involves detecting deadlocks that occur due to resource contention across nodes.
9. **Tools**: Popular tools include GDB for distributed systems, D-Trace, and distributed versions of standard debuggers.
10. **Challenge of Non-Determinism**: Debugging is complicated due to the non-deterministic nature of distributed system execution.

---

#### **Q5) Outline Multicast Communication.**

1. **Multicast Communication**: The process of sending a message from one sender to multiple receivers at the same time.
2. **Efficiency**: Multicast reduces the overhead of sending separate messages to each receiver by delivering the same message to a group.
3. **IP Multicast**: Uses the IP multicast address to send data to a group of devices on a network.
4. **Group Management**: Devices can join or leave multicast groups dynamically.
5. **Reliability**: Reliability protocols (e.g., reliable multicast) ensure message delivery even in the event of network issues.
6. **Types of Multicast**: Includes one-to-many (a single source sending to multiple receivers) and many-to-many (multiple sources sending to multiple receivers).
7. **Applications**: Used in video conferencing, live streaming, and distributed simulations.
8. **Multicast Trees**: Routers form a multicast tree to efficiently route messages to all group members.
9. **Challenges**: Includes ensuring reliable delivery and avoiding congestion in the network.
10. **Protocols**: Common multicast communication protocols include IGMP (Internet Group Management Protocol) and PIM (Protocol Independent Multicast).

---

#### **Q6) State Three Properties of Mutual Exclusion.**

1. **Safety**: At most one process can be in the critical section at a time, ensuring no conflicts during resource access.
2. **Liveness**: Every process that requests entry to the critical section should eventually be granted access, preventing deadlock.
3. **Fairness**: Every process should get a fair chance to access the critical section, preventing starvation.
4. **Exclusive Access**: Only one process can use a shared resource at any time.
5. **No Deadlock**: The system must ensure that processes are not stuck waiting indefinitely.
6. **No Starvation**: All processes should eventually get a chance to enter the critical section.
7. **Non-Preemptiveness**: A process inside the critical section cannot be forced out until it completes its execution.
8. **Progress**: If no process is in the critical section, and some processes wish to enter, one of the waiting processes should be allowed in.
9. **Distributed Mutual Exclusion**: Ensures that the mutual exclusion property is maintained across nodes in a distributed system.
10. **Coordination**: Often achieved using coordination algorithms, such as token-based or quorum-based approaches.

---

#### **Q7) Show the importance of Leader Election in a Distributed System.**

1. **Leader Election**: A process where one node is chosen as the "leader" to coordinate tasks among nodes.
2. **Central Coordination**: The leader node manages distributed tasks such as resource allocation and communication control.
3. **Fault Tolerance**: If the leader fails, the system elects a new leader to ensure continued operation.
4. **Consistency**: Having a leader ensures a single point of coordination, preventing conflicts in distributed systems.
5. **Load Balancing**: The leader can distribute workloads evenly among nodes.
6. **Synchronization**: In systems like distributed databases, the leader ensures that all nodes are synchronized.
7. **Leader Election Algorithms**: Includes Bully Algorithm, Ring Algorithm, and Paxos.
8. **Decentralized Systems**: In decentralized systems, leader election ensures coordination without a permanent centralized controller.
9. **Consensus Building**: Leader election is often a part of achieving consensus in distributed systems.
10. **Real-Life Example**: In cloud storage systems, the leader manages file replication and ensures data consistency.

---

#### **Q8) Why is Consensus Important in a Distributed System?**

1. **Consensus**: Achieving agreement among distributed nodes on a particular value or state.
2. **Coordination**: Consensus ensures all nodes in a distributed system agree on actions or updates, avoiding conflicts.
3. **Data Consistency**: Consensus is critical for maintaining consistency across replicated databases.
4. **Fault Tolerance**: Helps the system remain operational even if some nodes fail, ensuring robustness.
5. **State Machine Replication**: Consensus algorithms ensure that all copies of a replicated service apply the same sequence of operations.
6. **Leader Election**: A form of consensus where nodes agree on which one will become the leader.
7. **Safety**: Consensus ensures that nodes make decisions without violating system safety constraints.
8. **Liveness**: Guarantees that a decision will eventually be made, even in

 the face of failures.
9. **Consensus Algorithms**: Includes Paxos, Raft, and Byzantine Fault Tolerance.
10. **Challenges**: Achieving consensus is challenging in asynchronous environments where nodes may fail or messages may be delayed.

---

#### **Q9) Discuss the CAP Theorem.**

1. **CAP Theorem**: States that a distributed system can only achieve two out of the following three guarantees: Consistency, Availability, and Partition Tolerance.
2. **Consistency**: Ensures all nodes see the same data at the same time.
3. **Availability**: Ensures that every request receives a response, even if some nodes are down.
4. **Partition Tolerance**: Ensures the system continues to operate even if there are network partitions.
5. **Trade-Off**: According to CAP, it's impossible to achieve all three properties simultaneously.
6. **Consistency vs. Availability**: Systems must often trade off between consistency and availability in the presence of network partitions.
7. **Real-World Example**: NoSQL databases like Cassandra focus on availability and partition tolerance at the expense of consistency.
8. **Eventual Consistency**: A common approach where systems are allowed to be temporarily inconsistent but eventually converge to a consistent state.
9. **Use Cases**: Systems like banking need consistency, while social media platforms prioritize availability.
10. **Implications**: The CAP theorem highlights the need to design systems with specific trade-offs based on the use case.

---


