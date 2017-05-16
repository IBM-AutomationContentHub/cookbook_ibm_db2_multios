name             'db2'
maintainer       'IBM Corp'
maintainer_email ''
license          'Copyright IBM Corp. 2017, 2017'
depends          'ibm_cloud_utils'
depends          'linux'
description <<-EOH
## DESCRIPTION
The db2 cookbook contains features and functions to support the installation and management of IBM DB2.
## Platforms Support
* RHEL 6.x
## Versions
* IBM DB2 V10.5
## Use Cases
* Single installation with no configuration.
* SIngle installation with 1..n instances defined.
* SIngle installation with 1..n instances defined and 1..n databases defined for each instance
## Platform Pre-Requisites
* Linux YUM Repository - An onsite linux YUM Repsoitory is required.
## Software Repository
SW_REPO_ROOT -> Stored in the ['ibm']['sw_repo_root'] attribute.
Relative to the software repository, the installation files must be stored in the following location.
* BASE FILES   -> /db2/v105/base
* FIXPACK FILES -> /db2/v105/maint
The following is a description of files needed on the REPO Server depending on version and architecture.
```python
case node['platform_family']
when 'rhel'
  case node['kernel']['machine']
  when 'x86_64'
    default['db2']['arch'] = 'x86-64'
    # <> DB2 Version 10.5.0.3, 10.5.0.8
    force_override['db2']['archive_names'] = {
      '10.5.0.3' => { 'filename' => 'DB2_Svr_' + node['db2']['version'] + '.' + node['db2']['modpack'] + '.'+ node['db2']['included_fixpack'] + '_Linux_' + node['db2']['arch'] + '.tar.gz',
                      'sha256' => 'd5844d395c66470f39db13ba2491b2036c2d6b50e89c06d46f3d83f4b6f093a7' },
      '10.5.0.8' => { 'filename' => 'DB2_Svr_' + node['db2']['version'] + '.' + node['db2']['modpack'] + '.'+ node['db2']['included_fixpack'] + '_Linux_' + node['db2']['arch'] + '.tar.gz',
                      'sha256' => '79233751b83a0acde01b84bbd506b8fe917a29a4ed08852ae821090ce2fc0256' },
      '11.1.0.0' => { 'filename' => 'DB2_Svr_' + node['db2']['version'] + '_Linux_' + node['db2']['arch'] + '.tar.gz', #~ip_checker
                      'sha256' => '635f1b64eb48ecfd83aface91bc4b99871f12b7d5c41e7aa8f8b3d275bcb7f04' }
    }
    # <> DB2 Fixpack package
    force_override['db2']['fixpack_names'] = {
      '10.5'  => { 'filename' => 'v' + node['db2']['version'] + 'fp' + node['db2']['fixpack'] + '_linuxx64_server_t.tar.gz' },
      '11.1'  => { 'filename' => 'v' + node['db2']['version']+ '.' + node['db2']['modpack'] + 'fp' + node['db2']['fixpack'] + '_linuxx64_server_t.tar.gz' }
    }
  end
end
```
EOH
version '0.1.16'
attribute 'db2/das_password',
          :default => '',
          :description => 'DB2 Administration Server (DAS) password',
          :displayname => 'das_password',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'true',
          :selectable => 'false',
          :type => 'string'
attribute 'db2/das_username',
          :default => 'db2das1',
          :description => 'DB2 Administration Server (DAS) username',
          :displayname => 'das_username',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'false',
          :type => 'string'
attribute 'db2/database/db01/codeset',
          :default => 'UTF-8',
          :description => 'codeset',
          :displayname => 'codeset',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'false',
          :type => 'string'
attribute 'db2/database/db01/db_data_path',
          :default => '/home/db2inst1',
          :description => 'db_data_path',
          :displayname => 'db_data_path',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'false',
          :type => 'string'
attribute 'db2/database/db01/db_name',
          :default => 'db01',
          :description => 'db_name',
          :displayname => 'db_name',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'false',
          :type => 'string'
attribute 'db2/database/db01/db_path',
          :default => '/home/db2inst1',
          :description => 'db_path',
          :displayname => 'db_path',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'false',
          :type => 'string'
attribute 'db2/database/db01/instance_username',
          :default => 'db2inst1',
          :description => 'instance_username',
          :displayname => 'instance_username',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'false',
          :type => 'string'
attribute 'db2/database/db01/pagesize',
          :default => '4096',
          :description => 'pagesize',
          :displayname => 'pagesize',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'false',
          :type => 'string'
attribute 'db2/database/db01/territory',
          :default => 'US',
          :description => 'territory',
          :displayname => 'territory',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'false',
          :type => 'string'
