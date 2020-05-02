Deploying ARA to Google Cloud
=============================

This is automation for deploying an instance of
`ARA <https://ara.recordsansible.org/>`_ to a
Google Cloud project.

Pre-conditions
==============

There are a few things which are unavoidably manual,
and a few assumptions.

We assume you have ``gcloud`` installed and authenticated,
as well as a Docker installation.

Then there's some steps:

* Create a Google Cloud Project.

* Set the project:

.. code-block:: bash

  gcloud config set project my-awesome-project-123456

* Configure a serivice account in the project called "ara-deploy"

* Grant Project Owner role to the service account (yup, that's absurd)

* Run the setup-docker.sh script:

.. note::

  The setup-docker.sh makes changes to your local docker config. There
  may be some overlap issues here. Later on we'd do this with an actual
  CI/CD setup, but that's also overkill for now - but you know your
  local setup better than I do, so please be careful.

.. code-block:: bash

  ./setup-docker.sh


Build and Push Images
=====================

Now that that's done, build the images and push them to the GCR registry for the project:

.. code-block:: bash

  ./build-images.sh
  ./push-images.sh
