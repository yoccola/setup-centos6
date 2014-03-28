#!/bin/bash

if [ ! $(grep single-request-reopen /etc/resolv.conf) ]; then
  echo 'options single-request-reopen' >> /etc/resolv.conf && service network restart
fi

