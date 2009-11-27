TEMP_DIR = "_temp_output"
OUTPUT_DIR = "output"
TEMP_FILE = "#{TEMP_DIR}/_temp.png"
INDEX_FILE = "#{OUTPUT_DIR}/_index.png"

WIDTH = 31
HEIGHT = 35

LAYERS = [
  %w(normal active),
  %w(default site offer coupon my),
  %w(cluster shopping eat explore)
]

def create_folder name
  system "mkdir #{name}"
end

def temp_file_name_for(index, item)
  "#{TEMP_DIR}/#{index}_#{item}.png"
end

def crop(images, index)
  images.each_with_index do |image, image_index|
    x = image_index * WIDTH
    y = index * HEIGHT

    file_name = temp_file_name_for(index, image)
    crop_area = "#{WIDTH}x#{HEIGHT}+#{x}+#{y}"

    puts "- #{image}"
    system "convert sprite.png -crop #{crop_area} #{file_name}"
  end
end

def create_output_folders
  create_folder "#{TEMP_DIR}"
  create_folder "#{OUTPUT_DIR}"
end

def crop_images
  count = LAYERS.inject(0) {|sum, images| sum + images.size } 
  puts "\nCroping #{count} images: #{WIDTH}x#{HEIGHT}"
  LAYERS.each_with_index do |layer, index|
    crop layer, index
  end
end

def collect_variations
  variations = []
  LAYERS.each_with_index do |images, layer_index|
    new_variations = []
    images.each_with_index do |image, image_index|
      if layer_index == 0
        new_variations << [image]
      else
        variations.each do |variation|
          new_variations << variation + [image]
        end
      end
    end
    variations = new_variations
  end
  variations
end

def compose_images
  count = collect_variations.size
  puts "\nComposing #{count} images:"
  
  output_files = [];

  collect_variations.each do |images|  
    name = "#{images.join('_')}"
    output_file = "#{OUTPUT_DIR}/#{name}.png"
    output_files << output_file
    puts "- #{name}"

    images.each_with_index do |image, index|
      input_file_name = temp_file_name_for(index, image)
      if index == 0
        system "cp #{input_file_name} #{TEMP_FILE}"
      else
        system "composite #{input_file_name} #{TEMP_FILE} #{TEMP_FILE}"
      end
    end

    system "cp #{TEMP_FILE} #{output_file}"
  end
  
  output_files
end

def create_index files
  puts "\nCreating index file:\n- #{INDEX_FILE} #{LAYERS[0].size}"
  
  files = files.join(' ')
  tile = "#{LAYERS[0].size}x"
  geometry = "#{WIDTH}x#{HEIGHT}+5+5"
  
  system "montage -tile #{tile} -geometry #{geometry} #{files} #{INDEX_FILE}"
end

def clean_up
  system "rm -Rf #{TEMP_DIR}"
end

def quantify_images files
  puts "\nQuantify PNG-8 images:"
  files.each do |file|
    system "pngquant -f #{file}"
    name = file.gsub(".png", "-fs8.png")
    puts "- #{name}"
    system "mv #{name} #{file}"
  end
end

# main actions

create_output_folders
crop_images
files = compose_images
quantify_images files
create_index files
clean_up

puts "\nDONE! #{files.size} images generated."