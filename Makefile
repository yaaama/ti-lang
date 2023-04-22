all: build Lexer.hs Parser.hs
	ghc src/Main.hs -isrc -o build/Main -odir build -hidir build

build: clean
	mkdir build

Lexer.hs: src/Lexer.x
	alex -ibuild/lexer.info src/Lexer.x

Parser.hs: src/Parser.y
	happy -ibuild/parser.info src/Parser.y

clean:
	rm -rf src/Lexer.hs src/Parser.hs build


