#!/usr/bin/env bash

source ../../../../target/classes/project.txt

VERSION=${VERSION%"-SNAPSHOT"}

echo "1 VERSIONINFO" > version.rc
echo "FILEVERSION $VERSION,$BUILD_NUMBER" | tr . , >> version.rc
echo "PRODUCTVERSION $VERSION,0" | tr . , >> version.rc
echo "FILEFLAGSMASK 0x17L" >> version.rc
echo "FILEFLAGS 0x0L" >> version.rc
echo "FILEOS 0x4L" >> version.rc
echo "FILETYPE 0x1L" >> version.rc
echo "FILESUBTYPE 0x0L" >> version.rc
echo "BEGIN" >> version.rc
echo "    BLOCK \"StringFileInfo\"" >> version.rc
echo "    BEGIN" >> version.rc
echo "        BLOCK \"040904b0\"" >> version.rc
echo "        BEGIN" >> version.rc
echo "            VALUE \"FileDescription\", \"Yildiz-Engine Audio engine with OpenAL implementation\"" >> version.rc
echo "            VALUE \"FileVersion\", \"$VERSION,$BUILD_NUMBER\"" | tr . , >> version.rc
echo "            VALUE \"InternalName\", \"libyildizopenal.dll\"" >> version.rc
echo "            VALUE \"LegalCopyright\", \"Copyright (c) 2019 Gregory Van den Borre\"" >> version.rc
echo "            VALUE \"OriginalFilename\", \"libyildizopenal.dll\"" >> version.rc
echo "            VALUE \"CompanyName\", \"Yildiz-Games\"" >> version.rc
echo "            VALUE \"ProductName\", \"Yildiz-Engine Audio OpenAL module\"" >> version.rc
echo "            VALUE \"ProductVersion\", \"$VERSION,0\"" | tr . , >> version.rc
echo "        END" >> version.rc
echo "    END" >> version.rc
echo "    BLOCK \"VarFileInfo\"" >> version.rc
echo "    BEGIN" >> version.rc
echo "        VALUE \"Translation\", 0x409, 1200" >> version.rc
echo "    END" >> version.rc
echo "END" >> version.rc

cmake . \
-DCMAKE_MODULE_PATH=. \
-DCMAKE_BUILD_TYPE=Release \
-DLIBSNDFILE_INCLUDE_DIR="libsndfile/win64/include/" \
-DLIBSNDFILE_LIBRARY="libsndfile/win64/lib/libsndfile.dll" \
-DOPENAL_INCLUDE_DIR="openal/win64/include/AL" \
-DOPENAL_LIBRARY="openal/win64/lib/libopenal.dll" \
-DPHYSFS_INCLUDE_DIR="physicsfs/win64/include" \
-DPHYSFS_LIBRARY="physicsfs/win64/libyildizphysfs.dll" \
-DLIBRARY_OUTPUT_PATH="../../../../target/classes/win64" \
-DCMAKE_TOOLCHAIN_FILE=mingw-toolchain.cmake

make
r1=$?

cp openal/win64/bin/OpenAL32.dll ../../../../target/classes/win64/OpenAL32.dll
cp libsndfile/win64/bin/libsndfile-1.dll ../../../../target/classes/win64/libsndfile-1.dll
cp libsndfile/win64/bin/libFLAC-8.dll ../../../../target/classes/win64/libFLAC-8.dll
cp libstdc++-6.dll ../../../../target/classes/win64/libstdc++-6.dll
cp libgcc_s_seh-1.dll ../../../../target/classes/win64/libgcc_s_seh-1.dll

exit $r1
