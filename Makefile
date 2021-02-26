SAMPLE_WAR_URL = https://tomcat.apache.org/tomcat-8.0-doc/appdev/sample/sample.war

.PHONY: all
all: target/sample.war

.PHONY: clean
clean:
	rm -rf target

target/sample.war:
	mkdir -p target
	curl -s -o "$@" "$(SAMPLE_WAR_URL)"
