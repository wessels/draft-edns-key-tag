DOC=draft-edns-key-tag
VER := $(shell cat ${DOC}.xml | awk '$$1 == "<rfc" {print $$3}' | awk -F= '{print $$2}' | tr -d '"' | awk -F- '{print $$NF}')

.PHONY: all
all: ${DOC}-${VER}.txt ${DOC}-${VER}.html 

${DOC}-${VER}.txt: ${DOC}.xml
	xml2rfc ${DOC}.xml
	mv ${DOC}.txt $@

${DOC}-${VER}.html: ${DOC}.xml
	xml2html ${DOC}.xml
	mv ${DOC}.html $@

${DOC}-${VER}.ps: ${DOC}-${VER}.txt
	enscript -B -f Courier11 -o $@ ${DOC}-${VER}.txt

.PHONY: clean
clean:
	rm -f ${DOC}-${VER}.txt
