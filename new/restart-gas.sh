#!/bin/bash

source $HOME/ve/bin/activate

$HOME/gridplatform/gridagentserver/stop.sh
sleep 10
$HOME/gridplatform/gridagentserver/start.sh
