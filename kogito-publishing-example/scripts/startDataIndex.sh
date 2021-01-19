#!/bin/sh
echo "Script requires your Kogito Publishing example project to be compiled"

PROJECT_VERSION=$(cd ../ && mvn help:evaluate -Dexpression=project.version -q -DforceStdout)

echo "Project version: ${PROJECT_VERSION}"

DATA_INDEX_VERSION=${PROJECT_VERSION}

# //PERSISTENCE_FOLDER=target/classes/META-INF/resources/persistence/protobuf
DATA_INDEX_RUNNER="https://repository.jboss.org/nexus/service/local/artifact/maven/content?r=public&g=org.kie.kogito&a=data-index-service-infinispan&v=${DATA_INDEX_VERSION}&c=runner"

KOGITO_PUBLISHING_PERSISTENCE=../basic/target/classes/META-INF/resources/persistence/protobuf

#mkdir -p $PERSISTENCE_FOLDER

if [ -d "$KOGITO_PUBLISHING_PERSISTENCE" ]
then
    cp $KOGITO_PUBLISHING_PERSISTENCE/*.proto persistence
else
    echo "$KOGITO_PUBLISHING_PERSISTENCE does not exist. Have you compiled your Kogito Publishing Example project?"
    exit 1
fi


#[ ! -d ${PERSISTENCE_FOLDER} ] && echo "Persistence folder is missing. Make sure that your project was compiled" && exit 0

#wget -nc https://repository.jboss.org/org/kie/kogito/data-index-service-infinispan/${DATA_INDEX_VERSION}/data-index-service-infinispan-${DATA_INDEX_VERSION}-runner.jar
wget -nc -O data-index-service-infinispan-${DATA_INDEX_VERSION}-runner.jar ${DATA_INDEX_RUNNER}
# cp -rf ${PERSISTENCE_FOLDER} persistence
java -jar  -Dkogito.protobuf.folder=`pwd`/persistence data-index-service-infinispan-${DATA_INDEX_VERSION}-runner.jar
