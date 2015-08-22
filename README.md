KyTea wrapper for ruby
==========================

Mykytea-ruby is a ruby wrapper module for KyTea, a general text analysis toolkit.
KyTea is developed by KyTea Development Team

Detailed information of KyTea can be found at
http://www.phontron.com/kytea

Install Dependencies
--------------------

You need to install KyTea before build.

To build Mykytea-ruby, run
--------------------

    % ruby ext/extconf.rb
    % make

  (If you want to install, run)

    % sudo make install

  (If you fail to make, please try to install SWIG and run)

    % swig -c++ -ruby -I/usr/local/include ext/mykytea.i

How to use?
--------------------

```
require 'kytea'

# You can write original kytea option
opt = "-model /usr/local/share/kytea/model.bin"
kytea = KyTea.new(opt)

str = "今日はいい天気です。"

kytea.segment(str)
#=> ["今日", "は", "い", "い", "天気", "で", "す", "。"]

kytea.tag_info_of(str)
#=> "今日/名詞/きょう は/助詞/は い/形容詞/い い/語尾/い 天気/名詞/てんき で/助動詞/で す/語尾/す 。/補助記号/。 "

kytea.tags_of(str)
#=> [{:surface=>"今日", :tags=>[[{:tag=>"名詞", :val=>3.610404674503611}], [{:tag=>"きょう", :val=>1.0726515803715995}]]},
# {:surface=>"は", :tags=>[[{:tag=>"助詞", :val=>3.5500698037485963}], [{:tag=>"は", :val=>100.0}]]},
# {:surface=>"い", :tags=>[[{:tag=>"形容詞", :val=>2.5966088884369523}], [{:tag=>"い", :val=>100.0}]]},
# {:surface=>"い", :tags=>[[{:tag=>"語尾", :val=>2.7064013574728385}], [{:tag=>"い", :val=>100.0}]]},
# {:surface=>"天気", :tags=>[[{:tag=>"名詞", :val=>4.220721634732509}], [{:tag=>"てんき", :val=>100.0}]]},
# {:surface=>"で", :tags=>[[{:tag=>"助動詞", :val=>2.9093304720685786}], [{:tag=>"で", :val=>0.99994530321086}]]},
# {:surface=>"す", :tags=>[[{:tag=>"語尾", :val=>2.5160490891753264}], [{:tag=>"す", :val=>0.9998735552127426}]]},
# {:surface=>"。", :tags=>[[{:tag=>"補助記号", :val=>3.070959942739055}], [{:tag=>"。", :val=>100.0}]]}]
```


License
--------------------
MIT License
