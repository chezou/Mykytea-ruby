KyTea wrapper for ruby
==========================

2011/07/15 chezou

Mykytea-ruby is a ruby wrapper module for KyTea, a general text analysis toolkit.
KyTea is developed by KyTea Development Team

Detailed information of KyTea can be found at
http://www.phontron.com/kytea

Install Dependencies
--------------------

You need install KyTea and SWIG before build.

To build Mykytea-ruby, run
--------------------

   % swig -c++ -ruby mykytea.i
   % ruby extconf.rb
   % make

  (If you want to install, run)
   % sudo make install


How to use?
--------------------
  See 'mykytea_test.rb' as a sample program.

License
--------------------
MIT License