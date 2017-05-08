case node['kernel']['machine']
when 'x86_64'
  yum_repository 'mongodb' do
    description "MongoDB Repository"
    baseurl 'http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/'
    gpgcheck false
    action :add
  end
when 'i386'
  yum_repository 'mongodb' do
    description "MongoDB Repository"
    baseurl 'http://downloads-distro.mongodb.org/repo/redhat/os/i686/'
    gpgcheck false
    action :add
  end
end

package 'mongodb-org'

service 'mongod' do
  action [:enable, :start]
end
