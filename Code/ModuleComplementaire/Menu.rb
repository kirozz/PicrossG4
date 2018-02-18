
class Menu < PageMenu

  def initialize(monApp, header)

    super("Menu",monApp, :vertical, header)
    self.spacing = 10

    @bouttons = Gtk::ButtonBox.new(:vertical)
    @bouttons.layout = :spread
    @bouttons.spacing = 20

    @btnJouer = Gtk::Button.new(:label => "Jouer", :use_underline => true)
    @btnLeaderboard = Gtk::Button.new(:label => "Leaderboard", :use_underline => true)
    @btnDidacticiel = Gtk::Button.new(:label => "Didacticiel", :use_underline => true)
    @btnQuitter = Gtk::Button.new(:label => "Quitter", :use_underline => true)

    [@btnJouer, @btnLeaderboard, @btnDidacticiel, @btnQuitter].each { |btn|
      @bouttons.add(btn, :expand => true, :fill => false)
    }


    @btnJouer.signal_connect('clicked') {
      ##
      # si il a reussi a ce co
      self.supprimeMoi
      choixMode = ChoixMode.new(@window, @header)
      choixMode.ajouteMoi
      @window.show_all
    }

    @btnLeaderboard.signal_connect('clicked') {
      ##
      # si il a reussi a ce co
      self.supprimeMoi
      mode = ModeCompetition.new(@window, @header)
      mode.ajouteMoi
      @window.show_all
    }

    @btnDidacticiel.signal_connect('clicked') {
      ##
      # si il a reussi a ce co
      self.supprimeMoi
      mode = ModeAventure.new(@window, @header)
      mode.ajouteMoi
      @window.show_all
    }

    @btnQuitter.signal_connect('clicked') {
      ##
      # si il a reussi a ce co
      self.supprimeMoi
      mode = ModeEntrainement.new(@window, @header)
      mode.ajouteMoi
      @window.show_all
    }


    self.add(@bouttons)
  end
end