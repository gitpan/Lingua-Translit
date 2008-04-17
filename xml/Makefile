# $Id: Makefile 235 2008-04-17 08:42:05Z alinke $

TARGET		:=	tables.dump
DUMP		:=	perl xml2dump.pl -v 
CHECK		:=	xmllint --noout --postvalid

# List of stable and supported transliteration tables
TABLES		:=	din_31634.xml din_1460_bul.xml \
			iso_843.xml iso_9.xml \
			greeklish.xml \
			common_deu.xml common_ron.xml common_ces.xml \
			common_classical_mon.xml \
			streamlined_system_bul.xml

all: clean tables

tables:
	$(DUMP) -o $(TARGET) $(TABLES)

all-tables:
	$(DUMP) -o $(TARGET) $(filter-out template.xml,$(wildcard *.xml))

check: $(TABLES)
	@for xml in $^; do \
		echo "Checking $$xml..."; \
		$(CHECK) $$xml; \
	done

clean:
	-rm -f $(TARGET)
