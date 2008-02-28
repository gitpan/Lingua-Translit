# $Id: Makefile 145 2008-02-27 13:37:51Z alinke $

TARGET		:=	tables.dump
DUMP		:=	perl xml2dump.pl -v 
CHECK		:=	xmllint --noout --postvalid

# List of stable and supported transliteration tables
TABLES		:=	din_5008.xml din_31634.xml \
			iso_843.xml iso_9.xml \
			greeklish.xml \
			common_ron.xml

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
