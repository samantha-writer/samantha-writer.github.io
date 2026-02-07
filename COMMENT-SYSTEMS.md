# 댓글 시스템 가이드

현재 블로그는 Disqus를 사용하고 있습니다. Disqus는 안정적이지만, 개인정보 보호와 성능 면에서 더 나은 대안들이 있습니다.

---

## 현재 상태: Disqus

**장점:**
- ✅ 설정이 간단
- ✅ 스팸 필터링 우수
- ✅ 소셜 로그인 지원

**단점:**
- ❌ 광고 표시 (무료 플랜)
- ❌ 페이지 로딩 속도 저하
- ❌ 사용자 추적 (개인정보 문제)
- ❌ 무거운 스크립트 (90KB+)

---

## 추천 대안

### 1. **utterances** (가장 추천) ⭐

GitHub Issues 기반의 경량 댓글 시스템

**장점:**
- ✅ 완전 무료, 오픈소스
- ✅ GitHub 계정으로 로그인
- ✅ Markdown 지원
- ✅ 매우 가벼움 (< 1KB)
- ✅ 개인정보 보호
- ✅ 다크모드 자동 지원

**단점:**
- ❌ GitHub 계정 필요
- ❌ 일반 사용자에게는 진입장벽

**설치 방법:**

```html
<!-- _layouts/post.html 또는 _includes/comments.html -->
<script src="https://utteranc.es/client.js"
        repo="samantha-writer/samantha-writer.github.io"
        issue-term="pathname"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script>
```

**설정:**
1. GitHub repo Settings > Features > Issues 활성화
2. https://github.com/apps/utterances 앱 설치
3. repo에 public 권한 부여

---

### 2. **giscus**

GitHub Discussions 기반 (utterances의 진화 버전)

**장점:**
- ✅ utterances의 모든 장점
- ✅ Discussions 사용 (Issues보다 적합)
- ✅ 반응 이모지 지원 (👍❤️😄)
- ✅ 대댓글 지원
- ✅ 더 나은 UI

**단점:**
- ❌ GitHub 계정 필요

**설치 방법:**

```html
<script src="https://giscus.app/client.js"
        data-repo="samantha-writer/samantha-writer.github.io"
        data-repo-id="YOUR_REPO_ID"
        data-category="Announcements"
        data-category-id="YOUR_CATEGORY_ID"
        data-mapping="pathname"
        data-strict="0"
        data-reactions-enabled="1"
        data-emit-metadata="0"
        data-input-position="bottom"
        data-theme="preferred_color_scheme"
        data-lang="ko"
        crossorigin="anonymous"
        async>
</script>
```

**설정:**
1. https://giscus.app/ko 방문
2. repo 입력하고 설정 생성
3. GitHub repo Settings > Features > Discussions 활성화

---

### 3. **Cusdis**

가볍고 개인정보 중심의 댓글 시스템

**장점:**
- ✅ 오픈소스, 자체 호스팅 가능
- ✅ 이메일 알림
- ✅ 익명 댓글 가능
- ✅ 관리자 승인 시스템
- ✅ GitHub 계정 불필요

**단점:**
- ❌ 자체 호스팅 필요 (또는 유료 클라우드)
- ❌ 설정이 복잡

---

### 4. **Staticman**

Jekyll에 직접 댓글 저장 (완전 정적)

**장점:**
- ✅ 완전히 정적 (빠름)
- ✅ 댓글이 Git repo에 저장
- ✅ 개인정보 문제 없음

**단점:**
- ❌ 설정이 매우 복잡
- ❌ 스팸 관리 어려움
- ❌ 실시간 업데이트 없음

---

### 5. **Disqus 유지 (현재 사용 중)**

그대로 사용해도 괜찮습니다.

**개선 방법:**
- Lazy loading 적용
- 광고 제거 (Pro 플랜, $12/월)

---

## 추천 선택 가이드

### 개발자/기술 블로그 → **giscus** 또는 **utterances**
- GitHub 사용자가 주 독자층
- 코드 스니펫 공유 빈번
- Markdown 지원 필요

### 일반 블로그 → **Cusdis** 또는 **Disqus 유지**
- 일반 독자층
- 간편한 댓글 작성 필요
- GitHub 계정 요구 부담

### 최고 성능 우선 → **utterances/giscus**
- 페이지 로드 속도 중요
- 개인정보 보호 중요

---

## 마이그레이션 가이드

### Disqus → utterances/giscus

1. **기존 댓글 백업**
   - Disqus Admin > Settings > Export
   - XML 파일 다운로드

2. **기존 댓글 삭제 (선택)**
   - 또는 그대로 유지

3. **새 시스템 설치**
   - 위 설치 방법 따라하기

4. **공지**
   - 독자들에게 댓글 시스템 변경 공지

**참고:** Disqus → GitHub 자동 마이그레이션 도구 없음

---

## 구현 예시

### `_includes/comments.html` 생성:

```liquid
{% if site.comments_system == "giscus" %}
  {% include comments-giscus.html %}
{% elsif site.comments_system == "utterances" %}
  {% include comments-utterances.html %}
{% elsif site.comments_system == "disqus" %}
  {% include disqus.html %}
{% endif %}
```

### `_config.yml` 설정:

```yaml
# Comments
comments_system: "giscus"  # giscus, utterances, disqus, none

# Giscus settings
giscus:
  repo: "samantha-writer/samantha-writer.github.io"
  repo_id: "YOUR_REPO_ID"
  category: "Announcements"
  category_id: "YOUR_CATEGORY_ID"
```

---

## 결론

**현재 추천:** 블로그가 기술/개발 콘텐츠가 많다면 **giscus**로 전환
- 무료
- 빠름
- 다크모드 지원
- Markdown 지원
- GitHub 독자층과 잘 맞음

**유지:** 일반 독자가 많다면 Disqus 그대로 유지도 괜찮습니다.
