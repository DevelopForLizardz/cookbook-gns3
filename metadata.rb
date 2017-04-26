name 'gns3'
maintainer 'Ryan Drew'
maintainer_email 'developforlizardz@gmail.com'
license 'MIT'
description 'Installs/Configures cookbook-gns3'
long_description 'Installs/Configures cookbook-gns3'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/cookbook-gns3/issues'

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/cookbook-gns3'

depends 'kvm'
