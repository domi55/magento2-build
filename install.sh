#!/usr/bin/env bash

echo "Installing latest Magento2 OpenSource..."
composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition=${MAGENTO_VERSION} src

echo "Installing CI/CD packages..."
cd src
composer require miagi/magento2-cloud-build @dev --no-update
composer update
vendor/bin/px-cloud-build-install
cd ..
