# Dangerfile

# Constants
SEMANTIC_WORD_REGEX = /^(feat|fix|docs|style|refactor|perf|test|chore|build|ci|temp|revert):/
JIRA_TICKET_REGEX = /\[([A-Z0-9]+-\d+)\]/i
EMOJIS = ["🎉", "👍", "🚀", "🔥", "✨", "💪", "🤖", "🌟", "💯", "👌"]

ENCOURAGEMENT_MESSAGES = [
  "You rock! :sunglasses:",
  "Awesome job! :star:",
  "Keep up the great work! :muscle:",
  "You're amazing! :sparkles:",
  "Fantastic work! :clap:",
  "Great job! :trophy:",
  "Excellent contribution! :medal_sports:",
  "You're the best! :crown:",
  "Superb! :100:",
  "Way to go! :thumbsup:",
  "You're on fire! :fire:",
  "Keep shining! :sun_with_face:",
  "Impressive work! :raised_hands:",
  "You're a superstar! :star2:",
  "Well done! :ok_hand:",
  "You nailed it! :hammer:",
  "Top notch! :1st_place_medal:",
  "You're a genius! :brain:",
  "Outstanding! :clap::clap::clap:",
  "You're unstoppable! :rocket:",
  "Magnificent! :sparkler:",
  "Brilliant job! :bulb:",
  "You're a champion! :trophy:",
  "Exceptional work! :medal:",
  "Keep it up! :muscle::muscle:",
  "You're doing great! :smiley:",
  "Fantastic effort! :star_struck:",
  "You're a hero! :superhero:",
  "Amazing! :heart_eyes:",
  "Great contribution! :handshake:"
].shuffle

THANK_YOU_MESSAGES = [
  "Thanks for your contribution! :rocket:",
  "Much appreciated! :pray:",
  "Thank you! :blush:",
  "Many thanks! :thumbsup:",
  "Grateful for your help! :handshake:",
  "Thank you so much! :sparkling_heart:",
  "Big thanks! :clap:",
  "Thanks a lot! :star:",
  "Thank you very much! :grinning:",
  "Deeply appreciated! :sparkles:",
  "You have my gratitude! :heart:",
  "Thanks a bunch! :bouquet:",
  "Cheers! :beers:",
  "Warm thanks! :hugs:",
  "Thankful for your effort! :medal_sports:",
  "Much obliged! :trophy:",
  "Appreciate it! :muscle:",
  "Thank you kindly! :crown:",
  "You made a difference! :raised_hands:",
  "Heartfelt thanks! :heart_eyes:",
  "You're appreciated! :sun_with_face:",
  "You're a star! :star2:",
  "Can't thank you enough! :1st_place_medal:",
  "You're awesome! :sunglasses:",
  "Thank you for your hard work! :100:",
  "Your help is appreciated! :smiley:",
  "You're the best! :clap::clap::clap:",
  "Greatly appreciated! :rocket:",
  "You're a lifesaver! :superhero:",
  "Big shoutout to you! :mega:"
].shuffle

# Functions

# Check if the PR title contains a semantic word and a JIRA ticket link.
def check_pr_title
  unless github.pr_title.match?(SEMANTIC_WORD_REGEX)
    fail default_semantic_word_message
  end

  if (ticket = github.pr_title.match(JIRA_TICKET_REGEX))
    jira_link_message(ticket[1])
  else
    fail jira_ticket_error_message
  end

  unless valid_pr_title?(github.pr_title)
    suggested_title = suggest_pr_title(github.pr_title)
    warn pr_title_suggestion_message(suggested_title)
  end
end

# Check if the PR title has a semantic prefix, a JIRA ticket, and an emoji.
def valid_pr_title?(title)
  title.match?(SEMANTIC_WORD_REGEX) && title.match?(JIRA_TICKET_REGEX) && contains_emoji?(title)
end

# Check if the title contains an emoji.
def contains_emoji?(title)
  title.match?(/[\u{1F600}-\u{1F6FF}\u{1F300}-\u{1F5FF}\u{1F900}-\u{1F9FF}\u{1F680}-\u{1F6FF}]/)
end

# Check for the presence of app changes and corresponding test changes.
def check_test_changes
  has_app_changes = !git.modified_files.grep(/CAFU/).empty?
  has_test_changes = !git.modified_files.grep(/CAFUTests/).empty?

  if has_app_changes && !has_test_changes
    fail no_tests_added_message
  end
end

