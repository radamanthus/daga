class MainScreen < PM::Screen
  title "Main Screen"

  def on_load
    rmq.stylesheet = MainScreenStylesheet
    rmq(self.view).apply_style :root_view
  end
end
