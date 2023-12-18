Commands:
- Docker build: `docker build -t aerial-manipulation .`
- Run: `docker run --name UAM -itd aerial-manipulation`
- Attach: `docker exec -it UAM zsh`
- With Display: `docker run --name UAM -itd -v /etc/localtime:/etc/localtime:ro -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -e GDK_SCALE -e GDK_DPI_SCALE aerial-manipulation-tactile /bin/zsh`