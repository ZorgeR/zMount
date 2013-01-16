#!/bin/sh

# zMount by Zorge.R
# please don't modify code
# Использование скрипта в корыстных целях преследуется по понятиям Российской Федерации.
# За модификацию без спроса, получите серпом по ... колосьям.

# Поехали

############################################
# определяем текущее местоположение скрипта
path=${0%/*}
#
echo -ne "$path" >/ezxlocal/zmountpath
#
cd /
############################################

##################################################################################
# выводим окно выбора действия.							 #
# Первый пункт, просто монтирование.						 #
# Второй пункт, добавление монтирования в автозапуск				 #
# Третий, Удалить все скрипты запуска созданные ранее и обнулить счетчик	 #
# По дефолту используется автозапуск из unKnow					 #
##################################################################################

showRadio "zMount" "r1.3" "Just mount" "add mount to autorun" "remove all autorun"

ret=$?
[ $ret -eq 0 ] && exit

case $ret in
	1)	$path/zmounter&
		;;
	2)	$path/zautomounter&
		;;
	3)	$path/zdelmounter&
		;;
	*)
		;;
esac

