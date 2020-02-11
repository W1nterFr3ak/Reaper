pkg  update
pkg install apksigner

git clone https://github.com/Lexiie/Termux-Apktool
cd Termux-Apktool
dpkg -i apktool_2.3.4_all.deb
cd ..
echo "alias reaper='python `pwd`/reaper.py'" >> ~/.bashrc

source ~/.bashrc
exit
