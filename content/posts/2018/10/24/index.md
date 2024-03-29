---
title: "API仕様書をつくる"
date: "2018-10-24 06:00:49+09:00"
draft: false
categories: "blog"
---
仕事柄、設計書やら仕様書などもつくることが増えてきました。  

最近、ご執心なのはAPI仕様書。  

エクセルやらオフィスでつくることもあったのですが、お客様用だからといって、強制的にそうするべきというわけではありません。  

ここ数年、Wikiを使ってお客様に連携することもしばしば。  

そこで活躍するのがMarkdown記法。  

テキストファイルのようにかけて、ビュワーを通せばいい感じに表示してくれる。  

## API仕様書かくなら

アプリと一緒に仕事するならSwaggerが候補となるでしょう。  

事実、最近のわたしはSwaggerばかり。  

記述ルールはyaml形式でかける[SwaggerSpec](https://swagger.io/specification/)。

何が便利かって、yaml形式で記述できるし、HTMLやMarkdownに変換してくれるツールもたくさんあるのでWikiへの展開がしやすい。  

なによりgit管理できる！  

オフィスソフト使うと、バイナリファイルなのでどうしても差分がみれない。  

Swaggerでかけば、yamlでサクッとかけるし、差分管理できるし、HTMLやMarkdownに変換できて、便利です。  

さらに、アプリ用のソースコードにも変換できるので、アプリ側の実装が楽になる。  

まぁ、自動生成のコード使って良いアプリつくれるのかって言われればそれまでですが。  

そこは自動生成コードからうまくリファクタリングしてよって感じです。  

## よくつかうツール

私が使うツールはこちら。  

Swagger Editor  

https://editor.swagger.io

Swaggerファイルの編集するならこれかな。  
見やすいビュー付きですしね。  

widdershins  

https://github.com/Mermade/widdershins

yaml -> Markdown への変換ツール。  
Swagger v3.0.0 で描くときはこちらですね。  
意外と対応しているツールは少ない。  

swagger2markup  

https://github.com/Swagger2Markup/swagger2markup

yaml -> markdown への変換ツール。  

Swagger v2.0 ならこちらかな。  

Dockerイメージもあったりして、使いやすい。  

こういう感じで、ドキュメントをテキストベースなファイルで管理すると、コスト削減にもなるし、精神的安定も得られる。  

こういうのは積極的に使っていきたい。  