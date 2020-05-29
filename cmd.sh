
#!/bin/sh
cd /root/app
rm -rf saipan/
git clone -b $BRANCH_NAME 「Git仓库地址」
cd saipan/
mvn install -Dmaven.test.skip=true -P$PROFILE_NAME
cd $PROJECT_NAME/
mvn package -Dmaven.test.skip=true -P$PROFILE_NAME
cd target/
package=`ls -t  $PROJECT_NAME-*.jar | head -1`
java -Duser.timezone=GMT+8 -Xms256M -Xmx512M -jar $package --spring.profiles.active=$PROFILE_NAME
