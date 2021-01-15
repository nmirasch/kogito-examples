# Kogito Consoles Quickstarts

## Description

This module contains a set of examples that will help you to get started with both _Kogito Management Console_ & _Kogito Task Console_. 

The quickstarts are based on a simple Hiring Process Kogito project. Starting by a basic example, each new one will be introducing new variants (such as authentication, jobs management...) that will give you a wider view of the Kogito Consoles.

Each example will provide the instructions and scripts to easily setup all the required infrastructure and run the example.

## The example

## The Process

<p align="center"><img width=75%  src="docs/images/process.svg"></p>

## The Data model



### Prerequisites

To run the examples you will need:

* Java 11+ installed
* Environment variable JAVA_HOME set accordingly
* Maven 3.5.2+ installed
* Docker and Docker Compose to run the required example infrastructure. 

When using native image compilation, you will also need:

* GraalVM 20 installed
* Environment variable GRAALVM_HOME set accordingly
* Note that GraalVM native image compilation typically requires other packages (glibc-devel, zlib-devel and gcc) to be installed too, please refer to GraalVM installation documentation for more details.