#!/bin/bash
if [ -z "${URL}" ]
  then
    read -p 'Enter VPN endpoint: '
    if [ -z "${REPLY}" ]
      then
	exit 1
    fi
    URL=${REPLY}
else
    echo "URL: ${URL}"
fi

if [ -z "${PROTOCOL}" ]
  then
    read -p 'Enter PASSWORD: '
    if [ -z "${REPLY}" ]
      then
	exit 1
    fi
    PROTOCOL=${REPLY}
else
    echo "PROTOCOL: ${PROTOCOL}"
fi


if [ -z "${USERNAME}" ]
  then
    read -p 'Enter PASSWORD: '
    if [ -z "${REPLY}" ]
      then
	exit 1
    fi
    USERNAME=${REPLY}
else
    echo "Username: ${USERNAME}"
fi

if [ -z "${PASSWORD}" ]
  then
    read -s -p 'Enter PASSWORD: '
    if [ -z "${REPLY}" ]
      then
	exit 1
    fi
    PASSWORD=${REPLY}
else
    echo "PASSWORD: *"
fi

# Start the second process
echo ${PASSWORD} | openconnect --protocol=${PROTOCOL} --csd-wrapper /vpn/hipreport.sh  ${URL} --user=${USERNAME} --passwd-on-stdin &
status=$?
if [ ${status} -ne 0 ]; then
  echo "Failed to start OpenConnect: ${status}"
  exit ${status}
fi
sleep 5
danted
status=$?
if [ ${status} -ne 0 ]; then
  echo "Failed to start Danted: ${status}"
  exit ${status}
fi
