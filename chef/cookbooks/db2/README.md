Db2 Cookbook
============

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


Requirements
------------

### Platform:

*No platforms defined*

### Cookbooks:

* ibm_cloud_utils
* linux

Attributes
----------

<table>
  <tr>
    <td>Attribute</td>
    <td>Description</td>
    <td>Default</td>
  </tr>
  <tr>
    <td><code>node['db2']['das_password']</code></td>
    <td>DB2 Administration Server (DAS) password</td>
    <td><code></code></td>
  </tr>
  <tr>
    <td><code>node['db2']['das_username']</code></td>
    <td>DB2 Administration Server (DAS) username</td>
    <td><code>db2das1</code></td>
  </tr>
  <tr>
    <td><code>node['db2']['database']['db01']['codeset']</code></td>
    <td>codeset</td>
    <td><code>UTF-8</code></td>
  </tr>
  <tr>
    <td><code>node['db2']['database']['db01']['db_data_path']</code></td>
    <td>db_data_path</td>
    <td><code>/home/db2inst1</code></td>
  </tr>
  <tr>
    <td><code>node['db2']['database']['db01']['db_name']</code></td>
    <td>db_name</td>
    <td><code>db01</code></td>
  </tr>
  <tr>
    <td><code>node['db2']['database']['db01']['db_path']</code></td>
    <td>db_path</td>
    <td><code>/home/db2inst1</code></td>
  </tr>
  <tr>
    <td><code>node['db2']['database']['db01']['instance_username']</code></td>
    <td>instance_username</td>
    <td><code>db2inst1</code></td>
  </tr>
  <tr>
    <td><code>node['db2']['database']['db01']['pagesize']</code></td>
    <td>pagesize</td>
    <td><code>4096</code></td>
  </tr>
  <tr>
    <td><code>node['db2']['database']['db01']['territory']</code></td>
    <td>territory</td>
    <td><code>US</code></td>
  </tr>
  <tr>
    <td><code>node['db2']['fixpack']</code></td>
    <td>The Fixpack of DB2 to install.</td>
    <td><code>0</code></td>
  </tr>
  <tr>
    <td><code>node['db2']['included_fixpack']</code></td>
    <td>The Fixpack of DB2 included in base package.</td>
    <td><code>8</code></td>
  </tr>
  <tr>
    <td><code>node['db2']['install_dir']</code></td>
    <td>The directory to install DB2 Binaries, reccomended /opt/ibm/db2/V<db2_version></td>
    <td><code>/opt/ibm/db2/V10.5</code></td>
  </tr>
  <tr>
    <td><code>node['db2']['instance']['default']['database_data_dir']</code></td>
    <td>database_data_dir</td>
    <td><code>/home/db2inst1</code></td>
  </tr>
  <tr>
    <td><code>node['db2']['instance']['default']['fcm_port']</code></td>
    <td>fcm_port</td>
    <td><code>60000</code></td>
  </tr>
  <tr>
    <td><code>node['db2']['instance']['default']['fenced_groupname']</code></td>
    <td>fenced_groupname</td>
    <td><code>db2fadm</code></td>
  </tr>
  <tr>
    <td><code>node['db2']['instance']['default']['fenced_password']</code></td>
    <td>fenced_password</td>
    <td><code></code></td>
  </tr>
  <tr>
    <td><code>node['db2']['instance']['default']['fenced_username']</code></td>
    <td>fenced_username</td>
    <td><code>db2fenc1</code></td>
  </tr>
  <tr>
    <td><code>node['db2']['instance']['default']['instance_groupname']</code></td>
    <td>instance_groupname</td>
    <td><code>db2iadm1</code></td>
  </tr>
  <tr>
    <td><code>node['db2']['instance']['default']['instance_password']</code></td>
    <td>instance_password</td>
    <td><code></code></td>
  </tr>
  <tr>
    <td><code>node['db2']['instance']['default']['instance_prefix']</code></td>
    <td>Instance prefix</td>
    <td><code>DB2_INST</code></td>
  </tr>
  <tr>
    <td><code>node['db2']['instance']['default']['instance_type']</code></td>
    <td>Instance type</td>
    <td><code>ESE</code></td>
  </tr>
  <tr>
    <td><code>node['db2']['instance']['default']['instance_username']</code></td>
    <td>instance_username</td>
    <td><code>db2inst1</code></td>
  </tr>
  <tr>
    <td><code>node['db2']['instance']['default']['port']</code></td>
    <td>port</td>
    <td><code>50000</code></td>
  </tr>
  <tr>
    <td><code>node['db2']['modpack']</code></td>
    <td>DB2 modification level</td>
    <td><code>0</code></td>
  </tr>
  <tr>
    <td><code>node['db2']['version']</code></td>
    <td>The Version of DB2 to install.</td>
    <td><code>10.5</code></td>
  </tr>
</table>

Recipes
-------

### db2::cleanup.rb


Cleanup recipe (cleanup.rb)
This recipe will remove any temporary installation files created as part of the automation.


### db2::create_database.rb


create database recipe (create_database.rb)
This recipe creates new db2 databases.


### db2::create_instance.rb


create instance recipe (create_instance.rb)
This recipe creates new db2 instances.


### db2::default.rb


Default recipe (default.rb)
The default recipe for the cookbook. It is recommended to not use the default recipe, but explicitly specify a run_list for the deployment node.


### db2::fixpack.rb


Fixpack recipe (fixpack.rb)
This recipe performs product fixpack installation.


### db2::gather_evidence.rb


Evidence gathering recipe (gather_evidence.rb)
This recipe will collect functional product information and store it in an archive.


### db2::harden.rb


Product hardening recipe (harden.rb)
This recipe performs security hardening tasks.


### db2::install.rb


Installation recipe (install.rb)
This recipe performs the product installation.


### db2::prereq.rb


Prerequisite recipe (prereq.rb)
This recipe configures the operating prerequisites for the product.


### db2::prereq_check.rb


Prerequisites check recipe (prereq_check.rb)
Recipe to ensure that pre-requisites are in place for a cookbook to run.



License and Author
------------------

Author:: IBM Corp (<>)

Copyright:: 2017, IBM Corp

License:: Copyright IBM Corp. 2017, 2017
