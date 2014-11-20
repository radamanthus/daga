class SplashScreen < PM::Screen
  title "Screen"

  def increment_progress
    progress_bar = rmq(UIProgressView).get
    progress_bar.setProgress(progress_bar.progress + 0.2)
    puts "Updating progress to #{progress_bar.progress}"
    progress_bar.setNeedsDisplay
    if progress_bar.progress < 1.0
      self.performSelector("increment_progress", withObject: nil, afterDelay: 1.0)
    end
  end

  def on_appear
    self.performSelector("increment_progress", withObject: nil, afterDelay: 1.0)
  end

  def on_load
    rmq.stylesheet = SplashScreenStylesheet
    rmq(self.view).apply_style :root_view

    rmq.append UIImageView, :splash_image
    rmq.append(UIProgressView, :progress_bar)
  end
end
