//check device properties
#include <iostream>
using namespace std;

int main(void){
	cudaDeviceProp prop;
	
	int count;
	cudaGetDeviceCount(&count);
	for(int i=0; i<count; i++){
		cudaGetDeviceProperties(&prop, i);
		cout << " --- General Information for device " << i << " --- " << endl;
		cout << "Name: " << prop.name << endl;
		cout << "Compute capability: " << prop.major << "." << prop.minor << endl;
		cout << "Clock rate: " << prop.clockRate << endl;
		cout << "Device copy overlap: ";
		if (prop.deviceOverlap)
			cout << "Enabled" << endl;
		else
			cout << "Disabled" << endl;
		cout << "Kernel execition timeout: ";
		if (prop.kernelExecTimeoutEnabled)
			cout << "Enabled" << endl;
		else
			cout << "Disabled" << endl;
			
		cout << " --- Memory Information for device " << i << "---" << endl;
		cout << "Total global mem: " << prop.totalGlobalMem << endl;
		cout << "TOtal constant Mem: " << prop.totalConstMem << endl;
		cout << "Max mem pitch: " << prop.memPitch << endl;
		cout << "Texture Alignment: " << prop.textureAlignment << endl;
		cout << " --- MP Information for device " << i << " --- " << endl;
		cout << "Multiprocessor count: " << prop.multiProcessorCount << endl;
		cout << "Shared mem per mp: " << prop.sharedMemPerBlock << endl;
		cout << "Registers per mp: " << prop.regsPerBlock << endl;
		cout << "Threads in warp: " << prop.warpSize << endl;
		cout << "Max threads per block: " << prop.maxThreadsPerBlock << endl;
		cout << "Max thread dimensions: " << prop.maxThreadsDim[0] << " "\
										  << prop.maxThreadsDim[1] << " "\
										  << prop.maxThreadsDim[2] << " " << endl;
		cout << "Max grid dimensions: "   << prop.maxGridSize[0] << " "\
										  << prop.maxGridSize[1] << " "\
										  << prop.maxGridSize[2] << " " << endl;
		cout << endl;								  
	}
}
