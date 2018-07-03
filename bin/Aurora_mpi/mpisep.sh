#!/bin/sh
# (C) Copyright NEC Corporation 2018

ID=${MPIUNIVERSE}:${MPIRANK}
case ${MPILX_SEPSELECT:-${NMPI_SEPSELECT:-2}} in
1) exec $* 1>> stdout.${ID}                  ;;
2) exec $*                  2>> stderr.${ID} ;;
3) exec $* 1>> stdout.${ID} 2>> stderr.${ID} ;;
4) exec $* 1>> std.${ID}    2>&1             ;;
*) exec $* ;;
esac
