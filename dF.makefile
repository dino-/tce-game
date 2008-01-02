BIN=bin/dF
SRC=src


$(BIN) : force
	ghc --make -O -i$(SRC) -o $@ $(SRC)/dF.hs

clean :
	find $(SRC) -regex ".*\.hi" -exec rm -v {} \;
	find $(SRC) -regex ".*\.o" -exec rm -v {} \;

distclean : clean
	rm -v $(BIN)

force :

.PHONY: clean distclean
