#!/usr/bin/env ruby -Ku

require 'rubygems'
require 'sinatra'
#require 'sinatra/reloader'
require 'haml'
require 'Mykytea'
require 'MeCab'

configure :development do
end

begin
  model_path= "/usr/local/share/kytea/model.bin"
  @@mk = Mykytea::Mykytea.new(model_path)
  @@c = MeCab::Tagger.new()
rescue => e
  STDERR.puts 'Initialize error!'
  STDERR.puts e
  exit 1
end

helpers do
  def show_tags(t)
    ret_str = ""
    t.each do |word|
      ret_str += word.surface + "\t"
      word.tag.each{|t1| t1.each{|t2| t2.each{|t3| ret_str += "/" + t3.to_s} ;ret_str +=  "\t"} ; ret_str += "\t"}
      ret_str += "<br>"
    end
    return ret_str
  end
end

get '/' do
  haml :index
end

post '/kytea' do
  haml :index
end

get '/kytea' do
  str = params[:str]
  @k_str = show_tags( @@mk.getTags(str) )

  n = @@c.parseToNode(str)
  @m_str = ""
  while n do
    @m_str += n.surface + "\t" + n.feature + n.cost.to_s + "<br>"
    n = n.next
  end

  haml :index
end
