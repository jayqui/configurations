* Theme: Settings > Appearance & Behavior > Appearance > Theme: Darcula
* Editor Colors: Settings > Editor > Color Scheme > Scheme: Monokai
* Font: Settings > Editor > Font > Font: Meslo LG M DZ for Powerline
* Ruby Version: Settings > Languages & Frameworks > Ruby SDK and Gems > select a non-system Ruby version
* EOF newline: Settings > Editor > General > Ensure every saved file ends with a line break
* Tabs: Settings > Editor > Editor Tabs > Show Tabs In: Multiple Rows
* Copy from Repository Root: Settings > Keymap
   * search for 'copy'
   * un-assign Cmd+Shift+C from Absolute Path
   * assign Cmd+Shift+C to Path from Repository Root
* ESLint: Settings > Keymap
   * find and remove all Ctrl + Option + E shortcuts
   * Add Ctrl + Option + E for 'Fix ESLint Problems'
* Live Templates: Settings > Editor > Live Templates > add the following.
* GitLink: See below

### My live templates

#### `ps`

```ruby
puts "===> $VAR$: #{($VAR$).inspect}"
```

#### `puts`

```ruby
puts "\n" * 3
puts "===== $THING$: #{($THING$).inspect}"
puts "\n" * 3
```

#### `con`

```js
console.log("===> $VAR$: ", $VAR$);
```

### GitLink

1. Install the GitLink plugin.
2. Go to Preferences > Tools > GitLink > Custom Hosts.
3. Add a custom host:
    * Name: Omada GitLab (or whatever you prefer)
    * Domain: git.omadahealth.net
    * File at branch template: {remote:url}/-/blob/{branch}/{file:path}/{file:name}#L{line:start}-L{line:end}
    * File at commit template: {remote:url}/-/blob/{commit}/{file:path}/{file:name}#L{line:start}-L{line:end}
    * Commit template: {remote:url}/commit/{commit}
4. Restart RubyMine. You should see a notification saying "GitLink has detected Omada GitLab as your remote host".

Now, when you right-click on a file, line of code, or (in the Git panel) a commit, you will get the option to Open in Omada GitLab. And it will take you straight to the file in our self-hosted GitLab. Or, for getting URLs to copy into Slack, Copy Omada GitLab link.
SO. CRAZY.
