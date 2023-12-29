Commands:
- Docker build: `docker build -t aerial-manipulation .`
- Run: `docker run -itd -p 6080:80 --shm-size=512m --name UAM aerial-manipulation`
- Attach: `docker exec -it -u ubuntu UAM zsh`
- Save current docker as image: `docker commit UAM aerial-manipulation`