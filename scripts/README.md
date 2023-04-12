# Installation docker by bash script

To install docker, if you are in Iran, you must first have a way to pass the filter.

That's why I wrote [set-dns](https://github.com/Amin-mashari/docker-installation/blob/main/scripts/set-dns.sh) script that you can use, otherwise you can use [install-docker](https://github.com/Amin-mashari/docker-installation/blob/main/scripts/install-docker.sh) script to install docker automatically.


## Usage

### usage set-dns.sh
```bash
## To be effective and more convenient, it's better to run it with the root user.

# Make file executable
$ chmod +x ./set-dns.sh

# Run script
$ ./set-dns.sh

# Use help to work with the script
$ ./set-dns.sh -h
```

### usage install-docker.sh
```bash
## To be effective and more convenient, it's better to run it with the root user.

# Make file executable
$ chmod +x ./install-docker.sh

# Run script
$ ./install-docker.sh
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
