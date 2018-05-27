source_dir = ARGV[0]
dest_dir = ARGV[1]

Dir.glob('*.mkv', base: source_dir) do |source_path|
  puts "converting #{source_path}"
  filename = File.basename(source_path, '.mkv')
  dest_path = File.join(dest_dir, "#{filename}.mp4")
  `ffmpeg -i #{source_path} -vcodec libx264 #{dest_path}`
  puts "converted to #{dest_path}"
end
