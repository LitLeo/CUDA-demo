#include "Solution.h"


int main(int argc, char const *argv[])
{
	if (argc == 1){
		cout << "usage error!  << endl";
	}

	// wampup函数，预热GPU，原理见 http://blog.csdn.net/litdaguang/article/details/50520549
	warmup();

    Solution so;
	cudaEvent_t start, stop;
    float runTime = 0.0;
	cudaEventCreate(&start);
	cudaEventCreate(&stop);
	cudaEventRecord(start, 0);

	// ga1.groupingAggregation1GPU();

	cudaEventRecord(stop, 0);
	cudaEventSynchronize(stop);
	cudaEventElapsedTime(&runTime, start, stop);

    return 0;
}



