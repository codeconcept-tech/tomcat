# execute useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat
user 'tomcat' do
  comment 'A user for tomcat'
  system true
  home '/opt/tomcat'
  shell '/bin/false'
  action :create
end

# execute wget http://www-eu.apache.org/dist/tomcat/tomcat-9/v9.0.24/bin/apache-tomcat-9.0.24.tar.gz -P /tmp

remote_file 'apache-tomcat-9.0.24.tar.gz' do
  source 'http://www-eu.apache.org/dist/tomcat/tomcat-9/v9.0.24/bin/apache-tomcat-9.0.24.tar.gz'
  path '/tmp/apache-tomcat-9.0.24.tar.gz'
  action :create
end

# execute tar xf /tmp/apache-tomcat-9.0.24.tar.gz -C /opt/tomcat

archive_file 'extract_tomcat' do
  destination '/opt/tomcat'
  path '/tmp/apache-tomcat-9.0.24.tar.gz'
  action :extract
end

# execute ln -s /opt/tomcat/apache-tomcat-9.0.24 /opt/tomcat/latest
link '/opt/tomcat/latest' do
  link_type :symbolic
  target_file '/opt/tomcat/latest'
  to '/opt/tomcat/apache-tomcat-9.0.24'
  action :create
end

# execute chown -RH tomcat: /opt/tomcat/latest
execute 'chown -RH tomcat: /opt/tomcat/latest' do
  command 'chown -RH tomcat: /opt/tomcat/latest'
  action :run
end