attribute 'db2/fixpack',
          :choice => ['0', '7', '8'],
          :default => '0',
          :description => 'The Fixpack of DB2 to install.',
          :displayname => 'DB2Fixpack',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'db2/included_fixpack',
          :choice => ['0', '3', '8'],
          :default => '8',
          :description => 'The Fixpack of DB2 included in base package.',
          :displayname => 'DB2IncludedFixpack',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'db2/install_dir',
          :choice => ['/opt/ibm/db2/V10.5', '/opt/ibm/db2/V11.1'],
          :default => '/opt/ibm/db2/V10.5',
          :description => 'The directory to install DB2 Binaries, reccomended /opt/ibm/db2/V<db2_version>',
          :displayname => 'InstallDir',
          :parm_type => 'component',
          :precedence_level => 'role',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'db2/instance/default/database_data_dir',
          :default => '/home/db2inst1',
          :description => 'database_data_dir',
          :displayname => 'database_data_dir',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'false',
          :type => 'string'
attribute 'db2/instance/default/fcm_port',
          :default => '60000',
          :description => 'fcm_port',
          :displayname => 'fcm_port',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'false',
          :type => 'string'
attribute 'db2/instance/default/fenced_groupname',
          :default => 'db2fadm',
          :description => 'fenced_groupname',
          :displayname => 'fenced_groupname',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'false',
          :type => 'string'
attribute 'db2/instance/default/fenced_password',
          :default => '',
          :description => 'fenced_password',
          :displayname => 'fenced_password',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'true',
          :selectable => 'false',
          :type => 'string'
attribute 'db2/instance/default/fenced_username',
          :default => 'db2fenc1',
          :description => 'fenced_username',
          :displayname => 'fenced_username',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'false',
          :type => 'string'
attribute 'db2/instance/default/instance_groupname',
          :default => 'db2iadm1',
          :description => 'instance_groupname',
          :displayname => 'instance_groupname',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'false',
          :type => 'string'
attribute 'db2/instance/default/instance_password',
          :default => '',
          :description => 'instance_password',
          :displayname => 'instance_password',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'true',
          :selectable => 'false',
          :type => 'string'
attribute 'db2/instance/default/instance_prefix',
          :default => 'DB2_INST',
          :description => 'Instance prefix',
          :displayname => 'instance_prefix',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'false',
          :type => 'string'
attribute 'db2/instance/default/instance_type',
          :default => 'ESE',
          :description => 'Instance type',
          :displayname => 'instance_type',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'false',
          :type => 'string'
attribute 'db2/instance/default/instance_username',
          :default => 'db2inst1',
          :description => 'instance_username',
          :displayname => 'instance_username',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'false',
          :type => 'string'
attribute 'db2/instance/default/port',
          :default => '50000',
          :description => 'port',
          :displayname => 'port',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'false',
          :type => 'string'
attribute 'db2/modpack',
          :choice => ['0', '1'],
          :default => '0',
          :description => 'DB2 modification level',
          :displayname => 'DB2ModPack',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
attribute 'db2/version',
          :choice => ['10.5', '11.1'],
          :default => '10.5',
          :description => 'The Version of DB2 to install.',
          :displayname => 'DB2Version',
          :parm_type => 'node',
          :precedence_level => 'node',
          :required => 'recommended',
          :secret => 'false',
          :selectable => 'true',
          :type => 'string'
recipe 'db2::cleanup.rb', '
Cleanup recipe (cleanup.rb)
This recipe will remove any temporary installation files created as part of the automation.
'
recipe 'db2::create_database.rb', '
create database recipe (create_database.rb)
This recipe creates new db2 databases.
'
recipe 'db2::create_instance.rb', '
create instance recipe (create_instance.rb)
This recipe creates new db2 instances.
'
recipe 'db2::default.rb', '
Default recipe (default.rb)
The default recipe for the cookbook. It is recommended to not use the default recipe, but explicitly specify a run_list for the deployment node.
'
recipe 'db2::fixpack.rb', '
Fixpack recipe (fixpack.rb)
This recipe performs product fixpack installation.
'
recipe 'db2::gather_evidence.rb', '
Evidence gathering recipe (gather_evidence.rb)
This recipe will collect functional product information and store it in an archive.
'
recipe 'db2::harden.rb', '
Product hardening recipe (harden.rb)
This recipe performs security hardening tasks.
'
recipe 'db2::install.rb', '
Installation recipe (install.rb)
This recipe performs the product installation.
'
recipe 'db2::prereq.rb', '
Prerequisite recipe (prereq.rb)
This recipe configures the operating prerequisites for the product.
'
recipe 'db2::prereq_check.rb', '
Prerequisites check recipe (prereq_check.rb)
Recipe to ensure that pre-requisites are in place for a cookbook to run.
'