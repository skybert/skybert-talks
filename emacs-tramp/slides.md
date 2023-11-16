
## Agenda

- Local emacs → server
- Local emacs → jump.server → server

---

Local Emacs 🐮 → server ⛳

---

```
C-x C-f /ssh:user@server:/foo/bar
```
---

Local Emacs 🐮 → jump.server 🔒 → server ⛳

---

## ~/.ssh/config

---

```conf
Host server
  Hostname server
  User real.user
  
  # Either
  ProxyJump jump.server
  # Or
  ProxyCommand ssh jump.server -W %h:%p
```

---

## Summary

- Never leave the comforts of your local Emacs
- Tramp comes pre-installed with Emacs
- `C-x C-f /ssh:user@server:/path/to/file`

---

## Delve further

[TRAMP 2.6.1 User Manual](https://www.gnu.org/software/tramp/)
