```
# 도커 빌드
docker build . -t benedictl/node_server

# 도커 실행
# -d : 백그라운드 실행
# -p {localPort:dockerPort}: localPort와 dockerPort를 연결
# -v /app/node_modules : 도커 내부의 /app/node_modules는 호스트의 /app/node_modules와 마운트하지 않음
# -v ${pwd}:/app : 현재 디렉토리를 도커의 /app으로 마운트
docker run -d -p 3000:3000 -v /app/node_modules -v ${pwd}:/app benedictl/node_server
```
