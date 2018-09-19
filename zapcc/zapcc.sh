git clone https://github.com/yrnkrn/zapcc.git llvm
mkdir -p build
cd build
	cmake -G Ninja \
	 -DCMAKE_BUILD_TYPE=Release \
	 -DLLVM_ENABLE_WARNINGS=OFF \
	 -DCMAKE_INSTALL_PREFIX="$pkgdir"  \
	 -DLLVM_DEFAULT_TARGET_TRIPLE=$CARCH-pc-windows-gnu  \
	 ../llvm

	ninja
	
	ninja check-all
	
	