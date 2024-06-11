task default: %w[onboard]

task :onboard do
    puts "Onboarding new user..."
    sh "brew bundle"
    sh 'echo \'eval "$(rbenv init -)"\' >> ~/.zshrc'
    sh "rbenv install --skip-existing 3.1.2"
    sh "rbenv local 3.1.2"
    sh "gem install bundler"
    sh "bundle install"
    sh "curl https://mise.run | sh"
    puts "Installing Mise for Tuist"
    sh 'echo \'eval "$(~/.local/bin/mise activate zsh)"\' >> ~/.zshrc'

    # Create a temporary script
    File.open('/tmp/temp_script.sh', 'w') do |file|
        file.puts 'source ~/.zshrc'
        file.puts 'mise install tuist@4.16.1'
        file.puts 'mise use tuist@4.16.1'
        file.puts 'tuist generate'
    end

    # Make the script executable
    sh "chmod +x /tmp/temp_script.sh"

    # Run the script using zsh
    sh "zsh /tmp/temp_script.sh"

    # Clean up
    sh "rm /tmp/temp_script.sh"
end
