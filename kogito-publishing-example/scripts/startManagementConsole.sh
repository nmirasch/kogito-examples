#!/bin/sh
echo "Starting the Kogito Management Console"

PROJECT_VERSION=$(cd ../ && mvn help:evaluate -Dexpression=project.version -q -DforceStdout)

echo "Project version: ${PROJECT_VERSION}"

MANAGEMENT_CONSOLE_VERSION=${PROJECT_VERSION}
MANAGEMENT_CONSOLE_RUNNER="https://repository.jboss.org/nexus/service/local/artifact/maven/content?r=public&g=org.kie.kogito&a=management-console&v=${MANAGEMENT_CONSOLE_VERSION}&c=runner"

SVG_FOLDER=svg

KOGITO_PUBLISHING_SVG_FOLDER=../basic/target/classes/META-INF/processSVG

mkdir -p $SVG_FOLDER

if [ -d "$KOGITO_PUBLISHING_SVG_FOLDER" ]
then
    cp $KOGITO_PUBLISHING_SVG_FOLDER/*.svg $SVG_FOLDER
else
    echo "$KOGITO_PUBLISHING_SVG_FOLDER does not exist. Have you compiled your Kogito Publishing basic project?"
    exit 1
fi

wget -nc -O management-console-${MANAGEMENT_CONSOLE_VERSION}-runner.jar ${MANAGEMENT_CONSOLE_RUNNER}

java -jar  -Dquarkus.http.port=8280 -Dkogito.svg.folder.path=`pwd`/svg management-console-${MANAGEMENT_CONSOLE_VERSION}-runner.jar