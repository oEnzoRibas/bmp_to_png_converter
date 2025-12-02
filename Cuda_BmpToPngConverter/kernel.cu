#include <iostream>
#include <cuda_runtime.h>

int main() {
    int deviceCount;
    cudaError_t err = cudaGetDeviceCount(&deviceCount);
    if (err != cudaSuccess) {
        std::cerr << "Erro CUDA: " << cudaGetErrorString(err) << std::endl;
        return 1;
    }
    std::cout << "GPUs detectadas: " << deviceCount << std::endl;
    for (int i = 0; i < deviceCount; i++) {
        cudaDeviceProp prop;
        cudaGetDeviceProperties(&prop, i);
        std::cout << "GPU " << i << ": " << prop.name << std::endl;
    }
    return 0;
}
