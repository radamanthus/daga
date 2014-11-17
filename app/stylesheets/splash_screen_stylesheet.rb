class SplashScreenStylesheet < ApplicationStylesheet
  def setup
  end

  def root_view(st)
    st.background_color = color.white
  end

  def splash_image(st)
    st.frame = "a0:l17"
    st.image = image.resource('splash_image')
  end
end


