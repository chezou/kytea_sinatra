KyTea-sinatra
==========================
This is simple web application for KyTea with Sinatra.


Install Dependencies
--------------------
First of all, you need to install KyTea and Mykytea-ruby.

[KyTea](http://www.phontron.com/kytea/)
[Mykytea-ruby](https://github.com/chezou/Mykytea-ruby)

Then,

    % gem install sinatra haml bundler


or


    % gem install bundler
    % bundle install
    

Run
---

    % ruby kytea_sinatra.rb

open [http://localhost:4567](http://localhost:4567)

or

    % ruby kytea_sinatra_mecab.rb

open [http://localhost:4567](http://localhost:4567)
(You need mecab-ruby.)