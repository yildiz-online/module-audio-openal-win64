# Yildiz-Engine module-audio-openal-win64.

This is the official repository of the OpenAl Module, part of the Yildiz-Engine project.
The openAl module is an implementation of the audio-module, based on OpenAl-soft library for windows 64.

## Features

* Ogg streaming.
* Wav sound file reading.
* ...

## Requirements

To build this module, you will need a java 9 JDK, Mingw64, and Maven 3.

## Coding Style and other information

Project website:
https://engine.yildiz-games.be

Issue tracker:
https://yildiz.atlassian.net

Wiki:
https://yildiz.atlassian.net/wiki

Quality report:
https://sonarqube.com/overview?id=be.yildiz-games:module-audio-openal-win64

## License

All source code files are licensed under the permissive MIT license
(http://opensource.org/licenses/MIT) unless marked differently in a particular folder/file.

## Build instructions

Go to your root directory, where you POM file is located.

Then invoke maven

	mvn clean install


This will compile the source code, then run the unit tests, and finally build a jar file and DLL.
	
To build the windows artifact, prebuilt libraries are provided.

## Usage

In your maven project, add the dependency

```xml
<dependency>
    <groupId>be.yildiz-games</groupId>
    <artifactId>module-audio-openal-win64</artifactId>
    <version>LATEST</version>
</dependency>
```

## Contact
Owner of this repository: Grégory Van den Borre
