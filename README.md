# workbench-cloud
> 업무 작업 도구나 블로그 등 여러 데이터를 클라우드로 관리하기 위함

## 환경구축
1. docker 프로그램을 설치해야 합니다. 
2. `.env` 와 `.env.prod` 의 환경변수를 기입해 주세요.
3. `실행하기` 명령어를 실행해 주세요.

## 실행하기
```
# 로컬 또는 개발
docker-compose up -d --build

# 상용
docker-compose --env-file .env.prod up -d --build
```