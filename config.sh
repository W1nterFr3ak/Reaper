pkg  update
pkg install python3
pkg install apksigner
pip3 install pyfiglet
git clone https://github.com/Lexiie/Termux-Apktool
cd Termux-Apktool
dpkg -i apktool_2.3.4_all.deb
cd ..
echo "alias reaper='python3 `pwd`/reaper.py'" >> ~/.bashrc

source ~/.bashrc
exit
