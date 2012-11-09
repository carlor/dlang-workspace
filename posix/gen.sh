
model=`getconf LONG_BIT`

# dmd
make_dmd () {
    cd ./dmd/src
    make -f posix.mak MODEL=$model TARGET_CPU=X86
    cd ../..
    cp ./dmd/src/dmd ./wbd;
}

make_druntime () {
    cd ./druntime
    make -f posix.mak MODEL=$model DMD=../wbd
    cd ..
}

make_phobos () {
    cd ./phobos
    make -f posix.mak MODEL=$model DMD=../wbd
    cd ..
    platform=`ls ./phobos/generated`
    cp ./phobos/generated/$platform/release/$model/libphobos2.a ./libphobos2.a
}

if [ $# = 0 ]
  then
    make_dmd && make_druntime && make_phobos
fi

if [ $# = 1 ]
  then
    if [ $1 = '--help' ]
      then
        echo "see README.md"
    fi
    test $1 == 'dmd' && make_dmd
    test $1 == 'phobos' && make_phobos
    test $1 == 'druntime' && make_druntime
fi

