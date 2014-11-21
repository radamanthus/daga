This is my log on how I'm building the template

## Create the app

Run from the CLI:

```
rmq create
```

## Add ProMotion

Add this line to the Gemfile:

```
gem "ProMotion", "~> 2.0.0"
```

Replace `app_delegate.rb` with

```
class AppDelegate < PM::Delegate
  def on_load(app, options)
    open SplashScreen.new(nav_bar: true)
  end
end
```

## Add the splash screen

Create the `app/screens` directory.

Create `app/screens/splash_screen.rb`:

```
class ScreenScreen < PM::Screen
  title "Screen"

  def on_load
    set_attributes self.view, {
      background_color: hex_color("#FFFFFF")
    }
  end
end
```

## Create a template for the splash screen

Create the file `app/stylesheets/splash_screen_stylesheet.rb`:

```
class SplashScreenStylesheet < ApplicationStylesheet
  def setup
  end

  def root_view(st)
    st.background_color = color.green
  end

end
```

Modify SplashScreen#on_load in `app/screens/splash_screen.rb` to use the style sheet:

```
def on_load
  rmq.stylesheet = SplashScreenStylesheet
  rmq(self.view).apply_style :root_view
end
```

## Add the splash image to the splash screen

Add a PNG file named `splash_image.png` to the `resources` directory

Add this line to the botton of SplashScreen#on_load:

```
rmq.append UIImageView, :splash_image
```

Add this method to SplashScreenStylesheet (in `app/stylesheets/splash_screen_stylesheet.rb`)

```
  def splash_image(st)
    st.frame = "a0:l17"
    st.image = image.resource('splash_image')
  end
```

Note that the included `resources/splash_image.png` file is sized for the iPhone 6. 
If you're targetting a different screen or want to use a different splash image size, you should adjust
the line `st.frame = "a0:l17"` accordingly. See http://rubymotionquery.com/documentation/#post-147 to learn more about the RMQ grid system.

## Add the progress bar to the splash screen

Create the progress_bar view at the bottom of SplashScreen#on_load (in `app/screens/splash_screen.rb`):

```
rmq.append UIProgressView, :progress_bar
```

Create the SplashScreenStylesheet#progress_bar method in `app/stylesheets/splash_screen_stylesheet.rb`:

```
  def progress_bar(st)
    st.frame = "c13:j13"
    st.view.progress = 0.0
  end
```

## Increment the progress bar by 20% every second

Add these methods to SplashScreen (`app/screens/splash_screen.rb`):

```
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
```

## TODO: Display the main screen when the splash progress reaches 100%


