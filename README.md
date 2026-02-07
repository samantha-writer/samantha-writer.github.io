# samantha-writer.github.io/blog

Jekyll로 만든 개인 블로그 / 포트폴리오입니다. 모든 콘텐츠의 저작권은 작가에게 귀속됩니다.

## 🚀 시작하기

### 필수 요구사항

- Ruby 3.0 이상
- Bundler
- (선택) Docker & Docker Compose

### 로컬 개발 환경 설정

#### 방법 1: Ruby 직접 설치

```bash
# Ruby 3.3 설치 (rbenv 사용)
rbenv install 3.3.0
rbenv local 3.3.0

# 의존성 설치
bundle install

# 개발 서버 실행
bundle exec jekyll serve --livereload

# 브라우저에서 http://localhost:4000 접속
```

#### 방법 2: Docker 사용 (추천)

```bash
# Docker Compose로 실행
docker-compose up

# 브라우저에서 http://localhost:4000 접속
```

## 📝 글 작성 방법

### 새 포스트 생성

`_posts` 폴더에 `YYYY-MM-DD-title.md` 형식으로 파일 생성:

```markdown
---
layout: post
title: 포스트 제목
date: 2024-01-01
author: samantha
categories: [ 카테고리 ]
tags: [ 태그1, 태그2 ]
image: assets/images/inpost/image.jpg
description: "포스트 설명 (SEO용)"
featured: true  # 메인에 노출
hidden: false
---

포스트 내용...
```

### 멀티미디어 콘텐츠

#### 유튜브 영상 삽입

```liquid
{% include youtube.html id="VIDEO_ID?start=1234" %}
```

#### 이미지 삽입

```markdown
![이미지 설명](assets/images/inpost/image.jpg)
```

## 🎨 커스터마이징

### 사이트 설정 변경

`_config.yml` 파일에서 사이트 제목, 설명, 저자 정보 등을 수정할 수 있습니다.

### 환경 변수 설정

민감한 정보는 `.env` 파일로 관리:

```bash
# .env.example을 복사
cp .env.example .env

# .env 파일 편집
# Google Analytics ID, Disqus 등 설정
```

## 📦 사용 중인 플러그인

- `jekyll-feed` - RSS 피드 생성
- `jekyll-sitemap` - 사이트맵 자동 생성
- `jekyll-paginate` - 페이지네이션
- `jekyll-seo-tag` - SEO 최적화
- `jekyll-archives` - 카테고리/태그 아카이브

## 🔧 유지보수

### 의존성 업데이트

```bash
bundle update
```

### 빌드 확인

```bash
bundle exec jekyll build
```

### 배포 전 테스트

```bash
JEKYLL_ENV=production bundle exec jekyll build
```

## 📁 디렉토리 구조

```
.
├── _config.yml          # 사이트 설정
├── _includes/           # 재사용 가능한 컴포넌트
├── _layouts/            # 페이지 레이아웃
├── _pages/              # 정적 페이지
├── _posts/              # 블로그 포스트
├── _sass/               # Sass 스타일시트
├── assets/              # 이미지, CSS, JS
│   ├── css/
│   ├── images/
│   └── js/
├── Gemfile              # Ruby 의존성
└── docker-compose.yml   # Docker 설정
```

## 📄 라이선스

모든 콘텐츠의 저작권은 작가에게 귀속됩니다.

## 📮 문의

- Email: samantha.writer89@gmail.com
- Instagram: [@samantha.writer](https://www.instagram.com/samantha.writer)
