FANCY-EMACS - my emacs config
=============================

Install
------
 - backup & delete .emacs file and .emacs.d folder first.(no .emacs file, all in .emacs.d folder)
 - private.el must be created for some private code.
 - rsense should be installed
 - ctag supported by rinari
   (should install ctags:
   $ sudo aptitude install ctags
   $ ctags-exuberant -a -e -f TAGS --tag-relative -R app lib vendor (run this command under project)
   (in Mac, maybe should set path /usr/local/bin)
   <http://rinari.rubyforge.org/Navigation.html>)
 - install magit
 - install mew (for email, the path in init.el may need be updated "/usr/share/emacs23/site-lisp/mew")

Include
------
 - color-theme
 - ido
 - karl's javascript
 - anything
 - yasnippet
 - auto-complete
 - nxhtml
 - rsense
 - yasnippet-javascript (my project: <https://github.com/fancyoung/yasnippet-javascript>)
 - yari

Shortcuts
------
<https://github.com/fancyoung/fancy-emacs/wiki/shortcut>

Bugs
------
- nxhtml + karl's javascript + inline javascript + inverted comma(')
el:if input inverted comma in onclick:<a html="#" onclick="">test</a>, emacs will stop running.
