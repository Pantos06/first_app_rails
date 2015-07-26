class PagesController < ApplicationController
  def home
  	@titre = 'Acceuil Pantos'
  end

  def contact
  	@titre = 'Contact'
  end

  def about
  	@titre = 'A Propos'
  end

  def help
  	@titre = 'Aide'
  end
end
