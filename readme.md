# Development Environment using Docker


## Background 
this repository is intended to do project development for old stack

| No | Item        | Value  |
|----|-------------|--------|
| 1  | PHP version | 7.0    |
| 2  | Ubuntu      | 16.04  |
| 3  | MySQL       | 5.7.33 |


## Commands


```shell
# build image
docker build --network=host .

# clone repo as submodule
cd src
git submodule add -f git@github.com:drosanda/ptbii_erp.git

# run the development container
docker compose up -d

# stop the development container
docker compose down
```

