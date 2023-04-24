all: clean build Lexer.hs Parser.hs
	ghc src/Main.hs -isrc -o build/Main -odir build -hidir build

build:
	mkdir build

Lexer.hs: src/Lexer.x
	alex src/Lexer.x

Parser.hs: src/Parser.y
	happy src/Parser.y

clean:
	rm -rf src/Lexer.hs src/Parser.hs build
