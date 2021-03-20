#!/bin/bash
cd ../webapp-gh-pages

rm -rf $(ls -a -I '.' -I '..' -I '.git')

docker pull ozelot379/convert-minecraft-java-texture-to-bedrock-webapp

docker run -d --name convert-minecraft-java-texture-to-bedrock-webapp ozelot379/convert-minecraft-java-texture-to-bedrock-webapp

docker cp convert-minecraft-java-texture-to-bedrock-webapp:/usr/local/apache2/htdocs/ ./

docker container rm convert-minecraft-java-texture-to-bedrock-webapp -f

cp -r htdocs/* .

rm -rf htdocs
