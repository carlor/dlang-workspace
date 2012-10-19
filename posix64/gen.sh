
# dmd
cd ./dmd/src
make -f posix.mak MODEL=64 TARGET_CPU=X86
cd ../..

# druntime
cd ./druntime
make -f posix.mak MODEL=64
cd ..

# phobos
cd ./phobos
make -f posix.mak MODEL=64
cd ..

# create workspace
mv ./dmd/src/dmd ./wbd


