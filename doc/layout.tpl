<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"/>
  <title>vdm-轻量级指令模板解决方案</title>
  <link rel="stylesheet" type="text/css" href="../lib/semantic.min.css">
  <link rel="stylesheet" type="text/css" href="../lib/lib.css">
  <link rel="stylesheet" type="text/css" href="../lib/channel.css">
  <script src="../lib/highlight.js"></script>
  <script src="../lib/jquery.js"></script>
  <script src="../lib/scrolltofix.js"></script>
  <script src="../lib/semantic.min.js"></script>

  <script>hljs.initHighlightingOnLoad()</script>
  <script type="text/javascript">
  $(function() {


    $('.quick-menu .lists').each(function(){
      var path = $(this).children('a').attr('href').slice(2)

      if (path && location.pathname.indexOf(path) != -1) {
        $(this).addClass('current')
      }
    })


    $('#J_article_nav').scrollToFixed()


    var linkNav = [];
    linkNav.push('<div id="link"><span class="title">目录</span><ul>');
    var isMarkDownArticle = false;
    $("#J_content").find('h2,h3').each(function(){
        isMarkDownArticle = true;
        var text = $(this).html().replace(/<a\s+.*>.*<\/a>/,"");
        var child = $(this)[0].tagName.toLowerCase() == 'h3' ? 'child' : ''
        linkNav.push('<li class="'+child+'"><a href="#'+$(this).attr("id")+'" title="'+text+'">'+text+'</a></li>');
    });
    linkNav.push('</div></ul>');
    if(isMarkDownArticle){
      $('#J_article_nav').html(linkNav.join(""))
    }

    // $(window).scroll(function(){
    //     if($(this).scrollTop() > 150){
    //         $("#link").animate({"top":"50px"}, 100);
    //     }else{
    //         $("#link").animate({"top":"280px"},100);
    //     }
    // });

  })

  </script>
</head>
<body>

<div id="site-nav">
  <div class="head">

   

    <nav class="head-nav quick-menu">
      <ul class="clearfix">
        <li id="index" class="lists"><a href="./index.html">首页</a></li>
        <li id="started" class="lists"><a href="./guide.html">起步</a></li>
        <li id="doc" class="lists"><a href="./doc.html">文档</a></li>
        <li id="example" class="lists"><a href="./example.html">实例</a></li>
        <li id="article" class="lists"><a href="./article.html">文章</a></li>
        <li class="lists"><a target="_blank" href="../../benchmark/list.html">基准测试</a></li>
      </ul>
    </nav>
  </div>
</div>

<div id="J_content" class="main wrap channel">
  <div id="J_article_nav" class="article-nav"></div>
  {{content}}
</div>


</body>
</html>