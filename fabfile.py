import fnmatch
import os
import shutil

from fabric.api import local, task


OUTPUT_DIR = 'output'


@task
def clean():
    if os.path.exists(OUTPUT_DIR):
        print "Directory '%s' already exists and will be deleted before continuing" % OUTPUT_DIR
        shutil.rmtree(OUTPUT_DIR)

    os.mkdir(OUTPUT_DIR)

@task
def build(template_file):
    local("packer build --force %s" % template_file)

@task(default=True)
def rebuild_all():
    clean()

    for filename in fnmatch.filter(os.listdir('.'), '*.json'):
        build(filename)

    print
    print 'Please remember to upload the generated OVA files to http://vm.petarmaric.com/acs/'
