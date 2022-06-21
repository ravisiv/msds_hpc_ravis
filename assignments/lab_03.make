build: install
	#spack concretize
	#spack install 
	echo "Building"
	

concretize: init
	spack concretize

install: concretize
	spack install

init:
	echo "Init..."
	export CMAKE_PREFIX_PATH=${CONDA_PREFIX:-"$(dirname $(which conda))/../"}
