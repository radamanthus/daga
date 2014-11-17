class AppDelegate < PM::Delegate
  def on_load(app, options)
    open SplashScreen.new(nav_bar: true)
  end
end
