RUNTIME_DIR=~/.emacs.d

all: link
	@true
link:
	test -e $(RUNTIME_DIR) || ln -s $(PWD) $(RUNTIME_DIR)
unlink:
	rm -f $(RUNTIME_DIR)
linkprivate:
	ln -s ~/Dropbox/my/private.el .

.PHONY: all link unlink linkprivate
