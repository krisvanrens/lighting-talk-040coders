OUTPUT_NAME := 040coders-lightning-talk


.PHONY: all
all: html


reveal.js:
	wget https://github.com/hakimel/reveal.js/archive/master.tar.gz
	tar -xzvf master.tar.gz
	rm master.tar.gz
	mv reveal.js-master reveal.js


html: reveal.js
	pandoc -t revealjs -s $(OUTPUT_NAME).md -o $(OUTPUT_NAME).html -V revealjs-url=./reveal.js -V theme=black
