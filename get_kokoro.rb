require "open-uri"
require "nkf"

url = "https://www.aozora.gr.jp/cards/000148/files/773_14560.html"
filename = "kokoro.html"

File.open(filename, "w") do |f|
  if File.exist?("filename") #filenameがあればtrueを返す、らしい
    puts "#{filename} has been downloaded."
  else
    text = URI.open(url).read
    f.write NKF.nkf("-w", text)
    puts "#{filename} download complete."
  end
end
