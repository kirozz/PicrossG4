
require "Classes/Interface/BoxButton.rb"

class BoxButtonPartie < BoxButton

  attr_reader :nbEtoile

  def initialize(monde , partie,nbEtoileTotal, bloque)

    @boxtest = Gtk::Box.new(:horizontal)

    if bloque then
      super(partie, "Partie n°", "partie_verrous")

      if(partie.eql?(4)) then
        @boxtest.add(Gtk::Label.new(nbEtoileTotal.to_s + "/6"), :expand => true, :fill => true)
        @boxtest.add(Gtk::Image.new(:file => "Images/Etoile.png", :size => :dialog, :expand => true, :fill => true))
      elsif(partie.eql?(5))
        @boxtest.add(Gtk::Label.new(nbEtoileTotal.to_s + "/8"), :expand => true, :fill => true)
        @boxtest.add(Gtk::Image.new(:file => "Images/Etoile.png", :size => :dialog, :expand => true, :fill => true))
      end

    else super(partie, "Partie n°", "partie") end

    @etoile1 = Gtk::Image.new(:file => "Images/Etoile.png", :size => :dialog)
    @etoile2 = Gtk::Image.new(:file => "Images/Etoile.png", :size => :dialog)
    @etoile3 = Gtk::Image.new(:file => "Images/Etoile.png", :size => :dialog)

    @boxEtoile = Gtk::Box.new(:horizontal)


    if($joueur.mode == 2) then
      taille = ($joueur.grilleCompetition(monde, partie).first.split(//).keep_if {|v| v =~ /[0123456789]/}).first(2).join.to_i
      if $joueur.grillesCompetition(monde, partie).first.include?("facile") then
        difficulte = 1
      elsif $joueur.grillesCompetition(monde, partie).first.include?("normal") then
        difficulte = 2
      else
        difficulte = 3
      end

      @nbEtoile = $joueur.donneNombreEtoile($joueur.grillesCompetition(monde, partie).at(1).getScore, difficulte, taille)

    elsif ($joueur.mode == 3) then
      taille = ($joueur.grilleAventure(monde, partie).first.split(//).keep_if {|v| v =~ /[0123456789]/}).first(2).join.to_i
      if $joueur.grilleAventure(monde, partie).first.include?("facile") then
        difficulte = 1
      elsif $joueur.grilleAventure(monde, partie).first.include?("normal") then
        difficulte = 2
      else
        difficulte = 3
      end

      @nbEtoile = $joueur.donneNombreEtoile($joueur.grilleAventure(monde, partie).at(1).getScore, difficulte, taille)
      if @nbEtoile.eql?(1) then
        @boxEtoile.add(@etoile1, :expand => true, :fill => true)
      elsif @nbEtoile.eql?(2) then
        @boxEtoile.add(@etoile1, :expand => true, :fill => true)
        @boxEtoile.add(@etoile2, :expand => true, :fill => true)
      elsif @nbEtoile.eql?(3) then
        @boxEtoile.add(@etoile1, :expand => true, :fill => true)
        @boxEtoile.add(@etoile2, :expand => true, :fill => true)
        @boxEtoile.add(@etoile3, :expand => true, :fill => true)
      end

      self.add(@boxtest)
      self.reorder_child(@boxtest, 0)

      self.add(@boxEtoile)
      self.reorder_child(@boxEtoile, 2)
    end

  end
end
