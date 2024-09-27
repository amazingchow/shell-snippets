
源码安装wrk
```shell
# Install lua-5.1.5
tar -zxvf lua-5.1.5.tar.gz
cd lua-5.1.5
make macosx
sudo make install
# Install luajit-2.1.0
tar -zxvf LuaJIT-2.1.0-beta3.tar.gz
cd LuaJIT-2.1.0-beta3
make
sudo make install
sudo ln -sf /usr/local/bin/luajit-2.1.0-beta3 /usr/local/bin/luajit
# Install luarocks
tar -zxvf luarocks-3.9.2.tar.gz
cd luarocks-3.9.2
./configure --with-lua-include=/usr/local/include
make
sudo make install
# Install wrk
tar -zxvf wrk-4.2.0.tar.gz
cd wrk-4.2.0
make WITH_LUAJIT=/usr/local/
sudo make install
```
