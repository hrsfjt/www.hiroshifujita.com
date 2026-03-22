# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal blog/portfolio website for Hiroshi Fujita built with **Hugo** (static site generator), hosted on AWS S3 + CloudFront. Content is primarily in Japanese.

## Common Commands

### Local Development
```bash
hugo server        # Start local dev server at http://localhost:1313/
hugo server -D     # Include draft posts
```

### Build for Production
```bash
./build.sh
```
Clears `/public` and `/resources`, then builds with `config.prod.toml` and minification.

### Image Optimization
```bash
./convert_webp.sh
```
Converts all JPGs in `static/img/` to WebP using `cwebp`. Run after adding new images.

### Deploy to S3
```bash
BACKET_NAME=<bucket-name> ./upload.sh
```
Syncs `/public` to the specified S3 bucket. Requires AWS CLI configured.

## Architecture

### Key Directories
- `content/posts/` — Blog posts as Markdown, organized by `YYYY/MM/DD/`
- `themes/simple-and-fast/` — Custom Hugo theme (layouts, SCSS, partials)
- `static/img/` — Images (both `.jpg` and `.webp` versions)
- `config.toml` — Local dev configuration
- `config.prod.toml` — Production config (gitignored, contains baseURL and analytics keys)

### Theme Structure (`themes/simple-and-fast/`)
- `layouts/` — Hugo Go templates (base layout, list, single post, 404, RSS)
- `layouts/partials/` — Reusable partials: head, header, footer, pagination, OG tags, Twitter cards
- `layouts/shortcodes/` — Custom shortcode: `iframe`
- `assets/sass/` — SCSS stylesheets compiled via Hugo's asset pipeline (minified + fingerprinted)

### Content Front Matter
```yaml
---
title: "Article Title"
date: "2023-02-13 00:00:00+09:00"
draft: false
categories: "blog"
thumbnail: "/img/example.jpg"
webp: "/img/example.webp"
---
```

The theme renders images using `<picture>` elements with WebP + JPEG fallback, so both `thumbnail` and `webp` fields should be set when adding posts with images.

### Hugo Config Notes
- `uglyurls: true` — URLs end in `/index.html` (e.g., `/post/index.html`)
- `paginate: 5` — 5 posts per page
- `hasCJKLanguage: true` — Enables correct word count for Japanese text
- Related posts use category (weight 60), keywords (weight 20), and date (weight 10)
