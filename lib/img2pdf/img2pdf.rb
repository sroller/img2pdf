module Img2pdf

def self.create_tex(src_dir)
  jpegs = Dir["#{src_dir}/*.jpg"].sort_by { |f| File.stat(f).mtime }
  STDERR.puts(jpegs)
  cwd = File.basename(Dir.pwd)
  File.open("#{cwd}.tex", "w") do |tex|
    tex.write(<<~END_OF_TEX_HEADER)
    \\documentclass{article}
    \\usepackage{pdfpages}
    \\begin{document}
    END_OF_TEX_HEADER
    jpegs.each do |page|
      page = 
        tex.write("\\includepdf{\"#{page[0,page.size-4]}\".jpg\}\n")
    end
    tex.write(<<~END_OF_TEX_FOOTER)
    \\end{document}
    END_OF_TEX_FOOTER
  end
  "#{cwd}.tex"
end

def self.create_pdf(tex_file)
  STDERR.puts "file=#{tex_file}"
  exit_code = %x( pdflatex -interaction=batchmode #{tex_file} )
  STDERR.puts "exit code #{exit_code}"
end

def self.clean_up
  STDERR.puts "cleanup #{Dir.pwd}"
  # Dir.chdir work_dir
  Dir['*.log'].each {|f| File.delete f}
  Dir['*.aux'].each {|f| File.delete f}
  Dir['*.tex'].each {|f| File.delete f}
end

def self.convert(work_dir)
  Dir.chdir work_dir
  tex = create_tex(work_dir)
  pdf = create_pdf(tex)
  clean_up
end

end
