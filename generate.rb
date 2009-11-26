
@width = 31
@height = 35

@folders = %w(default site offer my)
@images = %w(cluster shopping eat explore)

@folders.each do |folder|
  
  @images.each do |image|
    system "echo #{folder}_#{image}"
  end
  
end