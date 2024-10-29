Installing Hadoop on macOS involves several steps, including installing Java, setting up Hadoop, and configuring it. Here’s a detailed guide to help you through the process:

### Step 1: Install Java
Hadoop requires Java to run. You can install the Java Development Kit (JDK) using Homebrew.

1. **Install Homebrew** (if you haven't already):
   Open your terminal and run:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Install JDK**:
   ```bash
   brew install openjdk@11
   ```

3. **Set JAVA_HOME**:
   Add the following lines to your `~/.bash_profile` or `~/.zshrc` (depending on the shell you're using):
   ```bash
   export JAVA_HOME="$(brew --prefix openjdk@11)"
   export PATH="$JAVA_HOME/bin:$PATH"
   ```
   Then, run `source ~/.bash_profile` or `source ~/.zshrc` to apply the changes.

### Step 2: Install Hadoop
1. **Download Hadoop**:
   Go to the [Apache Hadoop Releases](https://hadoop.apache.org/releases.html) page and download the latest stable version of Hadoop (e.g., `hadoop-x.y.z.tar.gz`).

   Alternatively, you can use the following command to download Hadoop directly in the terminal:
   ```bash
   wget https://downloads.apache.org/hadoop/common/hadoop-x.y.z/hadoop-x.y.z.tar.gz
   ```

2. **Extract Hadoop**:
   Navigate to the directory where you downloaded Hadoop and extract the files:
   ```bash
   tar -xzf hadoop-x.y.z.tar.gz
   mv hadoop-x.y.z /usr/local/hadoop
   ```

### Step 3: Configure Hadoop
1. **Set Hadoop Environment Variables**:
   Add the following lines to your `~/.bash_profile` or `~/.zshrc`:
   ```bash
   export HADOOP_HOME=/usr/local/hadoop
   export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
   ```

   Then, run `source ~/.bash_profile` or `source ~/.zshrc` to apply the changes.

2. **Configure Hadoop**:
   Navigate to the Hadoop configuration directory:
   ```bash
   cd /usr/local/hadoop/etc/hadoop
   ```

   Edit the following configuration files:

   - **`core-site.xml`**:
     ```xml
     <configuration>
         <property>
             <name>fs.defaultFS</name>
             <value>hdfs://localhost:9000</value>
         </property>
     </configuration>
     ```

   - **`hdfs-site.xml`**:
     ```xml
     <configuration>
         <property>
             <name>dfs.replication</name>
             <value>1</value>
         </property>
     </configuration>
     ```

   - **`mapred-site.xml`**:
     Create this file if it does not exist:
     ```xml
     <configuration>
         <property>
             <name>mapreduce.framework.name</name>
             <value>yarn</value>
         </property>
     </configuration>
     ```

   - **`yarn-site.xml`**:
     ```xml
     <configuration>
         <property>
             <name>yarn.nodemanager.aux-services</name>
             <value>mapreduce_shuffle</value>
         </property>
         <property>
             <name>yarn.nodemanager.aux-services.mapreduce.shuffle.class</name>
             <value>org.apache.hadoop.mapred.ShuffleHandler</value>
         </property>
     </configuration>
     ```

### Step 4: Format HDFS
Before you start Hadoop for the first time, you need to format the HDFS:

```bash
hdfs namenode -format
```

### Step 5: Start Hadoop
You can now start Hadoop:

```bash
start-dfs.sh
start-yarn.sh
```

### Step 6: Verify the Installation
To verify if Hadoop is running, you can access the web interfaces:

- NameNode: `http://localhost:9870`
- ResourceManager: `http://localhost:8088`

### Step 7: Stop Hadoop
To stop Hadoop, use the following commands:

```bash
stop-yarn.sh
stop-dfs.sh
```

### Troubleshooting
- Ensure you have the correct permissions on Hadoop directories.
- Check logs located in the `logs` directory within your Hadoop installation for any errors.

This guide should help you set up Hadoop on your macOS successfully. If you have any specific questions or run into issues, feel free to ask!
