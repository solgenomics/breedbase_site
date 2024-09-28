
# Breedbase Site

You can easily create your own Breedbase site using this repo. For developers, the [```breedbase_dockerfile```](https://github.com/solgenomics/breedbase_dockerfile) repo is recommended.

## First Installation

As a prerequisite, you have to install [```docker```](https://docs.docker.com/engine/install/), [```docker compose```](https://docs.docker.com/compose/install/), and [```git```](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) on your machine; follow the instructions appropriate for your operating system.

After the installation of the prerequisites, clone this repo and start the docker from within the repo directory, then enter the docker and run the db update script:

```
git clone https://github.com/solgenomics/breedbase_site

cd breedbase_site

docker compose up -d

# enter into the docker
docker exec -it bb_web bash

# run the db update script
db/run_all_patches.pl -h bb_db -u postgres -p postgres -d breedbase -e admin -s 150
```
Change the password 
```
# log into docker

docker exec -it bb_web bash

# log into database

psql -h bb_db -U postgres breedbase

# change password

set search_path=sgn;
begin;
update sgn_people.sp_person set password=crypt('your new password', gen_salt('bf')) where username = 'admin';
commit;

# quit database
\q

```

A webpage should become accessible through a browser at ```localhost:8099```.

You can login using the following credentials:

username: ```admin```
password: ```password```

That's all there is to it!

## Updating an installation to the latest version

To update the docker, run the following steps:

```
cd breedbase_site

docker pull breedbase/breedbase:latest

docker compose down

docker compose up -d

docker exec -it bb_web bash

db/run_all_patches.pl -h bb_db -u postgres -p postgres -d breedbase -e admin -s 150
```


