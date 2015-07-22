DOC=draft-edns-key-tag
VER=00

all: ${DOC}-${VER}.txt ${DOC}-${VER}.html 

${DOC}-${VER}.txt: ${DOC}.xml
	xml2rfc ${DOC}.xml
	mv ${DOC}.txt $@

${DOC}-${VER}.html: ${DOC}.xml
	xml2html ${DOC}.xml
	mv ${DOC}.html $@

.PHONY: clean
	
clean:
	rm -f ${DOC}-${VER}.txt
