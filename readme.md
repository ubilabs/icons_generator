# Multiple Icons Generator #

Creates all possible variations for a given set of layers. You can provide a single image, specify some dimensions and run this script to automatically export a list of graphic files.

**Requirements:** You need [Ruby](http://www.ruby-lang.org/) and [ImageMagick](http://www.imagemagick.org) running on your machine. [pngQuant](http://pornel.net/pngquant) is already include in the project.

## Quick Install ##

To download and test the script, execute these lines of code in your shell:

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

List of exported files:

* normal\_default\_cluster
* active\_default\_cluster
* normal\_site\_cluster
* active\_site\_cluster
* normal\_offer\_cluster
* active\_offer\_cluster
* normal\_coupon\_cluster
* active\_coupon\_cluster
* normal\_my\_cluster
* active\_my\_cluster
* normal\_default\_shopping
* active\_default\_shopping
* normal\_site\_shopping
* active\_site\_shopping
* normal\_offer\_shopping
* active\_offer\_shopping
* normal\_coupon\_shopping
* active\_coupon\_shopping
* normal\_my\_shopping
* active\_my\_shopping
* normal\_default\_eat
* active\_default\_eat
* normal\_site\_eat
* active\_site\_eat
* normal\_offer\_eat
* active\_offer\_eat
* normal\_coupon\_eat
* active\_coupon\_eat
* normal\_my\_eat
* active\_my\_eat
* normal\_default\_explore
* active\_default\_explore
* normal\_site\_explore
* active\_site\_explore
* normal\_offer\_explore
* active\_offer\_explore
* normal\_coupon\_explore
* active\_coupon\_explore
* normal\_my\_explore
* active\_my\_explore

## Sample Log ##

While running the script, you see the following output:

    Croping 11 images: 31x35
    ...........
    
    Composing 40 images:
    ........................................
    
    Quantifying PNG-8 images:
    ........................................
    
    Creating index file:
    - output/_index.png
    
    DONE! 40 images generated.

