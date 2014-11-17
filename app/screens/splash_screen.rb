class SplashScreen < PM::Screen
  title "Screen"

  def on_load
    rmq.stylesheet = SplashScreenStylesheet
    rmq(self.view).apply_style :root_view

    rmq.append UIImageView, :splash_image
  end
end
