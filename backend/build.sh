#!/bin/bash
set -e

echo "Installing Maven..."
# Download and install Maven
MAVEN_VERSION=3.9.6
wget https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz
tar -xzf apache-maven-${MAVEN_VERSION}-bin.tar.gz
export PATH=$PWD/apache-maven-${MAVEN_VERSION}/bin:$PATH

echo "Maven version:"
mvn -version

echo "Building application..."
mvn clean package -DskipTests

echo "Build complete!"
