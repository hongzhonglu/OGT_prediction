#!/bin/bash

#setting up in a fresh Ubuntu install. Tested on Ubuntu 18.04 LTS

#create and move into the External_tools directory
mkdir External_tools
cd External_tools

#install tRNAscan-SE 
echo "installing tRNAscan"
sudo apt-get -y update
sudo apt-get -y install gcc make perl automake
wget http://eddylab.org/infernal/infernal-1.1.2.tar.gz
tar -zxvf infernal-1.1.2.tar.gz
cd infernal-1.1.2
./configure
make
make check
sudo make install
cd ..

wget http://trna.ucsc.edu/software/trnascan-se-2.0.0.tar.gz
tar -zxvf trnascan-se-2.0.0.tar.gz
cd tRNAscan-SE-2.0
./configure
make
sudo make install
sudo chmod 755 /usr/local/lib/tRNAscan-SE/tRNAscanSE/
cd ..
echo "tRNAscan-SE tRNAscan-SE" > ../external_tools.txt

#installing bedtools
sudo apt-get -y install zlib1g-dev python hmmer
wget https://github.com/arq5x/bedtools2/releases/download/v2.27.1/bedtools-2.27.1.tar.gz
tar -zxvf bedtools-2.27.1.tar.gz
cd bedtools2
make
sudo cp ./bin/* /usr/local/bin/
cd ..
echo "bedtools bedtools" >> ../external_tools.txt

#install barrnap-0.9
echo "installing barrnap"
wget https://github.com/tseemann/barrnap/archive/0.9.tar.gz
tar -zxvf 0.9.tar.gz
echo "barrnap $PWD/barrnap-0.9/bin/barrnap" >> ../external_tools.txt

#install python
echo "installing python"
sudo apt-get -y install python3 python3-dev python3-pip build-essential python3-tk

#install python packages
echo "install python packages"
sudo pip3 install numpy scipy matplotlib biopython bcbio-gff tqdm sklearn matplotlib matplotlib-venn

#install GeneMarkS
#go to exon.gatech.edu/GeneMark/license_download.cgi
#download Genemark-S and the 64_bit key
echo "Don't forget:"
echo "1. download and install GeneMarkS to External_tools"
echo "2. edit the external_tools.txt file with the absolute path to gmsn.pl"
echo "genemark [absolute_path_to_gmsn.pl]" >> ../external_tools.txt
