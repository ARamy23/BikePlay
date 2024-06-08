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
    sh 'source ~/.zshrc'
    sh "mise install tuist@4.16.1"
    sh "mise use tuist@4.16.1"
    sh "tuist generate"
end
