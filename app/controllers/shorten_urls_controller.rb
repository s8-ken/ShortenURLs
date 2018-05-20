# coding: utf-8
class ShortenUrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def show
    
  end
  

  def create
    @url = Url.new(params.require(:url).permit(:original_url))
    @url.shortened_url = generate_shortened_url
    if @url.save
      flash[:info] = "短縮後のURLは#{@url.shortened_url}です！"
      redirect_to shorten_urls_new_path
    elsif
      flash.now[:alert] = "しっぱい"
      render :action => :new
    end  
  end

  def delete
  end


  def jump
    @url = Url.find_by_shortened_url(generate_shortened_url_from_id(params[:id]))
    if @url
      redirect_to(@url.original_url)
    else
      redirect_to :action=>'new'
    end
  end
  private
  def generate_shortened_url_from_id(id)
    "http://" + request.host_with_port+ '/shorten_urls/jump/' +  id
  end
  def generate_shortened_url
    generate_shortened_url_from_id(('a'..'z').to_a.shuffle[0..7].join)
  end


end
