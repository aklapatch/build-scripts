git clone --depth=1 -b khronos/spirv-3.6.1 https://github.com/KhronosGroup/SPIRV-LLVM.git llvm

cd llvm/tools

git clone --depth=1 -b spirv-1.1 https://github.com/KhronosGroup/SPIR clang

cd ..

mkdir build && cd build

cmake -GNinja -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/home/me/binstall ..
