---
title: "Springの@Transactionalについて"
date: "2019-02-11 20:20:12+09:00"
draft: false
series: "blog"
thumbnail: "/posts/20190211-959/20190211_01.jpg"
---
最近、Springを扱う時間が長くなってきまして、トランザクションをある程度管理しなければいけなくなったこともあり、@Transactionalについて調べてみました。

<a href="https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/transaction/annotation/Transactional.html">Transactional(Spring Framework)</a>
<h2>気をつけること</h2>
Javaの経験年数が少ない、Springに慣れていない私にとって、まずは仕様をしっかり理解することがスタートラインにたつことにもなる。と思っている。
<ul>
 	<li>RuntimeExceptionまたはRuntimeExceptionサブクラスをthrowする必要がある</li>
</ul>
<h3>RuntimeExceptionまたはRuntimeExceptionサブクラスをthrowする必要がある</h3>
アノテーションつけたらトランザクションが効きますよ〜って教えてもらった身としては、これができていないことが一番怖かった。

何が起きるかというと、トランザクションははられるわけですが、処理失敗したときに<strong>RuntimeException</strong>か<strong>RuntimeExceptionサブクラス</strong>をthrowしないとロールバックしてくれないんです。

仕様書みれば、確かに書いてある。
<strong>rolling back on RuntimeException and Error but not on checked exceptions</strong>
じつはロールバックできてなかった、なんてことになりかねないわけです。。。

Javaになれてる人であれば、普通じゃんって思うかもしれないですが、なれてない人は気をつけたいポイントではある。。。
<h2>まとめ</h2>
とにもかくにも、仕様書をしっかり読み込めよって話です。

さて、また読み込み作業。。。ローディング。。。