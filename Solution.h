#include "Common.h"

#ifndef SOLUTION_H_
#define SOLUTION_H_

class Solution
{
public:
    Solution() 
    {
        // 默认 block 大小
        this->blocksize.x = 32;
        this->blocksize.y = 4;
    }
    ~Solution() {}
    int solution();
    
private:
    dim3 blocksize;
    // 找出最优参数配置，比如 block 大小
    void training();
};

#endif // SOLUTION_H_

