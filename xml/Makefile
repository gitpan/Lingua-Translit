# $Id: Makefile 198 2008-04-07 09:21:53Z alinke $

TARGET		:=	tables.dump
DUMP		:=	perl xml2dump.pl -v 
CHECK		:=	xmllint --noout --postvalid

# List of stable and supported transliteration tables
TABLES		:=	din_31634.xml \
			iso_843.xml iso_9.xml \
			greeklish.xml \
			common_deu.xml common_ron.xml common_ces.xml \
			common_classical_mon.xml

all: clean tables

tables: check
	$(DUMP) -o $(TARGET) $(TABLES)

check: $(TABLES)
	@for xml in $^; do \
		echo "Checking $$xml..."; \
		$(CHECK) $$xml; \
	done

clean:
	-rm -f $(TARGET)
