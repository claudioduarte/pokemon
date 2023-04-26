# Pokémon - Gotta Catch 'Em All!

![Pokemon](https://user-images.githubusercontent.com/4729521/234700625-76b97c63-4bc4-4fc5-969b-d975962f6fba.png)

Ash is catching Pokémon in a world consisting of an infinite two-dimensional grid of houses. In each house there is exactly 1 Pokémon.

Ash starts by catching the Pokémon that are in the house where he starts. Then, he moves to the house immediately North (N), South (S), East (E) or West (O/W) from where he is and catches the Pokémon that is there, and so on.

Attention: if he passes a house where he has already passed (and, therefore, where he has already caught a Pokémon), there is no longer a Pokémon there for him to catch!

## Prerequisites

The setups steps expect following tools installed on the system.

- PostgreSQL 14
- Ruby 3.2.2
- Rails 7.0.4.3
- Puma 5

## Installation

#### 1. Clone the repository

```bash
git clone https://github.com/claudioduarte/pokemon.git
```

or, if you prefer, via SSH (recommended)

```bash
git clone git@github.com:claudioduarte/pokemon.git
```

#### 2. `cd` into the project

```ruby
cd pokemon
```

#### 3. Install Homebrew

```ruby
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
````

If you run into problems after the installation, please run the following commands:

```ruby
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/your_user/.zprofile
```
```ruby
eval "$(/opt/homebrew/bin/brew shellenv)"
```

#### 4. Install Ruby using `rbenv`

```ruby
brew install rbenv
```

Add the following command to your ~/.zshrc file to make rbenv load automatically when you open up the Terminal.

```ruby
eval "$(rbenv init -)" >> ~/.zshrc
```

Install Ruby 3.2.2 with the following command:

```ruby
rbenv install 3.2.2
```

Set the ruby version in the project, rehash and then restart the terminal to apply the changes

```ruby
rbenv local 3.2.2
rbenv rehash
```

When typing `ruby -v`, this should be the version:

```ruby
ruby 3.2.2 (2023-03-30 revision e51014f9c0) [arm64-darwin21]
```

#### 5. Install PostgreSQL with Homebrew

```ruby
brew install postgresql@14
```

#### 6. Install Bundler gem

```ruby
gem install bundler -v '2.4.12'
```

#### 7. Install all of your gem dependencies

```ruby
bundle install
```

If an error occurs, run command with `sudo` permissions
```ruby
sudo bundle install
```

#### 8. Start PostgreSQL in your local machine if not yet running

```ruby
brew services start postgresql@14
```

#### 9. Create and setup the database

```ruby
bundle exec rake db:create
```

#### 10. Start the Rails server in development mode

```ruby
rails s
```

#### 11. View the project

You can visit the website using the following URL: [http://localhost:3000](http://localhost:3000)

#### 12. Run RSpec Tests

```ruby
rspec -fd
```

## License & Copyright

Licensed under the [MIT License](LICENSE). ©2023 Cláudio Duarte
