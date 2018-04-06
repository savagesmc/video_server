* This is streaming video server bundled up in a docker container.

To build container:
```bash
docker build -t <container_name> <this_folder>
```

To use container:
```bash
docker run --rm -v $PDW:/myvideo.mp4:/tmp/myvideo.mp4 -p 8554:8554 -f /tmp/myvideo.mp4 -i rtsp://:8554/video
```
