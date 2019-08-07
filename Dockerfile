FROM maven:3.5-jdk-8

WORKDIR /s

COPY org.eclipse.paho.client.eclipse.feature ./org.eclipse.paho.client.eclipse.feature
COPY org.eclipse.paho.client.eclipse.view ./org.eclipse.paho.client.eclipse.view
COPY org.eclipse.paho.client.mqttv3 ./org.eclipse.paho.client.mqttv3
COPY org.eclipse.paho.client.mqttv3.internal.traceformat ./org.eclipse.paho.client.mqttv3.internal.traceformat
COPY org.eclipse.paho.client.mqttv3.repository ./org.eclipse.paho.client.mqttv3.repository
COPY org.eclipse.paho.client.mqttv3.test ./org.eclipse.paho.client.mqttv3.test
COPY org.eclipse.paho.jmeclient ./org.eclipse.paho.jmeclient
COPY org.eclipse.paho.sample.mqttv3app ./org.eclipse.paho.sample.mqttv3app
COPY org.eclipse.paho.sample.utility ./org.eclipse.paho.sample.utility
COPY org.eclipse.paho.ui ./org.eclipse.paho.ui

COPY pom.xml ./

RUN mvn package -DskipTests

RUN ls org.eclipse.paho.client.mqttv3/target

ENTRYPOINT [ "sh", "-c", \
    "mv org.eclipse.paho.client.mqttv3/target/org.eclipse.paho.client.mqttv3-1.1.0.jar \
    /out/org.eclipse.paho.client.mqttv3.jar" \
]
