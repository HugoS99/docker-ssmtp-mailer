#!/bin/sh

: ${FROM_EMAIL:?Variable FROM_EMAIL is required!}
: ${SMTP_HOST:?Variable SMTP_HOST is required!}


if [ "${FROM_NAME}" == "" ]; then FROM_NAME="${FROM_EMAIL}"; else FROM_NAME="=?utf-8?B?"$(echo "${FROM_NAME}" | base64)"?="; fi;

cat > /etc/ssmtp/ssmtp.conf << EOF
mailhub=${SMTP_HOST}
EOF

usermod -c "${FROM_NAME}" root

cat > /etc/ssmtp/revaliases << EOF
root:${FROM_EMAIL}:${SMTP_HOST}
EOF
