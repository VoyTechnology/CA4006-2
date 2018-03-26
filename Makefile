all: build

clean:
	@rm -rf out
	@mkdir out

build: clean
	@javac -d out/ src/*.java

run: build
	@cd out && java Main

package: build
	jar -cvf out/assignment2.war out/*
