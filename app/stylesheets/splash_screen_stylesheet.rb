class SplashScreenStylesheet < ApplicationStylesheet
  def setup
  end

  def progress_bar(st)
    st.frame = "c13:j13"
    st.view.progress = 0.0
  end

  def root_view(st)
    st.background_color = color.white
  end

  def splash_image(st)
    st.frame = "a0:l17"
    st.image = image.resource('Default')
  end
end


