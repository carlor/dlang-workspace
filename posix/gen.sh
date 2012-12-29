#! /bin/sh

model=`getconf LONG_BIT`

scriptPath=`dirname $0`
homePath=$scriptPath/..
dmdPath=$homePath/dmd
druntimePath=$homePath/druntime
phobosPath=$homePath/phobos

make_dmd() {
    ( cd $dmdPath/src &&
        make -f posix.mak MODEL=$model TARGET_CPU=X86 )
    cp $dmdPath/src/dmd $homePath/wbd
}

clean_dmd() {
    ( cd $dmdPath/src &&
        make -f posix.mak MODEL=$model TARGET_CPU=X86 clean )
}

make_druntime() {
    ( cd $druntimePath &&
        make -f posix.mak MODEL=$model DMD=$homePath/wbd )
}

clean_druntime() {
    ( cd $druntimePath &&
        make -f posix.mak MODEL=$model clean )
}

make_phobos() {
    ( cd $phobosPath &&
        make -f posix.mak MODEL=$model DMD=$homePath/wbd )
    platform=`ls $phobosPath/generated`
    cp $phobosPath/generated/$platform/release/$model/libphobos2.a $homePath/libphobos2.a
}

clean_phobos() {
    ( cd $phobosPath &&
        make -f posix.mak MODEL=$model clean )
}

if [ $# = 0 ]; then
    make_dmd && make_druntime && make_phobos
else
    if [ $1 = clean ]; then
        if [ $# = 1 ]; then
            clean_dmd && clean_druntime && clean_phobos
            exit 0
        fi
        case $2 in
            dmd)
                clean_dmd
                ;;
            phobos)
                clean_phobos
                ;;
            druntime)
                clean_druntime
                ;;
            *)
                echo "Unknown component."
                exit 1
        esac
    elif [ $1 = help ]; then
        echo "see README.md"
    else
        case $1 in
            dmd)
                make_dmd
                ;;
            phobos)
                make_phobos
                ;;
            druntime)
                make_druntime
                ;;
            *)
                echo "Unknown component."
                exit 1
        esac

    fi
fi
