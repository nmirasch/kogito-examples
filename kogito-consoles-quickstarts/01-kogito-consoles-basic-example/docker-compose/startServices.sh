#!/bin/sh

echo "Script requires your Kogito Consoles Basic Setup project to be compiled"

PROJECT_VERSION=$(cd ../ && mvn help:evaluate -Dexpression=project.version -q -DforceStdout)

echo "Project version: ${PROJECT_VERSION}"

if [[ $PROJECT_VERSION == *SNAPSHOT ]];
then
  KOGITO_VERSION="latest"
else
  KOGITO_VERSION=${PROJECT_VERSION%.*}
fi

echo "Kogito Image version: ${KOGITO_VERSION}"
echo "KOGITO_VERSION=${KOGITO_VERSION}" > ".env"

PERSISTENCE_FOLDER=./persistence
KOGITO_EXAMPLE_PERSISTENCE=../target/classes/META-INF/resources/persistence/protobuf

mkdir -p $PERSISTENCE_FOLDER

if [ -d "$KOGITO_EXAMPLE_PERSISTENCE" ]
then
    cp $KOGITO_EXAMPLE_PERSISTENCE/*.proto $PERSISTENCE_FOLDER/
else
    echo "$KOGITO_EXAMPLE_PERSISTENCE does not exist. Have you compiled Kogito Consoles Basic Setup project?"
    exit 1
fi

docker-compose up