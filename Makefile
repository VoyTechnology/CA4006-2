all: build

clean:
	@rm -rf out
	@mkdir -p out/WEB-INF
	@rm -f servlet-api.jar

get-servlet-api:
	@docker run -it -v ${PWD}/:/tmp tomcat:9-jre8-alpine /bin/bash -c \
		"cd lib && chmod a+r servlet-api.jar && cp servlet-api.jar /tmp"

build: clean get-servlet-api
	@javac -classpath ${PWD}/servlet-api.jar -d out/WEB-INF/classes src/*.java
	@cp src/web.xml out/WEB-INF/web.xml

package: build
	@cd out && jar -cvf assignment2.war .

docker-build: package
	@docker build -t ca4006/assignment2 .

docker-run: docker-build
	@docker run -it --rm -p 8080:8080 --name assignment2 ca4006/assignment2