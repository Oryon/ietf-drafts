DRAFTS=$(patsubst %.xml,%.html,$(wildcard *.xml))

all: homenet pim 6man

.PHONY: homenet
homenet:
	$(MAKE) -f ../Makefile -C homenet ids
	
.PHONY: pim
pim:
	$(MAKE) -f ../Makefile -C pim ids
	
.PHONY: 6man
6man:
	$(MAKE) -f ../Makefile -C 6man ids

clean:
	$(MAKE) -f ../Makefile -C homenet ids_clean
	$(MAKE) -f ../Makefile -C pim ids_clean
	$(MAKE) -f ../Makefile -C 6man ids_clean


#Executed in subdirectories
ids: $(DRAFTS)

%.html : %.xml
	xml2rfc $< --text --html

ids_clean:
	rm -f *.txt *.html
