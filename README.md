# Jekyll Resize 🖼 🤏 🔬
> Simple image resizing filter for Jekyll 3 and 4

[![GitHub tag](https://img.shields.io/github/tag/MichaelCurrin/jekyll-resize)](https://github.com/MichaelCurrin/jekyll-resize/tags/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/MichaelCurrin/jekyll-resize/blob/master/LICENSE)

[![Made with Ruby](https://img.shields.io/badge/Ruby->=2.6-blue.svg?logo=ruby)](https://ruby-lang.org)
[![Jekyll](https://img.shields.io/badge/jekyll->=3.3,_4.x-blue.svg?logo=jekyll)](https://jekyllrb.com)


If your page is loading too slowly because of large images and you can't be bothered to manually create thumbnails (images with reduced dimensions), then this Jekyll filter is for you.

When running `jekyll build` or `jekyll serve`, this easy-to-use filter will create a smaller version of your image in a cache directory and link to it, so your page can load faster.

Use it for thumbnails. Ort to create versions of your images that are like 800px wide and under 1MB - while still keeping the original full-size images untouched in the repo.


## Sample usage

Add the plugin gem to your Gemfile and then install it with Bundler.

```ruby
group :jekyll_plugins do
  gem "jekyll-resize", git: "https://github.com/MichaelCurrin/jekyll-resize"
end
```

Now you can use the `resize` filter in your markdown or HTML, for a JPEG or PNG file.

```liquid
{{ "my-image.png" | resize: "800x800>" }}
```

That takes care of both generating the thumbnail image for you as well as providing a link to the file - magic.

See the docs linked below for example using with a `img` HTML tag.


## Documentation
> How to install the plugin and guide to using it

<div align="center">
  
[![View - Documentation](https://img.shields.io/badge/View-Documentation-blue?style=for-the-badge)](/docs/)

</div>


## Contributing

Submit a Pull Request or issue if you have improvements or fixes to suggest. I didn't create this plugin, so I don't have a deep understanding of the libraries or implementation. I just adapted the plugin as a fork that I can use for my projects.


## License

Released under [MIT](/LICENSE) by [@MichaelCurrin](https://github.com/MichaelCurrin).

Original license - [MIT](/LICENSE-source). 

This project was forked from the [CloudCannon/jekyll-resize](https://github.com/CloudCannon/jekyll-resize) repo ([jekyll-resize](https://rubygems.org/gems/jekyll-resize) on RubyGems). So that I could use this in my Jekyll 4 project and so others can too.

Notable changes:

- Updated [jekyll-resize.gemspec](/jekyll-resize.gemspec) to use Jekyll 4.
- Added `require "mini_magick"` to the [jekyll-resize.rb](/lib/jekyll-resize.rb) file to avoid a runtime error as constant `MiniMagick::Image` not defined (this error was not present on Jekyll 3).
- Created this `README.md` file and the [docs](/docs/) directory.
