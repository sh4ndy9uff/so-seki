htmlfile = "kokoro.html"
textfile = "cut_kokoro.txt"

html = File.read(htmlfile)

File.open(textfile, "w") do |f|
  in_header = true
  html.each_line do |line|
    if in_header && /midashi/ !~ line
      next
    else
      in_header = false
    end
    break if /bibliographical_information/ =~ line
    line.gsub!(/<[^>]+>/, '')
    line.gsub!(/（[^）]+）/, '') #ルビ表示の括弧内を削除する。いずれキャプチャしてルビ表示
    line.gsub!(/ /, '')
    if /^「/ !~ line #鍵括弧の行では句読点で改行しない。要微調整。
      line.gsub!(/。/, "。\n")
    end
    f.write line
  end
end
