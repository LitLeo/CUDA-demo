#include "Solution.h"

// 每个线程处理 stride 个数据
static __global__ void GA1Ker()
{
    // 计算线程ID
    uint thread_index = blockIdx.x * blockDim.x + threadIdx.x;

 //    // 根据线程ID获得数据索引
 //    uint data_index = thread_index * stride;

	// // 越界判断
 //    if (data_index >= data_size)
 //        return; 
}

void Solution::training()
{
    cudaEvent_t start, stop;
    float runTime = 0.0;
    float minRunTime = 1000.0f;
    dim3 _blocksize;
    _blocksize.x = this->blocksize.x; // = 32
    
    // block 大小从32-1024，以32为stride，得到最优block 大小
    for(_blocksize.y = 1; _blocksize.y <= 32; ++_blocksize.y) {
        cudaEventCreate(&start);
        cudaEventCreate(&stop);
        cudaEventRecord(start, 0);

        // ga1.groupingAggregation1GPU();

        cudaEventRecord(stop, 0);
        cudaEventSynchronize(stop);
        cudaEventElapsedTime(&runTime, start, stop);
        if(runTime < minRunTime) {
            minRunTime = runTime;
            this->blocksize.y = _blocksize.y;
        }
    }
}

int Solution::solution()
{

    // 申请 device 端空间，并拷贝数据
    // checkCudaErrors(cudaMalloc(&d_data, insize));
    // checkCudaErrors(cudaMemcpy(d_data, h_data, insize, cudaMemcpyHostToDevice));
    // checkCudaErrors(cudaMalloc(&d_out_data, outsize));
    // checkCudaErrors(cudaMemset(d_out_data, 0, outsize));

    

    // getLastCudaError("GA2_1Ker() execution failed");
    return 0;
}