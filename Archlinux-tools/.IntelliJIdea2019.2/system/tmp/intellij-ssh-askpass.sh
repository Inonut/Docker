#!/bin/sh
"/usr/lib/jvm/java-13-openjdk/bin/java" -cp "/opt/intellij-idea-ultimate-edition/plugins/git4idea/lib/git4idea-rt.jar:/opt/intellij-idea-ultimate-edition/lib/xmlrpc-2.0.1.jar:/opt/intellij-idea-ultimate-edition/lib/commons-codec-1.13.jar:/opt/intellij-idea-ultimate-edition/lib/util.jar" org.jetbrains.git4idea.nativessh.GitNativeSshAskPassApp "$@"
