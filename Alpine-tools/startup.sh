#printf "Inonut@eb4f4cebc00cc3b2adeb9560d6beb608601c523d" | secret-tool store --label="IntelliJ Platform Settings Repository — github.com" account Inonut service 'IntelliJ Platform Settings Repository — github.com' xdg:schema com.intellij.credentialStore.Credential

git clone https://github.com/Inonut/idea-settings.git
mv idea-settings .IntelliJIdea2019.2

/idea-IU-192.7142.36/bin/idea.sh

cd .IntelliJIdea2019.2
git add .
git commit -m 'update'
git push