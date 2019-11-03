printf "$GIT_USER@$GIT_TOKEN" | secret-tool store --label="IntelliJ Platform Settings Repository — github.com" account $GIT_USER service 'IntelliJ Platform Settings Repository — github.com' xdg:schema com.intellij.credentialStore.Credential
printf "89c7c84b-a4ce-4904-8ad8-5d404472c218@$GIT_TOKEN" | secret-tool store --label="IntelliJ Platform GitHub — 89c7c84b-a4ce-4904-8ad8-5d404472c218" account 89c7c84b-a4ce-4904-8ad8-5d404472c218 service 'IntelliJ Platform GitHub — 89c7c84b-a4ce-4904-8ad8-5d404472c218' xdg:schema com.intellij.credentialStore.Credential

if [ ! -z $GIT_IDEA_SETTINGS ]; then
  git clone https://$(secret-tool lookup account $GIT_USER | cut -d'@' -f2)@github.com/$GIT_USER/$GIT_IDEA_SETTINGS.git
  mv $GIT_IDEA_SETTINGS .IntelliJIdea2019.2
fi

/idea-IU-192.7142.36/bin/idea.sh

if [ ! -z $GIT_IDEA_SETTINGS ]; then
  cd .IntelliJIdea2019.2
  rm -fr "$(find ./ -iname eval 2>/dev/null | grep -e \..*/config/eval)"
  rm -fr "$(find ./ -iname *statistics* 2>/dev/null | grep -e \..*/config/.*\.xml)"
  sed -i.bak '/evlsprt*/d' $(find ./ -iname 'other.xml' 2>/dev/null | grep -e \..*/config/options/other\.xml)
  git add .
  git commit -m 'update'
  git push
fi
