```sh
# 개발 : Dockerfile.dev

# 개발을 위한 도커 빌드
# -t : 태그
# -f : Dockerfile 경로
docker build . -t docker-react -f Dockerfile.dev

# 개발을 위한 도커 실행
# -d : 백그라운드 실행
# -p {localPort:dockerPort}: localPort와 dockerPort를 연결
# -v /app/node_modules : 도커 내부의 /app/node_modules는 호스트의 /app/node_modules와 마운트하지 않음
# -v ${pwd}/react_app:/app : 현재 디렉토리를 도커의 /app으로 마운트
docker run -d -p 5173:5173 -v /app/node_modules -v ${pwd}/react_app:/app docker-react

# 개발을 위한 도커 빌드 및 실행
# 위의 복잡한 도커 빌드 및 실행 명령어를 docker-compose.yml에 정의하여 간단하게 실행
docker-compose up --build



# 배포 : Dockerfile

# 배포를 위한 도커 빌드
docker build . -t docker-react-dist

# 배포를 위한 도커 실행
# nginx는 기본으로 80포트를 사용
docker run -p 80:80 docker-react-dist
```
