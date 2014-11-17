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
    st.frame = "a0:j12"
    st.image = image.resource('splash_image')
  end
```

## TODO: center the splash image and occupy the whole screen

## TODO: Add the progress bar to the splash screen

## TODO: Increment the progress bar by 20% every second

## TODO: Display the main screen when the splash progress reaches 100%


