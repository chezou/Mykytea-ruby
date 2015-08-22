require "kytea/version"
require "Mykytea"

class KyTea
  def initialize(option = "")
    @model = Mykytea::Mykytea.new(option)
  end

  def segment(input)
    @model.getWS(input).map do |word|
      word.force_encoding(Encoding.default_external)
    end
  end

  def tag_info_of(input)
    @model.getTagsToString(input).force_encoding(Encoding.default_external)
  end

  def tags_of(input, full_tag: false)
    raw_tags = full_tag ? @model.getAllTags(input) : @model.getTags(input)
    raw_tags.map do |e|
      tags = e.tag.map do |t|
                t.map do |k, v|
                  {
                    tag: k.force_encoding("UTF-8"),
                    val: v
                  }
                end
              end
      {
        surface: e.surface.force_encoding("UTF-8"),
        tags: tags
      }
    end
  end
end
