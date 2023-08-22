#include <iostream>
#include <opencv2/opencv.hpp>

int main(int argc, char* argv[]) {
    // Open camera 0 with OpenCV
    cv::VideoCapture cap(0);
    if (!cap.isOpened()) {
        std::cerr << "Failed to open camera." << std::endl;
        return 1;
    }

    // OpenCV camera capturing
    cv::Mat frame;
    while (true) {
        cap >> frame;
        if (frame.empty())
            break;

        // Display the captured frame
        cv::imshow("Camera Stream", frame);

        // Exit loop if ESC key is pressed
        if (cv::waitKey(1) == 27)
            break;
    }

    return 0;
}
