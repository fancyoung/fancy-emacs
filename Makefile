RUNTIME_DIR=~/.emacs.d

all: link
	@true

link:
	test -e $(RUNTIME_DIR) || ln -s $(PWD) $(RUNTIME_DIR)
unlink:
	rm -f $(RUNTIME_DIR)

.PHONY: all link unlink