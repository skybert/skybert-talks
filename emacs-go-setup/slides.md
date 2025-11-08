
# Go & Emacs <code>[14/14]</code>


## ✅ go-mode

    M-x package-install RET go-mode


## ✅ gopls - Go, please!

    # pacman -S gopls


## ✅ eglot - LSP in Emacs

    M-x eglot RET


## ✅ Lets' write som Go


## ✅ Useful on-write hooks

    (add-hook
      'before-save-hook
      #'gofmt-before-save)


## ✅ Write some Go tests


## ✅ Run your Go tests

    M-x package-install gotest


## ✅ Debugger

    paru -S extra/delve


## ✅ Debugger

\#+begin<sub>src</sub> conf
M-x package-install RET dape
\*#+end<sub>src</sub>


## ✅ Debug your Go code

-   Debug `main.go`
-   Debug `main_test.go`
-   Attach to remote Go process
-   See my debugger setup here: [.emacs](file:///home/torstein/.emacs)


## ✅ Go REPL in Emacs

    M-x package-install RET gorepl-mode
    M-x gorepl-run


## ✅ Read Go doc in Emacs

[Emacs Web Browser (eww)](https://www.gnu.org/software/emacs/manual/html_mono/eww.html)

    M-x eww-list-bookmarks


## ✅ Commit Go code in Emacs


## ✅ Summary

-   Go itself: [go.dev](https://go.dev/)
-   Go language server: [gopls](https://go.dev/gopls/)
-   Go debugger: [dlv](https://github.com/go-delve/delve)
-   Emacs & Go: [go-mode](https://github.com/dominikh/go-mode.el), [eglot](https://github.com/joaotavora/eglot), [dape](https://github.com/svaante/dape), [gotest.el](https://github.com/nlamirault/gotest.el), [gorepl-mode](https://github.com/manute/gorepl-mode)
-   Emacs web browser: [eww](https://www.gnu.org/software/emacs/manual/html_mono/eww.html)

