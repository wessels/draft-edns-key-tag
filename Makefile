DOC=draft-edns-key-tag
VER=00

all: ${DOC}-${VER}.txt
	
${DOC}-${VER}.txt: ${DOC}.xml
	xml2rfc ${DOC}.xml -o $@

.PHONY: clean
	
clean:
	rm -f ${DOC}-${VER}.txt
