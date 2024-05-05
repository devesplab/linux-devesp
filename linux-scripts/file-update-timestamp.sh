#!/usr/bin/env bash
#
# DESCRIPTION: update the linux sample directory with different timestamps
#
# author: afoot
# Date: Sun 2024May05 23:39:01 UTC
#

function year1999()
{
  # change 1999Sep09, 09:09
  find linux-files/files2-data/archeological-locations -type f -exec touch -t 199909090909 {} +
}

function year2020()
{
  # change 2020Apr29, 08:00(all content)
  find ./linux-files/files4-system/json-yalm-files -exec touch -t 202004290800 {} +

  # change 2020July07, 04:30
  find linux-files/files1-data/literature/esopo/ -type f -exec touch -t 202007070430 {} +
}

function year2021()
{
  # change to 2021Mar13, 15:01
  find linux-files/files1-data/dirOne/ -type f -exec touch -t 202103131501 {} +

  # change to 2021Mar13, 15:01
  find ./linux-files/files2-data/dirTwo/ -exec touch -t 202103131501 {} +
}

function year2022()
{
  # change 2022Sep22, 10:25
  find linux-files/files2-data/animals/ -type f -exec touch -t 202209221025 {} +

  # change 2022Nov05, 22:04 (all content)
  find ./linux-files/files4-system/conf-files  -exec touch -t 202211052204 {} +

  # change 2022Oct10, 14:30
  find ./linux-files/files4-system/program* -type f -exec touch -t 202210101430 {} +
}

function year2023()
{
  # change 2023Feb10, 11:22
  find linux-files/files3-net/hosts_vlans/ -type f -exec touch -t 202302101122 {} +

  # change 2023Apr24, 14:16
  find linux-files/files3-net/accounts_files_linux/passwd* -type f -exec touch -t 202304241416 {} +
  find linux-files/files3-net/accounts_files_linux/group* -type f -exec touch -t 202306171022 {} +
  find linux-files/files3-net/accounts_files_linux/shadow* -type f -exec touch -t 202308251545 {} +

  # change 2023Feb10, 11:22
  find ./linux-files/files4-system/cab-files/ -type f -exec touch -t 202302101122 {} +

  # change 2023May23, 09:44
  find ./linux-files/files1-data  -type f -exec touch -t 202305230944 {} +

  # change 2023Apr17, 02:49
  find ./linux-files/files1-data/literature/esopo/ -exec touch -t 202304170249 {} +

  # change 2023May23, 21:50
  find ./linux-files/files1-data/literature/quixote/ -exec touch -t 202304170249 {} +

  # change 2023Jun18, 20:23
  find ./linux-files/files4-system/lib-files/postfix/ -exec touch -t 202306182023 {} +

  # change 2023Jul19, 19:13
  find ./linux-files/files4-system/conf-files/ubuntu_conf/ -exec touch -t 202307191913 {} +

  # change 2023Aug17, 18:03
  find ./linux-files/files4-system/inf-files  -exec touch -t 202308171803 {} +
}

function year2024()
{
  # change 2024Jan16, 12:05
  find linux-files/files2-data/rocks-tale/ -exec touch -t 202401161205 {} +

  # change 2024Feb07, 11:22
  find linux-files/files2-data/dirTwo/asubdir/ -type f -exec touch -t 202402071122 {} +

  # change 2024Jan16, 12:05
  find ./linux-files/files4-system/log-files/ubuntu-logs/ -type f -exec touch -t 202401161205 {} +

  # change 2024Feb07, 09:33
  find ./linux-files/files4-system/simple-java-maven-app/ -type d -exec touch -t 202402070933 {} +

  # change 2024Mar25, 10:15
  find ./linux-files/files4-system/ini-files/ -exec touch -t 202403251015 {} +

  # change 2024Apr30, 11:45
  find ./linux-files/files2-data/ -type f -exec touch -t 202404301145 {} +

  # change 2024May02, 13:52
  find ./linux-files/files4-system/simple-java-maven-app/ -type d -exec touch -t 202405021352 {} +

  # change 2024Jun09, 13:43
  find ./linux-files/files3-net/data-center-regions/ -type f -exec touch -t 202406091343 {} +

  # change 2024Jul04, 14:51
  find ./linux-files/files3-net/data-center-regions/east/ -exec touch -t 202407041451 {} +

  # change 2024Aug12, 15:12
  find ./linux-files/files3-net/data-center-regions/west/ -type d -exec touch -t 202408121512 {} +
}

#
# Run it
#
echo
echo "Start updates..."
echo
echo "Update year 1999"
year1999
echo "Update year 2020"
year2020
echo "Update year 2021"
year2021
echo "Update year 2022"
year2022
echo "Update year 2023"
year2023
echo "Update year 2024"
year2024
echo
echo "Done..."
echo
