# Identicon

This gem convert a string name to an Identicon image

## Install

Add this line to your application's Gemfile:

```ruby
gem 'identicon'
```

And then execute:

```bash
$ bundle
```

Or install:

```bash
$ gem install identicon
```

## Usage

```ruby
identicon = Identicon.new(user_name, path)
identicon.generate
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
