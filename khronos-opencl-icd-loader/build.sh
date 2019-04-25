sed -i.bak  "s|/etc/OpenCL/vendors/|$PREFIX/etc/OpenCL/vendors/|g" icd_linux.c;

mkdir build
cd build

cmake -GNinja \
    -DCMAKE_AR=$BUILD_PREFIX/bin/x86_64-conda_cos6-linux-gnu-ar \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_BUILD_TYPE=Release ..
cmake --build . --target install --config Release

if [[ "$(uname)" == "Darwin" ]]; then
    ln -s $PREFIX/include/CL $PREFIX/include/OpenCL
fi