def no_tests_added_message
  <<~MESSAGE
    I see that no tests were modified. 

    Make sure tests have ran and added, or else... :eyes:

    ![hippo](https://appstickers-cdn.appadvice.com/1419071649/828045143/2b62722ea9fcdab3c088f7f54df39784-11.png)
  MESSAGE
end

# Encourage the contributor with a fun message.
def encourage_contributor
  author = github.pr_author
  unless author == "ahmed.ramy"
    message("@#{author}, #{ENCOURAGEMENT_MESSAGES.first}")
  end
end

# Thank the contributor for their work.
def thank_contributor
  message(":tada: #{THANK_YOU_MESSAGES.first}")
end

# Generate the error message for missing JIRA ticket link in the PR title.
def jira_ticket_error_message
  <<~MESSAGE
    PR title should contain a JIRA ticket link.

    Example:
    ```
    #      👇 we should add this
    feat: [XYZ-999] Add new feature 🔥
    ```

    JIRA Ticket format: [XYZ-999]
  MESSAGE
end

# Generate the warning message for suggesting the PR title.
def pr_title_suggestion_message(suggested_title)
  <<~MESSAGE
    Please update PR title to be like this: 

    ```
    #{suggested_title}
    ```

    This will play an important role in the release notes and changelog.

    Remember to write something clear for the QA and the product 😇
  MESSAGE
end

# Generate the message with the JIRA ticket link.
def jira_link_message(ticket)
  jira_url = "https://cafu.atlassian.net/browse/#{ticket}"
  message("JIRA ticket: [#{ticket}](#{jira_url})")
end

# Generate the default semantic word message.
def default_semantic_word_message
  <<~MESSAGE
    PR title should contain a semantic word at the beginning.
    Defaulting to **feat** for suggestions.

    Example:
    ```
    # 👇 we should add this
    feat: [XYZ-999] Add new feature 🔥
    ```

    Semantic words to pick from:
    - **feat**: A new feature
    - **fix**: A bug fix
    - **docs**: Documentation only changes
    - **style**: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
    - **refactor**: A code change that neither fixes a bug nor adds a feature
    - **perf**: A code change that improves performance
    - **test**: Adding missing tests or correcting existing tests
    - **chore**: Changes to the build process or auxiliary tools and libraries such as documentation generation
    - **build**: Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)
    - **ci**: Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs)
    - **temp**: Temporary commit that won't be included in the final release
    - **revert**: Revert a previous commit
  MESSAGE
end

# Suggest a PR title following the conventions.
def suggest_pr_title(title)
  title = add_random_emoji(title)
  title = correct_punctuation(title)
  
  semantic_word = extract_semantic_word(title) || "feat"
  jira_ticket = extract_jira_ticket(title) || "[XYZ-999]"
  title_without_metadata = clean_title_metadata(title, semantic_word, jira_ticket)

  "#{semantic_word}: [#{jira_ticket}] #{title_without_metadata}"
end

# Add a random emoji to the end of the PR title if it's not already there.
def add_random_emoji(title)
  unless title.match?(/[\u{1F600}-\u{1F6FF}\u{1F300}-\u{1F5FF}\u{1F900}-\u{1F9FF}\u{1F680}-\u{1F6FF}]/)
    title += " #{EMOJIS.sample}"
  end
  title
end

# Correct punctuation in the title.
def correct_punctuation(title)
  title = title.strip
  title += "." unless title.end_with?(".", "!", "?")
  title
end

# Extract the semantic word from the title.
def extract_semantic_word(title)
  title.match(/^(.*?):/)&.captures&.first
end

# Extract the JIRA ticket from the title.
def extract_jira_ticket(title)
  title.match(JIRA_TICKET_REGEX)&.captures&.first
end

# Clean the title by removing metadata.
def clean_title_metadata(title, semantic_word, jira_ticket)
  title_without_metadata = title.gsub(/^(.*?):/, "").gsub(JIRA_TICKET_REGEX, "").strip
  title_without_metadata.sub(/\b\w/, &:upcase)
end

# Check if the description has attachments or screenshots and write a collapsible message with a table of images.
def check_description_for_attachments
  # Extract attachments from the pull request description
  attachments = danger.github.pr_body.scan(/!\[.*?\]\((.*?)\)/).flatten
  appliedIdentifier = "--:|:--" # Part of the columns, if it exists that means it was applied
  suggestionAlreadyApplied = danger.github.pr_body.include?(appliedIdentifier)
  unless attachments.empty? || suggestionAlreadyApplied
    message(generate_collapsible_attachment_message(attachments))
    message(generate_markdown_code(attachments))
  end
end

# Generate a collapsible message with a table of attachments.
def generate_collapsible_attachment_message(attachments)
  table_rows = attachments.each_slice(3).map do |row|
    cells = row.map { |attachment| "<td style='width: 30%;'><img src='#{attachment}' style='width: 30%;'></td>" }
    # If the row has fewer than 3 cells, add empty cells to ensure the table has 3 columns
    cells += ["<td style='width: 30%;'></td>"] * (3 - cells.size)
    "<tr>#{cells.join}</tr>"
  end.join

  <<~MESSAGE
Noticed you have screenshots on your PR, I took the liberty organize them better for ya! :camera:
<details>
  <summary>Here's a preview</summary>
  <table>
    #{table_rows}
  </table>
</details>
  MESSAGE
end

# Generate the markdown code for the attachments in a table format.
def generate_markdown_code(attachments)
  markdown_rows = attachments.each_slice(3).map do |row|
    cells = row.map { |attachment| "| <img src='#{attachment}' style='width: 30%;'> " }
    # If the row has fewer than 3 cells, add empty cells to ensure the table has 3 columns
    cells += ["| "] * (3 - cells.size)
    cells.join
  end.join("|\n") + "|"

  # Header row and separator for markdown table
  header = "| | | |\n|:----------:|:----------:|:----------:|\n"

  <<~MESSAGE
    here's the code for the markdown, you can copy it for quicker access :heart:

    quick note, when u copy it, please remove the codeblock signs (```) so GitHub can render them correctly :rocket:

    ```markdown
    #{header}#{markdown_rows}
    ```
    MESSAGE
end

