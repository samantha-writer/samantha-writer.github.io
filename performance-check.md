# 블로그 성능 체크리스트

## 자동 최적화 완료 항목

✅ **Lazy Loading** - 이미지 지연 로딩 활성화
✅ **DNS Prefetch** - 외부 리소스 사전 연결
✅ **Preload** - 중요 CSS/JS 우선 로드
✅ **Dark Mode** - 시스템 설정 감지 및 토글
✅ **SEO 메타 태그** - Open Graph, Twitter Cards
✅ **Sass 최적화** - @use로 마이그레이션

## 수동 최적화 가능 항목

### 이미지 최적화
현재 96개의 이미지가 `assets/images/`에 있습니다.

**권장 작업:**
```bash
# WebP 변환 (품질 80%)
cd ~/문서/github/assets/images
for img in *.jpg *.png; do
  cwebp -q 80 "$img" -o "${img%.*}.webp"
done
```

**또는 온라인 도구 사용:**
- https://squoosh.app/ (Google)
- https://tinypng.com/
- https://imageoptim.com/mac (Mac 앱)

### 성능 측정 도구

1. **Lighthouse (Chrome DevTools)**
   - Chrome에서 F12 → Lighthouse 탭
   - Performance, SEO, Accessibility 체크

2. **PageSpeed Insights**
   - https://pagespeed.web.dev/
   - URL 입력: https://samantha-writer.github.io

3. **GTmetrix**
   - https://gtmetrix.com/

## 목표 점수

- Performance: 90+
- Accessibility: 95+
- Best Practices: 95+
- SEO: 100

## 추가 최적화 팁

### CSS 최소화
```yaml
# _config.yml에 추가
sass:
  style: compressed
```

### 이미지 CDN 사용 (선택)
- Cloudflare Images
- imgix
- Cloudinary

### 서비스 워커 추가 (PWA)
오프라인 지원 및 캐싱 전략
