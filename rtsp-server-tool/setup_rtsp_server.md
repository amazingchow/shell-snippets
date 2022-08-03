## Use gst-rtsp-server
### 1. merge some pieces of short videos into a long video

```shell
ffmpeg -f concat -i video_list.txt -c copy output/Friends-Season01-01_10.mp4
```

video_list.txt
```text
file input/Friends/Friends-Season01-01.mp4
file input/Friends/Friends-Season01-02.mp4
file input/Friends/Friends-Season01-03.mp4
file input/Friends/Friends-Season01-04.mp4
file input/Friends/Friends-Season01-05.mp4
file input/Friends/Friends-Season01-06.mp4
file input/Friends/Friends-Season01-07.mp4
file input/Friends/Friends-Season01-08.mp4
file input/Friends/Friends-Season01-09.mp4
file input/Friends/Friends-Season01-10.mp4
```

### 2. install gstreamer on ubuntu

```shell
sudo apt-get install libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio -y
```

### 3. install gst-rtsp-server

```shell
sudo apt-get install git build-essential autoconf automake autopoint libtool pkg-config -y
sudo apt-get install gtk-doc-tools libglib2.0-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev -y
sudo apt-get install checkinstall -y

git clone https://github.com/GStreamer/gst-rtsp-server.git
cd gst-rtsp-server
git checkout 1.13.91 && git switch -c 1.13.91
./autogen.sh && ./configure && make && sudo make install
```

## Use live555

### 1. convert mp4 format to h264 format

```shell
ffmpeg -i Friends-Season01-01_10.mp4 -an -vcodec libx264 -crf 23 Friends-Season01-01_10.h264
```

### 2. install live555

```shell
sudo apt-get install git build-essential autoconf automake autopoint libtool pkg-config -y

git https://github.com/rgaufman/live555.git
cd live555
# change DynamicRTSPServer.cpp, add h264 format support
./genMakefiles linux-64bit && make -j4
```
