SRC=https://www.rarlab.com/rar/unrarsrc-6.2.12.tar.gz

unrar/unrar: unrar/
	cd unrar/; make

unrar/: unrar.tar.gz
	tar xzvf $<
	patch -p0 < patch-openssl-aes.diff

unrar.tar.gz:
	wget -O $@ $(SRC)

clean:
	rm -rf unrar/ unrar.tar.gz

