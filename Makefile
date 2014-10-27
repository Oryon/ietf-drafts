DRAFTS=$(patsubst %.xml,%.html,$(wildcard *.xml))

all: homenet pim

.PHONY: homenet
homenet:
	$(MAKE) -f ../Makefile -C homenet ids
	
.PHONY: pim
pim:
	$(MAKE) -f ../Makefile -C pim ids

clean:
	$(MAKE) -f ../Makefile -C homenet ids_clean
	$(MAKE) -f ../Makefile -C pim ids_clean


#Executed in subdirectories
ids: $(DRAFTS)

%.html : %.xml
	xml2rfc $< --text --html

ids_clean:
	rm -f *.txt *.html
