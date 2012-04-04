#! /usr/bin/env ruby -Ku
# -*- coding: utf-8 -*-

require './Mykytea'

opt = "-model /usr/local/share/kytea/model.bin -deftag UNKNOWN!!!"
mk = Mykytea::Mykytea.new(opt)

str = "今日はいい天気です。1999"

def show_tags(t)
  t.each do |word|
    print word.surface + "\t"
    word.tag.each{|t1| t1.each{|t2| t2.each{|t3| print "/" + t3.to_s} ;print  "\t"} ; print "\t"}
    print "\n"
  end
end

#分かち書きを取得
mk.getWS(str).each{|a| puts a}

print "\n"

#解析結果を文字列で取得
puts mk.getTagsToString(str)
print "\n"

#1位のタグを取得
t = mk.getTags(str)
show_tags(t)


#すべてのタグを取得
tt = mk.getAllTags(str)
show_tags(tt)
