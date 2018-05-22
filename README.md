* This is a streaming video server bundled up in a docker container.

To build the container:
```bash
docker build -t <container_name> <this_folder>
```

To use the container:
```bash
docker run --rm -v $PDW:/myvideo.mp4:/tmp/myvideo.mp4 -p 8554:8554 <container_name> -f /tmp/myvideo.mp4 -i rtsp://:8554/video
```
