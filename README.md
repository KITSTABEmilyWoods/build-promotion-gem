# BuildPromotionTool

The purpose of this tool is to automate semantic versioning updates to git tags. It will update the tag version number depending on the type of tag to be applied. The types of tags which can be applied are outlined in the config.yml file. A remote repository must exist in order to fetch all tags and to push new tags to the remote repository.

To apply the **first deploy tag (a develop or 'dev' tag)** , a search for all previously applied develop tags is conducted on the repository (local and remote). The tag version number is incremented, depending on the most recent develop tag version number, and on the type of version update selected (major, minor, or patch). Two develop tags cannot be applied to the same commit

To apply a **later tag type (such as stage or test)**, a tag of the preceding tag type must have been applied to the commit e.g. to apply a 'test' tag, a 'dev' tag must exist on the commit. The tag number applied will match that of the preceding tag type.

## Installation

Add the following line to your application's Gemfile:

```ruby
gem 'build_promotion_tool'
```

And then execute:

    $ bundle install

Or install it as:

    $ gem install build_promotion_tool

## Usage

__First Deploy Step: Dev Tag__
- Run:
```
    $ deploy dev
```

- If no prior develop tag has been assigned, the user will be asked whether they would like to assign the first develop tag. If they select yes, first tag 'dev-v0.0.1' is applied.
- If previous develop tags have been applied, the latest develop tag is displayed and the user is asked whether they would like to do a `major/ma`, `minor/mi`, or `patch/p` update. See: [Semantic Versioning](http://semver.org).
- The user inputs their choice, the user is shown the new tag (e.g. dev-v0.1.2) and is asked to confirm their choice and apply the tag.
- When the user selects yes to updating the tag, the tag version number is updated.
- The tag is then added to the repository and pushed to the remote.

__Later Deploy Steps: E.g. Test, Stage Tags__
- To see the list of tags which can be applied, the config.yml file should be reviewed
- For example run:
```
    $ deploy test
```
- A tag can only be applied, if a tag of the preceding type has been applied. E.g. to apply a test tag, a develop tag must exist for this commit; to apply a stage tag, a test tag must exist for this commit. If it does not, an error message is displayed.
- If the preceding tag type exists for this commit, the user is shown the new tag (e.g. test-v0.1.2) and asked if they would like to apply it.
- If the user selects yes, then the tag is applied
- The tag is then added to the repository and pushed to the remote.

## Development

After checking out the repo, run `bin/setup` to install dependencies.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).
