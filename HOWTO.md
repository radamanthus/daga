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

## TODO: Create a template for the splash screen

## TODO: Add the splash image to the splash screen

## TODO: Add the progress bar to the splash screen

## TODO: Increment the progress bar by 20% every second

## TODO: Display the main screen when the splash progress reaches 100%


