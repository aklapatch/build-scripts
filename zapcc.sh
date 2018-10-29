git clone --depth=1 https://github.com/yrnkrn/zapcc.git llvm
mkdir -p build
cd build
	cmake -G Ninja \
	 -DCMAKE_BUILD_TYPE=Release \
	 -DLLVM_ENABLE_WARNINGS=OFF \
	 -DCMAKE_INSTALL_PREFIX="/home/me/tools/zapcc"  \
	 -DLLVM_DEFAULT_TARGET_TRIPLE=$CARCH-pc-windows-gnu  \
	 ../llvm

	ninja	
