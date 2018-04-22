all: package

clean-frontend:
	-rm -r src/main/webapp
	-mkdir src/main/webapp

frontend: clean-frontend
	cd src/main/dart && \
	pub build --mode=release --web-compiler=dart2js && \
	find build -name "*.ng_*.json" -exec rm {} + && \
	find build -name "*.ng_placeholder" -exec rm {} + && \
	cp -r build/web/* ../webapp/

serve:
	cd src/main/dart && pub serve --port 8888

package:
	mvn package

full-package: frontend package

docker-run: full-package
	@docker run -it --rm -p 8080:8080 \
		-v ${PWD}/target/assignment2.war:/usr/local/tomcat/webapps/ROOT.war \
		-v ${PWD}/target/assignment2:/usr/local/tomcat/webapps/ROOT \
		tomcat:9-jre8-alpine
	# @docker run -it --rm -p 8080:8080 --name assignment2 ca4006/assignment2