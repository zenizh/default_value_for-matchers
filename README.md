# default_value_for-matchers

[![Build Status](https://travis-ci.org/kami-zh/default_value_for-matchers.svg)](https://travis-ci.org/kami-zh/default_value_for-matchers)
[![Gem Version](https://badge.fury.io/rb/default_value_for-matchers.svg)](http://badge.fury.io/rb/default_value_for-matchers)

This gem is a RSpec matchers for [default_value_for](https://github.com/FooBarWidget/default_value_for) gem.

## Installation

Add this line to your application's Gemfile:

```ruby
group :test do
  gem 'default_value_for-matchers'
end
```

And then execute:

```
$ bundle
```

## Usage

You can use `have_default_value_for` matcher and `with_value`, `and_allow_nil`, `and_disallow_nil` submatchers.

For example:

```ruby
# app/models/user.rb
class User < ActiveRecord::Base
  default_value_for :name, 'no name'
  default_value_for :age, value: 20, allows_nil: false
end

# spec/models/user.rb
describe User, type: :model do
  # name
  it { is_expected.to have_default_value_for(:name) }
  it { is_expected.to have_default_value_for(:name).with_value('no name') }
  it { is_expected.to have_default_value_for(:name).with_value('no name').and_allow_nil }

  # age
  it { is_expected.to have_default_value_for(:age) }
  it { is_expected.to have_default_value_for(:age).with_value(20) }
  it { is_expected.to have_default_value_for(:age).with_value(20).and_disallow_nil }
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kami-zh/default_value_for-matchers.
