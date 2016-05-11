#!/bin/bash  

#  only need to run this script with the command (do not type the #)
#  bash setup.sh



# GCC Setup
sudo apt-get -y update
sudo apt-get install gcc
sudo apt-get install g++




#Cublas Setup
sudo apt-get install -y  libatlas-base-dev

cd /home/ubuntu/workspace


#OpenMPI Setup
sudo apt-get -y install make
wget http://www.open-mpi.org/software/ompi/v1.8/downloads/openmpi-1.8.2.tar.gz
tar xvfz openmpi-1.8.2.tar.gz
cd openmpi-1.8.2
./configure --prefix=/home/ubuntu/workspace/openmpi
make
sudo make install

printf "\n\nPATH=\$PATH:\$/home/ubuntu/workspace/openmpi"  >> ~/.profile






#HDF5 Setup
wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4/hdf5-1.8.9.tar.gz
tar xvfz hdf5-1.8.9.tar.gz
cd hdf5-1.8.9
./configure --prefix=/home/ubuntu/workspace/hdf5
make
sudo make install

printf "\nPATH=\$PATH:\$/home/ubuntu/workspace/hdf5"  >> ~/.profile




#Zlib Setup
wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4/zlib-1.2.8.tar.gz
tar xvf zlib-1.2.8.tar.gz
cd zlib-1.2.8
./configure --prefix=/home/ubuntu/workspace/zlib
make
sudo make install


printf "\nPATH=\$PATH:\$/home/ubuntu/workspace/zlib"  >> ~/.profile





#Netcdf Setup
wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.1.3.tar.gz
tar xvf netcdf-4.1.3.tar.gz
cd netcdf-4.1.3
./configure --prefix=/home/ubuntu/workspace/netcdf
make
sudo make install

printf "\nPATH=\$PATH:\$/home/ubuntu/workspace/netcdf"  >> ~/.profile





#Netcdfc++ Setup
wget http://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-cxx4-4.2.tar.gz
tar xvf netcdf-cxx4-4.2.tar.gz
cd netcdf-cxx4-4.2
./configure --prefix=/home/ubuntu/workspace/netcdfcpp
make
sudo make install

printf "\nPATH=\$PATH:\$/home/ubuntu/workspace/netcdfcpp"  >> ~/.profile


#JsonCPP Setup
cd /home/ubuntu/workspace

sudo apt-get -y install cmake
wget https://github.com/open-source-parsers/jsoncpp/archive/svn-import.tar.gz
tar xvfz svn-import.tar.gz
cd jsoncpp-svn-import
mkdir -p build/release
cd build/release
cmake -DCMAKE_BUILD_TYPE=release -DJSONCPP_LIB_BUILD_SHARED=OFF -G "Unix Makefiles" ../..
make
sudo make install


printf "\nPATH=\$PATH:\$/home/ubuntu/workspace/jsoncpp-svn-import"  >> ~/.profile



#CUB Setup
cd /home/ubuntu/workspace

wget https://github.com/NVlabs/cub/archive/1.5.2.zip
sudo apt-get install -y  unzip
unzip 1.5.2.zip
sudo cp -rf cub-1.5.2/cub/ /home/ubuntu/workspace/include/


printf "\nPATH=\$PATH:\$/home/ubuntu/workspace/include"  >> ~/.profile



#Download the code and build.
cd /home/ubuntu/workspace

git clone https://github.com/amznlabs/amazon-dsstne.git
cd amazon-dsstne/src/amazon/dsstne
#Add the mpiCC and nvcc compiler in the path
export PATH=/home/ubuntu/workspace/openmpi/bin:/home/ubuntu/workspace/cuda/bin:$PATH
make

printf "\nPATH=\$PATH:\$/home/ubuntu/workspace/amazon-dsstne/src/amazon/dsstne"  >> ~/.profile
printf "\nPATH=\$PATH:\$/home/ubuntu/workspace/openmpi/bin"  >> ~/.profile
printf "\nPATH=\$PATH:\$/home/ubuntu/workspace/cuda/bin"  >> ~/.profile



echo "Try the examples at "
echo "amazon-dsstne/docs/getting_started/examples.md"
echo "or"
echo "https://github.com/amznlabs/amazon-dsstne/blob/master/docs/getting_started/examples.md"



# what is this line doing
#export PATH=`pwd`/bin:$PATH


#example how to setup a profile for new terminals
#printf "\nPATH=\$PATH:\$GRADLE_USER_HOME/bin"  >> ~/.profile







echo "All done setup "
echo "-------------------------------------------"


cd /home/ubuntu/workspace
# some examples
#wget https://s3-us-west-2.amazonaws.com/amazon-dsstne-samples/data/ml20m-all
#generateNetCDF -d gl_input -i ml20m-all -o gl_input.nc -f features_input -s samples_input -c
#generateNetCDF -d gl_output -i ml20m-all -o gl_output.nc -f features_output -s samples_input -c

#test.c

#train -c config.json -i gl_input.nc -o gl_output.nc -n gl.nc -b 256 -e 10


