require 'spec_helper'

describe KyTea do
  let(:mk) do
    KyTea.new
  end

  let(:input) do
    "今日はいい天気です。"
  end
  let(:segment_array) do
    ['今日', 'は', 'い', 'い', '天気', 'で', 'す', '。']
  end
  describe '#segment' do
    it 'segments word' do
      expect(mk.segment(input)).to eq segment_array
    end
  end

  describe '#tag_info_of' do
    let(:tag_info) do
      "今日/名詞/きょう は/助詞/は い/形容詞/い い/語尾/い 天気/名詞/てんき で/助動詞/で す/語尾/す 。/補助記号/。 "
    end
    it 'tags in flat string' do
      expect(mk.tag_info_of(input)).to eq tag_info
    end
  end

  describe '#tags_of' do
    let(:tags) do
      mk.tags_of(input)
    end
    it 'tags input string' do
      expect(tags).to match [
        including(surface: "今日", tags: an_instance_of(Array)),
        including(surface: "は", tags: an_instance_of(Array)),
        including(surface: "い", tags: an_instance_of(Array)),
        including(surface: "い", tags: an_instance_of(Array)),
        including(surface: "天気", tags: an_instance_of(Array)),
        including(surface: "で", tags: an_instance_of(Array)),
        including(surface: "す", tags: an_instance_of(Array)),
        including(surface: "。", tags: an_instance_of(Array)),
      ]
    end

    it 'tags only top 1 tag' do
      expect(tags.first[:tags].first.size).to eq 1
    end

    it 'tags full tag' do
      expect(mk.tags_of(input, full_tag: true).first.size).to eq 2
    end
  end
end
