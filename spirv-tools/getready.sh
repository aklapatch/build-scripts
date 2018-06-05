git clone --depth=1 https://github.com/KhronosGroup/SPIRV-Tools

cd SPIRV-Tools

git clone --depth=1 https://github.com/KhronosGroup/SPIRV-Headers.git external/spirv-headers

mkdir build && cd build 

cmake -GNinja -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_BUILD_TYPE=Release ..
