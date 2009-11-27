# Multiple Icons Generator #

Creates all possible variations for a given set of layers. You can provide a single image, specify some dimensions and run this script to automatically export a list of graphic files.

**Requirements:** You need [Ruby](http://www.ruby-lang.org/) and [ImageMagick](http://www.imagemagick.org) running on your machine. [pngQuant](http://pornel.net/pngquant) is already include in the project.

## Quick Install ##

To download and test the script, execute this lines of code in your shell:

    git clone git@github.com:ubilabs/icons_generator.git 
    cd icons_generator
    ruby generate.rb

## Configuration ##

### Layers ###

To add more variations, simply add a new row to the `source.png` image document and update the `SOURCE` titles:

    LAYERS = [
      %w(normal active),
      %w(default site offer coupon my),
      %w(cluster shopping eat explore)
    ]

### Dimensions ###

To modify the icon size, change the image grid dimensions and update the following settings:

    WIDTH = 31
    HEIGHT = 35


## Sample Output ##

Source input image:

![Source](http://github.com/ubilabs/icons_generator/raw/master/source.png)

Generated icons:

![Source](http://github.com/ubilabs/icons_generator/raw/master/output_sample.png)