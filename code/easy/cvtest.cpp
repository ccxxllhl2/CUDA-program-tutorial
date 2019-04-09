#include<opencv2/opencv.hpp>
#include<opencv2/core/core.hpp>        // 核心组件
#include<opencv2/highgui/highgui.hpp>  // GUI
#include<opencv2/imgproc/imgproc.hpp>  // 图像处理
using namespace cv;
using namespace std;

int main(void){
	Mat src = imread("time.jpeg"); 
	imshow("cvtest", src); 
	while(1){
		if(waitKey(30) == 27) break;
	}
	return 0;
}
