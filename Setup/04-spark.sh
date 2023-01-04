# Download Apache Spark
wget https://archive.apache.org/dist/spark/spark-3.3.1/spark-3.3.1-bin-hadoop3.tgz

tar -xzf spark-3.3.1-bin-hadoop3.tgz

sudo mv spark-3.3.1-bin-hadoop3 /opt/spark

# Download Apache Hadoop
wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.4/hadoop-3.3.4.tar.gz

tar -xzf hadoop-3.3.4.tar.gz

sudo mv hadoop-3.3.4 /opt/hadoop

# Use Docker Compose

curl -LO https://raw.githubusercontent.com/bitnami/containers/main/bitnami/spark/docker-compose.yml

docker-compose up