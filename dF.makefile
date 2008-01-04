# Makefile for the dF Fudge dice rolling command-line utility

# variables

BIN=bin/dF
SRC=src


# targets

# build the binary
$(BIN) : force
	ghc --make -O -i$(SRC) -o $@ $(SRC)/dF.hs

# clean just the build files, not the compiled binary
clean :
	find $(SRC) -regex ".*\.hi" -exec rm -v {} \;
	find $(SRC) -regex ".*\.o" -exec rm -v {} \;

# clean everything including the compiled binary
distclean : clean
	rm -v $(BIN)


# phony targets

force :

.PHONY: clean distclean
