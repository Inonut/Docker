#!/bin/bash

#printf "$GIT_USER@$GIT_TOKEN" | secret-tool store --label="IntelliJ Platform Settings Repository — github.com" account $GIT_USER service 'IntelliJ Platform Settings Repository — github.com' xdg:schema com.intellij.credentialStore.Credential
#printf "89c7c84b-a4ce-4904-8ad8-5d404472c218@$GIT_TOKEN" | secret-tool store --label="IntelliJ Platform GitHub — 89c7c84b-a4ce-4904-8ad8-5d404472c218" account 89c7c84b-a4ce-4904-8ad8-5d404472c218 service 'IntelliJ Platform GitHub — 89c7c84b-a4ce-4904-8ad8-5d404472c218' xdg:schema com.intellij.credentialStore.Credential
#
#if [ ! -z $GIT_IDEA_SETTINGS ]; then
#  CURRENT_PATH=$(pwd)
#  if [ ! -d "$GIT_IDEA_SETTINGS" ]; then
#    git clone https://$GIT_TOKEN@github.com/$GIT_USER/$GIT_IDEA_SETTINGS.git
#    sudo mv ~/$GIT_IDEA_SETTINGS/ ~/.IntelliJIdea2019.2
#    sudo chmod -R ugo+rwx .IntelliJIdea2019.2
#  else
#    cd .IntelliJIdea2019.2
#    git pull
#  fi
#  cd $CURRENT_PATH
#fi

IDEA_SHORT_VERSION=$(echo $IDEA_VERSION | awk -F"[\.\-]" '{ print $1}').$(echo $IDEA_VERSION | awk -F"[\.\-]" '{ print $2}')
mkdir -p .IntelliJIdea$IDEA_SHORT_VERSION
sudo chmod -R ugo+rwx .IntelliJIdea$IDEA_SHORT_VERSION

/idea-IU/bin/idea.sh

#if [ ! -z $GIT_IDEA_SETTINGS ]; then
#  cd .IntelliJIdea2019.2
#  rm -fr "$(find ./ -iname eval 2>/dev/null | grep -e \..*/config/eval)"
#  rm -fr "$(find ./ -iname *statistics* 2>/dev/null | grep -e \..*/config/.*\.xml)"
#  sed -i.bak '/evlsprt*/d' $(find ./ -iname 'other.xml' 2>/dev/null | grep -e \..*/config/options/other\.xml)
#  git add .
#  git commit -m 'update'
#  git push
#fi
