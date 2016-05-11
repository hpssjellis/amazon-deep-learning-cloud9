#!/bin/bash  

#  only need to run this script with the command (do not type the #)
#  bash setup.sh



# GCC Setup
sudo apt-get -y update
sudo apt-get install gcc
sudo apt-get install g++




#Cublas Setup
sudo apt-get install -y  libatlas-base-dev




#OpenMPI Setup
sudo apt-get -y install make
wget http://www.open-mpi.org/software/ompi/v1.8/downloads/openmpi-1.8.2.tar.gz
tar xvfz openmpi-1.8.2.tar.gz
cd openmpi-1.8.2
./configure --prefix=/usr/local/openmpi
make
sudo make install




#HDF5 Setup
wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4/hdf5-1.8.9.tar.gz
tar xvfz hdf5-1.8.9.tar.gz
cd hdf5-1.8.9
./configure --prefix=/usr/local
make
sudo make install






#Zlib Setup
wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4/zlib-1.2.8.tar.gz
tar xvf zlib-1.2.8.tar.gz
cd zlib-1.2.8
./configure
make
sudo make install


#Netcdf Setup
wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.1.3.tar.gz
tar xvf netcdf-4.1.3.tar.gz
cd netcdf-4.1.3
./configure --prefix=/usr/local
make
sudo make install


#Netcdfc++ Setup
wget http://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-cxx4-4.2.tar.gz
tar xvf netcdf-cxx4-4.2.tar.gz
cd netcdf-cxx4-4.2
./configure --prefix=/usr/local
make
sudo make install




#JsonCPP Setup

sudo apt-get -y install cmake
wget https://github.com/open-source-parsers/jsoncpp/archive/svn-import.tar.gz
tar xvfz svn-import.tar.gz
cd jsoncpp-svn-import
mkdir -p build/release
cd build/release
cmake -DCMAKE_BUILD_TYPE=release -DJSONCPP_LIB_BUILD_SHARED=OFF -G "Unix Makefiles" ../..
make
sudo make install


#CUB Setup

wget https://github.com/NVlabs/cub/archive/1.5.2.zip
sudo apt-get install -y  unzip
unzip 1.5.2.zip
sudo cp -rf cub-1.5.2/cub/ /usr/local/include/


#Download the code and build.

git clone https://github.com/amznlabs/amazon-dsstne.git
cd amazon-dsstne/src/amazon/dsstne
#Add the mpiCC and nvcc compiler in the path
export PATH=/usr/local/openmpi/bin:/usr/local/cuda/bin:$PATH
make



echo "Try the examples at "
echo "amazon-dsstne/docs/getting_started/examples.md"
echo "or"
echo "https://github.com/amznlabs/amazon-dsstne/blob/master/docs/getting_started/examples.md"
export PATH=`pwd`/bin:$PATH




