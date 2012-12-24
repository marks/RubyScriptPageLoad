Here's a quick solution that executes a phantomjs[1] yslow[2] script inside a ruby one. There is _a lot_ more information available from yslow[2] but I've included just a little more than you asked for in this solution due to time.

**Example CLI input:** `$ ruby itemized_page_weight_of_url.rb http://mappyhealth.com`  
**Example output:**

    TOTAL PAGE SIZE: 630kb

    + DOC: 15kb (over 1 requests)
      - http://mappyhealth.com/: 15kb (16256ms response time)
    + CSS: 138kb (over 6 requests)
      - http://s3.amazonaws.com/mappyhealth-public/bootstrap/css/bootstrap-spacelab0.min.css: 91kb (93993ms response time)
      - http://s3.amazonaws.com/mappyhealth-public/bootstrap/css/bootstrap-responsive0.min.css: 10kb (10709ms response time)
      - http://s3.amazonaws.com/mappyhealth-public/showLoading/showLoading.css: 0kb (284ms response time)
      - http://s3.amazonaws.com/mappyhealth-public/css-social-buttons/social-buttons.css: 32kb (33597ms response time)
      - http://s3.amazonaws.com/mappyhealth-public/custom.css: 0kb (698ms response time)
      - http://s3.amazonaws.com/mappyhealth-public/scroller.css: 2kb (2517ms response time)
    + JS: 386kb (over 12 requests)
      - http://www.google-analytics.com/ga.js: 36kb (37362ms response time)
      - http://platform.twitter.com/widgets.js: 75kb (77103ms response time)
      - http://s3.amazonaws.com/mappyhealth-public/bootstrap/js/jquery.js: 242kb (247822ms response time)
      - http://s3.amazonaws.com/mappyhealth-public/showLoading/jquery.showLoading.min.js: 4kb (4813ms response time)
      - http://s3.amazonaws.com/mappyhealth-public/custom.js: 1kb (1493ms response time)
      - http://s3.amazonaws.com/mappyhealth-public/scroller.js: 1kb (1907ms response time)
      - http://s3.amazonaws.com/mappyhealth-public/jquery.tagcloud.js: 2kb (2377ms response time)
      - http://s3.amazonaws.com/mappyhealth-public/bootstrap/js/basic/bootstrap-modal.js: 5kb (5490ms response time)
      - http://s3.amazonaws.com/mappyhealth-public/bootstrap/js/basic/bootstrap-dropdown.js: 2kb (2558ms response time)
      - http://s3.amazonaws.com/mappyhealth-public/bootstrap/js/basic/bootstrap-tooltip.js: 7kb (7374ms response time)
      - http://s3.amazonaws.com/mappyhealth-public/bootstrap/js/basic/bootstrap-collapse.js: 3kb (3912ms response time)
      - http://cdn.api.twitter.com/1/users/show.json?screen_name=MappyHealth&callback=twttr.setFollowersCount: 2kb (2070ms response time)
    + CSSIMAGE: 4kb (over 1 requests)
      - http://s3.amazonaws.com/mappyhealth-public/bootstrap/img/glyphicons-halflings.png: 4kb (4352ms response time)
    + IMAGE: 0kb (over 3 requests)
      - http://s3.amazonaws.com/mappyhealth-public/logo.gif: 0kb (732ms response time)
      - http://p.twitter.com/f.gif?_=1356369820551&id=twitter-widget-1&lang=en&screen_name=MappyHealth&show_count=false&show_screen_name=true&size=m&twttr_variant=2.0&twttr_referrer=http%3A%2F%2Fmappyhealth.com%2F&twttr_widget=1&twttr_hask=0&twttr_li=0&twttr_pid=v3%3A1356369820120830106696393: 0kb (43ms response time)
      - http://p.twitter.com/t.gif?_=1356369820542&count=none&id=twitter-widget-0&lang=en&original_referer=http%3A%2F%2Fmappyhealth.com%2F&size=m&text=Check%20out%20%40MappyHealth%20-%20following%20disease%20trends%2C%20140%20characters%20at%20a%20time.%20%23NowTrending2012&url=http%3A%2F%2Fmappyhealth.com%2F&type=share&twttr_referrer=http%3A%2F%2Fmappyhealth.com%2F&twttr_widget=1&twttr_hask=0&twttr_li=0&twttr_pid=: 0kb (43ms response time)
    + FAVICON: 0kb (over 1 requests)
      - http://mappyhealth.com/favicon.ico: 0kb (0ms response time)
    + IFRAME: 85kb (over 2 requests)
      - http://platform.twitter.com/widgets/follow_button.1355514129.html#_=1356369820551&id=twitter-widget-1&lang=en&screen_name=MappyHealth&show_count=false&show_screen_name=true&size=m: 65kb (67553ms response time)
      - http://platform.twitter.com/widgets/tweet_button.1355514129.html#_=1356369820542&count=none&id=twitter-widget-0&lang=en&original_referer=http%3A%2F%2Fmappyhealth.com%2F&size=m&text=Check%20out%20%40MappyHealth%20-%20following%20disease%20trends%2C%20140%20characters%20at%20a%20time.%20%23NowTrending2012&url=http%3A%2F%2Fmappyhealth.com%2F: 55kb (57281ms response time)

Honestly not sure if it includes @import support but can definitely be added.

**Code!** at https://github.com/marks/RubyScriptPageLoad


**References:**
1. http://phantomjs.org/  
2. https://github.com/marcelduran/yslow/wiki/PhantomJS  
Also: http://scriptogr.am/micmath/post/using-phantomjs-to-measure-web-page-performance  
