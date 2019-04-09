#include <iostream>
using namespace std;

#define N 10

__global__ void add(int *a, int *b, int *c){
	int tid = blockIdx.x;
	if(tid < N)
		c[tid] = a[tid] + b[tid];
}

int main(void){
	int a[N], b[N], c[N];
	int *dev_a, *dev_b, *dev_c;
	
	//allocate memory on GPU
	cudaMalloc((void**)&dev_a, N*sizeof(int));
	cudaMalloc((void**)&dev_b, N*sizeof(int));
	cudaMalloc((void**)&dev_c, N*sizeof(int));
	
	//set value for vars
	for(int i=0; i<N; i++){
		a[i] = -i;
		b[i] = i*i;
	}
	
	//copy arrays to GPU
	cudaMemcpy(dev_a, a, N*sizeof(int), cudaMemcpyHostToDevice);
	cudaMemcpy(dev_b, b, N*sizeof(int), cudaMemcpyHostToDevice);
	//N threads on GPU
	add<<<N,1>>>(dev_a, dev_b, dev_c);
	
	//copy array c from GPU to CPU
	cudaMemcpy(c, dev_c, N*sizeof(int), cudaMemcpyDeviceToHost);
	
	//show result
	for(int i=0; i<N; i++){
		cout << a[i] << "+" << b[i] << "=" << c[i] << endl;
	}
	
	//free memory on GPU
	cudaFree(dev_a);
	cudaFree(dev_b);
	cudaFree(dev_c);
	
	return 0;
}
