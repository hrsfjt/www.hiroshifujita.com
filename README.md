# www.hiroshifujita.com

Personal blog website for Hiroshi Fujita, built with Hugo and hosted on AWS.

## Overview

A Japanese-language blog documenting professional and personal development, technology, business strategy, and life reflections. Posts span from 2017 to 2023.

- **Site title**: HIROSHI FUJITA
- **Language**: Japanese (ja-jp)
- **Theme**: `simple-and-fast` (custom theme)
- **Social**: [Twitter](https://twitter.com/shiropiritamma) · [GitHub](https://github.com/hrsfjt) · Facebook

## Tech Stack

| Name | Description |
|---|---|
| [Hugo](https://gohugo.io/) | Static Site Generator |
| [Amazon CloudFront](https://aws.amazon.com/jp/cloudfront/) | CDN |
| [Amazon S3](https://aws.amazon.com/jp/s3/) | Hosting, Origin for CDN |
| [Route53](https://aws.amazon.com/jp/route53/) | DNS |
| [AWS Key Management Service](https://aws.amazon.com/jp/kms/) | Key Management for DNSSEC |
| [Google Domains](https://domains.google/intl/ja_jp/) | Domain Management |
| [Google Analytics](https://marketingplatform.google.com/intl/ja/about/analytics/) | Web Access Analysis |
| [WebP](https://developers.google.com/speed/webp?hl=ja) | Image optimization via `cwebp` |

## Repository Structure

```
.
├── config.toml              # Hugo site configuration (baseURL, theme, social links)
├── build.sh                 # Build script (minifies output, uses config.prod.toml)
├── upload.sh                # Deploy built site to S3
├── convert_webp.sh          # Batch convert JPG images to WebP
├── content/
│   ├── posts/               # Blog posts, organized as YYYY/MM/DD/index.md
│   ├── profile.md           # Static profile page
│   └── privacy.md           # Static privacy policy page
├── static/
│   ├── img/                 # Blog images and thumbnails
│   └── favicon/             # Favicon and app icon variants for all platforms
└── themes/
    └── simple-and-fast/     # Custom Hugo theme
        ├── assets/          # SCSS stylesheets
        └── layouts/         # HTML templates and partials
```

## Content

- **149** blog posts (2017–2023), structured as `content/posts/YYYY/MM/DD/index.md`
- **2** static pages: profile and privacy policy
- Categories: `blog`, `pages`
- Related posts use category (60%), keywords (20%), and date (10%) weighting

## Theme: simple-and-fast

The custom Hugo theme prioritizes simplicity and performance.

- **Layouts**: Article pages, list/archive pages, 404 error page, RSS feed
- **Partials**: `head`, `header`, `footer`, `pagination`, Open Graph and Twitter Card meta tags
- **Shortcodes**: `iframe` for embedding iframes in markdown

## Local Development

Requires [Hugo](https://gohugo.io/installation/) to be installed.

```bash
hugo server
```

The site will be available at `http://localhost:1313/`.

## Build

Requires a `config.prod.toml` file (not tracked in git) with production settings.

```bash
./build.sh
```

Cleans `public/` and `resources/`, then builds with minification enabled, including draft content (`-D`).

### Convert JPG images to WebP

```bash
./convert_webp.sh
```

## Deploy

```bash
BUCKET_NAME=xxxxxx ./upload.sh
```

**Warning**: First deletes all objects in the S3 bucket (`aws s3 rm ... --recursive`), then syncs the `public/` directory to the specified bucket. This is a destructive operation.
