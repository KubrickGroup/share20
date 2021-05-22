echo KAFKA INSTALLATION
echo ******************
echo Installing Java

sudo yum -y install java-1.8.0-openjdk

echo Installing Zookeeper

mkdir kafkainst
cd kafkainst

wget https://archive.apache.org/dist/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz

tar -zxf zookeeper-3.4.6.tar.gz
sudo mv zookeeper-3.4.6 /usr/local/zookeeper
sudo mkdir -p /var/lib/zookeeper

sudo echo tickTime=2000 > /usr/local/zookeeper/conf/zoo.cfg
sudo echo dataDir=/var/lib/zookeeper >> /usr/local/zookeeper/conf/zoo.cfg
sudo echo clientPort=2181 >> /usr/local/zookeeper/conf/zoo.cfg
sudo /usr/local/zookeeper/bin/zkServer.sh start
sudo yum -y install telnet


echo Installing Kafka Broker

wget https://archive.apache.org/dist/kafka/2.8.0/kafka_2.12-2.8.0.tgz

tar -zxf kafka_2.12-2.8.0.tgz
sudo mv kafka_2.12-2.8.0 /usr/local/kafka
sudo mkdir /tmp/kafka-logs

echo "" > listeners
printf "advertised.listeners=PLAINTEXT://" >> listeners
curl ifconfig.me >> listeners
printf ":9092\n" >> listeners

sudo cp /usr/local/kafka/config/server.properties /usr/local/kafka/config/server.backup

sudo cat /usr/local/kafka/config/server.backup listeners > /usr/local/kafka/config/server.properties

/usr/local/kafka/bin/kafka-server-start.sh -daemon /usr/local/kafka/config/server.properties

echo Done
