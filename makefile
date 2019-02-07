slides: ./main/main.pandoc
	pandoc $< -o slides.pdf \
		--from markdown+raw_tex+definition_lists+fenced_code_blocks \
		--to=beamer \
		--slide-level=2 \
		--template=./templates/beamer.tex \
		--strip-comments \
		--highlight-style zenburn \
		--standalone
	
# ----------------------------------------------------------------------
# motivation

# the first example: adding curch-encoded 1 and 1 in lambda calculus

# show the first lambda program
lambda1: 
	cat ./examples/lambda/1+1.lambda

# evaluate the first lambda program
lambda2: 
	cat ./examples/lambda/1+1.lambda | crush

# evaluate the first lambda program
lambda3: 
	cat ./examples/lambda/1+1.lambda | crush 2> 1+1_trace.txt

# generate DSO SQL selections in scout reader mode (indented)
genNative1:
	genNativeSql \
		--input ./examples/genNativeSql/testInput1.csv \
		--scout ./examples/genNativeSql/testInput1Keys.csv \
		--indent

# generate DSQ sql selection in direct mode (indented)
genNative2: 
	genNativeSql \
		--input ./examples/genNativeSql/test.csv \
		--indent >> genNative2.sql


# ----------------------------------------------------------------------
# cleanup
	
.PHONY: clean
clean: clean_tex
	rm *.pdf
	
.PHONY: clean_tex
clean_tex:
	rm -r tex2pdf.*
