#!/bin/bash
function db1 {
  read -p "Enter a value:" value
  echo "doubling the value"
  return $[ $value*2 ]
}
db1
echo "The new value is $?"
