#! /bin/bash

sed -n '/#+begin_src elisp/,/#+end_src/ {
    s/^#+begin.*/\n/
    /^#+end.*/d
    p
}' < emacs-java.org > init.el
