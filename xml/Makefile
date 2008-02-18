# $Id: Makefile 108 2008-02-14 11:58:17Z alinke $

TARGET		:=	transtbl.dump
DUMP		:=	perl xml2dump.pl -v 
CHECK		:=	xmllint --noout --postvalid

# List of stable and supported transliteration tables
TABLES_STABLE	:=	din_5008.xml \
			iso_843.xml iso_9.xml \
			greeklish.xml


all: clean $(TARGET)-stable $(TARGET)-unstable

stable: clean $(TARGET)-stable 

$(TARGET)-stable: check-stable
	$(DUMP) -o $@ $(TABLES_STABLE)

$(TARGET)-unstable: check-all
	$(DUMP) -o $@ *.xml

check-stable: $(TABLES_STABLE)
	@for xml in $^; do \
		echo "Checking $$xml..."; \
		$(CHECK) $$xml; \
	done

check-all: *.xml
	@for xml in $<; do \
		echo "Checking $$xml..."; \
		$(CHECK) $$xml; \
	done

clean:
	-rm -f $(TARGET)-stable $(TARGET)-unstable

