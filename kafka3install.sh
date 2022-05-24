echo KAFKA 3.2.0 INSTALLATION
echo ************************

echo Installing Java
sudo apt install openjdk-17-jre-headless

echo Installing Kafka Broker

mkdir kafkainst
cd kafkainst
wget https://dlcdn.apache.org/kafka/3.2.0/kafka_2.12-3.2.0.tgz
tar -zxf kafka_2.12-3.2.0.tgz
sudo mv kafka_2.12-3.2.0 /usr/local/kafka
mkdir /tmp/kafka-logs

# create a file with the advertised.listeners setting and the public ip address
echo "" > listeners
printf "advertised.listeners=PLAINTEXT://" >> listeners
curl ifconfig.me >> listeners
printf ":9092\n" >> listeners
echo "" >> listeners

# backup the kraft config file
sudo cp /usr/local/kafka/config/kraft/server.properties /usr/local/kafka/config/kraft/server.backup

# remove any existing advertised.listeners line from config
sudo sed -i 's/^.*advertised.listeners.*$/#--see below--/' /usr/local/kafka/config/kraft/server.properties

# append the setting with the correct ip address
sudo cat /usr/local/kafka/config/kraft/server.properties listeners > server.properties

# copy the file back where it belongs
sudo cp server.properties /usr/local/kafka/config/kraft/server.properties

# format storage
/usr/local/kafka/bin/kafka-storage.sh format -t 25hd9Q-iRVSYOJLEek6iSg -c /usr/local/kafka/config/kraft/server.properties

echo Starting Kafka
/usr/local/kafka/bin/kafka-server-start.sh -daemon /usr/local/kafka/config/kraft/server.properties

echo Done
