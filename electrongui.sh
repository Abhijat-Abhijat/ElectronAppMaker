#!/bin/bash
if (which node)
then 
 echo "node present"
 if (which npm)
 then
  echo "npm present"
 else
  sudo apt install npm
 fi
else
 sudo apt install nodejs
fi
var=$(zenity --entry --title="title" --text="Enter Url")
mkdir test
cd test
cp ~/Documents/index.js .
npm init -y
npm i --save-dev electron
filename="package.json"
sed -i "s/test/start/" $filename
echo "done"
sed -i "s|Error: no test specified||" $filename
sed -i "s|&& exit 1||" $filename
sed -i 's|/"/"||' $filename
sed -i "s|echo |electron .|" $filename
echo "done"
filename="index.js"
sed -i "s|urls|$var|" $filename
echo "done"
io.elementary.code package.json
# npm start
npm install electron-packager --save-dev
npx electron-packager . test --overwrite --asar=true --platform=linux --arch=x64 --prune=true --out=release-builds

