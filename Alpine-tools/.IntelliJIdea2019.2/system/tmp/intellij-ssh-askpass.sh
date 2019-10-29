#!/bin/sh
"/usr/lib/jvm/java-1.8-openjdk/jre/bin/java" -cp "/idea-IU-192.7142.36/plugins/git4idea/lib/git4idea-rt.jar:/idea-IU-192.7142.36/lib/xmlrpc-2.0.1.jar:/idea-IU-192.7142.36/lib/commons-codec-1.13.jar:/idea-IU-192.7142.36/lib/util.jar" org.jetbrains.git4idea.nativessh.GitNativeSshAskPassApp "$@"
