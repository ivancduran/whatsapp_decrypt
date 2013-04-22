#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#required openssl and sqlite3
for i in $( ls *db.crypt ); do
	VAR1=${i%.*}
	openssl enc -d  -aes-192-ecb -in $VAR1.crypt -out $VAR1.sqlite -K 346a23652a46392b4d73257c67317e352e3372482177652c
		echo Ok: $VAR1
	mkdir -p txt
	mkdir -p sqlite
	sqlite3 $VAR1.sqlite "select key_remote_jid, key_from_me, data from messages" > txt/$VAR1.txt
		echo Ok: txt
	mv $VAR1.sqlite sqlite/$VAR1.sqlite
		echo Ok: sql
done
