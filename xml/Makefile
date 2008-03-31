# $Id: Makefile 185 2008-03-31 09:09:43Z rlinke $

TARGET		:=	tables.dump
DUMP		:=	perl xml2dump.pl -v 
CHECK		:=	xmllint --noout --postvalid

# List of stable and supported transliteration tables
TABLES		:=	din_31634.xml \
			iso_843.xml iso_9.xml \
			greeklish.xml \
			common_deu.xml common_ron.xml common_ces.xml

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
