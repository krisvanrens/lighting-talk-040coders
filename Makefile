OUTPUT_NAME := 040coders-lightning-talk


.PHONY: all
all: html


reveal.js:
	wget https://github.com/hakimel/reveal.js/archive/master.tar.gz
	tar -xzvf master.tar.gz
	rm master.tar.gz
	mv reveal.js-master reveal.js
	patch -p0 < revealjs_fix_theme_css.patch
	patch -p0 < revealjs_fix_dimensions.patch


html: reveal.js
	pandoc -t revealjs -s $(OUTPUT_NAME).md -o $(OUTPUT_NAME).html -V revealjs-url=./reveal.js -V theme=solarized -f 'markdown+emoji'


pdf:
	npm i decktape
	$(shell npm bin)/decktape -s 1920x1080 automatic file://$(shell pwd)/040coders-lightning-talk.html $(OUTPUT_NAME).pdf
