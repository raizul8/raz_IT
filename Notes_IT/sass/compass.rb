# install

sudo gem install sass --pre
sudo gem install compass --pre 
sudo gem install susy --pre 

compass create ProjectFolder
compass create --using susy <project name>

compass watch sassFolder
compass watch
compass init

# Config.rb  to include susy
require 'compass/import-once/activate'
require 'susy'
require 'compass-normalize'

# Require any additional compass plugins here.

project_type = :stand_alone
http_path = "/"
sass_dir = "scss"
css_dir = "css"
images_dir = "img"
fonts_dir = "fonts"
javascripts_dir = "js"
line_comments = false
preferred_syntax = :scss
output_style = :expanded
relative_assets = true