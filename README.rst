About
=====

An automated `Packer`_ based system for building VirtualBox images, which have
been preconfigured to make coursework easier for our `ACS`_ students.


Quick start
===========

Please follow these steps:

#. Download and install `VirtualBox`_

#. Download one of `these OVA files`_

#. Open the downloaded OVA file, which should start up the VirtualBox
   virtual machine `import process`_

#. Once the import is complete, start up the resulting VirtualBox virtual
   machine

You should now be ready to do your `ACS`_ related coursework hassle-free.
Good luck :)

.. _`Packer`: https://www.packer.io/
.. _`ACS`: http://www.acs.uns.ac.rs/
.. _`VirtualBox`: https://www.virtualbox.org/
.. _`these OVA files`: http://vm.petarmaric.com/acs/
.. _`import process`: https://www.virtualbox.org/manual/ch01.html#ovf


Building VirtualBox images
==========================

*If you're an ACS student you can probably skip right ahead to the next section*

The following software must be installed on your workstation before you can use
Packer to build VirtualBox images:

* `Fabric`_

* `Packer`_

* `VirtualBox`_

To rebuild all of the VirtualBox images simply run::

    $ fab rebuild_all

And if you want to build a specific Packer template (i.e.
``ubuntu-desktop-1404-tmd018.json``)::

    $ packer build ubuntu-desktop-1404-tmd018.json

.. _`Fabric`: http://www.fabfile.org/


Contribute
==========

If you find any bugs, or wish to propose new features `please let us know`_. 

If you'd like to contribute, simply fork `the repository`_, commit your changes
and send a pull request. Make sure you add yourself to `AUTHORS`_.

.. _`please let us know`: https://bitbucket.org/petar/packer-acs-templates/issues/new
.. _`the repository`: http://bitbucket.org/petar/packer-acs-templates
.. _`AUTHORS`: https://bitbucket.org/petar/packer-acs-templates/src/default/AUTHORS
