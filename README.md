# GitHub Reactions

A simple command line tool to show numbers of reactions on GitHub issues and pull requests.

## Usage

```shell
$ gem install github_reactions

$ ACCESS_TOKEN=your-github-access-token github_reactions get github/graphql-client
# Alternatively, `ghr` is totally the same as `github_reactions` command
```

The command results below:

```shell
Fetched 100 / 145... 👍
Fetched 145 / 145... ❤
+-----------------------+-----------------------+
| github/graphql-client has 55 reactions so far |
+-----------------------+-----------------------+
| Emoji                 | Count                 |
+-----------------------+-----------------------+
| HEART                 |                    21 |
| HOORAY                |                     7 |
| THUMBS_UP             |                    26 |
| THUMBS_DOWN           |                     1 |
+-----------------------+-----------------------+
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ohbarye/github_reactions. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

