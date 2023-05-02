all: clean build Lexer.hs Parser.hs
	ghc src/Tsl.hs -isrc -o build/Tsl -odir build -hidir build

build:
	mkdir build

Lexer.hs: src/Lexer.x
	alex src/Lexer.x

Parser.hs: src/Parser.y
	happy src/Parser.y

clean:
	rm -rf src/Lexer.hs src/Parser.hs build
