# 기본 이미지 지정
FROM node:18-alpine as builder

# 사용자 지정 작업경로 지정
WORKDIR /app

# 설치에 필요한 파일들을 컨테이너에 복사
# npm i 전에 package.json만을 복사하는 이유는 캐싱을 통해 빌드 속도를 높이기 위함
# package.json이 변경되지 않으면 npm i를 실행하지 않음
COPY ./react_app/package.json .
RUN npm i

# 빌드에 필요한 소스코드를 컨테이너에 복사
COPY ./react_app .

# 빌드
RUN npm run build

# nginx 이미지 지정
FROM nginx

# nginx port 매핑
EXPOSE 80

# nginx 설정파일을 컨테이너에 복사
COPY --from=builder /app/dist /usr/share/nginx/html