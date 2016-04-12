# An example puppet file which installs CMSSW into 
# /opt/cms.
package {["HEP_OSlibs_SL6", "e2fsprogs"]:
  ensure => present,
}->
file {"/etc/sudoers.d/999-cmsbuild-requiretty":
   content => "Defaults:root !requiretty\n",
}->
user {"cmsbuild":
  ensure => present,
}->
file {"/opt":
  ensure => directory,
}->
file {"/opt/cms":
  ensure => directory,
  owner => "cmsbuild",
}->
package {"cms+cmssw+CMSSW_8_1_0_pre2":
  ensure             => present,
  provider           => cmsdist,
  install_options    => [{
    "install_prefix" => "/opt/cms",
    "install_user"   => "cmsbuild",
    "architecture"   => "slc6_amd64_gcc530",
    "server"         => "cmsrep.cern.ch",
    "server_path"    => "cmssw/cms",
  }]
}
