# jenkins

custom jenkins based on official images


```
docker build -f Dockerfile-jenkins  -t owen2016/jenkins:1.0 . 

## DooD（Docker-outside-of-Docker）
docker run -d \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $(which docker):/usr/bin/docker \
  -p 8080:8080 \
  owen2016/jenkins

docker run -u root -itd --name  my-jenkins -p 8080:8080 -p 50000:50000 --restart=always \
   -v /var/jenkins_home:/var/jenkins_home \
   -v $(which docker):/usr/bin/docker \
   -v $(which git):/usr/bin/git \
   -v /etc/localtime:/etc/localtime \
   -v /etc/timezone:/etc/timezone \
   -v /var/run/docker.sock:/var/run/docker.sock  owen2016/jenkins:1.0

```
