class Menu
  TEXT = <<-TEXT
    S: Save
    ESC: Return to map
  TEXT

  def initialize(window)
    @window = window
  end

  def draw
    text.draw_rot(240, 240, 0, 0)
  end

  def button_down(id)
    case id
    when Gosu::KbEscape
      @window.mode = :map
    when Gosu::KbS
      Command::Save.new(@window).call
    end
  end

  private

  def text
    @text ||= Gosu::Image.from_text(@window, TEXT, 'Helvetica Neue', 24)
  end
end