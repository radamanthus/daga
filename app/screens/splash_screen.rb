class SplashScreen < PM::Screen
  title "Screen"

  def on_appear
    # This isn't working. The progress bar is updated after we exit this method
    # See
    # http://stackoverflow.com/questions/1503761/what-is-the-most-robust-way-to-force-a-uiview-to-redraw
    # http://stackoverflow.com/questions/1455878/modifying-an-iphone-animation-container-view-before-starting-animation/1501650#1501650
    @progress_bar = rmq(UIProgressView).get
    5.times do
      sleep 1
      @progress_bar.setProgress(@progress_bar.progress + 0.2)
      @progress_bar.setNeedsDisplay
    end
  end

  def on_load
    rmq.stylesheet = SplashScreenStylesheet
    rmq(self.view).apply_style :root_view

    rmq.append UIImageView, :splash_image
    rmq.append(UIProgressView, :progress_bar)
  end
end
