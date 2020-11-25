require 'digest'
require "mini_magick"

module Jekyll
  module Resize
    def resize(source, options)
      site = @context.registers[:site]

      source_path = site.source + source
      # What is _[]?
      raise "#{source_[path]} is not readable" unless File.readable?(source_path)
    
      # TODO: move to constants.
      dest_subpath = "/cache/resize/"
      dest_dir = site.source + dest_subpath
      FileUtils.mkdir_p dest_dir
      
      # TODO: move to func
      desc = options.gsub(/[^\da-z]+/i, '')
      sha = Digest::SHA256.file source_path
      ext = File.extname(source)
      file_name = "#{sha}_#{desc}#{ext}"
      
      dest_path = dest_dir + file_name
      
      # TODO: move to func
      if !File.exist?(dest_path) || (File.mtime(dest_path) <= File.mtime(source_path))
        puts "Thumbnailing #{source_path} to #{dest_path} (#{options})"

        image = MiniMagick::Image.open(source_path)
        image.strip
        image.resize options
        image.write dest_path
        site.static_files << Jekyll::StaticFile.new(site, site.source, dest_subpath, file_name)
      end

      dest_subpath + file_name
    end
  end
end

Liquid::Template.register_filter(Jekyll::Resize)
