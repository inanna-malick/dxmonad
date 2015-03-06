FROM postgres:9.4

#If you wish to keep the configuration files elsewhere than the data directory,
#the postgres -D command-line option or PGDATA environment variable must point to 
#the directory containing the configuration files, and the data_directory parameter must 
#be set in postgresql.conf (or on the command line) to show where the data directory is 
#actually located. Notice that data_directory overrides -D and PGDATA for the location 
#of the data directory, but not for the location of the configuration files.

ADD postgresql.conf /postgresql.conf
RUN chown postgres:postgres /postgresql.conf
RUN chmod 700 /postgresql.conf

#RUN mkdir /docker-entrypoint-initdb.d
ADD shim.sh /docker-entrypoint-initdb.d/shim.sh


# add script to that one dir to mv this to the data volume
