# docker-postfix

Docker image for Postfix mail service.

This image runs only a [Postfix](http://www.postfix.org/) process
so nor pop3 or imap services are supported.

This is a "mail send" only installation, no relay, no receiving emails.

## Installation

Pull the image from the docker hub:

```shell
docker pull emarcs/postfix
```

## Configuring Postfix

Postfix is huge and has hundreds of configuration parameters.

Two config files are the main actors in the configuration:

*   **main.cf**: specifies the options for running Postfix.
*   **master.cf**: specifies the services Postfix should run.

Tutorial and examples for configuring Postfix can be found online,
it's not an easy task for a newcomer, but starting with the
official documentation is always a good thing:

*   [Postfix Basic Configuration](http://www.postfix.org/BASIC_CONFIGURATION_README.html)
*   [Postfix SMTP relay and access control](http://www.postfix.org/SMTPD_ACCESS_README.html)

## Running the container

Run the container with docker-compose:

```yml
main_srv:
  image: emarcs/postfix
  ports:
    - "25:25"
  volumes:
    - ./data/spool/:/var/spool/postfix
    - ./data/log/:/var/log/postfix
    - ./main.cf:/etc/postfix/main.cf
    - ./master.cf:/etc/postfix/master.cf
```

As you see in the example above the configuration files are
mounted with compose in the postfix configuration folder.

Also Is important to save store the spool folder outside the
container, the spool folder contains the email data of the
mailboxes. In this case is not critical to do that, because for
now this is a send only container.
