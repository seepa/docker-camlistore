# Camlistore Docker


## Clean (re)build:

From the root of this repository, run:

```
docker build --no-cache -t camlistore .
```

Builds HEAD of camlistore with sqlite support.


## Running

```
docker run -p 3179:3179 \
  -v /host/path/to/config:/config \
  -v /host/path/to/store:/store \
  -it camlistore
```

The first time it runs, it will generate server config files. I've deliberately
not added any magic to go edit these, but you will need to do so in order to
open up the UI. Open up the `server-config.json` file in the config directory
and edit the "auth" parameter to something other than "localhost". For example,
"none" will do. For more info visit https://camlistore.org/doc/server-config.

The UI will live at: `http://localhost:3179`


## Docker-compose

Create a `docker-compose.yml` containing:

```
camlistore:
    image: camlistore
    ports:
        - "3179:3179"
    volumes:
        - ./config:/config
        - ./store:/store
```

Run with `docker-compose up -d`
