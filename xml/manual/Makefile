TITLE	:=	Lingua::Translit Developer Manual
TITLE_H :=	"<h1 id=\"title\">$(TITLE)<\/h1>"
KEYWORDS:=	"Lingua::Translit, Lingua::Translit::Tables, \
		transliteration tables, transliteration, \
		developer manual, xml2dump.pl, natural language \
		transliteration, text transliteration, translit, \
		Lingua-Systems"
LT_URL	:=	http://search.cpan.org/dist/Lingua-Translit/lib/Lingua

P2H	:=	pod2html --css=pod.css \
			--htmlroot=http://perldoc.perl.org
P2T	:=	pod2text --width 78 --loose --alt
HL	:=	highlight -s print --encoding utf-8

TARGETS	:=	manual.html manual.txt
EXAMPLES:=	11_tr_Common_DEU.t.html Common_DEU.xml.html
TEMPLATES:=	template.xml.html xx_tr_template.t.html



all: $(TARGETS) $(EXAMPLES) $(TEMPLATES)

manual.html: manual.pod
	$(P2H) --infile $< --outfile $@ --title "$(TITLE)"
	sed -e 's/<link rev="made" href="[^"]*" \/>/<meta name="keywords" content="'$(strip $(KEYWORDS))'"\/>/' \
	  -e 's/^\(<h[[:digit:]]>\)\(<a[^>]\+>\)\([^<]\+\)<\/a>/\2<\/a>\n\1\3/' \
	  -e 's/^<dt><strong><a name="[^"]\+">\(.*\)<\/a><\/strong>$$/<dt>\1/' \
	  -e 's{http://[^[:space:]]\+Lingua/\([^"]\+\).html{$(LT_URL)/\1.pm{' \
	  -e 's{the Lingua::\([^[:space:]]\+\) manpage{Lingua::\1{g' \
	  -e '/^[[:space:]]*$$/d' \
	  -e 's/<body>/<body>'$(TITLE_H)'/' \
	  -e 's/``/"/g' \
	  -i $@
	rm -f pod2htm*.tmp

manual.txt: manual.pod
	$(P2T) $< $@

11_tr_Common_DEU.t.html: ../../t/11_tr_Common_DEU.t
	$(HL) -S perl -o $@ --doc-title "Example: '$(shell basename $<)'" $<

Common_DEU.xml.html: ../common_deu.xml
	$(HL) -S xml  -o $@ --doc-title "Example: '$(shell basename $<)'" $<

template.xml.html: ../template.xml
	$(HL) -S xml  -o $@ --doc-title "Template: '$(shell basename $<)'" $<

xx_tr_template.t.html: ../../t/xx_tr_template.t.pl
	$(HL) -S perl -o $@ --doc-title "Template: 'xx_tr_template.t'" $<

clean:
	-rm -f $(TARGETS) index.html *.tmp

distclean: clean
	-rm -f $(EXAMPLES) $(TEMPLATES) highlight.css
