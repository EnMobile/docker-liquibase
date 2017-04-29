#!/bin/bash
echo "Setting up liquibase"
: ${DB_ENV_USER?"DB_ENV_USER not set"}
: ${DB_ENV_PASSWORD?"DB_ENV_PASSWORD not set"}
: ${DB_SID?"DB_SID not set"}

cat <<CONF > /liquibase.properties
  driver: oracle.jdbc.driver.OracleDriver
  classpath:/usr/local/bin/ojdbc6.jar
  url: jdbc:oracle:thin:@db:1521/${DB_SID}
  username: $DB_ENV_USER
  password: $DB_ENV_PASSWORD
CONF
