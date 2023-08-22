# CameraStreamer

This project demonstrates how to stream camera input using OpenCV within a Docker container. The captured video can be accessed using a VNC client to view the streamed content.

## Requirements

- Docker - https://docs.docker.com/engine/install/
- VNC Client e.g.:
  - Linux: remmina
  - MacOs: Remote Desktop


### Building the Application

1. Clone the repository:
    ```sh
    git clone https://github.com/thbonotto/CameraStreamer
    cd CameraStreamer
    ```
2. Build the Docker image:
    ```sh
    docker build -t camera_streamer .
    ```
### Running the Application

1. Run the Docker application:
    ```sh
    docker run --rm -it --device=/dev/video0 --net=host camera_streamer
    ```
2. Connect to the VNC Server running inside the container using a VNC client:

- On Linux, you can use Remmina:
  ```
  remmina -c vnc://localhost:5900
  ```

- On Mac click on the "Go" menu and choose connect to server.
- MacOS has a VNC Viewer already built into it. For the Server Address, type vnc://localhost:5900
- You should be connected and able to see a window with your webcam


Steps for Mac taken from here: https://cat.pdx.edu/platforms/mac/remote-access/vnc-to-linux/

## Additional Notes

- The `--device=/dev/video0` option is used to pass the camera device into the container.
- The `--net=host` option allows the container to share the host's network stack.
- The VNC server runs on port `5900` inside the container.

## License

This project is licensed under the GNU General Public License version 2.0 (GPL-2.0). See the [LICENSE](LICENSE) file for details.
