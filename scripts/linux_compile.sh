echo "Installing Zlib 1.2.11...";
wget https://www.zlib.net/zlib-1.2.11.tar.gz;
tar -xf zlib-1.2.11.tar.gz;
cd zlib-1.2.11;
./configure --prefix=/usr/local/zlib >/dev/null 2>&1;
make -j$(nproc) >/dev/null 2>&1;
sudo make install >/dev/null 2>&1;
cd ..;
echo "Installing Pcre 8.43...";
wget https://ftp.pcre.org/pub/pcre/pcre-8.43.tar.gz;
tar -xf pcre-8.43.tar.gz;
cd pcre-8.43;
./configure --prefix=/usr/local/pcre >/dev/null 2>&1;
make -j$(nproc) >/dev/null 2>&1;
sudo make install >/dev/null 2>&1;
cd ..;
echo "Installing ZBar 0.10...";
wget -O zbar-0.10.tar.gz https://sourceforge.net/projects/zbar/files/zbar/0.10/zbar-0.10.tar.gz/download;
tar -xf zbar-0.10.tar.gz;
cd zbar-0.10;
export CFLAGS="";
./configure --prefix=/usr/local/zbar --disable-video --without-qt --without-gtk --without-python >/dev/null 2>&1;
make -j$(nproc) >/dev/null 2>&1;
sudo make install >/dev/null 2>&1;
cd ..;
echo "Installing libqrencode...";
git clone https://github.com/fukuchi/libqrencode.git;
cd libqrencode;
./autogen.sh >/dev/null 2>&1;
./configure --prefix=/usr/local/qrencode >/dev/null 2>&1;
make -j$(nproc) >/dev/null 2>&1;
sudo make install >/dev/null 2>&1;
cd ..;
echo "Installing openssl 1.1.1f...";
wget https://www.openssl.org/source/openssl-1.1.1f.tar.gz;
tar -xf openssl-1.1.1f.tar.gz;
cd openssl-1.1.1f;
./config --prefix=/usr/local/openssl --openssldir=/usr/local/openssl shared zlib >/dev/null 2>&1;
make -j$(nproc) >/dev/null 2>&1;
sudo make install >/dev/null 2>&1;
cd ..;
echo "Installing boost 1_72_0...";
wget -O boost_1_72_0.tar.gz https://sourceforge.net/projects/boost/files/boost/1.72.0/boost_1_72_0.tar.gz/download >/dev/null 2>&1;
tar -xf boost_1_72_0.tar.gz;
cd boost_1_72_0/;
./bootstrap.sh --prefix=/usr/local/boost >/dev/null 2>&1;
./b2 -j$(nproc);
sudo ./b2 install >/dev/null 2>&1;
cd ..;