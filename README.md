# unrar-openssl-aes
Builds UnRAR from source using FreeBSD's patches to use OpenSSL's AES functions.

[UnRAR](https://www.rarlab.com/rar_add.htm) uses AES functions for password protected archives.  These are CPU intensive and slow.
The source includes SSE optimizations, but those are only enabled for Windows builds.

[@animetosho](https://github.com/animetosho) has a [patch](https://github.com/animetosho/unrar-patch) which enables those SSE optimizations for Linux and MacOS builds.

The FreeBSD version [patches](https://cgit.freebsd.org/ports/tree/archivers/unrar/files) the AES functions to use those from OpenSSL's libcrypto, which are even faster.

Here are some timing results (`unrar t ...`) on the same hardware of a large password protected rarset:

```
stock 6.24 on linux:

user    5m25.500s
sys     0m29.106s

animetosho patched 6.24 on linux:

user    1m23.428s
sys     0m29.722s

freebsd's openssl-aes patched 6.24 on linux:

user    1m2.389s
sys     0m28.775s
```

This repository provides an easy way to build UnRAR with FreeBSD's openssl-aes patches.  libssl-dev is required.

```
$ git clone https://github.com/kchiem/unrar-openssl-aes
$ cd unrar-openssl-aes
$ make
```
