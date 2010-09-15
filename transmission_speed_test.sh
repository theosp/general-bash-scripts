#!/bin/bash

# GPLed By - Daniel chcouri

# transmission_speed_test(url, requests, data)
transmission_speed_test ()
{
    url="$1" # url to test
    requests="$2" # number of requests
    data="$3" # if not empty - use post method with the given string as data

    if [[ -n "$data" ]]
    then
        # one non silent request for testing
        curl "$url" -d "$data" --output /dev/null
        time for ((x = 0 ; x < $requests ; x++)); do
            curl -s "$url" -d "$data" --output /dev/null &> /dev/null
        done
    else
        # one non silent request for testing
        curl "$url" --output /dev/null
        time for ((x = 0 ; x < $requests ; x++)); do
            curl -s "$url" --output /dev/null
        done
    fi
}

# if __name__ == "__main__": ;)
if [[ "$BASH_SOURCE" == "$0" ]]
then
    transmission_speed_test "$1" $2 "$3"
fi
