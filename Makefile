DRAFTS=$(patsubst %.xml,%.html,$(wildcard *.xml))

all: $(DRAFTS)

%.html : %.xml
	xml2rfc $< --text --html

clean:
	rm -f *.txt *.html
